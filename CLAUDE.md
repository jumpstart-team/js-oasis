# js-oasis

Website rebuild for **Oasis Healthcare** — a JumpStart DPC Solutions client in
Grafton, WI. This rebuilds/upgrades their live Squarespace site,
`oasishealthcare.net`, which runs three divisions from one location: Oasis
Healthcare (urgent + primary care, Laura Mckinnis APNP), Oasis Collaborative
(direct primary care for POTS/headache/primary care, Katie Henke DNP), and
Oasis MedSpa (Xeomin, IV hydration, skincare, treatment packages).

## Status: direction chosen, full site built in it

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

## Chosen direction: Option C, now the whole site

Laura and Angela picked **Option C (Trusted DPC)**, then sent a revised flow.
All six pages are now built in it against one shared stylesheet. There is no
separate v2 preview file, deliberately: a second copy of the homepage would
fork and drift.

The flow they asked for, and what the pages implement:

1. Hero on **"from illness to wellness"** (their own live-site tagline, not
   invented) framed around convenient, cost-effective care.
2. **"How we care for you"**, four categories in illness→wellness order:
   urgent care → primary care and disease management → health maintenance and
   prevention → aesthetics and wellness. The first three deep-link to sections
   on `healthcare.html` (`#urgent`, `#primary`, `#prevention`); the fourth goes
   to `medspa.html`. No new pages, per their answer.
3. **"Accessing care is simple and affordable"**: membership/DPC, commercial
   insurance, discounted cash rate, employer-sponsored plans.

Judgement calls made where their notes were silent, all easy to reverse:

- **Cash rate kept** as a fourth payment route. It is real, currently
  advertised, and the route uninsured patients use; silently dropping live
  pricing seemed worse than leaving it to be struck.
- **Employer-sponsored plans stay deliberately soft**: an invitation to talk,
  with no program details, pricing, or claim that a program already exists.
  Per their answer, it is real but early.
- **Membership leads, DPC is defined inside it**, rather than renaming the nav.
- A compressed **providers strip** was kept although their flow omitted a team
  section, because clinician-ownership is the strongest trust signal available.

`previews/` holds the three original A/B/C options, frozen as reference only.

## Not yet built, worth raising

- **A dedicated POTS page.** `oasis-guidelines` calls Katie Henke's POTS and
  autonomic line the most under-exploited asset on the account, notes it is a
  national-search term rather than a local one, and lists "does it get its own
  page" as the single biggest SEO decision here. Currently POTS only appears as
  a section on `membership.html`. Not built unasked, since it is an open
  question, but it is the highest-value page missing.
- **Women's health / HRT.** Requested in the intake form, still no specifics
  supplied. HRT copy also needs a clinician review pass before publication.
- **Testimonials.** There are none anywhere, and none existed on any of the
  original 17 live pages either. For a trust-led membership pitch this is the
  biggest conversion gap. Google reviews are the obvious source; needs client
  sign-off on which ones and permission to quote.
- **Real photography.** Every photo slot is still an honest labelled
  placeholder. Their Instagram and Facebook already carry real photos they own,
  which beats both a shoot and stock on speed.
- **Open Graph / structured data.** No page has OG tags, so links shared to the
  Facebook and Instagram channels they actively push render as bare URLs.

## Stack

Plain static HTML/CSS/JS. No framework, no build step — this is a direct
rebuild-in-HTML project (see branch name `claude/website-rebuild-html-*`),
unlike sibling JumpStart client repos that are Next.js apps exporting a
static bundle. Structure mirrors what those sibling repos export, authored
directly instead of generated:

```
index.html, healthcare.html, membership.html, medspa.html,
about.html, contact.html
tokens.css   (design tokens: real brand colors, type scale, motion)
styles.css   (@imports tokens.css; every component lives here)
site.js      (mobile nav, FAQ accordion, scroll reveal)
images/
previews/    (three frozen A/B/C options, reference only)
```

All six pages share `styles.css`. Pages carry no inline `:root` blocks and
almost no inline styles; if something needs styling, add a component to
`styles.css` rather than a one-off. Two rules in there are easy to break by
accident and are commented at the top of the file:

- The scroll reveal animates **`translate`**, not `transform`, so it composes
  with `:hover { transform: ... }` instead of winning a specificity fight
  against it. Using `transform` for both silently cancels every card's hover
  lift, which happened once already and was invisible in screenshots.
- `--color-accent` (#D94D2A) is **large text, fills and icons only**: it is
  4.16:1 on white and fails the body-text floor. `--color-accent-deep`
  (#B93F21) is the one safe for small text on light surfaces. Do not swap them
  to taste.

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

- **`oasis-guidelines`** — client profile skill, read it before writing copy.
  The load-bearing rule is at the top of that file and it is easy to violate
  by instinct: **Oasis is not a DPC practice**, it is a hybrid clinic where DPC
  is one of three access routes. The frame is **access, not escape**. Never
  position insurance as the villain, because a large share of patients walk in
  with commercial insurance cards and that copy insults a revenue line they
  depend on. Earlier drafts of this site failed exactly this way ("no insurance
  middlemen", "care that isn't rationed by an insurance company", "insurers
  often add cost and administrative burden"); all of it has been rewritten and
  the phrasing should not come back. Aesthetics copy also carries Wisconsin
  advertising limits: no permanence or outcome promises ("long-lasting results"
  was removed for this reason). POTS copy needs maximum precision and zero hype.
- **`anti-generic-design`** — mandatory for any HTML output. Hard rules on type
  scale, 16px mobile / 15px desktop minimum body text, semantic color roles, no
  decorative gradients/glassmorphism, `min-height: 100dvh` not `100vh`,
  `IntersectionObserver` not scroll listeners, animate only
  `transform`/`opacity`. It also carries a **hard banned-typeface list**:
  Inter, Space Grotesk, Manrope, JetBrains Mono, Fira Code, IBM Plex Mono,
  Fraunces. The body face here was Inter and had to be replaced; it is now
  **Figtree**, off that skill's sanctioned list and the warmer choice, which
  suits the client's stated "warm, welcoming, not industrial or clinical"
  guardrail. Display face is **Lora**. Do not reintroduce Inter.
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
- **`humanizer`** — standing rule, applies to all copy on this project, always
  (not just when explicitly invoked). Zero em dashes anywhere: not in body
  copy, not in `<title>` tags, meta descriptions, or `aria-label` attributes
  (all three have tripped this before; grep for `&mdash;`, `—`, and numeric
  entities, not just one form). Quotation marks must be genuinely verbatim
  from a real source (the live site, the call transcript, or the intake
  form); paraphrasing text inside quote marks, even lightly, is a fabricated
  quote and has happened twice in this project already. When rewording
  paraphrased (unquoted) copy for AI-tell patterns, don't touch anything
  that traces back to a direct quote elsewhere on the site, and don't
  introduce new factual/pricing claims that aren't sourced.

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
