class EndPoints {
  static const String baseUrl =
      "https://api.example.com/api/v1/"; // Placeholder

  static const auth = _Auth();
  static const home = _Home();
  static const prayer = _Prayer();
  static const grow = _Grow();
  static const library = _Library();
  static const matrimony = _Matrimony();
  static const jobs = _Jobs();
  static const bibleAi = _BibleAi();
  static const profile = _Profile();
  static const settings = _Settings();
}

class _Auth {
  const _Auth();

  /// Auth with email/password
  final String login = "auth/login";

  /// Request OTP for a phone number
  final String phone = "auth/phone";

  /// Verify OTP and return session token
  final String verifyOtp = "auth/otp/verify";

  /// Initial user profile creation (during onboarding)
  final String setupProfile = "auth/setup-profile";

  /// Invalidate current session token
  final String logout = "auth/logout";
}

class _Home {
  const _Home();

  /// Fetch all data for the home screen (Scripture, Podcasts, Prayers)
  final String dashboard = "home/dashboard";

  /// Fetch user's check-in history or submit mood
  final String dailyCheckin = "home/daily-checkin";

  /// Fetch user's prayer streak details
  final String streak = "home/streak";
}

class _Prayer {
  const _Prayer();
  /// Fetch prayer categories (Practice Hub)
  final String categories = "prayer/categories";
  /// Fetch user's spiritual journey items
  final String journey = "prayer/journey";
  /// Fetch the item for "Today in your path"
  final String todayPath = "prayer/today-path";
  /// Fetch guidance resources (Need Guidance, Speak/Write prayer)
  final String guidance = "prayer/guidance";
  /// Submit or record a prayer (Voice or Text)
  final String record = "prayer/record";
  /// Fetch recommended prayers based on feeling
  final String recommended = "prayer/recommended";
  /// Fetch situational topics (Anxiety, Wisdom, etc.)
  final String topics = "prayer/topics";
  /// Mark a journey step as completed
  final String completeStep = "prayer/complete-step";
}

class _Grow {
  const _Grow();

  /// Fetch spiritual routines (Morning/Night Routines)
  final String routines = "grow/routines";

  /// List available Bible Reading Plans
  final String readingPlans = "grow/reading-plans";

  /// Fetch details for a specific plan (Append ID)
  final String planDetails = "grow/plan/"; // Append ID

  /// Fetch and update daily checklist for "Tiny Habits"
  final String habits = "grow/tiny-habits";

  /// Manage private journal entries and weekly reflections
  final String journal = "grow/journal";

  /// List lessons for a specific course/plan
  final String lessons = "grow/lessons";
}

class _Library {
  const _Library();

  /// Search library items (scenarios, topics)
  final String search = "library/search";

  /// Fetch list of saved verses
  final String savedVerses = "library/saved-verses";

  /// Fetch current user path progress (e.g. 7-Day Peace Plan)
  final String continuePath = "library/continue-path";

  /// Fetch devotional articles and reads
  final String devotionals = "library/devotionals";

  /// Fetch categorized audio playlists (Peace, Focus, Sleep, etc.)
  final String playlists = "library/playlists";

  /// Fetch list of daily sermons
  final String sermons = "library/sermons";

  /// Fetch or manage user's bookmarked resources
  final String bookmark = "library/bookmarks";
}

class _Matrimony {
  const _Matrimony();

  /// List bride/groom profiles with filters
  final String profiles = "matrimony/profiles";

  /// View detailed matrimony profile (Append ID)
  final String profileDetails = "matrimony/profile/"; // Append ID
  /// Fetch or update the user's matrimony profile
  final String myProfile = "matrimony/my-profile";

  /// List profiles shortlisted by the user
  final String shortlist = "matrimony/shortlist";
}

class _Jobs {
  const _Jobs();

  /// Fetch available job opportunities
  final String listings = "jobs/listings";

  /// Get details for a specific job post (Append ID)
  final String listingDetails = "jobs/listing/"; // Append ID
  /// Submit job application
  final String apply = "jobs/apply";
}

class _BibleAi {
  const _BibleAi();

  /// Send a query to the Bible AI assistant
  final String ask = "bible-ai/ask";

  /// Fetch recent AI conversation history
  final String history = "bible-ai/history";
}

class _Profile {
  const _Profile();

  /// Get current user's profile information
  final String me = "profile/me";

  /// Update user's personal details
  final String update = "profile/update";

  /// Upload a new profile picture
  final String avatar = "profile/avatar";

  /// Toggle business listing visibility
  final String toggleBusinessListing = "profile/business-listing/toggle";

  /// Toggle matrimony profile visibility
  final String toggleMatrimonyProfile = "profile/matrimony-profile/toggle";

  /// Fetch details about user's church
  final String myChurch = "profile/my-church";

  /// Fetch community-related user data
  final String community = "profile/community";

  /// Fetch all items saved/bookmarked by the user across the app
  final String savedItems = "profile/saved-items";

  /// Endpoint for upgrading to Pro membership
  final String upgradePro = "profile/upgrade-pro";

  /// Fetch support contact information or submit a ticket
  final String support = "profile/support";
}

class _Settings {
  const _Settings();

  /// Fetch dynamic application configuration
  final String appConfig = "app/config";

  /// Fetch or update user application preferences
  final String userPreferences = "settings";
}
