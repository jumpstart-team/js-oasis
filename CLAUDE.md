# js-oasis

Website rebuild for "Oasis" — a JumpStart DPC Solutions client site.

## Status: brief pending

This repo was scaffolded (skills wired up, project conventions documented) before
any client-specific content existed. No business brief has been supplied yet —
name, industry/specialty, location, tone, existing site to reference, brand
assets, services, pricing, and contact info are all unknown. **Do not invent
these.** Fabricated business details (fake testimonials, fake addresses, a
guessed specialty) are explicitly against house rules (see `hallmark`'s
"honest copy" rule and `anti-generic-design`'s ban on placeholder-as-final
content) and risk colliding with an unrelated real business also named Oasis.

Get the brief from the user/team before writing real page content or locking
in a color/type system.

## Stack

Plain static HTML/CSS/JS. No framework, no build step — this is a direct
rebuild-in-HTML project (see branch name `claude/website-rebuild-html-*`),
unlike sibling JumpStart client repos that are Next.js apps exporting a
static bundle. Structure mirrors what those sibling repos export, authored
directly instead of generated:

```
index.html, about.html, services.html, contact.html, ...   (one file per page)
styles.css
site.js
images/
```

Keep it that flat — no `src/`, no bundler, no `node_modules`. Anything that
needs interactivity (mobile nav, accordions, tab toggles) gets a small
vanilla-JS behavior in `site.js` keyed off `data-*` attributes, same pattern
as other JumpStart sites' exports.

## Design skills

This account has a full web-build skill bundle installed globally
(`~/.claude/skills/`). For this project specifically:

- **`anti-generic-design`** — mandatory for any HTML output. Hard rules on
  type scale, 16px/15px minimum body text, semantic color roles, no
  Fraunces (house-wide ban outside Blooming Health), no decorative
  gradients/glassmorphism, `min-height: 100dvh` not `100vh`,
  `IntersectionObserver` not scroll listeners, animate only
  `transform`/`opacity`.
- **`hallmark`** — structural/macrostructure skill for the actual page
  build. It **gates on three questions before writing any code**: audience,
  use case, tone. Don't skip that gate here just because a brief eventually
  arrives — run it for real.
- **`jumpstart-messaging-framework`** — required before writing any
  patient/prospect-facing copy *if* Oasis turns out to be a DPC, concierge,
  or membership medical practice (unconfirmed — see Status above). Governs
  homepage section architecture, patient-psychology framing, and copy
  anti-patterns for that vertical specifically. Don't apply it blind if
  Oasis turns out to be a different kind of business.
- **`redesign-existing-projects`** — if a live "old" Oasis site exists
  somewhere that this repo is meant to replace, use this (or `hallmark
  study <url>`) to extract its content/IA before rebuilding, rather than
  starting from a blank slate.

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
