#!/usr/bin/env bash
# Oasis Healthcare: download and convert the 10 approved Unsplash photos.
# Run from the repo root. Writes into images/web/.
#
# Every photo is free under the Unsplash licence for commercial use with no
# attribution required on the live site. Credits are in CREDITS.md.
#
# Requires cwebp. macOS: brew install webp. Debian/Ubuntu: apt install webp.

set -euo pipefail

if ! command -v cwebp >/dev/null 2>&1; then
  echo "cwebp not found. Install it first: brew install webp" >&2
  exit 1
fi

OUT="images/web"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
mkdir -p "$OUT"

CDN="https://images.unsplash.com/photo-"

# fetch <filename> <photo-id> <width> <height> <crop-mode>
fetch () {
  local name="$1" id="$2" w="$3" h="$4" crop="$5"
  echo "-> $name"
  curl -fsSL -o "$TMP/$name.jpg" \
    "${CDN}${id}?w=${w}&h=${h}&fit=crop&crop=${crop}&q=88&fm=jpg"
  cwebp -quiet -q 78 -m 6 "$TMP/$name.jpg" -o "$OUT/$name.webp"
}

# --- Page heroes: 2400x900, the site's 2.68:1 hero band ---------------------
# 1A  healthcare.html          Maximilian Bungart, sunlit corner with a plant
fetch hero-healthcare  1780139815926-ea90709b2010  2400 900 entropy
# 2A  health-maintenance.html  fr0ggy5, exam room diagnostic wall
fetch hero-prevention  1682365114794-14b870355d21  2400 900 entropy
# 3A  medspa.html              Katsia Jazwinska, beige curtain in soft light
fetch hero-medspa      1578500467296-441a11d5d55a  2400 900 entropy
# 4B  membership.html          Marija Zaric, shadows on a textured wall corner
fetch hero-membership  1754555680193-606fb5ffd6b1  2400 900 entropy
# 5A  about.html               Rosemary Williams, a dock on a lake at dawn
fetch hero-about       1665782670881-96d1c710704a  2400 900 entropy
# 6A  pots.html                Puscas Adryan, a chair in sunlight by a window
fetch hero-pots        1765948079484-3bb1af6e5268  2400 900 entropy

# contact.html's hero uses images/web/wide-exterior.webp, the practice's own
# storefront photo, which was already in this repo and unreferenced. Nothing
# to fetch for it.

# --- Section bands: 2400x680, the site's 3.5:1 band --------------------------
# 8B  .section--slate, all 8 pages    John Ettema, white wall
#
#     TESTED ON THE LIVE PAGE, AND IT DOES NOT WORK. Behind the slate scrim
#     this photo has two outcomes and both are bad. With crop=entropy the
#     right edge of the frame turns the band into a brown wash that reads as
#     a rendering fault. With crop=left the brown is gone and the band is
#     indistinguishable from the flat slate colour it already has, so the
#     page carries the download for nothing.
#
#     Built as chosen. To switch to 8A, comment the line below and uncomment
#     the one after it. 8A is Yanhao Fang, sunlight streaks on textured
#     concrete, which keeps visible structure through the scrim.
fetch band-cta         1617614649797-16d75555a2bc  2400 680 entropy
# fetch band-cta       1758545344431-e41113f70d58  2400 680 entropy   # 8A
# 9B  index.html #access              Marija Zaric, wall corner
#     crop=right on purpose: 9B and hero-membership (4B) are the same
#     photographer shooting the same subject. Different crop regions keep the
#     two from reading as one image reused.
fetch band-access      1784447355410-8d29a6bd49e6  2400 680 right
# 10B contact.html #hours             ekrem osmanoglu, rippling green water
fetch band-hours       1781877771212-afb6542b3169  2400 680 entropy

echo
echo "Done. Files in $OUT:"
ls -lh "$OUT"/hero-*.webp "$OUT"/band-*.webp | awk '{print "  " $9 "  " $5}'
echo
echo "Next: append oasis-photos-patch.css to styles.css and apply the 8 HTML"
echo "edits in oasis-photos-html.md. Files alone will not show up on the page."
