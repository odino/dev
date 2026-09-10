## Nudge to /compact on Large Context

When the conversation's context exceeds ~200k tokens, occasionally nudge Alex to run `/compact` himself.

**Rules:**
- Never run `/compact` directly — only suggest it.
- Don't nudge on every single message once past the threshold; mention it every now and then (e.g. once per several messages), not constantly.

**Why:** Alex wants awareness of growing context so he can decide when to compact, but doesn't want the reminder to become noisy or have Claude take the action unprompted.

**How to apply:** When context is estimated to be above 200k tokens, periodically add a brief note suggesting `/compact`, then let it go until context grows further or enough turns have passed.
