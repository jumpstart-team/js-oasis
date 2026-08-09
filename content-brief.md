# Oasis Healthcare — Source-of-Truth Content Brief

Extracted from the live site `https://www.oasishealthcare.net/` (Squarespace 7.1) on 2026-08-08,
via WebFetch (rendered/markdown extraction) cross-checked against raw HTML pulled with `curl`
for every page and for the linked CSS/font/logo assets. All facts below are copied from the live
site; nothing has been invented, inferred, or paraphrased away. Where the site itself contains
inconsistencies (credentials spelled differently page to page, conflicting hours), both/all
versions are recorded rather than silently reconciled — flag these for the client before locking
copy.

---

## 1. Business facts

**Brand name(s):**
- Primary/site name: **Oasis Healthcare** (`og:site_name`, `<title>`, header logo alt text all say "Oasis Healthcare")
- Three divisions under one site/one location:
  - **Oasis Healthcare** — urgent care + primary care + weight loss support
  - **Oasis Collaborative** — Direct Primary Care (DPC) / membership model (POTS, primary care, headache management)
  - **Oasis MedSpa** — also styled "Oasis Medspa" in body copy (nav/footer consistently render "Oasis MedSpa"; the medspa-home hero copy uses "Oasis Medspa" lowercase-s in one place — minor inconsistency on the live site)

**Address (single shared location for all three divisions):**
> 1505 Wisconsin Ave Ste 150, Grafton, WI, 53024

Confirmed verbatim identically on: /contact, /oasis-collaborative-home, /medspa-home.

**Phone:**
- Main office line: **+262 421 8961** (also written as `262-421-8961`) — used site-wide for all three divisions, and repeated as "for Office Staff" on the pricing page.
- **Billing-specific line: 501-223-2776** — appears only once, on /payments-and-pricing: *"Call 501-223-2776 for Billing Questions and Payments"*. Note this has a different area code (501 = Arkansas) than the clinic's own 262 (Wisconsin) number — likely a third-party billing service's support line, not a second clinic location. Worth confirming with the client rather than assuming.

**Email:** info@oasishealthcare.net (used consistently across all pages)

**Hours — Oasis Healthcare clinic** (from /contact and /healthcare-home, "Clinic Hours (Walk-Ins Welcome)"):
- Monday: 8am–6pm
- Tuesday: 8am–4pm
- Thursday: 8am–4pm
- Saturday: 8am–12pm (Appointment Recommended)
- No Wednesday or Sunday hours are listed anywhere on the site — the clinic appears closed those days (or the site simply omits them; not stated either way).

**Hours — Oasis Collaborative:** ⚠️ **the live site contradicts itself between two pages:**
- /oasis-collaborative-home says: *"Monday: 12pm-3pm (by appointment only) / Friday: 8am-2pm (by appointment only)"* — no Wednesday.
- /appointments says: *"Available on Monday, Wednesday, Friday by appointment only. Monday: 12pm-3pm / Wednesday 8am-12 pm / Friday: 8am-2pm"* — Wednesday included.
- Flag this discrepancy to the client and get the correct current hours before publishing new hours copy.

**Hours — Oasis MedSpa:** Not specified anywhere on the site beyond "(Appointment Required)" (stated on /contact and implied on /medspa-home, which only offers a "Schedule NOW" CTA with no day/time listed).

**Booking / scheduling platforms (real URLs found in page source):**
- Tebra — Laura McKinnis: `https://www.tebra.com/care/provider/laura-mckinnis-np-1497931943`
- Tebra — Katie Henke: `https://www.tebra.com/care/provider/katie-henke-dnp-1659727345`
- Kareo — practice-wide: `https://practice.kareo.com/oasishealthcare`
- Kareo — Laura McKinnis (used specifically for MedSpa/Botox booking per /appointments): `http://provider.kareo.com/laura-mckinnis#?view=booking`
- Note the Tebra profile URL slugs read "laura-mckinnis-**np**" and "katie-henke-**dnp**" — i.e. Tebra's own system has Laura as "NP" and Katie as "DNP", which is one more data point in the credential-spelling inconsistency documented in Section 2.

**Payment portal:** `https://paymnt.io/ao900p` (linked from /payments-and-pricing for online bill pay)

**Logo file(s) found:**
- Header logo (used site-wide) and Open Graph/social share image are the **same single file**, a "stacked, full color" lockup:
  `https://images.squarespace-cdn.com/content/v1/5c90fcbafd6793405313f5d5/0be1644b-3d16-4d4a-bce8-0d565853f956/Oasis+Healthcare_Stacked_Full+Color.png?format=1500w`
  (alt text: "Oasis Healthcare"; OG copy of same asset at `format=1500w`, 1301×551px per og:image dimensions)
- No other logo variant (e.g., horizontal lockup, icon-only mark, white/reversed version) was found referenced anywhere in the head or nav markup — only this one file.

**Favicon:** The site is using Squarespace's **generic default favicon** (`https://assets.squarespace.com/universal/default-favicon.ico`), not a custom-uploaded icon. No brand-specific favicon exists to migrate.

**Platform:** Confirmed via page source (`Static.SQUARESPACE_CONTEXT`) — the current site runs on **Squarespace 7.1**.

**Social media:** No outbound links to a Facebook, Instagram, LinkedIn, or X/Twitter page were found anywhere in the HTML (only a generic Facebook Open Graph XML namespace declaration, which is not a real profile link). The site does not appear to link out to any social profiles.

---

## 2. Providers

| Name | Credential(s) as they appear (verbatim, page by page) | Division | Notes |
|---|---|---|---|
| **Laura Mckinnis** | "Laura McKinnis, NP" (healthcare-home) · "Laura Mckinnis, APNP" (about-staff heading and bio) · "Laura McKinnis, APNP-C" (appointments page) · Tebra URL slug says "-np-" | Oasis Healthcare (owner/provider); also does MedSpa bookings via Kareo | Owner and Provider at Oasis Healthcare. 15 years ER experience. Bio: *"With 15 years ER experience Laura offers expertise in acute illnesses and injury. After years of hospital based emergency medicine, Laura chose to provide care directly to patients in an effort to bring clinical expertise and convenience together. Children and women's health are a particular joy. We focus on urgent care that is convenient for busy families. We know how hard it is to juggle life and we want provide care that is easily accessible. Since 2020, Oasis had been providing access to healthcare for all individuals, regardless of income. We offer insurance, flat rates, and clinic subscription plans to make healthcare accessible for everyone."* — Note: practice has been operating "since 2020" per this bio. |
| **Katie Henke** | "Katie Henke, DNP" (healthcare-home, about-staff, collaborative-home) · "Katie Henke, APNP" (collaborative-about page heading) · "Katie Henke, APNP-C" (appointments page) · Tebra URL slug says "-dnp-" | Oasis Collaborative (primary provider); also delivers some MedSpa-adjacent treatments (Botox, IV therapy, nerve blocks) per collaborative-about copy | Bio (identical wording used on both about-staff and oasis-collaborative-about): *"Katie is an experienced nurse practitioner specializing in the diagnosis and management of Postural Orthostatic Tachycardia Syndrome (POTS) and related autonomic disorders[, and headache disorders — clause present on about-staff, absent on collaborative-about]. Katie also offers primary care for adolescents and adults. Recognizing the limited access many patients face when seeking specialized care for these chronic neurologic disorders, Katie is committed to advancing patient outcomes through evidence-based treatment and individualized care plans. By integrating the latest research with practical symptom management, Katie helps patients achieve measurable improvements in daily functioning and long-term quality of life."* |
| **Kelly Plagemann** | "Kelly Plagemann, PA-C" | Oasis Healthcare | Only appears on /about-staff (not mentioned on /healthcare-home or elsewhere). Bio (first-person): *"It is a privilege to serve patients and their families. I have been practicing in emergency medicine and urgent care for several years which has provided me with a background of varied experience at several locations in Wisconsin. I find it a joy to problem solve with and listen to my patients to help address their healthcare needs and concerns."* Languages Spoken: English, Spanish. |

**Nursing / support staff** (from /about-staff, under heading "Nursing Staff" — subheading: *"The magic happens when excellent clinicians are empowered to provide excellent care"*):
- **Angela, RN** — Nurse Manager (and, per bio text, COO). Bio: *"Angela is RN and Nurse Manager at Oasis Healthcare. She has prior experience in hospice care, emergency medicine, and urgent care. She has been with Oasis Healthcare since the beginning. She is an invaluable part of the team and runs the show! She is the Nurse Manager and COO as well as great friend to have. She has a love for tiny, special needs pups and is always running to keep up with kids, work, and life."*
- **Tom, RN** — Bio: *"Tom has been with Oasis since the very beginning. He has worked as a EMT and is now a RN in Emergency Medicine. He helps Oasis Healthcare in all capacities including nursing, business support, and the occasional remodel. He has a penchant for meteorology and loves a good sunny day on the golf course."*
- **Adam, Registration, EMT** — Bio: *"Adam is a graduate from St Thomas University with a bachelor degree in Biology. He is studying to become a licensed EMT and preparing for future work in the healthcare field. He has a particular talent for research, business, and painting."*

No testimonials from patients were found on any of the 17 pages fetched.

---

## 3. Per-division breakdown

### Oasis Healthcare (urgent care / primary care / weight loss)

**Positioning copy used (healthcare-home hero):**
- "From Illness to Wellness"
- "Convenient & Cost-Effective Care"
- About blurb: *"Convenient urgent care services designed for busy families. We believe in accessibility for all, offering a range of payment options including insurance, flat rates, and subscription plans, ensuring healthcare is available to everyone, regardless of income."*

**Healthcare-services page tagline:** *"From urgent care to primary care, our expert team provides high-quality, compassionate healthcare to move from illness to wellness."*

**Full services list (verbatim, from /healthcare-services):**
1. **Urgent Care** — *"Oasis Healthcare providers are ER trained with years of experience in acute injuries and illness for patients of all ages."* Resources noted: *"Labs available on site and full bloodwork available."* / *"X-rays available at partner site with results in 1-2 hours"* (X-rays are NOT done on-site — partner site). "Sick Visits & Injuries" list: Cough, strep, mono, pneumonia · Injuries – fracture and sprains, lacerations, infections · STIs and contraception care · School Physicals
2. **Primary Care** — *"Convenient Access for primary care with attention to your unique healthcare needs. Open minded providers ready to listen to your treatment preferences and work together to form a care plan that promotes health and wellness while actively and appropriately managing disease."*
3. **Prescription Weight Loss** — *"With GLP Medication and Clinical Management. We support your weight loss efforts with prescription GLP, curated medical treatments, and weekly to monthly visits. Medications help control appetite and most patients see 10%-20% weight loss!"*
4. **DOT Exams** — *"No need to wait weeks for appointments. Update your DOT physical requirement. Taking care of you so you can stay on the road."*
5. **Pre-Employment Physicals** — *"Taking care of your employees is top priority. We are able to perform pre-employment physicals and drug and alcohol screening in clinic (non DOT). Same day appointments usually available."*

No prices appear on the services page itself.

**Weight Loss Support page (/weight-loss-support) — full copy:**
- Hero: "Weight Loss Support with GLP Therapies & More" / "Medical Support, Counseling, and GLP Therapies. Additional Curated Medications as Needed"
- "How Do GLP Medications Work?" — *"GLP medications help control appetite, fullness triggers, and cravings. Medications increase production of fullness hormones and suppress the drive to over eat. Using these medications under the care of a clinician is a powerful tool to help you achieve your weight loss goals."*
- Closing section: "Sustainable Weight Loss with GLP Therapy—Start Your Journey Today." — *"Break free from fad diets and discover a science-backed approach to weight loss. Our medically supervised weight loss program helps you achieve lasting results safely and effectively."*
- No pricing, testimonials, FAQ, or eligibility criteria appear on this page.

**Pricing (/payments-and-pricing) — exact figures:**
- Insurance accepted (verbatim list, including a source-site typo "Newtork Health" preserved as-is): *"Aetna, BCBS, CCHP, Chorus, Cigna, First Health, Humana, ICare Managed Health Services, Medicare, Molina, Newtork Health, UHC/UMR and MEDICAID, Tricare and many more"*
- Header: "Discounted Cash Rates Always Available" — **$149–$349**
- Disclaimer: *"*Pricing Listed Below ONLY relates to discounted cash rate payment. Insurance rates vary by plan and individual coverage."*
- **Oasis Healthcare Clinic Membership: $99/Month**
  - Includes: "annual exam and labwork" · "Sick visits and follow up visits INCLUDED" · "Onsite Laboratory services INCLUDED"
  - Terms: *"*12 month membership required"* / *"*Not available for Medicare or Medicaid covered individuals"*
- Payment contact: *"Call 501-223-2776 for Billing Questions and Payments"* / *"262-421-8961 for Office Staff"*
- Online payment: `https://paymnt.io/ao900p`

*(Note: this "$99/mo Clinic Membership" is a separate, distinct offering from Oasis Collaborative's DPC membership — do not conflate the two when rebuilding.)*

---

### Oasis Collaborative (DPC / membership — Katie Henke, DNP)

**Positioning copy (collaborative-home hero):**
- "Specialized Care for Complex Conditions"
- "Compassionate treatment for POTS, primary care, and headache management—tailored to restore balance and quality of life."

**About copy (collaborative-home "About Oasis Collaborative" section):**
> *"At Oasis Collaborative, we believe that healing begins with understanding. Our team specializes in POTS, primary care, and advanced headache management, offering treatments such as IV therapy, Botox, nerve blocks, and more. By combining clinical expertise with compassionate care, we provide personalized solutions that help patients find relief, restore balance, and regain quality of life."*

**DPC model explanation (used on both /oasis-collaborative-home and /oasis-collaborative-payment-pricing, identical text):**
> *"Direct Primary Care (DPC) is an innovative healthcare model that offers personalized, affordable, and accessible primary care services through a simple, fee-based plan. Patients enjoy extended visits, direct access to their healthcare providers, and a focus on preventative care, all without insurance middlemen. Experience high-quality, relationship-driven healthcare designed to keep you healthy and save you money."*

**Services (/oasis-collaborative-services):**
- Page heading: "Healthcare Designed Around You" / Tagline: *"Explore our specialized services in POTS and primary care—delivering personalized treatment, advanced therapies, and the time your health deserves."*
- **POTS** — *"We provide comprehensive care for patients with POTS, addressing the complex symptoms of this condition with individualized treatment plans."*
- **Primary Care** — *"Oasis Collaborative offers personalized primary care that goes beyond routine checkups. We focus on prevention, chronic condition management, and overall wellness, providing the time and attention needed to address your health concerns thoroughly and develop a proactive care plan tailored to you."*

**Pricing (/oasis-collaborative-payment-pricing):** ⚠️ **Confirmed via both WebFetch and raw-HTML source inspection (searched for every "$" character in the page — zero found): this page publishes NO membership tiers, NO enrollment fee, NO dollar amounts of any kind.** It contains only the general DPC-model description above, a "Explore our FAQs..." pointer, and a "Book an Appointment" CTA. **This is a real content gap on the current site, not a fetch failure** — the actual DPC price point(s) will need to come from the client directly; nothing to migrate here.

**FAQs (/oasis-collaborative-faqs) — verbatim Q&A, confirmed against raw HTML:**

**Q: What is Direct Primary Care**
> *"Direct Primary Care (DPC) is healthcare model where patients pay a flat fee for access to a primary or specialty care provider. No insurance, no surprise bills—just more convenient appointments, longer visits, direct messaging, and personalized care that puts the patient first."*

**Q: Do you take insurance?**
> *"We don't bill insurance for care because it allows us to give you better access and more time with your provider. Insurers often increase costs and burden on clinic resources which unfortunately limits providers ability to spend more time on your care. With direct access you can see your provider for the time that you need to fully address your concerns and develop a treatment plan. We offer reasonable rates to provide a better healthcare experience."*

**Q: Why does Oasis Collaborative not take insurance when Oasis Healthcare does?**
> *"Oasis Collaborative is a clinic that operates independently but shares office space with Oasis Healthcare. Being a separate business allows us to spend more time with you and address more complex health concerns that might not be fully covered or prioritized by insurance. Our goal is to give you better access and personalized care when you need it most."*

No testimonials on any Collaborative page.

---

### Oasis MedSpa (Botox, IV hydration, aesthetic packages)

**Positioning copy (medspa-home hero):**
- "Restoration & Rejuvenation Using Nature & Science"
- "Experience the perfect blend of medical expertise and aesthetic precision for natural, radiant beauty."
- Closing CTA line: "Invest in Your Glow" / "Your personalized treatment awaits."

**Product lines called out on medspa-home:** "Ourself Lip Filler Alternative," "LightStim," "PCA Skincare," "L'Bri Skincare"

**"Beauty Bank" loyalty program (medspa-home, verbatim):**
> *"BEAUTY BANK — Earn Beauty Bucks for every $100 saved. Enjoy members only Rewards and Specials. Call today to set up Your Beauty Bank 262-421-8961"*

**Full services list (/medspa-services):**
1. **Skincare and Medical Grade Peels** — *"Customized treatments to nourish, repair, and protect your skin. Whether you're looking to clear acne, reduce fine lines and wrinkles, or restore your natural glow, we use high-quality products and advanced techniques tailored to your skin's unique needs."*
2. **Microneedling** — *"A minimally invasive treatment that stimulates your skin's natural healing process to improve texture, tone, and overall radiance. Using tiny, medical-grade needles, microneedling boosts collagen production to reduce the appearance of fine lines, acne scars, and enlarged pores—revealing smoother, firmer, more youthful-looking skin. The Collagen P.I.N.® is FDA cleared as a treatment to improve the appearance of facial acne scars in adults 22 years and older in Fitzpatrick Skin Types I-III"*
3. **Anti-Wrinkle Injections** — *"Subtle, strategic enhancements that refresh your look without changing your natural expression. Administered by skilled professionals, our injectable treatments help smooth fine lines, restore volume, and enhance facial balance."*
4. **IV Hydration** — *"Feel better from the inside out. Our IV therapy blends essential fluids, vitamins, and nutrients to support immunity, energy, and recovery—ideal for travel, stress, or a simple wellness reset."*
5. **Light Therapy (LightStim)** — *"A gentle, non-invasive treatment that uses LED light to support skin healing, reduce inflammation and acne, and stimulate collagen production. Great on its own or as a complement to other skincare services."*

No prices on this page.

**Botox / Anti-Wrinkle Injections detail page (/botox) — verbatim:**
- Headings: "Enhance, Refine, Rejuvenate" / "Anti-Wrinkle Injections" / "Tox Injections: The Art of Subtle Rejuvenation" / "Why Choose Xeomin?" / "Smooth fine lines with precision."
- Sub-heading copy: *"Smooth fine lines, restore lost volume, and achieve a refreshed, natural look with expertly applied botox-like treatments."*
- Body: *"Xeomin is one of the most effective and minimally invasive treatments for reducing fine lines and wrinkles, helping you achieve a smooth, refreshed appearance without the need for surgery. Whether you're targeting crow's feet, forehead lines, or frown lines, our expert injectors tailor each treatment to your unique facial anatomy, ensuring natural-looking results that enhance your features."*
- "Why Choose Xeomin?" bullets: Smooth and soften wrinkles · Quick, in-office treatment with no downtime · Subtle, long-lasting results · Safe and FDA-approved
- Closing: *"At our MedSpa, we take a customized approach to anti-wrinkle injections, focusing on enhancing your natural beauty and helping you achieve the look you've always desired. Book a consultation today to learn how Xeomin can work for you."*
- Additional-use note: *"Our personalized approach ensures subtle, balanced results that enhance your features without looking overdone. Men and women can benefit from additional medical treatment of tension headaches and TMJ pain using carefully placed xeomin product to relax muscles with the added benefit of looking younger."*
- **Important brand detail: the injectable product used is Xeomin, not Botox brand** — the page and URL are titled "Botox" for SEO/searchability, but the actual product named throughout the copy is **Xeomin**. Carry this distinction into the rebuild rather than defaulting to "Botox" as the product name.
- **No pricing (per-unit or per-area) appears on this page** — confirmed by scanning raw HTML for every "$" character (zero found).

**IV Hydration Menu (/iv-hydration-menu) — verbatim, confirmed against raw HTML menu block:**
- Heading: "Replenish & Restore"
- Intro: *"Recharge your body with nutrient-rich IV therapy designed to boost energy, enhance recovery, and keep you feeling your best."*
- **Pricing: "$199 IV fluid + $29 per medication additive"**
- Menu items (name — contents):
  1. **Dehydration** — IV fluid
  2. **Headache** — IV Fluid + toradol, zofran
  3. **Immune Boost** — IV Fluid, Vit C, Zinc, B complex
  4. **Travel Well** — IV Fluid, Vit C
  5. **NAD+** — IV Fluid — benefits listed: "Anti-Aging/Energy/Recovery"
- No per-drip itemized pricing beyond the base $199 + $29/additive formula; individual dosages/concentrations are not published.

**Treatment Packages (/treatment-packages) — verbatim, confirmed complete against raw HTML (all 5 packages present, no pricing anywhere on the page — confirmed zero "$" characters in source):**
- Page heading: "Targeted Solutions, Exceptional Results" / "Treatment Packages" / *"Explore our curated bundles designed to deliver results and maximize value."*

1. **The Signature Glow** — *"Our Best Treatment Plan for Overall Skin Rejuvenation including Anti-Wrinkle and Improvement in Skin Tone and Texture."*
   - Botox up to 150 Units per year
   - 3 Facial or Decolette Peels per Year
   - 3 Microneedling Sessions Per Year PLUS exosome mask post treatment
   - 3 FREE Wrinkle or Acne Light Therapy post treatments
   - 1 FREE IV therapy per year

2. **Clear Confidence** — *"Treatment for acne and scar reduction."*
   - 3 PCA Acne Peels per year
   - 3 FREE Blue Light Post Therapy
   - 3 FREE Therapeutic Oat Milk mask

3. **Heal and Reveal** — *"Reduce fine lines and wrinkles, and improve tone and texture."*
   - 3 Microneedling Sessions Per Year
   - 3 FREE Light Therapy for Wrinkles/Skin Tightening
   - Free exosome therapy post treatment

4. **Pure Rejuvenation** — *"Natural skin rejuvenation and total body health."*
   - 3 PCA No Peel Peels OR 3 Microneedling Sessions per year
   - 3 IV therapy sessions per year
   - 3 FREE Curated Light Therapy Sessions
   - 3 FREE Oat milk mask treatment OR exosome mask

5. **Fully Integrated Health and Wellness Package**
   - Medical Clinic Access
   - 4 sick visits per year
   - 1 annual physical with health screening labs for FREE

No testimonials on any MedSpa page.

---

## 4. Current visual branding

**Colors — FOUND.** Extracted from the linked production stylesheet (`site.css`, a Squarespace "versioned-site-css" file referenced in every page's `<head>`), which defines the site's actual color palette as CSS custom properties in HSL. Converted to hex via standard HSL→RGB math (exact math, not eyeballed — but note Squarespace's own stored percentages are already rounded, so treat these hex values as a very close approximation, confirm final swatches against the client's brand guide if one exists):

| Token | Raw value (site.css) | Approx. hex | Apparent role |
|---|---|---|---|
| `--white-hsl` | `0, 19.05%, 91.76%` | `#EEE6E6` | Warm off-white / page background |
| `--black-hsl` | `220, 17.14%, 13.73%` | `#1D2129` | Near-black, navy-charcoal — body text |
| `--accent-hsl` (= `--safeLightAccent-hsl` = `--safeDarkAccent-hsl`) | `12, 69.72%, 50.78%` | `#D94D2A` | Primary brand accent — a burnt-orange/terracotta red |
| `--lightAccent-hsl` | `15.65, 26.44%, 82.94%` | `#DFCEC8` | Light dusty-rose/tan — section backgrounds, light fills |
| `--darkAccent-hsl` | `216, 20%, 29.41%` | `#3C485A` | Dark slate blue — secondary/dark accent |

**Fonts — FOUND.** Also from `site.css`'s `:root` typography tokens, cross-checked against the actual `@font-face` declarations (self-hosted on Squarespace's font CDN — these are Google Fonts names but served from `file.squarespace-cdn.com`, not a `fonts.googleapis.com` or Adobe Fonts/Typekit link):

- **Heading font:** Tenor Sans (`--heading-font-font-family`) — weight 400, letter-spacing -0.03em, line-height 1.4em
- **Body font:** Karla (`--body-font-font-family`) — weight 400 (also loaded at 700/bold and italic), letter-spacing -0.02em, line-height 1.5em
- **Meta/decorative font:** Averia Serif Libre (`--meta-font-font-family`) — a handwritten-style serif, weight 400, letter-spacing 0, line-height 1.2em — used for meta/eyebrow-style text rather than body or main headings
- Base font size: **16px**
- Type scale (rem, from site.css tokens): H1 4rem · H2 2.8rem · H3 2.2rem · H4 1.6rem · large text 1.4rem · normal text 1.1rem · small text 0.9rem · meta text 1rem

**Logo — FOUND.** Single "stacked, full color" PNG lockup, used identically as both the header logo and the Open Graph share image:
`https://images.squarespace-cdn.com/content/v1/5c90fcbafd6793405313f5d5/0be1644b-3d16-4d4a-bce8-0d565853f956/Oasis+Healthcare_Stacked_Full+Color.png?format=1500w`
No alternate lockup (horizontal, reversed/white, icon-only) was found anywhere in the markup.

**Favicon — checked, none custom.** Site uses Squarespace's generic default favicon (`https://assets.squarespace.com/universal/default-favicon.ico`) — there is no brand-specific favicon to carry forward.

**Platform — FOUND.** Squarespace 7.1 (confirmed via the `Static.SQUARESPACE_CONTEXT` JS object embedded in every page).

**Could not determine:** Any brand guideline documentation, exact Pantone/print color specs, or a definitive statement from the client on which of these tokens is the "primary" brand color vs. an incidental UI accent — the CSS only exposes functional token names (`accent`, `lightAccent`, `darkAccent`), not brand-intent names. Treat the extracted hex values as a faithful snapshot of the current site's rendered palette, not as a confirmed brand-guide standard.

---

## 5. Full page inventory (17 URLs)

| # | URL | Contents (one-line) |
|---|---|---|
| 1 | `/contact` | Hours & Location: address, phone, email, Oasis Healthcare clinic hours, MedSpa "(Appointment Required)" note, per-division nav footers. Fetched successfully; content confirmed complete via raw HTML. |
| 2 | `/healthcare-home` | Oasis Healthcare landing page: hero ("From Illness to Wellness"), 5-service summary strip, about blurb, hours, contact block, CTAs. Fetched successfully. |
| 3 | `/healthcare-services` | Full Oasis Healthcare services list with descriptions (Urgent Care, Primary Care, Prescription Weight Loss, DOT Exams, Pre-Employment Physicals). No prices. Fetched successfully, confirmed via raw HTML. |
| 4 | `/weight-loss-support` | GLP/weight-loss program page: how GLP meds work, program framing copy. No pricing/testimonials/FAQ present on page. Fetched successfully, confirmed via raw HTML. |
| 5 | `/payments-and-pricing` | Oasis Healthcare pricing: insurance list, $149–$349 discounted cash rate, $99/mo clinic membership terms, billing phone, payment link. Fetched successfully, confirmed via raw HTML (exact dollar figures verified). |
| 6 | `/about-staff` | Full staff directory: 3 providers (Laura Mckinnis, Katie Henke, Kelly Plagemann) + 3 support staff (Angela RN, Tom RN, Adam) with bios. Fetched successfully, confirmed via raw HTML. |
| 7 | `/oasis-collaborative-home` | Oasis Collaborative landing page: hero, About section, DPC model description, hours/contact block (Mon/Fri only — no Wednesday, conflicts with /appointments), pricing teaser, CTA. Fetched successfully, confirmed via raw HTML. |
| 8 | `/oasis-collaborative-about` | Katie Henke provider bio page (same bio text as about-staff, credential shown as "APNP" here vs "DNP" elsewhere). Fetched successfully. |
| 9 | `/oasis-collaborative-services` | POTS + Primary Care service descriptions for the Collaborative division. No pricing. Fetched successfully, confirmed via raw HTML. |
| 10 | `/oasis-collaborative-payment-pricing` | **No pricing tiers, no dollar amounts of any kind published** — only general DPC-model description + FAQ pointer + booking CTA. Confirmed via both WebFetch and a full raw-HTML scan for "$" (zero matches). This is a genuine content gap on the live site. |
| 11 | `/oasis-collaborative-faqs` | 3 FAQ Q&As on the DPC model and why Collaborative doesn't take insurance (full verbatim text captured in Section 3). Fetched successfully, confirmed via raw HTML. |
| 12 | `/medspa-home` | Oasis MedSpa landing page: hero, 5-service icon strip, product lines, "Beauty Bank" loyalty program copy, hours/contact block. Fetched successfully, confirmed via raw HTML. |
| 13 | `/medspa-services` | Full MedSpa services list with descriptions (Skincare/Peels, Microneedling, Anti-Wrinkle Injections, IV Hydration, Light Therapy/LightStim). No prices. Fetched successfully, confirmed via raw HTML. |
| 14 | `/treatment-packages` | All 5 aesthetic bundle packages (Signature Glow, Clear Confidence, Heal and Reveal, Pure Rejuvenation, Fully Integrated Health and Wellness) with full inclusions. **No prices published** — confirmed via raw-HTML scan. Fetched successfully, all 5 packages verified present (WebFetch's first pass had flagged possible truncation; raw HTML confirms nothing is missing beyond the pricing itself). |
| 15 | `/botox` | Xeomin/anti-wrinkle injection detail page — product is branded "Xeomin," not "Botox," despite the URL slug. No pricing. Fetched successfully, confirmed via raw HTML. |
| 16 | `/iv-hydration-menu` | IV drip menu: 5 named drips + base pricing formula ($199 + $29/additive). Fetched successfully, confirmed via raw HTML menu block. |
| 17 | `/appointments` | Central booking hub: per-division/provider hours summary + live links to Tebra (both providers) and Kareo (practice-wide + Laura McKinnis MedSpa booking). Fetched successfully, confirmed via raw HTML including actual outbound booking URLs. |

All 17 pages returned usable content — none failed to fetch. The only genuine gaps in the source material (not fetch failures, but content the client's own site doesn't publish) are: **Oasis Collaborative DPC membership pricing** (page 10) and **prices for the 5 MedSpa treatment packages** (page 14) and **Botox/Xeomin per-unit pricing** (page 15) — none of these are published anywhere on the live site and will need to come directly from the client.

---

## 6. Client updates (supersede the live-site crawl above where they conflict)

Two documents supplied directly by the user after the initial rebuild, both
more authoritative than the live-site crawl in Sections 1–5: a recorded
branding/website call between JumpStart (Eric Caballero, Joanna De Jesus
Flores) and the client (Laura McKinnis), and JumpStart's signed "Website &
Marketing Questionnaire" intake form (submitted by Laura McKinnis, Aug 5,
2026). Where the two disagree with each other, **the intake form wins** —
it's Laura's own written submission, dated after the call. Nothing below is
inferred; every line traces to one of these two sources.

**Business structure — Oasis Collaborative is being retired as a brand.**
Per the call, Laura is restructuring so "Oasis Healthcare" is the single
front-facing name for everything; Oasis Collaborative becomes an internal
MSO (management service organization), not a patient-facing business. This
was described as still pending an attorney meeting at call time, but is the
clear stated direction, and the user confirmed applying it now. Site
impact: `collaborative.html` removed; its content (POTS/headache/neurology
care, DPC explanation, FAQ) now lives in `membership.html`, framed as "how
you pay for care" under one practice rather than a separate business. The
intake form separately and explicitly requests a "DPC info page," so the
dedicated page was kept — just not branded as "Oasis Collaborative."

**Confirmed real membership pricing** (call + intake form agree exactly):
- **$99/month** — individual, no age banding between kids and adults
- **$249/month** — family, max
- **$149/month** — specialty care: weight loss program, specialist care
  (neurology and related specialists), and patients 65 and older

This replaces the single "$99/mo Clinic Membership" figure in Section 3
above, which undersold the real structure — specialty/neurology care (what
Oasis Collaborative used to cover) is part of this $149 tier, not unpriced.

**Provider credentials — resolved via the intake form's official bios**
(the form has a dedicated "Provider Biographies" section, written in
first/third person as if meant to be published verbatim):
- **Laura Mckinnis, APNP** (not APNP-C — an earlier round of questions
  guessed APNP-C before this form surfaced; the user confirmed the intake
  form's plainer "APNP" is correct)
- **Katie Henke, NP** (not DNP — same correction; NP is what her official
  bio in the intake form uses)
- **Angela Wenzel, RN** — the intake form gives her last name; the live
  site crawl in Section 2 only had "Angela, RN"

**Membership/specialty-care hours — resolved** (the call didn't address
this; the user picked directly): **Monday 12–3pm, Friday 8am–2pm only, no
Wednesday.** This overturns the Section 1 guess, which had gone with the
version that included Wednesday.

**MedSpa/treatment-package pricing is deliberately withheld, not a gap.**
Per the call, Laura tried publishing full pricing when they started and
"it only led to complaints... as soon as we pulled all the pricing off,
everybody's fine." This is an intentional, ongoing business choice, not
something waiting on the client to supply — site copy says "we quote
pricing at your consultation," not "coming soon" or "not yet published."

**Weight loss needs to be prominent.** Direct quote from the call: "we do
a large percentage of our patients find us because of weight loss... that
probably needs to be in there fairly high." It now has its own home-page
band and a dedicated, elevated section on `healthcare.html` (previously
just one bullet among five services).

**Real mission/vision copy, from the intake form** (used more directly in
`about.html`'s hero than the paraphrase this repo started with): *"We are
owned by clinicians. Our vision is to make healthcare accessible and
affordable... healthcare is scary for people. We want to remove barriers
of access to healthcare... Our clinic is warm, inviting, and feels like
home. We offer care across the lifespan from children to adults."*

**Audience, from the intake form:** ideal patients are women 30–50;
membership/DPC patients skew small-business owners, self-employed in their
20s without insurance, or adults 63–67 not yet Medicare-eligible. Brand
should feel "warm, welcoming, healthcare specific but not industrial or
clinical." (Specific internal business/revenue targets from the intake form
are intentionally not logged here — this repo is public — see the session
notes if you need them.)

**Real social handles, from the intake form:** Instagram `oasis.healthcare`,
Facebook `https://www.facebook.com/OASISHEALTHCARE.hereforyou/` (exact URL
supplied by the user). Neither was linked from the live site itself. Added
to every page's footer.

**Preferred CTA language, from the intake form:** "Schedule appointment and
talk to care coordinator" — used on `membership.html`'s CTAs specifically;
kept the simpler "Book an appointment" for urgent-care/MedSpa contexts
where "talk to a care coordinator" doesn't fit the same-day-visit framing.

**Explicitly requested, not yet built — needs more from the client:**
- **Price comparison section** ("value vs. traditional care") — intake
  form says yes, but gave no real numbers. Built a qualitative comparison
  (what membership includes vs. typical insurance friction) with zero
  invented dollar figures. If the client wants numeric comparisons, needs
  real sourced figures from them first.
- **Women's health, HRT, etc.** — intake form asks for this as a new
  service area not on the live site at all. No specifics given (services,
  provider, pricing). The user explicitly chose to wait for details rather
  than publish anything underspecified — **not on the site in any form**,
  don't add a placeholder without checking with the user first.

**Known but not yet actionable** (kept deliberately vague here — this repo
is public, and the specifics are the client's non-public plans; ask the
user/account team if you need exact details):
- New clinical/support hires are in progress; no names or bios exist yet
  for them — don't invent placeholder staff.
- A future change in service area is under discussion, which is why the
  footer says "serving the greater Milwaukee area" rather than naming only
  Grafton — don't claim any new office location exists yet.
- Laura mentioned real photos/videos of the space and team may be supplied
  later ("if you've done any photo shoots... drop those pictures"). Until
  then the site stays typography-led with no stock photography, per
  `anti-generic-design` and `hallmark`'s honest-content rules.
