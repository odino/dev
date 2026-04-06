---
name: Custom confirmation modal
description: Never use window.confirm for delete/destructive confirmations — always build a simple custom modal instead
type: feedback
---

Never use `window.confirm()` for confirmation dialogs. Always implement a simple, clean custom modal component instead.

**Why:** Alex prefers a polished in-page modal over the browser's native dialog, which looks inconsistent and unstyled.

**How to apply:** Any time a destructive action (delete, convert, reset, etc.) requires user confirmation, build or reuse a lightweight modal with confirm/cancel buttons rather than calling `window.confirm`.
