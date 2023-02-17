// ignore_for_file: unused_import

import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:interpretasi/src/data/datasources/article_data_source.dart';
import 'package:interpretasi/src/data/datasources/auth_data_source.dart';
import 'package:interpretasi/src/data/datasources/author_data_source.dart';
import 'package:interpretasi/src/data/datasources/boarding_remote_data_source.dart';
import 'package:interpretasi/src/data/datasources/category_remote_data_source.dart';
import 'package:interpretasi/src/data/datasources/comment_article_data_source.dart';
import 'package:interpretasi/src/data/datasources/like_article_data_source.dart';
import 'package:interpretasi/src/data/datasources/password_data_source.dart';
import 'package:interpretasi/src/data/datasources/user_article_data_source.dart';
import 'package:interpretasi/src/data/datasources/user_data_source.dart';
import 'package:interpretasi/src/data/repositories/article_repository_impl.dart';
import 'package:interpretasi/src/data/repositories/auth_repository_impl.dart';
import 'package:interpretasi/src/data/repositories/author_data_source_impl.dart';
import 'package:interpretasi/src/data/repositories/boarding_repository_impl.dart';
import 'package:interpretasi/src/data/repositories/category_repository_impl.dart';
import 'package:interpretasi/src/data/repositories/comment_article_repository_impl.dart';
import 'package:interpretasi/src/data/repositories/like_article_repository_impl.dart';
import 'package:interpretasi/src/data/repositories/password_repository_impl.dart';
import 'package:interpretasi/src/data/repositories/user_article_repository_impl.dart';
import 'package:interpretasi/src/data/repositories/user_repository_impl.dart';
import 'package:interpretasi/src/domain/repositories/article_repository.dart';
import 'package:interpretasi/src/domain/repositories/auth_repository.dart';
import 'package:interpretasi/src/domain/repositories/author_data_source.dart';
import 'package:interpretasi/src/domain/repositories/boarding_repository.dart';
import 'package:interpretasi/src/domain/repositories/category_repository.dart';
import 'package:interpretasi/src/domain/repositories/comment_article_repository.dart';
import 'package:interpretasi/src/domain/repositories/like_article_repository.dart';
import 'package:interpretasi/src/domain/repositories/password_repository.dart';
import 'package:interpretasi/src/domain/repositories/user_article_repository.dart';
import 'package:interpretasi/src/domain/repositories/user_repository.dart';
import 'package:interpretasi/src/domain/usecases/article/create_article.dart';
import 'package:interpretasi/src/domain/usecases/article/delete_article.dart';
import 'package:interpretasi/src/domain/usecases/article/get_article.dart';
import 'package:interpretasi/src/domain/usecases/article/get_article_detail.dart';
import 'package:interpretasi/src/domain/usecases/article/report_article.dart';
import 'package:interpretasi/src/domain/usecases/article/update_article.dart';
import 'package:interpretasi/src/domain/usecases/auth/check_google_auth.dart';
import 'package:interpretasi/src/domain/usecases/auth/resend_email_verification.dart';
import 'package:interpretasi/src/domain/usecases/auth/sign_in_with_email.dart';
import 'package:interpretasi/src/domain/usecases/auth/sign_in_with_google.dart';
import 'package:interpretasi/src/domain/usecases/auth/sign_out_with_google.dart';
import 'package:interpretasi/src/domain/usecases/auth/sign_up_with_email.dart';
import 'package:interpretasi/src/domain/usecases/author/get_author.dart';
import 'package:interpretasi/src/domain/usecases/author/report_author.dart';
import 'package:interpretasi/src/domain/usecases/category/get_categories.dart';
import 'package:interpretasi/src/domain/usecases/comment_article/delete_comment.dart';
import 'package:interpretasi/src/domain/usecases/comment_article/get_comment_list.dart';
import 'package:interpretasi/src/domain/usecases/comment_article/report_comment.dart';
import 'package:interpretasi/src/domain/usecases/comment_article/send_comment.dart';
import 'package:interpretasi/src/domain/usecases/like_article/check_like_status.dart';
import 'package:interpretasi/src/domain/usecases/like_article/like_article.dart';
import 'package:interpretasi/src/domain/usecases/on_boarding/get_boarding_list.dart';
import 'package:interpretasi/src/domain/usecases/password/add_password.dart';
import 'package:interpretasi/src/domain/usecases/password/change_password.dart';
import 'package:interpretasi/src/domain/usecases/user/check_user_verification.dart';
import 'package:interpretasi/src/domain/usecases/user/get_user_profile.dart';
import 'package:interpretasi/src/domain/usecases/user/update_user_profile.dart';
import 'package:interpretasi/src/domain/usecases/user_article/change_to_moderated.dart';
import 'package:interpretasi/src/domain/usecases/user_article/get_banned_article.dart';
import 'package:interpretasi/src/domain/usecases/user_article/get_drafted_article.dart';
import 'package:interpretasi/src/domain/usecases/user_article/get_moderated_article.dart';
import 'package:interpretasi/src/domain/usecases/user_article/get_published_article.dart';
import 'package:interpretasi/src/domain/usecases/user_article/get_rejected_article.dart';
import 'package:interpretasi/src/domain/usecases/user_article/history_article.dart';
import 'package:interpretasi/src/presentation/bloc/article/article_by_category_watcher/article_by_category_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/article/article_detail_watcher/article_detail_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/article/article_form/article_form_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/article/delete_article_actor/delete_article_actor_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/article/latest_article_watcher/latest_article_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/article/search_article_watcher/search_article_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/article/trending_article_watcher/trending_article_watcher_bloc.dart';
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
import 'package:interpretasi/src/presentation/bloc/report/report_actor_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/theme/theme_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user/user_form/user_form_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user/user_watcher/user_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/moderated_actor/moderated_actor_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/read_history_watcher/read_history_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/user_article_banned_watcher/user_article_banned_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/user_article_drafted_watcher/user_article_drafted_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/user_article_moderated_watcher/user_article_moderated_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/user_article_published_watcher/user_article_published_watcher_bloc.dart';
import 'package:interpretasi/src/presentation/bloc/user_article/user_article_rejected_watcher/user_article_rejected_watcher_bloc.dart';

final locator = GetIt.instance;

void init() {
  /// List of [External Packages]
  ///
  ///
  final httpPackage = http.Client();
  locator.registerLazySingleton(
    () => httpPackage,
  );

  final googleSignIn = GoogleSignIn();
  locator.registerLazySingleton(
    () => googleSignIn,
  );

  /// List of [Remote Data Source]
  ///
  ///
  final articleDataSource = ArticleDataSourceImpl(httpPackage);
  locator.registerLazySingleton<ArticleDataSource>(
    () => articleDataSource,
  );

  final authDataSource = AuthDataSourceImpl(
    client: locator(),
    googleSignIn: locator(),
  );
  locator.registerLazySingleton<AuthDataSource>(
    () => authDataSource,
  );

  final authorDataSource = AuthorDataSourceImpl(locator());
  locator.registerLazySingleton<AuthorDataSource>(
    () => authorDataSource,
  );

  final boardingRemoteDataSource = BoardingRemoteDataSourceImpl();
  locator.registerLazySingleton<BoardingRemoteDataSource>(
    () => boardingRemoteDataSource,
  );

  final categoryRemoteDataSource = CategoryRemoteDataSourceImpl();
  locator.registerLazySingleton<CategoryRemoteDataSource>(
    () => categoryRemoteDataSource,
  );

  final commentArticleDataSource = CommentArticleDataSourceImpl(locator());
  locator.registerLazySingleton<CommentArticleDataSource>(
    () => commentArticleDataSource,
  );

  final likeArticleDataSource = LikeArticleDataSourceImpl(locator());
  locator.registerLazySingleton<LikeArticleDataSource>(
    () => likeArticleDataSource,
  );

  final passwordDataSource = PasswordDataSourceImpl(locator());
  locator.registerLazySingleton<PasswordDataSource>(
    () => passwordDataSource,
  );

  final userDataSource = UserDataSourceImpl(locator());
  locator.registerLazySingleton<UserDataSource>(
    () => userDataSource,
  );

  final userArticleDataSource = UserArticleDataSourceImpl(locator());
  locator.registerLazySingleton<UserArticleDataSource>(
    () => userArticleDataSource,
  );

  /// List of [Repositories]
  ///
  ///
  final articleRepository = ArticleRepositoryImpl(locator());
  locator.registerLazySingleton<ArticleRepository>(
    () => articleRepository,
  );

  final authRepository = AuthRepositoryImpl(locator());
  locator.registerLazySingleton<AuthRepository>(
    () => authRepository,
  );

  final authorRepository = AuthorRepositoryImpl(locator());
  locator.registerLazySingleton<AuthorRepository>(
    () => authorRepository,
  );

  final boardingRepository = BoardingRepositoryImpl(locator());
  locator.registerLazySingleton<BoardingRepository>(
    () => boardingRepository,
  );

  final categoryRepository = CategoryRepositoryImpl(locator());
  locator.registerLazySingleton<CategoryRepository>(
    () => categoryRepository,
  );

  final commentArticleRepository = CommentArticleRepositoryImpl(locator());
  locator.registerLazySingleton<CommentArticleRepository>(
    () => commentArticleRepository,
  );

  final likeArticleRepository = LikeArticleRepositoryImpl(locator());
  locator.registerLazySingleton<LikeArticleRepository>(
    () => likeArticleRepository,
  );

  final passwordRepository = PasswordRepositoryImpl(locator());
  locator.registerLazySingleton<PasswordRepository>(
    () => passwordRepository,
  );

  final userRepository = UserRepositoryImpl(locator());
  locator.registerLazySingleton<UserRepository>(
    () => userRepository,
  );

  final userArticleRepository = UserArticleRepositoryImpl(locator());
  locator.registerLazySingleton<UserArticleRepository>(
    () => userArticleRepository,
  );

  /// List of [Usecases]
  ///
  ///

  //* Filter by [Article] folder
  //*
  final createArtcleUseCase = CreateArticle(locator());
  locator.registerLazySingleton(
    () => createArtcleUseCase,
  );

  final deleteArticleUseCase = DeleteArticle(locator());
  locator.registerLazySingleton(
    () => deleteArticleUseCase,
  );

  final getArticleDetailUseCase = GetArticleDetail(locator());
  locator.registerLazySingleton(
    () => getArticleDetailUseCase,
  );

  final getArticleUseCase = GetArticle(locator());
  locator.registerLazySingleton(
    () => getArticleUseCase,
  );

  final reportArticleUseCase = ReportArticle(locator());
  locator.registerLazySingleton(
    () => reportArticleUseCase,
  );

  final updateArtcleUseCase = UpdateArticle(locator());
  locator.registerLazySingleton(
    () => updateArtcleUseCase,
  );

  //* Filter by [Auth] folder
  //*
  final checkGoogleAuthUseCase = CheckGoogleAuth(locator());
  locator.registerLazySingleton(
    () => checkGoogleAuthUseCase,
  );

  final checkUserVerificationUseCase = CheckUserVerification(locator());
  locator.registerLazySingleton(
    () => checkUserVerificationUseCase,
  );

  final resendEmailVerificationUseCase = ResendEmailVerification(locator());
  locator.registerLazySingleton(
    () => resendEmailVerificationUseCase,
  );

  final signInWithGoogleUseCase = SignInWithGoogle(locator());
  locator.registerLazySingleton(
    () => signInWithGoogleUseCase,
  );

  final signOutWithGoogleUseCase = SignOut(locator());
  locator.registerLazySingleton(
    () => signOutWithGoogleUseCase,
  );

  final signInWithEmailUseCase = SignInWithEmail(locator());
  locator.registerLazySingleton(
    () => signInWithEmailUseCase,
  );

  final signUpWithEmailUseCase = SignUpWithEmail(locator());
  locator.registerLazySingleton(
    () => signUpWithEmailUseCase,
  );

  //* Filter by [Category] folder
  //*
  final getAuthorUseCase = GetAuthor(locator());
  locator.registerLazySingleton(
    () => getAuthorUseCase,
  );

  final reportAuthorUseCase = ReportAuthor(locator());
  locator.registerLazySingleton(
    () => reportAuthorUseCase,
  );

  //* Filter by [Category] folder
  //*
  final getCategoriesUseCase = GetCategories(locator());
  locator.registerLazySingleton(
    () => getCategoriesUseCase,
  );

  //* Filter by [Comment Article] folder
  //*
  final deleteCommentUseCase = DeleteComment(locator());
  locator.registerLazySingleton(
    () => deleteCommentUseCase,
  );

  final getCommentListUseCase = GetCommentList(locator());
  locator.registerLazySingleton(
    () => getCommentListUseCase,
  );

  final reportCommentUseCase = ReportComment(locator());
  locator.registerLazySingleton(
    () => reportCommentUseCase,
  );

  final sendCommentUseCase = SendComment(locator());
  locator.registerLazySingleton(
    () => sendCommentUseCase,
  );

  //* Filter by [Like / Unlike Article] folder
  //*
  final checkLikeStatusUseCase = CheckLikeStatus(locator());
  locator.registerLazySingleton(
    () => checkLikeStatusUseCase,
  );
  final likeOrUnlikedArticleUseCase = LikeOrUnlikedArticle(locator());
  locator.registerLazySingleton(
    () => likeOrUnlikedArticleUseCase,
  );

  //* Filter by [On Boarding] folder
  //*
  final getBoardingUseCase = GetBoardingList(locator());
  locator.registerLazySingleton(
    () => getBoardingUseCase,
  );

  //* Filter by [Password] folder
  //*
  final addPasswordUseCase = AddPassword(locator());
  locator.registerLazySingleton(
    () => addPasswordUseCase,
  );
  final changePasswordUseCase = ChangePassword(locator());
  locator.registerLazySingleton(
    () => changePasswordUseCase,
  );

  //* Filter by [User] folder
  //*
  final getUserProfileUseCase = GetUserProfile(locator());
  locator.registerLazySingleton(
    () => getUserProfileUseCase,
  );
  final updateUserProfileUseCase = UpdateUserProfile(locator());
  locator.registerLazySingleton(
    () => updateUserProfileUseCase,
  );

  //* Filter by [User Article] folder
  //*
  final changeToModeratedUseCase = ChangeToModerated(locator());
  locator.registerLazySingleton(
    () => changeToModeratedUseCase,
  );

  final getBannedArticleUseCase = GetBannedArticle(locator());
  locator.registerLazySingleton(
    () => getBannedArticleUseCase,
  );

  final getDraftedArticleUseCase = GetDraftedArticle(locator());
  locator.registerLazySingleton(
    () => getDraftedArticleUseCase,
  );

  final getModeratedArticleUseCase = GetModeratedArticle(locator());
  locator.registerLazySingleton(
    () => getModeratedArticleUseCase,
  );

  final getPublishedArticleUseCase = GetPublishedArticle(locator());
  locator.registerLazySingleton(
    () => getPublishedArticleUseCase,
  );

  final getRejectedArticleUseCase = GetRejectedArticle(locator());
  locator.registerLazySingleton(
    () => getRejectedArticleUseCase,
  );

  final readHistoryUseCase = ReadHistory(locator());
  locator.registerLazySingleton(
    () => readHistoryUseCase,
  );

  /// List of [BLoCs]
  ///
  ///

  //* Article BLoC folder
  //*

  final articleByCategoryWatcherBloc = ArticleByCategoryWatcherBloc(locator());
  locator.registerLazySingleton(
    () => articleByCategoryWatcherBloc,
  );

  final articleDetailWatcherBloc = ArticleDetailWatcherBloc(locator());
  locator.registerLazySingleton(
    () => articleDetailWatcherBloc,
  );

  final articleFormBloc = ArticleFormBloc(
    create: locator(),
    update: locator(),
    articleDetail: locator(),
  );
  locator.registerLazySingleton(
    () => articleFormBloc,
  );

  final deleteArticleActorBloc = DeleteArticleActorBloc(locator());
  locator.registerLazySingleton(
    () => deleteArticleActorBloc,
  );

  final latestArticleWatcherBloc = LatestArticleWatcherBloc(locator());
  locator.registerLazySingleton(
    () => latestArticleWatcherBloc,
  );

  final searchArticleWatcherBloc = SearchArticleWatcherBloc(locator());
  locator.registerLazySingleton(
    () => searchArticleWatcherBloc,
  );

  final trendingArticleWatcherBloc = TrendingArticleWatcherBloc(locator());
  locator.registerLazySingleton(
    () => trendingArticleWatcherBloc,
  );

  //* Auth BLoC folder
  //*
  final authWatcherBloc = AuthWatcherBloc(
    checkGoogleAuth: locator(),
    signOut: locator(),
  );
  locator.registerLazySingleton(
    () => authWatcherBloc,
  );

  final signInWithEmailFormBloc = SignInWithEmailFormBloc(locator());
  locator.registerLazySingleton(
    () => signInWithEmailFormBloc,
  );

  final signInWithGoogleActorBloc = SignInWithGoogleActorBloc(locator());
  locator.registerLazySingleton(
    () => signInWithGoogleActorBloc,
  );

  final signUpWithEmailFormBloc = SignUpWithEmailFormBloc(locator());
  locator.registerLazySingleton(
    () => signUpWithEmailFormBloc,
  );

  final verificationStatusWatcherBloc = VerificationStatusWatcherBloc(
    locator(),
  );
  locator.registerLazySingleton(
    () => verificationStatusWatcherBloc,
  );

  //* Author BLoC folder
  //*
  final authorWatcherBloc = AuthorWatcherBloc(locator());
  locator.registerLazySingleton(
    () => authorWatcherBloc,
  );

  //* OnBoarding BLoC folder
  //*
  final boardingWatcherBloc = BoardingWatcherBloc(locator());
  locator.registerLazySingleton(
    () => boardingWatcherBloc,
  );

  //* Category BLoC folder
  //*
  final categoryWatcherBloc = CategoryWatcherBloc(locator());
  locator.registerLazySingleton(
    () => categoryWatcherBloc,
  );

  //* Comment Article BLoC folder
  //*

  final articleCommentWatcherBloc = ArticleCommentWatcherBloc(locator());
  locator.registerLazySingleton(
    () => articleCommentWatcherBloc,
  );

  final deleteCommentActorBloc = DeleteCommentActorBloc(locator());
  locator.registerLazySingleton(
    () => deleteCommentActorBloc,
  );

  final sendCommentFormBloc = SendCommentActorBloc(locator());
  locator.registerLazySingleton(
    () => sendCommentFormBloc,
  );

  //* Email Verification BLoC folder
  //*
  final emailVerificationFormBloc = EmailVerificationFormBloc(locator());
  locator.registerLazySingleton(
    () => emailVerificationFormBloc,
  );

  //* Like/Unlike Article in BLoC folder
  //*
  final likeArticleWatcherBloc = LikeArticleWatcherBloc(
    checkLikeStatus: locator(),
    likeArticle: locator(),
  );
  locator.registerLazySingleton(
    () => likeArticleWatcherBloc,
  );

  //* Localization in BLoC folder
  //*
  final localizationWatcherBloc = LocalizationWatcherBloc();
  locator.registerLazySingleton(
    () => localizationWatcherBloc,
  );

  //* Password BLoC folder
  //*
  final addPasswordFormBloc = AddPasswordFormBloc(locator());
  locator.registerLazySingleton(
    () => addPasswordFormBloc,
  );

  final changePasswordFormBloc = ChangePasswordFormBloc(locator());
  locator.registerLazySingleton(
    () => changePasswordFormBloc,
  );

  //* Report BLoC folder
  //*
  final reportActorBloc = ReportActorBloc(
    article: locator(),
    author: locator(),
    comment: locator(),
  );
  locator.registerLazySingleton(
    () => reportActorBloc,
  );

  //* Theme BLoC folder
  //*
  final themeWatcherBloc = ThemeWatcherBloc();
  locator.registerLazySingleton(
    () => themeWatcherBloc,
  );

  //* User BLoC folder
  //*
  final userFormBloc = UserFormBloc(locator());
  locator.registerLazySingleton(
    () => userFormBloc,
  );

  final userWatcherBloc = UserWatcherBloc(locator());
  locator.registerLazySingleton(
    () => userWatcherBloc,
  );

  //* User Article BLoC folder
  //*
  final moderatedActorBloc = ModeratedActorBloc(locator());
  locator.registerLazySingleton(
    () => moderatedActorBloc,
  );
  final readHistoryWatcherBloc = ReadHistoryWatcherBloc(locator());
  locator.registerLazySingleton(
    () => readHistoryWatcherBloc,
  );
  final userArticleBannedWatcherBloc = UserArticleBannedWatcherBloc(locator());
  locator.registerLazySingleton(
    () => userArticleBannedWatcherBloc,
  );

  final userArticleDraftedWatcherBloc = UserArticleDraftedWatcherBloc(
    locator(),
  );
  locator.registerLazySingleton(
    () => userArticleDraftedWatcherBloc,
  );

  final userArticleModeratedWatcherBloc = UserArticleModeratedWatcherBloc(
    locator(),
  );
  locator.registerLazySingleton(
    () => userArticleModeratedWatcherBloc,
  );

  final userArticlePublishedWatcherBloc = UserArticlePublishedWatcherBloc(
    locator(),
  );
  locator.registerLazySingleton(
    () => userArticlePublishedWatcherBloc,
  );

  final userArticleRejectedWatcherBloc = UserArticleRejectedWatcherBloc(
    locator(),
  );
  locator.registerLazySingleton(
    () => userArticleRejectedWatcherBloc,
  );
}
