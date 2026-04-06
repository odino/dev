## Preferred Notification/Update Banner Style

Alex prefers a **toast/snackbar style** for update banners and in-app notifications:

- Fixed to the bottom of the screen (`fixed bottom-4 left-4 right-4`)
- Dark background (`bg-gray-900`) with white text
- Rounded pill shape (`rounded-xl`)
- Drop shadow (`shadow-lg`)
- Dismiss + action buttons inline

**How to apply:** When building any update notification, version nudge, or similar non-blocking alert, use this bottom-fixed dark toast pattern rather than modals, top banners, or alerts.
