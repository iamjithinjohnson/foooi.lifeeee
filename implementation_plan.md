# Daily Check-in Enhancement Ideas

The Daily Check-in should do more than just update a UI state. It should be the "entry point" to the user's daily journey in the app. Here are three proposed levels of implementation:

## 1. Contextual Encouragement (Simple)
When a user selects a mood, show a brief, tailored message or scripture reference in a small overlay or snackbar.
- **Example:** Select "Tired" -> "He gives strength to the weary... (Isaiah 40:29)"
- **Example:** Select "Happy" -> "Rejoice in the Lord always! (Philippians 4:4)"

## 2. Interactive Redirection (Functional)
Instead of just staying on the home screen, the app "reacts" to the mood by highlighting existing sections.
- **If Sad/Anxious:** Smoothly scroll the user to the `PrayerSection` or `ScriptureCard`.
- **If Happy:** Add a "Praise Report" button that appears temporarily.

## 3. Emotional Journey (Premium)
Implement a mini-flow when a mood is selected:
- **Haptic Feedback:** A subtle "click" feeling on tap.
- **Mood Confirmation:** A bottom sheet with a specific action like "Play a calming podcast" (if Anxious) or "Join a morning prayer" (if Happy).

---

## Proposed Changes

### [Home Feature]

#### [MODIFY] [home_controller.dart](file:///Users/admin/Documents/flutter_projects/foi/lib/features/home/controller/home_controller.dart)
- Add a mapping of moods to specific scriptures/messages.
- Implement logic to trigger UI responses (snackbars/sheets).

#### [MODIFY] [daily_checkin.dart](file:///Users/admin/Documents/flutter_projects/foi/lib/features/home/widgets/daily_checkin.dart)
- Add haptic feedback and animations on selection.

## Verification Plan

### Automated Tests
- N/A (UI/UX enhancement)

### Manual Verification
- Tap each emoji and verify the corresponding message/action triggers as expected.
- Check that the UI remains responsive and smooth.
