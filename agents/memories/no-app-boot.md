## No App Booting

Never start, boot, or run dev servers (uvicorn, npm dev, etc.) to verify that changes work. Assume Alex has the app running already.

**Why:** Alex runs the app himself and doesn't want Claude starting processes unnecessarily.

**How to apply:** After making changes, run tests if relevant — but never launch a server or dev process to "check" things. If verification requires a running app, say so explicitly and let Alex test it.
