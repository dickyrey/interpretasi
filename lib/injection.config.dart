// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i10;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:interpretasi/injection.dart' as _i109;
import 'package:interpretasi/src/data/datasources/article_data_source.dart'
    as _i32;
import 'package:interpretasi/src/data/datasources/auth_data_source.dart'
    as _i35;
import 'package:interpretasi/src/data/datasources/author_data_source.dart'
    as _i38;
import 'package:interpretasi/src/data/datasources/boarding_data_source.dart'
    as _i41;
import 'package:interpretasi/src/data/datasources/category_data_source.dart'
    as _i44;
import 'package:interpretasi/src/data/datasources/comment_article_data_source.dart'
    as _i4;
import 'package:interpretasi/src/data/datasources/like_article_data_source.dart'
    as _i11;
import 'package:interpretasi/src/data/datasources/password_data_source.dart'
    as _i16;
import 'package:interpretasi/src/data/datasources/user_article_data_source.dart'
    as _i23;
import 'package:interpretasi/src/data/datasources/user_data_source.dart'
    as _i26;
import 'package:interpretasi/src/data/repositories/article_repository_impl.dart'
    as _i34;
import 'package:interpretasi/src/data/repositories/auth_repository_impl.dart'
    as _i37;
import 'package:interpretasi/src/data/repositories/author_data_source_impl.dart'
    as _i40;
import 'package:interpretasi/src/data/repositories/boarding_repository_impl.dart'
    as _i43;
import 'package:interpretasi/src/data/repositories/category_repository_impl.dart'
    as _i46;
import 'package:interpretasi/src/data/repositories/comment_article_repository_impl.dart'
    as _i6;
import 'package:interpretasi/src/data/repositories/like_article_repository_impl.dart'
    as _i13;
import 'package:interpretasi/src/data/repositories/password_repository_impl.dart'
    as _i18;
import 'package:interpretasi/src/data/repositories/user_article_repository_impl.dart'
    as _i25;
import 'package:interpretasi/src/data/repositories/user_repository_impl.dart'
    as _i28;
import 'package:interpretasi/src/domain/repositories/article_repository.dart'
    as _i33;
import 'package:interpretasi/src/domain/repositories/auth_repository.dart'
    as _i36;
import 'package:interpretasi/src/domain/repositories/author_data_source.dart'
    as _i39;
import 'package:interpretasi/src/domain/repositories/boarding_repository.dart'
    as _i42;
import 'package:interpretasi/src/domain/repositories/category_repository.dart'
    as _i45;
import 'package:interpretasi/src/domain/repositories/comment_article_repository.dart'
    as _i5;
import 'package:interpretasi/src/domain/repositories/like_article_repository.dart'
    as _i12;
import 'package:interpretasi/src/domain/repositories/password_repository.dart'
    as _i17;
import 'package:interpretasi/src/domain/repositories/user_article_repository.dart'
    as _i24;
import 'package:interpretasi/src/domain/repositories/user_repository.dart'
    as _i27;
import 'package:interpretasi/src/domain/usecases/article/add_view_count.dart'
    as _i96;
import 'package:interpretasi/src/domain/usecases/article/create_article.dart'
    as _i53;
import 'package:interpretasi/src/domain/usecases/article/delete_article.dart'
    as _i54;
import 'package:interpretasi/src/domain/usecases/article/get_article.dart'
    as _i58;
import 'package:interpretasi/src/domain/usecases/article/get_article_detail.dart'
    as _i59;
import 'package:interpretasi/src/domain/usecases/article/report_article.dart'
    as _i77;
import 'package:interpretasi/src/domain/usecases/article/update_article.dart'
    as _i89;
import 'package:interpretasi/src/domain/usecases/article/upload_image.dart'
    as _i91;
import 'package:interpretasi/src/domain/usecases/auth/check_google_auth.dart'
    as _i50;
import 'package:interpretasi/src/domain/usecases/auth/resend_email_verification.dart'
    as _i79;
import 'package:interpretasi/src/domain/usecases/auth/sign_in_with_email.dart'
    as _i81;
import 'package:interpretasi/src/domain/usecases/auth/sign_in_with_google.dart'
    as _i83;
import 'package:interpretasi/src/domain/usecases/auth/sign_out_with_google.dart'
    as _i85;
import 'package:interpretasi/src/domain/usecases/auth/sign_up_with_email.dart'
    as _i86;
import 'package:interpretasi/src/domain/usecases/author/get_author.dart'
    as _i60;
import 'package:interpretasi/src/domain/usecases/author/report_author.dart'
    as _i78;
import 'package:interpretasi/src/domain/usecases/category/get_categories.dart'
    as _i63;
import 'package:interpretasi/src/domain/usecases/comment_article/delete_comment.dart'
    as _i7;
import 'package:interpretasi/src/domain/usecases/comment_article/get_comment_list.dart'
    as _i9;
import 'package:interpretasi/src/domain/usecases/comment_article/report_comment.dart'
    as _i19;
import 'package:interpretasi/src/domain/usecases/comment_article/send_comment.dart'
    as _i20;
import 'package:interpretasi/src/domain/usecases/like_article/check_like_status.dart'
    as _i51;
import 'package:interpretasi/src/domain/usecases/like_article/like_article.dart'
    as _i14;
import 'package:interpretasi/src/domain/usecases/on_boarding/get_boarding_list.dart'
    as _i62;
import 'package:interpretasi/src/domain/usecases/password/add_password.dart'
    as _i29;
import 'package:interpretasi/src/domain/usecases/password/change_password.dart'
    as _i47;
import 'package:interpretasi/src/domain/usecases/password/forgot_password.dart'
    as _i56;
import 'package:interpretasi/src/domain/usecases/user/check_user_verification.dart'
    as _i52;
import 'package:interpretasi/src/domain/usecases/user/get_user_profile.dart'
    as _i68;
import 'package:interpretasi/src/domain/usecases/user/update_user_profile.dart'
    as _i90;
import 'package:interpretasi/src/domain/usecases/user_article/change_to_moderated.dart'
    as _i49;
import 'package:interpretasi/src/domain/usecases/user_article/get_banned_article.dart'
    as _i61;
import 'package:interpretasi/src/domain/usecases/user_article/get_drafted_article.dart'
    as _i64;
import 'package:interpretasi/src/domain/usecases/user_article/get_moderated_article.dart'
    as _i65;
import 'package:interpretasi/src/domain/usecases/user_article/get_published_article.dart'
    as _i66;
import 'package:interpretasi/src/domain/usecases/user_article/get_rejected_article.dart'
    as _i67;
import 'package:interpretasi/src/domain/usecases/user_article/history_article.dart'
    as _i74;
import 'package:interpretasi/src/presentation/bloc/article/article_by_category_watcher/article_by_category_watcher_bloc.dart'
    as _i97;
import 'package:interpretasi/src/presentation/bloc/article/article_detail_watcher/article_detail_watcher_bloc.dart'
    as _i98;
import 'package:interpretasi/src/presentation/bloc/article/article_form/article_form_bloc.dart'
    as _i99;
import 'package:interpretasi/src/presentation/bloc/article/delete_article_actor/delete_article_actor_bloc.dart'
    as _i55;
import 'package:interpretasi/src/presentation/bloc/article/latest_article_watcher/latest_article_watcher_bloc.dart'
    as _i69;
import 'package:interpretasi/src/presentation/bloc/article/search_article_watcher/search_article_watcher_bloc.dart'
    as _i80;
import 'package:interpretasi/src/presentation/bloc/article/trending_article_watcher/trending_article_watcher_bloc.dart'
    as _i88;
import 'package:interpretasi/src/presentation/bloc/article/upload_image_actor/upload_image_actor_bloc.dart'
    as _i92;
import 'package:interpretasi/src/presentation/bloc/article/view_count_actor/view_count_actor_bloc.dart'
    as _i108;
import 'package:interpretasi/src/presentation/bloc/auth/auth_watcher/auth_watcher_bloc.dart'
    as _i100;
import 'package:interpretasi/src/presentation/bloc/auth/sign_in_with_email_form/sign_in_with_email_form_bloc.dart'
    as _i82;
import 'package:interpretasi/src/presentation/bloc/auth/sign_in_with_google_actor/sign_in_with_google_actor_bloc.dart'
    as _i84;
import 'package:interpretasi/src/presentation/bloc/auth/sign_up_with_email_form/sign_up_with_email_form_bloc.dart'
    as _i87;
import 'package:interpretasi/src/presentation/bloc/auth/verification_status_watcher/verification_status_watcher_bloc.dart'
    as _i95;
import 'package:interpretasi/src/presentation/bloc/author/author_watcher_bloc.dart'
    as _i101;
import 'package:interpretasi/src/presentation/bloc/boarding/boarding_watcher_bloc.dart'
    as _i103;
import 'package:interpretasi/src/presentation/bloc/category/category_watcher_bloc.dart'
    as _i104;
import 'package:interpretasi/src/presentation/bloc/comment_article/article_comment_watcher/article_comment_watcher_bloc.dart'
    as _i31;
import 'package:interpretasi/src/presentation/bloc/comment_article/delete_comment_actor/delete_comment_actor_bloc.dart'
    as _i8;
import 'package:interpretasi/src/presentation/bloc/comment_article/send_comment_actor/send_comment_actor_bloc.dart'
    as _i21;
import 'package:interpretasi/src/presentation/bloc/email_verification/email_verification_form_bloc.dart'
    as _i106;
import 'package:interpretasi/src/presentation/bloc/like_article_watcher/like_article_watcher_bloc.dart'
    as _i70;
import 'package:interpretasi/src/presentation/bloc/localization/localization_watcher_bloc.dart'
    as _i15;
import 'package:interpretasi/src/presentation/bloc/password/add_password_form/add_password_form_bloc.dart'
    as _i30;
import 'package:interpretasi/src/presentation/bloc/password/change_password_form/change_password_form_bloc.dart'
    as _i48;
import 'package:interpretasi/src/presentation/bloc/password/forgot_password_form/forgot_password_form_bloc.dart'
    as _i57;
import 'package:interpretasi/src/presentation/bloc/report/report_actor_bloc.dart'
    as _i107;
import 'package:interpretasi/src/presentation/bloc/theme/theme_watcher_bloc.dart'
    as _i22;
import 'package:interpretasi/src/presentation/bloc/user/user_form/user_form_bloc.dart'
    as _i93;
import 'package:interpretasi/src/presentation/bloc/user/user_watcher/user_watcher_bloc.dart'
    as _i94;
import 'package:interpretasi/src/presentation/bloc/user_article/banned_watcher/banned_watcher_bloc.dart'
    as _i102;
import 'package:interpretasi/src/presentation/bloc/user_article/drafted_watcher/drafted_watcher_bloc.dart'
    as _i105;
import 'package:interpretasi/src/presentation/bloc/user_article/moderated_actor/moderated_actor_bloc.dart'
    as _i71;
import 'package:interpretasi/src/presentation/bloc/user_article/moderated_watcher/moderated_watcher_bloc.dart'
    as _i72;
import 'package:interpretasi/src/presentation/bloc/user_article/read_history_watcher/read_history_watcher_bloc.dart'
    as _i75;
import 'package:interpretasi/src/presentation/bloc/user_article/rejected_watcher/rejected_watcher_bloc.dart'
    as _i76;
import 'package:interpretasi/src/presentation/bloc/user_article/user_article_published_watcher/published_watcher_bloc.dart'
    as _i73; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.Client>(() => registerModule.httpClient);
    gh.factory<_i4.CommentArticleDataSource>(
        () => _i4.CommentArticleDataSourceImpl(gh<_i3.Client>()));
    gh.factory<_i5.CommentArticleRepository>(() =>
        _i6.CommentArticleRepositoryImpl(gh<_i4.CommentArticleDataSource>()));
    gh.factory<_i7.DeleteComment>(
        () => _i7.DeleteComment(gh<_i5.CommentArticleRepository>()));
    gh.factory<_i8.DeleteCommentActorBloc>(
        () => _i8.DeleteCommentActorBloc(gh<_i7.DeleteComment>()));
    gh.factory<_i9.GetCommentList>(
        () => _i9.GetCommentList(gh<_i5.CommentArticleRepository>()));
    gh.factory<_i10.GoogleSignIn>(() => registerModule.googleSignIn);
    gh.factory<_i11.LikeArticleDataSource>(
        () => _i11.LikeArticleDataSourceImpl(gh<_i3.Client>()));
    gh.factory<_i12.LikeArticleRepository>(
        () => _i13.LikeArticleRepositoryImpl(gh<_i11.LikeArticleDataSource>()));
    gh.factory<_i14.LikeOrUnlikedArticle>(
        () => _i14.LikeOrUnlikedArticle(gh<_i12.LikeArticleRepository>()));
    gh.factory<_i15.LocalizationWatcherBloc>(
        () => _i15.LocalizationWatcherBloc());
    gh.factory<_i16.PasswordDataSource>(
        () => _i16.PasswordDataSourceImpl(gh<_i3.Client>()));
    gh.factory<_i17.PasswordRepository>(
        () => _i18.PasswordRepositoryImpl(gh<_i16.PasswordDataSource>()));
    gh.factory<_i19.ReportComment>(
        () => _i19.ReportComment(gh<_i5.CommentArticleRepository>()));
    gh.factory<_i20.SendComment>(
        () => _i20.SendComment(gh<_i5.CommentArticleRepository>()));
    gh.factory<_i21.SendCommentActorBloc>(
        () => _i21.SendCommentActorBloc(gh<_i20.SendComment>()));
    gh.factory<_i22.ThemeWatcherBloc>(() => _i22.ThemeWatcherBloc());
    gh.factory<_i23.UserArticleDataSource>(
        () => _i23.UserArticleDataSourceImpl(gh<_i3.Client>()));
    gh.factory<_i24.UserArticleRepository>(
        () => _i25.UserArticleRepositoryImpl(gh<_i23.UserArticleDataSource>()));
    gh.factory<_i26.UserDataSource>(
        () => _i26.UserDataSourceImpl(gh<_i3.Client>()));
    gh.factory<_i27.UserRepository>(
        () => _i28.UserRepositoryImpl(gh<_i26.UserDataSource>()));
    gh.factory<_i29.AddPassword>(
        () => _i29.AddPassword(gh<_i17.PasswordRepository>()));
    gh.factory<_i30.AddPasswordFormBloc>(
        () => _i30.AddPasswordFormBloc(gh<_i29.AddPassword>()));
    gh.factory<_i31.ArticleCommentWatcherBloc>(
        () => _i31.ArticleCommentWatcherBloc(gh<_i9.GetCommentList>()));
    gh.factory<_i32.ArticleDataSource>(
        () => _i32.ArticleDataSourceImpl(gh<_i3.Client>()));
    gh.factory<_i33.ArticleRepository>(
        () => _i34.ArticleRepositoryImpl(gh<_i32.ArticleDataSource>()));
    gh.factory<_i35.AuthDataSource>(() => _i35.AuthDataSourceImpl(
          client: gh<_i3.Client>(),
          googleSignIn: gh<_i10.GoogleSignIn>(),
        ));
    gh.factory<_i36.AuthRepository>(
        () => _i37.AuthRepositoryImpl(gh<_i35.AuthDataSource>()));
    gh.factory<_i38.AuthorDataSource>(
        () => _i38.AuthorDataSourceImpl(gh<_i3.Client>()));
    gh.factory<_i39.AuthorRepository>(
        () => _i40.AuthorRepositoryImpl(gh<_i38.AuthorDataSource>()));
    gh.factory<_i41.BoardingDataSource>(
        () => _i41.BoardingDataSourceImpl(gh<_i3.Client>()));
    gh.factory<_i42.BoardingRepository>(
        () => _i43.BoardingRepositoryImpl(gh<_i41.BoardingDataSource>()));
    gh.factory<_i44.CategoryDataSource>(
        () => _i44.CategoryDataSourceImpl(gh<_i3.Client>()));
    gh.factory<_i45.CategoryRepository>(
        () => _i46.CategoryRepositoryImpl(gh<_i44.CategoryDataSource>()));
    gh.factory<_i47.ChangePassword>(
        () => _i47.ChangePassword(gh<_i17.PasswordRepository>()));
    gh.factory<_i48.ChangePasswordFormBloc>(
        () => _i48.ChangePasswordFormBloc(gh<_i47.ChangePassword>()));
    gh.factory<_i49.ChangeToModerated>(
        () => _i49.ChangeToModerated(gh<_i24.UserArticleRepository>()));
    gh.factory<_i50.CheckGoogleAuth>(
        () => _i50.CheckGoogleAuth(gh<_i36.AuthRepository>()));
    gh.factory<_i51.CheckLikeStatus>(
        () => _i51.CheckLikeStatus(gh<_i12.LikeArticleRepository>()));
    gh.factory<_i52.CheckUserVerification>(
        () => _i52.CheckUserVerification(gh<_i27.UserRepository>()));
    gh.factory<_i53.CreateArticle>(
        () => _i53.CreateArticle(gh<_i33.ArticleRepository>()));
    gh.factory<_i54.DeleteArticle>(
        () => _i54.DeleteArticle(gh<_i33.ArticleRepository>()));
    gh.factory<_i55.DeleteArticleActorBloc>(
        () => _i55.DeleteArticleActorBloc(gh<_i54.DeleteArticle>()));
    gh.factory<_i56.ForgotPassword>(
        () => _i56.ForgotPassword(gh<_i17.PasswordRepository>()));
    gh.factory<_i57.ForgotPasswordFormBloc>(
        () => _i57.ForgotPasswordFormBloc(gh<_i56.ForgotPassword>()));
    gh.factory<_i58.GetArticle>(
        () => _i58.GetArticle(gh<_i33.ArticleRepository>()));
    gh.factory<_i59.GetArticleDetail>(
        () => _i59.GetArticleDetail(gh<_i33.ArticleRepository>()));
    gh.factory<_i60.GetAuthor>(
        () => _i60.GetAuthor(gh<_i39.AuthorRepository>()));
    gh.factory<_i61.GetBannedArticle>(
        () => _i61.GetBannedArticle(gh<_i24.UserArticleRepository>()));
    gh.factory<_i62.GetBoardingList>(
        () => _i62.GetBoardingList(gh<_i42.BoardingRepository>()));
    gh.factory<_i63.GetCategories>(
        () => _i63.GetCategories(gh<_i45.CategoryRepository>()));
    gh.factory<_i64.GetDraftedArticle>(
        () => _i64.GetDraftedArticle(gh<_i24.UserArticleRepository>()));
    gh.factory<_i65.GetModeratedArticle>(
        () => _i65.GetModeratedArticle(gh<_i24.UserArticleRepository>()));
    gh.factory<_i66.GetPublishedArticle>(
        () => _i66.GetPublishedArticle(gh<_i24.UserArticleRepository>()));
    gh.factory<_i67.GetRejectedArticle>(
        () => _i67.GetRejectedArticle(gh<_i24.UserArticleRepository>()));
    gh.factory<_i68.GetUserProfile>(
        () => _i68.GetUserProfile(gh<_i27.UserRepository>()));
    gh.factory<_i69.LatestArticleWatcherBloc>(
        () => _i69.LatestArticleWatcherBloc(gh<_i58.GetArticle>()));
    gh.factory<_i70.LikeArticleWatcherBloc>(() => _i70.LikeArticleWatcherBloc(
          checkLikeStatus: gh<_i51.CheckLikeStatus>(),
          likeArticle: gh<_i14.LikeOrUnlikedArticle>(),
        ));
    gh.factory<_i71.ModeratedActorBloc>(
        () => _i71.ModeratedActorBloc(gh<_i49.ChangeToModerated>()));
    gh.factory<_i72.ModeratedWatcherBloc>(
        () => _i72.ModeratedWatcherBloc(gh<_i65.GetModeratedArticle>()));
    gh.factory<_i73.PublishedWatcherBloc>(
        () => _i73.PublishedWatcherBloc(gh<_i66.GetPublishedArticle>()));
    gh.factory<_i74.ReadHistory>(
        () => _i74.ReadHistory(gh<_i24.UserArticleRepository>()));
    gh.factory<_i75.ReadHistoryWatcherBloc>(
        () => _i75.ReadHistoryWatcherBloc(gh<_i74.ReadHistory>()));
    gh.factory<_i76.RejectedWatcherBloc>(
        () => _i76.RejectedWatcherBloc(gh<_i67.GetRejectedArticle>()));
    gh.factory<_i77.ReportArticle>(
        () => _i77.ReportArticle(gh<_i33.ArticleRepository>()));
    gh.factory<_i78.ReportAuthor>(
        () => _i78.ReportAuthor(gh<_i39.AuthorRepository>()));
    gh.factory<_i79.ResendEmailVerification>(
        () => _i79.ResendEmailVerification(gh<_i36.AuthRepository>()));
    gh.factory<_i80.SearchArticleWatcherBloc>(
        () => _i80.SearchArticleWatcherBloc(gh<_i58.GetArticle>()));
    gh.factory<_i81.SignInWithEmail>(
        () => _i81.SignInWithEmail(gh<_i36.AuthRepository>()));
    gh.factory<_i82.SignInWithEmailFormBloc>(
        () => _i82.SignInWithEmailFormBloc(gh<_i81.SignInWithEmail>()));
    gh.factory<_i83.SignInWithGoogle>(
        () => _i83.SignInWithGoogle(gh<_i36.AuthRepository>()));
    gh.factory<_i84.SignInWithGoogleActorBloc>(
        () => _i84.SignInWithGoogleActorBloc(gh<_i83.SignInWithGoogle>()));
    gh.factory<_i85.SignOut>(() => _i85.SignOut(gh<_i36.AuthRepository>()));
    gh.factory<_i86.SignUpWithEmail>(
        () => _i86.SignUpWithEmail(gh<_i36.AuthRepository>()));
    gh.factory<_i87.SignUpWithEmailFormBloc>(
        () => _i87.SignUpWithEmailFormBloc(gh<_i86.SignUpWithEmail>()));
    gh.factory<_i88.TrendingArticleWatcherBloc>(
        () => _i88.TrendingArticleWatcherBloc(gh<_i58.GetArticle>()));
    gh.factory<_i89.UpdateArticle>(
        () => _i89.UpdateArticle(gh<_i33.ArticleRepository>()));
    gh.factory<_i90.UpdateUserProfile>(
        () => _i90.UpdateUserProfile(gh<_i27.UserRepository>()));
    gh.factory<_i91.UploadImage>(
        () => _i91.UploadImage(gh<_i33.ArticleRepository>()));
    gh.factory<_i92.UploadImageActorBloc>(
        () => _i92.UploadImageActorBloc(gh<_i91.UploadImage>()));
    gh.factory<_i93.UserFormBloc>(
        () => _i93.UserFormBloc(gh<_i90.UpdateUserProfile>()));
    gh.factory<_i94.UserWatcherBloc>(
        () => _i94.UserWatcherBloc(gh<_i68.GetUserProfile>()));
    gh.factory<_i95.VerificationStatusWatcherBloc>(() =>
        _i95.VerificationStatusWatcherBloc(gh<_i52.CheckUserVerification>()));
    gh.factory<_i96.AddViewCount>(
        () => _i96.AddViewCount(gh<_i33.ArticleRepository>()));
    gh.factory<_i97.ArticleByCategoryWatcherBloc>(
        () => _i97.ArticleByCategoryWatcherBloc(gh<_i58.GetArticle>()));
    gh.factory<_i98.ArticleDetailWatcherBloc>(
        () => _i98.ArticleDetailWatcherBloc(gh<_i59.GetArticleDetail>()));
    gh.factory<_i99.ArticleFormBloc>(() => _i99.ArticleFormBloc(
          create: gh<_i53.CreateArticle>(),
          update: gh<_i89.UpdateArticle>(),
          articleDetail: gh<_i59.GetArticleDetail>(),
        ));
    gh.factory<_i100.AuthWatcherBloc>(() => _i100.AuthWatcherBloc(
          checkGoogleAuth: gh<_i50.CheckGoogleAuth>(),
          signOut: gh<_i85.SignOut>(),
        ));
    gh.factory<_i101.AuthorWatcherBloc>(
        () => _i101.AuthorWatcherBloc(gh<_i60.GetAuthor>()));
    gh.factory<_i102.BannedWatcherBloc>(
        () => _i102.BannedWatcherBloc(gh<_i61.GetBannedArticle>()));
    gh.factory<_i103.BoardingWatcherBloc>(
        () => _i103.BoardingWatcherBloc(gh<_i62.GetBoardingList>()));
    gh.factory<_i104.CategoryWatcherBloc>(
        () => _i104.CategoryWatcherBloc(gh<_i63.GetCategories>()));
    gh.factory<_i105.DraftedWatcherBloc>(
        () => _i105.DraftedWatcherBloc(gh<_i64.GetDraftedArticle>()));
    gh.factory<_i106.EmailVerificationFormBloc>(() =>
        _i106.EmailVerificationFormBloc(gh<_i79.ResendEmailVerification>()));
    gh.factory<_i107.ReportActorBloc>(() => _i107.ReportActorBloc(
          article: gh<_i77.ReportArticle>(),
          author: gh<_i78.ReportAuthor>(),
          comment: gh<_i19.ReportComment>(),
        ));
    gh.factory<_i108.ViewCountActorBloc>(
        () => _i108.ViewCountActorBloc(gh<_i96.AddViewCount>()));
    return this;
  }
}

class _$RegisterModule extends _i109.RegisterModule {}
