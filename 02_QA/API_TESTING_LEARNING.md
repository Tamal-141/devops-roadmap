# API Testing with Playwright — Learning Guide
> Practice this at home. Ask any AI (Claude/ChatGPT/Copilot) to explain any section.

---

## What is API Testing?

Instead of clicking buttons on a website, we directly call the backend API and check:
- Did it return status 200?
- Is the data correct?
- Are all required fields present?

No browser needed. 10-20x faster than UI tests.

---

## The Tool We Use

```js
// This is Playwright's request fixture — it makes API calls
async ({ request }) => {
    const response = await request.get('https://example.com/api');
}
```

---

## Basic Structure of Every API Test

```js
test('test name here', async ({ request }) => {

    // Step 1: Make the API call
    const response = await request.get('URL_HERE', {
        params: { key: 'value' }   // these go in the URL as ?key=value
    });

    // Step 2: Check status code
    expect(response.status()).toBe(200);

    // Step 3: Parse the JSON response
    const body = await response.json();

    // Step 4: Check the data
    expect(body.meta.message).toBe('Success');
    expect(body.data).not.toBeNull();
});
```

---

## How to Find API Endpoints (Without Postman)

1. Open the website in Chrome
2. Press F12 → go to Network tab
3. Click "Fetch/XHR" filter
4. Interact with the page (click, search, filter)
5. A new row appears in Network tab = API call fired

**Then click that row and check:**
- Headers tab → URL and Method (GET/POST)
- Payload tab → what params were sent
- Response tab → what JSON came back

**IGNORE these (not real APIs):**
- Files ending in `.json` like `equity.json`, `story.json` → Next.js static files
- Files ending in `.css` → styling
- `collect?v=2...` → Google Analytics

---

## Real Code We Wrote — api1finance.spec.js

```js
import { test, expect } from '@playwright/test';

const API_BASE = 'https://qa.onehub.1finance.co.in';

// ── TC1: Basic status check ───────────────────────────────────────────────────
test('TC1: GET /settings - returns 200 with active content', async ({ request }) => {
    const response = await request.get(`${API_BASE}/global/landing-page/settings`);

    expect(response.status()).toBe(200);           // status check

    const body = await response.json();
    expect(body.meta.message).toBe('Success');     // outer wrapper check
    expect(body.data).toHaveProperty('is_active'); // field exists check
    expect(body.data.content.length).toBeGreaterThan(0); // array not empty
});


// ── TC2: Checking inside the array ────────────────────────────────────────────
test('TC2: Each content item has required fields', async ({ request }) => {
    const response = await request.get(`${API_BASE}/global/landing-page/settings`);
    const body = await response.json();

    // Loop through EVERY item in array (not just first one)
    for (const item of body.data.content) {
        expect(item).toHaveProperty('tag_text');    // field must exist
        expect(item).toHaveProperty('is_published');
        expect(typeof item.is_published).toBe('boolean'); // type check
    }
});


// ── TC3-TC7: Data-driven test (one test per category) ─────────────────────────
const CATEGORIES = [
    'Large & Mid Cap',
    'Large Cap Fund',
    'Mid Cap Fund',
    'Small cap Fund',   // NOTE: lowercase 'c' — API is case sensitive!
    'Flexi Cap Fund',
];

// forEach creates one test per category automatically
CATEGORIES.forEach((category, index) => {
    test(`TC${3 + index}: ${category} - returns funds`, async ({ request }) => {
        const response = await request.get(
            `${API_BASE}/scoring-ranking/mutual-funds/schemes`,
            {
                params: {
                    type: 'Active Funds',
                    featured: false,
                    page: 0,
                    category: category
                }
            }
        );

        expect(response.status()).toBe(200);
        const body = await response.json();
        expect(body.meta.message).toBe('Success');
        expect(body.data.data.length).toBeGreaterThan(0);
    });
});


// ── TC8: Checking inside the fund object ──────────────────────────────────────
test('TC8: Each fund has all required fields', async ({ request }) => {
    const response = await request.get(
        `${API_BASE}/scoring-ranking/mutual-funds/schemes`,
        { params: { type: 'Active Funds', featured: false, page: 0, category: 'Large & Mid Cap' } }
    );

    const body = await response.json();
    const fund = body.data.data[0]; // check first fund

    // All these fields must exist in every fund
    expect(fund).toHaveProperty('id');
    expect(fund).toHaveProperty('scheme_name');
    expect(fund).toHaveProperty('one_f_score');
    expect(fund).toHaveProperty('category_rank');
    expect(fund).toHaveProperty('aum');
    expect(fund).toHaveProperty('expense_ratio');
    expect(fund).toHaveProperty('isin');
    expect(fund).toHaveProperty('slug');
});


// ── TC9: Value range check ────────────────────────────────────────────────────
test('TC9: one_f_score is between 0 and 100', async ({ request }) => {
    const response = await request.get(
        `${API_BASE}/scoring-ranking/mutual-funds/schemes`,
        { params: { type: 'Active Funds', featured: false, page: 0, category: 'Large & Mid Cap' } }
    );

    const body = await response.json();

    for (const fund of body.data.data) {
        expect(fund.one_f_score).toBeGreaterThanOrEqual(0);  // cannot be negative
        expect(fund.one_f_score).toBeLessThanOrEqual(100);   // cannot exceed 100
    }
});


// ── TC10: Pagination test ─────────────────────────────────────────────────────
test('TC10: Page 2 returns different funds than page 1', async ({ request }) => {
    const page1 = await request.get(
        `${API_BASE}/scoring-ranking/mutual-funds/schemes`,
        { params: { type: 'Active Funds', featured: false, page: 0, category: 'Large & Mid Cap' } }
    );
    const page2 = await request.get(
        `${API_BASE}/scoring-ranking/mutual-funds/schemes`,
        { params: { type: 'Active Funds', featured: false, page: 2, category: 'Large & Mid Cap' } }
    );

    const body1 = await page1.json();
    const body2 = await page2.json();

    // First fund on page 1 should NOT be same as first fund on page 2
    expect(body1.data.data[0].id).not.toBe(body2.data.data[0].id);
});


// ── TC11: Pagination metadata check ──────────────────────────────────────────
test('TC11: total_pages = ceil(total_count / limit)', async ({ request }) => {
    const response = await request.get(
        `${API_BASE}/scoring-ranking/mutual-funds/schemes`,
        { params: { type: 'Active Funds', featured: false, page: 0, category: 'Large & Mid Cap' } }
    );

    const body = await response.json();
    const { limit, total_count, total_pages } = body.data;

    // Math check: if 33 funds and limit 10 → total_pages should be 4
    expect(total_pages).toBe(Math.ceil(total_count / limit));
});
```

---

## Real Code We Wrote — mutualFundApi.spec.js

```js
import { test, expect } from '@playwright/test';

const BASE = 'https://qa.onehub.1finance.co.in/scoring-ranking';

test.describe('MF Scoring & Ranking API', () => {

    // GET with query params
    test('TC1: AMC names list', async ({ request }) => {
        const response = await request.get(`${BASE}/mutual-funds/amc-names`, {
            params: { type: 'equity' }
        });
        expect(response.status()).toBe(200);
        const body = await response.json();
        expect(body.meta.message).toBe('Success');
        expect(body.data).not.toBeNull();
    });

    // GET with slug in URL path (not params)
    test('TC3: Equity fund detail by slug', async ({ request }) => {
        const response = await request.get(
            `${BASE}/equity/details/jm-flexicap-fund-g-direct-plan`
        );
        expect(response.status()).toBe(200);
        const body = await response.json();
        expect(body.meta.message).toBe('Success');
    });

    // GET with multiple slugs (comma separated)
    test('TC6: Compare 2 equity funds', async ({ request }) => {
        const response = await request.get(`${BASE}/equity/compare`, {
            params: {
                slugs: 'bandhan-small-cap-fund-g-direct-plan,axis-small-cap-fund-g-direct-plan'
            }
        });
        expect(response.status()).toBe(200);
        const body = await response.json();
        expect(body.meta.message).toBe('Success');
    });

});
```

---

## Key Concepts to Remember

| Concept | What it means | Example |
|---|---|---|
| `request.get()` | Make a GET API call | Fetching list of funds |
| `request.post()` | Make a POST API call | Submitting search |
| `params: {}` | Query string params | `?type=equity&page=1` |
| `response.status()` | HTTP status code | 200 = OK, 404 = Not Found |
| `response.json()` | Parse JSON response | Get the data object |
| `toHaveProperty` | Check field exists | `fund` has `scheme_name` |
| `toBeGreaterThan(0)` | Array is not empty | At least 1 fund returned |
| `forEach` | Data-driven test loop | Test all categories at once |
| `test.describe` | Group related tests | All MF tests together |

---

## Questions to Ask AI at Home

Copy any of these and paste to Claude/ChatGPT:

1. *"Explain this Playwright test line by line like I'm a beginner: [paste code]"*
2. *"What is the difference between params in URL path vs query string?"*
3. *"What does toHaveProperty do in Playwright?"*
4. *"Why do we use forEach to create data-driven tests?"*
5. *"What is the difference between GET and POST in API testing?"*
6. *"What are negative test cases in API testing? Give me examples."*
7. *"How do I check that every item in an array has required fields?"*

---

## What to Practice at Home

1. Pick any public API (e.g., `https://jsonplaceholder.typicode.com/posts`)
2. Open it in browser — read the JSON response
3. Write a Playwright test that:
   - Calls the API
   - Checks status is 200
   - Checks array length > 0
   - Checks first item has required fields

That's the same thing we did — just on a public API you can access from home.

---

## Current Test Files in This Project

| File | Tests | What it covers |
|---|---|---|
| `tests/api1finance.spec.js` | 14 | Settings, MF schemes by category, global search |
| `tests/scoringAndRanking/mutualFundApi.spec.js` | 15 | AMC names, details, compare, graphs, search |

**Total: 29 API tests, all passing.**
