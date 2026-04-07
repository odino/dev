## URL-First UI State Management

Persist UI state in the URL whenever practical — filters, sorting, checkboxes, selected tabs, pagination, search terms. This makes every view shareable and deep-linkable.

**Rules:**
- Default to URL params for any state a user might want to share or return to
- Only skip URL persistence if the param count or value length would get unwieldy
- When navigating from one route to another with pre-populated state (e.g. an "email" button that opens a compose form with the address filled in), pass that state via URL params too — not local state or context

**Examples:**
- Filter panel open with certain options checked → encode in URL
- Sort column + direction → encode in URL
- Email button linking to a form → `?to=foo@bar.com` in the target URL

**Why:** Deep-linking and shareability are first-class UX. State that lives only in memory dies on refresh or copy-paste.
