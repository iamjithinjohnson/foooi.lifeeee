import 'package:foi/features/prayer/screen/journey_detail_screen.dart';
import 'package:foi/features/prayer/screen/music_list_screen.dart';
import 'package:foi/features/prayer/screen/audio_player_screen.dart';
import 'package:foi/features/prayer/screen/prayer_content_screen.dart';
import 'package:foi/features/prayer/screen/prayer_situation_screen.dart';
import 'package:foi/features/grow/screen/grow_screen.dart';
import 'package:foi/features/morning_night_routine/screen/morning_routine_screen.dart';
import 'package:foi/features/morning_night_routine/screen/night_routine_screen.dart';
import 'package:foi/features/grow/screen/plan_detail_screen.dart';
import 'package:foi/features/morning_night_routine/binding/morning_night_routine_binding.dart';
import 'package:foi/features/library/screen/library_screen.dart';
import 'package:foi/features/library/binding/library_binding.dart';
import 'package:foi/features/profile/screen/profile_screen.dart';
import 'package:foi/features/profile/binding/profile_binding.dart';
import 'package:foi/features/settings/screen/settings_screen.dart';
import 'package:foi/features/settings/binding/settings_binding.dart';
import 'package:foi/features/grow/binding/grow_binding.dart';
import 'package:foi/features/main/screen/main_screen.dart';
import 'package:foi/features/main/binding/main_binding.dart';
import 'package:foi/features/prayer/binding/audio_player_binding.dart';
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
import '../../features/bible_ai/binding/speak_to_god_binding.dart';
import '../../features/bible_ai/screen/speak_to_god_screen.dart';
import '../../features/prayer/binding/prayer_binding.dart';
import '../../features/prayer/screen/prayer_screen.dart';
import '../../features/jobs/screen/jobs_screen.dart';
import '../../features/jobs/screen/job_create_screen.dart';
import '../../features/prayer/binding/prayer_request_binding.dart';
import '../../features/prayer/screen/prayer_request_screen.dart';
import '../../features/matrimony/screen/matrimony_screen.dart';
import '../../features/matrimony/screen/matrimony_create_screen.dart';
import '../../features/matrimony/binding/matrimony_binding.dart';
import '../../features/church/binding/my_church_binding.dart';
import '../../features/church/screen/my_church_screen.dart';
import '../../features/community/screen/cito_community_screen.dart';
import '../../features/community/screen/incubation_innovation_screen.dart';
import '../../features/community/screen/business_network_screen.dart';
import '../../features/profile/screen/edit_profile_screen.dart';
import 'package:foi/features/grow/screen/reading_session_screen.dart';
import 'package:foi/features/grow/screen/template_selection_screen.dart';
import 'package:foi/features/grow/screen/routine_details_screen.dart';
import 'package:foi/features/grow/screen/create_custom_routine_screen.dart';
import 'app_routes.dart';
import 'auth_middleware.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.MAIN,
      page: () => const MainScreen(),
      binding: MainBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.PHONE,
      page: () => const PhoneScreen(),
      binding: PhoneBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.OTP,
      page: () => const OtpScreen(),
      binding: OtpBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.SETUP_PROFILE,
      page: () => const SetupProfileScreen(),
      binding: SetupProfileBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.BIBLE_AI,
      page: () => const BibleAiScreen(),
      binding: BibleAiBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.SPEAK_TO_GOD,
      page: () => const SpeakToGodScreen(),
      binding: SpeakToGodBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.PRAYER,
      page: () => const PrayerScreen(),
      binding: PrayerBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.PRAYER_REQUEST,
      page: () => const PrayerRequestScreen(),
      binding: PrayerRequestBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.JOURNEY_DETAIL,
      page: () => const JourneyDetailScreen(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.MUSIC_LIST,
      page: () => const MusicListScreen(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.AUDIO_PLAYER,
      page: () => const AudioPlayerScreen(),
      binding: AudioPlayerBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.PRAYER_CONTENT,
      page: () => const PrayerContentScreen(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.PRAYER_SITUATION,
      page: () => const PrayerSituationScreen(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.GROW,
      page: () => const GrowScreen(),
      binding: GrowBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.MORNING_ROUTINE,
      page: () => const MorningRoutineScreen(),
      binding: MorningNightRoutineBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.NIGHT_ROUTINE,
      page: () => const NightRoutineScreen(),
      binding: MorningNightRoutineBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.PLAN_DETAIL,
      page: () => const PlanDetailScreen(),
      binding: GrowBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.READING_SESSION,
      page: () => const ReadingSessionScreen(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.LIBRARY,
      page: () => const LibraryScreen(),
      binding: LibraryBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => const SettingsScreen(),
      binding: SettingsBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.JOBS,
      page: () => const JobsScreen(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.JOB_CREATE,
      page: () => const JobCreateScreen(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.MATRIMONY,
      page: () => const MatrimonyScreen(),
      binding: MatrimonyBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.MATRIMONY_CREATE,
      page: () => const MatrimonyCreateScreen(),
      binding: MatrimonyBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.MY_CHURCH,
      page: () => const MyChurchScreen(),
      binding: MyChurchBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.CITO_COMMUNITY,
      page: () => const CitoCommunityScreen(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.INCUBATION_INNOVATION,
      page: () => const IncubationInnovationScreen(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.BUSINESS_NETWORK,
      page: () => const BusinessNetworkScreen(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.EDIT_PROFILE,
      page: () => const EditProfileScreen(),
      binding: ProfileBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.TEMPLATE_SELECTION,
      page: () => const TemplateSelectionScreen(),
      binding: GrowBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.ROUTINE_DETAILS,
      page: () => const RoutineDetailsScreen(),
      binding: GrowBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.CREATE_CUSTOM_ROUTINE,
      page: () => const CreateCustomRoutineScreen(),
      binding: GrowBinding(),
      middlewares: [AuthMiddleware()],
    ),
  ];
}
