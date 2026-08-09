# js-oasis

Website rebuild for **Oasis Healthcare** — a JumpStart DPC Solutions client in
Grafton, WI. This rebuilds/upgrades their live Squarespace site,
`oasishealthcare.net`, which runs three divisions from one location: Oasis
Healthcare (urgent + primary care, Laura Mckinnis APNP), Oasis Collaborative
(direct primary care for POTS/headache/primary care, Katie Henke DNP), and
Oasis MedSpa (Xeomin, IV hydration, skincare, treatment packages).

## Status: real content built, client-confirmed

`content-brief.md` at repo root is the source-of-truth brief: the original
live-site crawl (all 17 pages, cross-checked against raw HTML/CSS) plus a
"Client updates" section layering in two later, more authoritative sources —
a branding/website call transcript and the signed JumpStart intake
questionnaire (both supplied by the user, not fetched). Where those conflict
with the live site or with each other, the intake form (Laura's own written
submission) wins. Nothing on the site is invented.

What changed based on those two sources (see `content-brief.md` "Client
updates" for the full reasoning):

- **Oasis Collaborative is no longer a separate patient-facing brand.**
  Per the call, it's becoming an internal MSO; the site now presents one
  practice (Oasis Healthcare) with membership as a payment/care model, not a
  separate business. `collaborative.html` was removed; that content now
  lives in `membership.html` (Direct Primary Care / specialty care with
  Katie Henke) plus a membership section on `healthcare.html`.
- **Real membership pricing applied everywhere:** $99/mo individual,
  $249/mo family max, $149/mo specialty care (weight loss, neurology/other
  specialists, patients 65+) — confirmed by both the call and the intake form.
- **Provider credentials resolved via the intake form's official bios:**
  "Laura Mckinnis, APNP" and "Katie Henke, NP" (plainer than earlier
  guesses — the intake form is the authoritative source, confirmed by the user).
- **Membership hours resolved:** Mon 12–3pm, Fri 8am–2pm only, no Wednesday.
- **MedSpa/treatment-package pricing stays off the site deliberately** — not
  a gap to fill later. The client tried publishing it before and pulled it
  after complaints; copy reflects "ask at your consultation," not "coming soon."
- **Weight loss elevated in prominence** per Laura's explicit request (it's
  a major patient-acquisition channel) — has its own home-page band and a
  dedicated section on `healthcare.html`, not just a bullet in a service list.
- Real social links added (Instagram, Facebook — from the intake form).
- **Not yet added:** Women's health / HRT content — the intake form requests
  it but gave no specifics (services, provider, pricing); explicitly waiting
  on the client rather than inventing details. Also not yet added: numeric
  price-comparison figures (built a qualitative comparison instead — no
  invented dollar amounts). A future service-area change is under
  discussion (not yet public) — this repo is public, so exact details are
  intentionally not logged here; the footer's "serving the greater
  Milwaukee area" phrasing is deliberate and shouldn't be read as claiming
  a new office exists.

## Stack

Plain static HTML/CSS/JS. No framework, no build step — this is a direct
rebuild-in-HTML project (see branch name `claude/website-rebuild-html-*`),
unlike sibling JumpStart client repos that are Next.js apps exporting a
static bundle. Structure mirrors what those sibling repos export, authored
directly instead of generated:

```
index.html, healthcare.html, membership.html, medspa.html,
about.html, contact.html
tokens.css   (design tokens — real brand colors/fonts, see below)
styles.css   (@imports tokens.css)
site.js
images/
```

Keep it that flat — no `src/`, no bundler, no `node_modules`. Anything that
needs interactivity (mobile nav, accordions, tab toggles) gets a small
vanilla-JS behavior in `site.js` keyed off `data-*` attributes, same pattern
as other JumpStart sites' exports.

The 17-page IA on the live site got consolidated to 6 (originally scoped as
3 divisions × several pages each; now 1 practice × 6 pages, `membership.html`
replacing the old `collaborative.html` per the business-structure change
above). Pricing/FAQs are folded in as sections rather than separate pages.

## Design skills

This account has a full web-build skill bundle installed globally
(`~/.claude/skills/`). For this project specifically:

- **`anti-generic-design`** — mandatory for any HTML output, and the one
  actually followed in full (self-contained, no missing files). Hard rules
  on type scale, 16px/15px minimum body text, semantic color roles, no
  Fraunces, no decorative gradients/glassmorphism, `min-height: 100dvh` not
  `100vh`, `IntersectionObserver` not scroll listeners, animate only
  `transform`/`opacity`. All colors in `tokens.css` are contrast-checked
  against these rules (see comments in that file).
- **`hallmark`** — the installed copy is `SKILL.md` only; the `references/`
  directory it repeatedly points to (macrostructures, component cookbook,
  genre files, slop-test gates) does not exist in this environment or in the
  uploaded skill bundle. Applied the principles stated directly in
  `SKILL.md` (honest copy, no eyebrows, no decorative divider lines, locked
  tokens, mobile-verified at 320/375/414/768px) but could not follow its
  named macrostructure/archetype picks since those reference files aren't
  present. Worth fixing the skill install if this project continues.
- **`jumpstart-messaging-framework`** — applies to Oasis Collaborative
  specifically (the one true DPC division); not applied blanket across
  Oasis Healthcare (insurance-based urgent/primary care) or MedSpa
  (aesthetics), which aren't DPC/concierge practices.
- Brand is **preserved, not reinvented** — colors, fonts, and logo are the
  practice's real values pulled from the live site (see `content-brief.md`
  § 4 and `tokens.css`), since the ask was "upgrade," not rebrand.

## Conventions carried over from sibling JumpStart sites

- Sticky nav, mobile hamburger menu collapsing under one breakpoint (see
  `site.js` pattern: toggle `.is-open` classes via `data-mobile-toggle` /
  `data-mobile-menu` attributes, not inline `style.display`).
- Footer: practice/brand blurb + page links + contact block, no decorative
  divider lines between them (spacing does the separating — see
  `anti-generic-design`).
- Design tokens as CSS custom properties in `:root` (`--color-*`,
  `--font-*`, `--space-*`), referenced by name everywhere — no ad hoc hex
  or px values sprinkled through component rules.
