import 'package:flutter/material.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/presentation/pages/error_page.dart';
import 'package:interpretasi/src/presentation/pages/on_boarding_page.dart';
import 'package:interpretasi/src/presentation/pages/splash_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case SPLASH:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
      case ON_BOARDING:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingPage(),
        );
      // case INTEREST:
      //   return MaterialPageRoute(
      //     builder: (_) => const InterestPage(),
      //   );
      // case INTEREST_SETTING:
      //   return MaterialPageRoute(
      //     builder: (_) => const InterestSettingPage(),
      //   );
      // case REGISTER:
      //   return MaterialPageRoute(
      //     builder: (_) => const RegisterPage(),
      //   );
      // case EMAIL_VERIFICATION:
      //     return MaterialPageRoute(
      //       builder: (_) => EmailVerificationPage(),
      //     );
      // case BACKUP_EMAIL_VERIFICATION:
      //   if (args is String) {
      //     return MaterialPageRoute(
      //       builder: (_) => BackupEmailVerificationPage(email: args),
      //     );
      //   }
      //   return _errorRoute();
      // case FORGOT_PASSWORD:
      //   return MaterialPageRoute(
      //     builder: (_) => const ForgotPasswordPage(),
      //   );
      // case LOGIN:
      //   return MaterialPageRoute(
      //     builder: (_) => const LoginPage(),
      //   );
      // case HOME:
      //   return MaterialPageRoute(
      //     builder: (_) => const ButtonNavBarWidget(),
      //   );
      // case MENU:
      //   return MaterialPageRoute(
      //     builder: (_) => const ButtonNavBarWidget(index: 3),
      //   );
      // case PROFILE:
      //   return MaterialPageRoute(
      //     builder: (_) => const ProfilePage(),
      //   );
      // case MY_ARTICLE:
      //   return MaterialPageRoute(
      //     builder: (_) => const MyArticlePage(),
      //   );
      // case SETTINGS_AND_PRIVACY:
      //   return MaterialPageRoute(
      //     builder: (_) => const SettingsAndPrivacyPage(),
      //   );
      // case PROFILE_FORM:
      //   return MaterialPageRoute(
      //     builder: (_) => const ProfileFormPage(),
      //   );
      // case ADD_SECOND_EMAIL:
      //   return MaterialPageRoute(
      //     builder: (_) => const AddSecondEmailPage(),
      //   );
      // case ADD_PHONE_NUMBER:
      //   return MaterialPageRoute(
      //     builder: (_) => const AddPhoneNumberPage(),
      //   );
      // case PASSWORD:
      //   return MaterialPageRoute(
      //     builder: (_) => const PasswordPage(),
      //   );
      // case DELETE_ACCOUNT:
      //   return MaterialPageRoute(
      //     builder: (_) => const DeleteAccountPage(),
      //   );
      // case READ_HISTORY:
      //   return MaterialPageRoute(
      //     builder: (_) => const ReadHistoryPage(),
      //   );
      // case TRENDING_ARTICLE:
      //   return MaterialPageRoute(
      //     builder: (_) => const TrendingArticlePage(),
      //   );
      // case LOCAL_NEWS:
      //   return MaterialPageRoute(
      //     builder: (_) => const LocalNewsPage(),
      //   );
      // case PROVINCE_NEWS:
      //   if (args is String) {
      //     return MaterialPageRoute(
      //       builder: (_) => ProvinceNewsPage(province: args),
      //     );
      //   }
      //   return _errorRoute();
      // case READ_ARTICLE:
      //   if (args is Article) {
      //     return MaterialPageRoute(
      //       builder: (_) => ReadArticlePage(article: args),
      //     );
      //   }
      //   return _errorRoute();
      // case ARTICLE_FORM:
      //   if (args is bool) {
      //     return MaterialPageRoute(
      //       builder: (_) => ArticleFormPage(isEdit: args),
      //     );
      //   }
      //   return _errorRoute();
      // case PREVIEW_ARTICLE:
      //   if (args is Article) {
      //     return MaterialPageRoute(
      //       builder: (_) => PreviewArticlePage(article: args),
      //     );
      //   }
      //   return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return const ErrorPage();
      },
    );
  }
}
