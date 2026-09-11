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

# Sizes are set to what the page actually shows, not to the largest file
# Unsplash will serve. These bands are full-bleed, so 1800px covers a 1440
# viewport with headroom and stops there; 2400px cost 1.4MB across nine files
# against a repo whose existing images run 29-75KB.
#
# Band quality runs lower than hero quality on purpose. Every band sits behind
# a scrim at 0.93 or heavier, and compression artifacts are not visible
# through that. band-hours goes lowest because rippling water is the noisiest
# subject in the set and the most expensive to encode.
#
# The fifth argument is passed to Unsplash verbatim, so it takes either a
# crop mode (crop=entropy, crop=right) or an explicit region
# (rect=x,y,width,height) when the automatic crop picks the wrong part of the
# frame. Give a rect the same aspect ratio as the output, or it crops twice.
#
# fetch <filename> <photo-id> <width> <height> <crop-param> <webp-quality>
fetch () {
  local name="$1" id="$2" w="$3" h="$4" crop="$5" q="$6"
  echo "-> $name"
  curl -fsSL -o "$TMP/$name.jpg" \
    "${CDN}${id}?w=${w}&h=${h}&fit=crop&${crop}&q=85&fm=jpg"
  cwebp -quiet -q "$q" -m 6 "$TMP/$name.jpg" -o "$OUT/$name.webp"
  printf '   %s KB\n' "$(( $(stat -c%s "$OUT/$name.webp") / 1024 ))"
}

# --- Page heroes: 1800x675, the site's 2.68:1 hero band ---------------------
# 1A  healthcare.html          Maximilian Bungart, sunlit corner with a plant
fetch hero-healthcare  1780139815926-ea90709b2010  1800 675 crop=entropy 72
# 2A  health-maintenance.html  fr0ggy5, exam room diagnostic wall
fetch hero-prevention  1682365114794-14b870355d21  1800 675 crop=entropy 72
# 3A  medspa.html              Katsia Jazwinska, beige curtain in soft light
#     The automatic crop took a band across the middle of the frame, which put
#     the headline over empty wall and cut the curtain off at the bottom edge.
#     This rect is the lower 1836 rows of the 4896x3264 original, which is the
#     fabric pooling on the floor plus the wood boards, and it matches the
#     output ratio exactly so nothing crops twice.
fetch hero-medspa      1578500467296-441a11d5d55a  1800 675 rect=0,1428,4896,1836 72
# 4B  membership.html          Marija Zaric, shadows on a textured wall corner
fetch hero-membership  1754555680193-606fb5ffd6b1  1800 675 crop=entropy 72
# 5A  about.html               Rosemary Williams, a dock on a lake at dawn
fetch hero-about       1665782670881-96d1c710704a  1800 675 crop=entropy 72
# 6A  pots.html                Puscas Adryan, a chair in sunlight by a window
fetch hero-pots        1765948079484-3bb1af6e5268  1800 675 crop=entropy 72

# contact.html's hero uses images/web/wide-exterior.webp, the practice's own
# storefront photo, which was already in this repo and unreferenced. Nothing
# to fetch for it.

# --- Section bands: 1800x510, the site's 3.5:1 band --------------------------
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
fetch band-cta         1617614649797-16d75555a2bc  1800 510 crop=entropy 62
# fetch band-cta       1758545344431-e41113f70d58  1800 510 crop=entropy 62   # 8A
# 9B  index.html #access              Marija Zaric, wall corner
#     crop=right on purpose: 9B and hero-membership (4B) are the same
#     photographer shooting the same subject. Different crop regions keep the
#     two from reading as one image reused.
fetch band-access      1784447355410-8d29a6bd49e6  1800 510 crop=right 62
# 10B contact.html #hours             ekrem osmanoglu, rippling green water
fetch band-hours       1781877771212-afb6542b3169  1800 510 crop=entropy 55

echo
echo "Done. Files in $OUT:"
ls -lh "$OUT"/hero-*.webp "$OUT"/band-*.webp | awk '{print "  " $9 "  " $5}'
echo
echo "Next: append oasis-photos-patch.css to styles.css and apply the 8 HTML"
echo "edits in oasis-photos-html.md. Files alone will not show up on the page."
