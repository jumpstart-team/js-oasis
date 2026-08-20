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
   invented), centred, opening on mission rather than money. Laura: "I don't
   love the financials being in the first paragraph, I'd rather it start with
   why we do what we do," so the lede leads with "Everyone deserves great
   healthcare" (her phrasing) and names the three services with no pricing.
   The centred variant swaps the hero scrim from a left-weighted gradient to a
   radial, because protection has to sit where the text sits.
2. **"How we care for you"**, now **three** services in illness→wellness order,
   each with its own page: Healthcare (urgent care plus primary care and
   disease management) → Health Maintenance and Prevention (weight loss,
   physicals, screening) → Aesthetics and Wellness (MedSpa). This replaced an
   earlier four-category version that deep-linked into sections of
   `healthcare.html`; the client asked for three services and three menu
   pages, so `health-maintenance.html` was split out and the `#prevention`
   anchor retired.
3. **"How we do it"**: membership/DPC, commercial insurance, discounted cash
   rate, employer-sponsored plans. Headings are Laura's "what we do / how we
   do it" pairing. Pricing stays on the homepage because she wants it seen,
   but as a compact text row rather than four cards: "I would like it there,
   but yeah, like a little smaller."

**Insurance copy is deliberately non-specific.** Named carriers were removed
everywhere. Laura: coverage "is shifting very quickly" and "I'd rather not be
super specific on what we take." Every mention is now "most commercial
insurances, including Medicare and Medicaid," and carries her required
caveat that **not every provider accepts insurance**. Do not reinstate a
carrier list.

Judgement calls made where their notes were silent, all easy to reverse:

- **Cash rate kept** as a fourth payment route. It is real, currently
  advertised, and the route uninsured patients use; silently dropping live
  pricing seemed worse than leaving it to be struck.
- **Employer-sponsored plans stay deliberately soft**: an invitation to talk,
  with no program details, pricing, or claim that a program already exists.
  Per their answer, it is real but early.
- **Membership leads, DPC is defined inside it**, rather than renaming the nav.
- **Membership stays in the nav** although the client named only the three
  service pages. It is a real page with pricing that the intake form explicitly
  asked for, so removing it from navigation would bury the conversion path.
- A compressed **providers strip** was kept although their flow omitted a team
  section, because clinician-ownership is the strongest trust signal available.
  It features Laura and Katie. Kelly Plagemann has been removed from the site
  entirely per Laura ("she's really not here very much, we probably shouldn't
  spend any time putting her stuff up there"), confirmed by the user.

`previews/` holds the three original A/B/C options, frozen as reference only.

## Client feedback round, 2026-08-20

Laura's marked-up review of the built site. Applied in full except where noted.

- Hero lede replaced with her own wording (illness or injury / prevention or
  disease management / clinically guided aesthetics, all under one roof).
- **"How we do it"** subhead is now her line, second sentence only: "Choose the
  way that works for you." Her first sentence ("Healthcare should be accessible
  to everyone") was dropped because the hero one screen up already opens on
  "Everyone deserves great healthcare," which is the same idea twice.
- POTS added to the homepage Healthcare card and given a full service block on
  `healthcare.html`, per her "add Katie's POTS practice to healthcare."
- Walk-in copy now reads "walk-ins welcome during clinic hours" on both
  `contact.html` and `healthcare.html`.
- `health-maintenance.html` gained **School and sports physicals** and **DOT
  and pre-employment physicals** as their own services. The DOT copy there is
  deliberately worded differently from the DOT block on `healthcare.html`, which
  stays, so the two pages are not duplicate content.
- MedSpa: the five-blend **IV hydration menu grid is removed**. The $199 base
  fluid / $29 per additive pricing was kept, in the IV entry under Services. It
  is real, currently advertised, and the one MedSpa number they do publish.
- Adam is now "Registration, EMT," no longer "in training."
- The billing line "Questions about a bill go to our billing line, not the front
  desk" is gone. Per Laura, patients do come to the front desk.

**Open, waiting on the client:**

- **Clinic hours.** She asked for them to be updated but did not supply the new
  set. The site still shows Mon 8-6, Tue 8-4, Thu 8-4, Sat 8-12 for the clinic
  and Mon 12-3, Fri 8-2 for membership. Do not guess these.
- **Homepage H1.** She asked for a marketing opinion between "From illness to
  wellness" and "Convenient. Cost Effective. Care." Nothing changed in the repo;
  both were rendered as screenshots for her to compare. The recommendation on
  record is to keep "From illness to wellness": it is already theirs, it maps to
  the three services in order, "Cost Effective" in an H1 contradicts her own
  earlier note about not opening on financials, and the alternate line-breaks
  badly, splitting "Cost Effective" across two lines at desktop width.
- **MedSpa "Fully Integrated Health and Wellness" package.** She flagged it with
  "Laura to decide." Left untouched. Worth noting when she answers: it is clinic
  access, 4 sick visits, and 1 annual physical, which is a membership offer
  sitting in the MedSpa grid competing with the $99/mo plan.

## Not yet built, worth raising

- **Women's health / HRT.** Requested in the intake form, still no specifics
  supplied. HRT copy also needs a clinician review pass before publication.
- **Testimonials.** Still none on the site. Laura has now explicitly asked for
  "a place for patient reviews and testimonials because we do have a lot of
  that," so this is approved in principle and only needs the content. Video is
  in scope: keep clips under 30 seconds, ideally 15 to 20, and patients must
  not be compensated. Eric also flagged the HIPAA edge, that replying to a
  review in a way that confirms someone is a patient is the risk, not the
  testimonial itself.
- **Booking and payment links are live (resolved).** Every
  `practice.kareo.com` and `provider.kareo.com` URL is gone. Scheduling is
  Tebra, per clinician, and membership signup/billing is Hint. Routing rule,
  applied deliberately: **no practice-wide Tebra URL exists**, so the global
  chrome CTAs (nav, mobile menu, and the closing CTA on index/about/contact)
  point at `contact.html#booking`, a three-card provider chooser, rather than
  silently defaulting every visitor to one clinician. Service pages route
  straight to the clinician who delivers that service: healthcare,
  health-maintenance, and medspa all go to Laura's Tebra page; Katie's page is
  reachable from the chooser and from membership/specialty copy. Membership
  signup goes to `oasishealthcare.hint.com/signup` from the membership hero and
  from under the pricing tiers. If Laura later supplies a single practice-wide
  Tebra link, the chooser hop is the thing to collapse.
- **Location emphasis: Grafton is now removed from all descriptive copy.**
  Laura's 2026-08-20 feedback said "not sure we should have location," and the
  user chose full removal. Grafton is gone from every `<title>`, every meta
  description, the footer blurb, and all page prose, including the contact H1
  (now "Visit us.").
  **This was done over a stated objection and is reversible in one commit.**
  `oasis-guidelines` warns local ranking will likely soften for a location they
  still occupy and still need patients to find; that risk was accepted
  knowingly, not overlooked. Do not "fix" it back without asking.
  One carve-out applied on judgement: the literal NAP address block
  (`1505 Wisconsin Ave Ste 150, Grafton, WI 53024`) and the Google Maps
  directions query keep the city, because an address without a city is not
  reduced emphasis, it is a broken address. GBP and any future schema are
  untouched.
- **Real photography.** Mostly resolved. Client photos are in and optimised
  to WebP under `images/web/`, including both provider headshots (Laura and
  Katie, the latter confirmed by the user as the navy-background portrait).
  `about.html` now carries headshots for Laura, Katie, and Adam.
  **Still needed: headshots for Angela Wenzel and Tom.** Both currently show a
  labelled `.ph--avatar` placeholder on `about.html`. Nothing in the supplied
  photo set is a usable portrait of either, and the only group shot is a
  Christmas parade photo with staff, family, and children mixed together, so
  guessing which face is which would risk putting the wrong person beside a
  name. Ask the client rather than cropping the group shot.
  Unused so far: the Grafton Chamber 2022 Outstanding Business of the Year
  award photo and the team group shots.
- **Open Graph / structured data.** No page has OG tags, so links shared to the
  Facebook and Instagram channels they actively push render as bare URLs.

## Stack

Plain static HTML/CSS/JS. No framework, no build step — this is a direct
rebuild-in-HTML project (see branch name `claude/website-rebuild-html-*`),
unlike sibling JumpStart client repos that are Next.js apps exporting a
static bundle. Structure mirrors what those sibling repos export, authored
directly instead of generated:

```
index.html, healthcare.html, health-maintenance.html, medspa.html,
pots.html, membership.html, about.html, contact.html
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
