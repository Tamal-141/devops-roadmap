# QA Learning — Tamal's Automation Progress
> Weekend focus (Saturday/Sunday) — API, Performance, Database, UI Automation
> Paste this in any AI chat when working on QA topics

---

## WHO I AM (QA context)

My name is Tamal. I work at 1Finance as a QA automation engineer.
I am building depth in QA while also transitioning to DevOps.

**QA Skill level: 6/10**
- Playwright UI: 6/10
- API Testing: 6/10
- Performance Testing (k6): 1/10
- Database Testing: 0/10

---

## WHAT I ALREADY KNOW (don't re-teach)

### Playwright Basics
- `page.locator()`, `page.click()`, `page.goto()`
- `expect(locator).toBeVisible()`
- Page Object Model (POM) — separating locators from tests
- `test.beforeEach`, `testInfo.skip()`, `test.setTimeout()`
- `evaluate(el => el.click())` — JS click to bypass DOM interception
- `{ force: true }` vs JS evaluate

### API Testing with Playwright
- `request` fixture, `request.get(url, { params: {} })`
- `response.status()`, `response.json()`
- `expect(body.meta.message).toBe('Success')`
- `toHaveProperty()`, `toBeGreaterThan(0)`
- `forEach` with index — data-driven tests
- `test.describe` — grouping tests

### Key Concepts
- XHR vs Fetch
- Next.js `.json` static files vs real APIs
- Real APIs on: `qa.onehub.1finance.co.in`
- API Test Pyramid — API tests 10-20x faster than UI
- DevTools Network tab — find endpoints

### 1Finance API Tests Written (don't repeat)
- `/global/landing-page/settings`
- `/scoring-ranking/mutual-funds/schemes` (5 categories)
- `/product-scoring/v1/get-global-search-list`
- `/scoring-ranking/mutual-funds/amc-names`
- `/scoring-ranking/equity/details/{slug}` and `/compare`
- `/scoring-ranking/mutual-funds/fundamental-ratios-graph`
- `/scoring-ranking/mutual-funds/search`
- `/scoring-ranking/mutual-funds/rolling-returns-graph`
- `/scoring-ranking/tax-saver/details/{slug}` and `/compare`
- `/scoring-ranking/debt/details/{slug}` and `/compare`
- `/scoring-ranking/mutual-funds/schemes/categories`
- `/scoring-ranking/hybrid/compare` and `/details/{slug}`
- `/scoring-ranking/mutual-funds/tracking-error`

---

## QA IMPROVEMENT ROADMAP

### API Testing — Level 5 → 8
Current level: 5/10. Missing:
- [ ] Negative tests (wrong slug → 404, missing param → 400)
- [ ] Loop through ALL array items, not just [0]
- [ ] Response time assertions
- [ ] Data format validation (regex)
- [ ] Schema/contract testing

### Performance Testing with k6
Current level: 1/10
- [ ] What is k6, install, first script
- [ ] Load test 1Finance APIs
- [ ] Read and understand k6 results
- API to test: `https://qa.onehub.1finance.co.in/scoring-ranking/mutual-funds/amc-names?type=equity`

### UI Automation — AutomationExercise
- [ ] Automate `automationexercise.com` — e-commerce with UI + API
- [ ] Registration, login, products, cart, checkout
- Use Playwright (not Selenium)
- This will also be used for DevOps pipeline project

### NPS Calculator (1Finance)
- [ ] Fix locators on: `https://1finance.co.in/retirement-planning/nps-calculator`
- Tests currently skipped

### Database Testing
- [ ] Learn basics — connect to DB, run queries in test
- [ ] Separate learning track

---

## 1Finance Project Info

**Project:** `c:\TTB`
**Tech stack:** Playwright, JavaScript, Node.js
**Test URLs:**
- Frontend QA: `https://website-frontend-qa.1finance.co.in`
- Production: `https://1finance.co.in`
- API Base: `https://qa.onehub.1finance.co.in/scoring-ranking`

**Test Files Status:**
| File | Status |
|------|--------|
| tests/About/QFA.spec.js | Passing |
| tests/calculators/npsCalculator.spec.ts | SKIPPED (fix locators) |
| tests/pillar/retirementPlanning.spec.js | Passing |
| tests/api1finance.spec.js (14 tests) | ALL PASSING |
| tests/scoringAndRanking/mutualFundApi.spec.js (15 tests) | ALL PASSING |

---

*Last updated: 23 April 2026*
