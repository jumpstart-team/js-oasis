# js-oasis

Website rebuild for **Oasis Healthcare** — a JumpStart DPC Solutions client in
Grafton, WI. This rebuilds/upgrades their live Squarespace site,
`oasishealthcare.net`, which runs three divisions from one location: Oasis
Healthcare (urgent + primary care, Laura Mckinnis APNP), Oasis Collaborative
(direct primary care for POTS/headache/primary care, Katie Henke DNP), and
Oasis MedSpa (Xeomin, IV hydration, skincare, treatment packages).

## Status: real content built, a few facts need client confirmation

`content-brief.md` at repo root is the source-of-truth brief, harvested and
verified directly from the live site (all 17 of its pages, cross-checked
against raw HTML/CSS for exact colors, fonts, and copy). All page content in
this repo comes from that brief — nothing invented. Three things it flags
still need the client's sign-off before this goes live:

- **Oasis Collaborative hours conflict on the live site itself** (one page
  lists Wed 8am–12pm, another omits it). Went with the version that includes
  Wednesday (`/appointments`, the more complete source) — confirm before publish.
- **Provider credentials are spelled inconsistently site-wide** (Laura:
  NP/APNP/APNP-C; Katie: DNP/APNP/APNP-C). Used "Laura Mckinnis, APNP" and
  "Katie Henke, DNP" (the most common spelling per page) — confirm the correct
  formal credential line for each before publish.
- **No real pricing exists yet** for Oasis Collaborative DPC membership,
  MedSpa treatment packages, or Xeomin per-unit cost — not on the live site
  at all. Pages say so honestly ("call for current pricing") rather than
  inventing numbers.

Get client sign-off on those three before this ships. Don't silently resolve
them a different way without updating `content-brief.md` too.

## Stack

Plain static HTML/CSS/JS. No framework, no build step — this is a direct
rebuild-in-HTML project (see branch name `claude/website-rebuild-html-*`),
unlike sibling JumpStart client repos that are Next.js apps exporting a
static bundle. Structure mirrors what those sibling repos export, authored
directly instead of generated:

```
index.html, healthcare.html, collaborative.html, medspa.html,
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

The 17-page IA on the live site got consolidated to 6: each of the three
divisions (urgent/primary care, DPC, MedSpa) got one page instead of 4-6,
with pricing/FAQs folded in as sections rather than separate pages. This was
a judgment call for clarity, not a client request — flag it if they'd rather
keep the old page count.

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
