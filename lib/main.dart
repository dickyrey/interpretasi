import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:interpretasi/injection.dart' as di;
import 'package:interpretasi/l10n/l10n.dart';
import 'package:interpretasi/src/common/routes.dart';
import 'package:interpretasi/src/common/themes.dart';
import 'package:interpretasi/src/presentation/bloc/article/article_by_category_watcher/article_by_category_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/article/article_detail_watcher/article_detail_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/article/article_form/article_form_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/article/delete_article_actor/delete_article_actor_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/article/latest_article_watcher/latest_article_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/article/search_article_watcher/search_article_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/article/trending_article_watcher/trending_article_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/article/upload_image_actor/upload_image_actor_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/article/view_count_actor/view_count_actor_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/auth/auth_watcher/auth_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/auth/sign_in_with_email_form/sign_in_with_email_form_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/auth/sign_in_with_google_actor/sign_in_with_google_actor_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/auth/sign_up_with_email_form/sign_up_with_email_form_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/auth/verification_status_watcher/verification_status_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/author/author_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/boarding/boarding_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/category/category_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/comment_article/article_comment_watcher/article_comment_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/comment_article/delete_comment_actor/delete_comment_actor_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/comment_article/send_comment_actor/send_comment_actor_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/email_verification/email_verification_form_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/like_article_watcher/like_article_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/localization/localization_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/password/add_password_form/add_password_form_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/password/change_password_form/change_password_form_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/password/forgot_password_form/forgot_password_form_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/report/report_actor_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/theme/theme_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user/user_form/user_form_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user/user_watcher/user_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/banned_watcher/banned_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/drafted_watcher/drafted_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/moderated_actor/moderated_actor_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/moderated_watcher/moderated_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/read_history_watcher/read_history_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/rejected_watcher/rejected_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/user_article_published_watcher/published_watcher_bloc.dart';
import 'package:interpretasi/src/utilities/route_generator.dart';

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, host, port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  HttpOverrides.global = PostHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //* Article BLoC folder
        BlocProvider(create: (context) => di.locator<ArticleByCategoryWatcherBloc>()),
        BlocProvider(create: (context) => di.locator<ArticleDetailWatcherBloc>()),
        BlocProvider(create: (context) => di.locator<ArticleFormBloc>()),
        BlocProvider(create: (context) => di.locator<DeleteArticleActorBloc>()),
        BlocProvider(create: (context) => di.locator<LatestArticleWatcherBloc>()),
        BlocProvider(create: (context) => di.locator<SearchArticleWatcherBloc>()),
        BlocProvider(create: (context) => di.locator<TrendingArticleWatcherBloc>()),
        BlocProvider(create: (context) => di.locator<UploadImageActorBloc>()),
        BlocProvider(create: (context) => di.locator<ViewCountActorBloc>()),
        //* Auth BLoC folder
        BlocProvider(create: (context) => di.locator<AuthWatcherBloc>()),
        BlocProvider(create: (context) => di.locator<SignInWithEmailFormBloc>()),
        BlocProvider(create: (context) => di.locator<SignInWithGoogleActorBloc>()),
        BlocProvider(create: (context) => di.locator<SignUpWithEmailFormBloc>()),
        BlocProvider(create: (context) => di.locator<VerificationStatusWatcherBloc>()),
        //* OnBoarding BLoC folder
        BlocProvider(create: (context) => di.locator<AuthorWatcherBloc>()),
        //* OnBoarding BLoC folder
        BlocProvider(create: (context) => di.locator<BoardingWatcherBloc>()),
        //* Category BLoC folder
        BlocProvider(create: (context) => di.locator<CategoryWatcherBloc>()),
        //* Comment Article BLoC folder
        BlocProvider(create: (context) => di.locator<ArticleCommentWatcherBloc>()),
        BlocProvider(create: (context) => di.locator<DeleteCommentActorBloc>()),
        BlocProvider(create: (context) => di.locator<SendCommentActorBloc>()),
        //* Email Verification BLoC folder
        BlocProvider(create: (context) => di.locator<EmailVerificationFormBloc>()),
        //* Like/Unlike Article in BLoC folder
        BlocProvider(create: (context) => di.locator<LikeArticleWatcherBloc>()),
        //* Localization in BLoC folder
        BlocProvider(create: (context) => di.locator<LocalizationWatcherBloc>()),
        //* Password BLoC folder
        BlocProvider(create: (context) => di.locator<AddPasswordFormBloc>()),
        BlocProvider(create: (context) => di.locator<ChangePasswordFormBloc>()),
        BlocProvider(create: (context) => di.locator<ForgotPasswordFormBloc>()),
        //* Report
        BlocProvider(create: (context) => di.locator<ReportActorBloc>()),
        //* Theme
        BlocProvider(create: (context) => di.locator<ThemeWatcherBloc>()),
        //* User BLoC folder
        BlocProvider(create: (context) => di.locator<UserFormBloc>()),
        BlocProvider(create: (context) => di.locator<UserWatcherBloc>()),
        //* User Article BLoC folder
        BlocProvider(create: (context) => di.locator<ModeratedActorBloc>()),
        BlocProvider(create: (context) => di.locator<ReadHistoryWatcherBloc>()),
        BlocProvider(create: (context) => di.locator<BannedWatcherBloc>()),
        BlocProvider(create: (context) => di.locator<DraftedWatcherBloc>()),
        BlocProvider(create: (context) => di.locator<ModeratedWatcherBloc>()),
        BlocProvider(create: (context) => di.locator<PublishedWatcherBloc>()),
        BlocProvider(create: (context) => di.locator<RejectedWatcherBloc>()),
      ],
      child: BlocBuilder<ThemeWatcherBloc, ThemeWatcherState>(
        builder: (context, theme) {
          return BlocBuilder<LocalizationWatcherBloc, LocalizationWatcherState>(
            builder: (context, localization) {
              return MaterialApp(
                title: 'Interpretasi',
                debugShowCheckedModeBanner: false,
                theme: themeLight(context),
                darkTheme: themeDark(context),
                themeMode: (theme.isDarkMode == true)
                    ? ThemeMode.dark
                    : ThemeMode.light,
                supportedLocales: L10n.all,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                locale: localization.selectedLocale,
                initialRoute: SPLASH,
                onGenerateRoute: RouteGenerator.generateRoute,
              );
            },
          );
        },
      ),
    );
  }
}
