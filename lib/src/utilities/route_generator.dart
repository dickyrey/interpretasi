import 'package:flutter/material.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/domain/entities/article.dart';
import 'package:interpretasi/src/domain/entities/user.dart';
import 'package:interpretasi/src/presentation/pages/article_trending_page.dart';
import 'package:interpretasi/src/presentation/pages/article_detail_page.dart';
import 'package:interpretasi/src/presentation/pages/article_form_page.dart';
import 'package:interpretasi/src/presentation/pages/article_preview_page.dart';
import 'package:interpretasi/src/presentation/pages/article_search_page.dart';
import 'package:interpretasi/src/presentation/pages/change_password_page.dart';
import 'package:interpretasi/src/presentation/pages/email_verification_page.dart';
import 'package:interpretasi/src/presentation/pages/error_page.dart';
import 'package:interpretasi/src/presentation/pages/explore_article_page.dart';
import 'package:interpretasi/src/presentation/pages/login_page.dart';
import 'package:interpretasi/src/presentation/pages/my_article_page.dart';
import 'package:interpretasi/src/presentation/pages/on_boarding_page.dart';
import 'package:interpretasi/src/presentation/pages/password_page.dart';
import 'package:interpretasi/src/presentation/pages/profile_detail_page.dart';
import 'package:interpretasi/src/presentation/pages/profile_form_page.dart';
import 'package:interpretasi/src/presentation/pages/read_history_page.dart';
import 'package:interpretasi/src/presentation/pages/register_page.dart';
import 'package:interpretasi/src/presentation/pages/report_article_page.dart';
import 'package:interpretasi/src/presentation/pages/settings_and_privacy_page.dart';
import 'package:interpretasi/src/presentation/pages/splash_page.dart';
import 'package:interpretasi/src/presentation/widgets/bottom_nav_bar_widget.dart';

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
      case LOGIN:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case REGISTER:
        return MaterialPageRoute(
          builder: (_) => const RegisterPage(),
        );
      case EMAIL_VERIFICATION:
        return MaterialPageRoute(
          builder: (_) => const EmailVerificationPage(),
        );
      case CHANGE_PASSWORD:
        return MaterialPageRoute(
          builder: (_) => const ChangePasswordPage(),
        );
      case PASSWORD:
        if (args is bool) {
          return MaterialPageRoute(
            builder: (_) => PasswordPage(isFromSetting: args),
          );
        }
        return _errorRoute();
      // case FORGOT_PASSWORD:
      //   return MaterialPageRoute(
      //     builder: (_) => const ForgotPasswordPage(),
      //   );
      case HOME:
        return MaterialPageRoute(
          builder: (_) => const BottomNavBarWidget(),
        );
      case PROFILE:
        return MaterialPageRoute(
          builder: (_) => const BottomNavBarWidget(index: 3),
        );
      case PROFILE_DETAIL:
        if (args is User) {
          return MaterialPageRoute(
            builder: (_) => ProfileDetailPage(user: args),
          );
        }
        return _errorRoute();
      case PROFILE_FORM:
        return MaterialPageRoute(
          builder: (_) => const ProfileFormPage(),
        );
      case SETTINGS_AND_PRIVACY:
        return MaterialPageRoute(
          builder: (_) => const SettingsAndPrivacyPage(),
        );
      case ARTICLE_DETAIL:
        if (args is Article) {
          return MaterialPageRoute(
            builder: (_) => ArticleDetailPage(article: args),
          );
        }
        return _errorRoute();
      case READ_HISTORY:
        return MaterialPageRoute(
          builder: (_) => const ReadHistoryPage(),
        );
      case MY_ARTICLE:
        return MaterialPageRoute(
          builder: (_) => const MyArticlePage(),
        );
      case ARTICLE_FORM:
        if (args is bool) {
          return MaterialPageRoute(
            builder: (_) => ArticleFormPage(isEdit: args),
          );
        }
        return _errorRoute();

      case ARTICLE_PREVIEW:
        if (args is Article) {
          return MaterialPageRoute(
            builder: (_) => ArticlePreviewPage(article: args),
          );
        }
        return _errorRoute();
      case ARTICLE_TRENDING:
        return MaterialPageRoute(
          builder: (_) => const ArticleTrendingPage(),
        );
      case ARTICLE_SEARCH:
        return MaterialPageRoute(
          builder: (_) => const ArticleSearchPage(),
        );
      case EXPLORE_ARTICLE:
        return MaterialPageRoute(
          builder: (_) => const ExploreArticlePage(),
        );
      case REPORT_ARTICLE:
        if (args is Article) {
          return MaterialPageRoute(
            builder: (_) =>  ReportArticlePage(article: args),
          );
        }
        return _errorRoute();
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
