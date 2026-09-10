## Frontend Links: Support Ctrl+Click to Open in New Tab

Links that navigate to a new page should work with Ctrl+Click (or Cmd+Click / middle-click) to open in a new tab, while a normal click uses the SPA router (no full page reload).

**Rules:**
- Use `<Link href="...">` (Next.js) or `<a href="...">` rather than `router.push()` inside a bare `onClick` handler
- `<Link>` / `<a href>` gives you both: the router intercepts normal clicks (fast SPA navigation), and the browser handles Ctrl+Click / middle-click natively (new tab, no reload)
- A `router.push()` inside `onClick` swallows the event — Ctrl+Click does nothing or still triggers the handler, breaking new-tab behavior
- Never use `e.preventDefault()` unconditionally on link elements; only call it when you have a specific reason (e.g., form submission), not just to intercept navigation

**Why:** Users rely on Ctrl+Click / middle-click to multitask. Blocking it by using `router.push()` in a click handler breaks this expectation without any benefit.

**How to apply:** Any clickable element that navigates to another route must render as a proper anchor (`<Link href>` or `<a href>`) so both normal and modifier-key clicks work as expected.
