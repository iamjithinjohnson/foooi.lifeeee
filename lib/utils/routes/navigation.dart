import 'package:foi/features/prayer/screen/journey_detail_screen.dart';
import 'package:foi/features/prayer/screen/music_list_screen.dart';
import 'package:foi/features/prayer/screen/audio_player_screen.dart';
import 'package:foi/features/prayer/screen/prayer_content_screen.dart';
import 'package:foi/features/grow/screen/grow_screen.dart';
import 'package:foi/features/grow/screen/morning_routine_screen.dart';
import 'package:foi/features/grow/screen/night_routine_screen.dart';
import 'package:foi/features/grow/screen/plan_detail_screen.dart';
import 'package:foi/features/library/screen/library_screen.dart';
import 'package:foi/features/library/binding/library_binding.dart';
import 'package:foi/features/profile/screen/profile_screen.dart';
import 'package:foi/features/profile/binding/profile_binding.dart';
import 'package:foi/features/settings/screen/settings_screen.dart';
import 'package:foi/features/settings/binding/settings_binding.dart';
import 'package:foi/features/grow/binding/grow_binding.dart';
import 'package:foi/features/main/screen/main_screen.dart';
import 'package:foi/features/main/binding/main_binding.dart';
import 'package:get/get.dart';
import '../../features/auth/login/binding/login_binding.dart';
import '../../features/auth/login/screen/login_screen.dart';
import '../../features/auth/phone/binding/phone_binding.dart';
import '../../features/auth/phone/screen/phone_screen.dart';
import '../../features/auth/otp/binding/otp_binding.dart';
import '../../features/auth/otp/screen/otp_screen.dart';
import '../../features/auth/setup_profile/binding/setup_profile_binding.dart';
import '../../features/auth/setup_profile/screen/setup_profile_screen.dart';
import '../../features/home/binding/home_binding.dart';
import '../../features/home/screen/home_screen.dart';
import '../../features/bible_ai/binding/bible_ai_binding.dart';
import '../../features/bible_ai/screen/bible_ai_screen.dart';
import '../../features/prayer/binding/prayer_binding.dart';
import '../../features/prayer/screen/prayer_screen.dart';
import '../../features/jobs/screen/jobs_screen.dart';
import '../../features/matrimony/screen/matrimony_screen.dart';
import 'app_routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.MAIN,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.PHONE,
      page: () => const PhoneScreen(),
      binding: PhoneBinding(),
    ),
    GetPage(
      name: Routes.OTP,
      page: () => const OtpScreen(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: Routes.SETUP_PROFILE,
      page: () => const SetupProfileScreen(),
      binding: SetupProfileBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.BIBLE_AI,
      page: () => const BibleAiScreen(),
      binding: BibleAiBinding(),
    ),
    GetPage(
      name: Routes.PRAYER,
      page: () => const PrayerScreen(),
      binding: PrayerBinding(),
    ),
    GetPage(
      name: Routes.JOURNEY_DETAIL,
      page: () => const JourneyDetailScreen(),
    ),
    GetPage(
      name: Routes.MUSIC_LIST,
      page: () => const MusicListScreen(),
    ),
    GetPage(
      name: Routes.AUDIO_PLAYER,
      page: () => const AudioPlayerScreen(),
    ),
    GetPage(
      name: Routes.PRAYER_CONTENT,
      page: () => const PrayerContentScreen(),
    ),
    GetPage(
      name: Routes.GROW,
      page: () => const GrowScreen(),
      binding: GrowBinding(),
    ),
    GetPage(
      name: Routes.MORNING_ROUTINE,
      page: () => const MorningRoutineScreen(),
    ),
    GetPage(
      name: Routes.NIGHT_ROUTINE,
      page: () => const NightRoutineScreen(),
    ),
    GetPage(
      name: Routes.PLAN_DETAIL,
      page: () => const PlanDetailScreen(),
    ),
    GetPage(
      name: Routes.LIBRARY,
      page: () => const LibraryScreen(),
      binding: LibraryBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => const SettingsScreen(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.JOBS,
      page: () => const JobsScreen(),
    ),
    GetPage(
      name: Routes.MATRIMONY,
      page: () => const MatrimonyScreen(),
    ),
  ];
}
