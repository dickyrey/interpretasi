// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i10;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:interpretasi/injection.dart' as _i110;
import 'package:interpretasi/src/data/datasources/article_data_source.dart'
    as _i33;
import 'package:interpretasi/src/data/datasources/auth_data_source.dart'
    as _i36;
import 'package:interpretasi/src/data/datasources/author_data_source.dart'
    as _i39;
import 'package:interpretasi/src/data/datasources/boarding_data_source.dart'
    as _i42;
import 'package:interpretasi/src/data/datasources/category_data_source.dart'
    as _i45;
import 'package:interpretasi/src/data/datasources/comment_article_data_source.dart'
    as _i4;
import 'package:interpretasi/src/data/datasources/like_article_data_source%20copy.dart'
    as _i12;
import 'package:interpretasi/src/data/datasources/like_article_data_source.dart'
    as _i11;
import 'package:interpretasi/src/data/datasources/password_data_source.dart'
    as _i17;
import 'package:interpretasi/src/data/datasources/user_article_data_source.dart'
    as _i24;
import 'package:interpretasi/src/data/datasources/user_data_source.dart'
    as _i27;
import 'package:interpretasi/src/data/repositories/article_repository_impl.dart'
    as _i35;
import 'package:interpretasi/src/data/repositories/auth_repository_impl.dart'
    as _i38;
import 'package:interpretasi/src/data/repositories/author_data_source_impl.dart'
    as _i41;
import 'package:interpretasi/src/data/repositories/boarding_repository_impl.dart'
    as _i44;
import 'package:interpretasi/src/data/repositories/category_repository_impl.dart'
    as _i47;
import 'package:interpretasi/src/data/repositories/comment_article_repository_impl.dart'
    as _i6;
import 'package:interpretasi/src/data/repositories/like_article_repository_impl.dart'
    as _i14;
import 'package:interpretasi/src/data/repositories/password_repository_impl.dart'
    as _i19;
import 'package:interpretasi/src/data/repositories/user_article_repository_impl.dart'
    as _i26;
import 'package:interpretasi/src/data/repositories/user_repository_impl.dart'
    as _i29;
import 'package:interpretasi/src/domain/repositories/article_repository.dart'
    as _i34;
import 'package:interpretasi/src/domain/repositories/auth_repository.dart'
    as _i37;
import 'package:interpretasi/src/domain/repositories/author_data_source.dart'
    as _i40;
import 'package:interpretasi/src/domain/repositories/boarding_repository.dart'
    as _i43;
import 'package:interpretasi/src/domain/repositories/category_repository.dart'
    as _i46;
import 'package:interpretasi/src/domain/repositories/comment_article_repository.dart'
    as _i5;
import 'package:interpretasi/src/domain/repositories/like_article_repository.dart'
    as _i13;
import 'package:interpretasi/src/domain/repositories/password_repository.dart'
    as _i18;
import 'package:interpretasi/src/domain/repositories/user_article_repository.dart'
    as _i25;
import 'package:interpretasi/src/domain/repositories/user_repository.dart'
    as _i28;
import 'package:interpretasi/src/domain/usecases/article/add_view_count.dart'
    as _i97;
import 'package:interpretasi/src/domain/usecases/article/create_article.dart'
    as _i54;
import 'package:interpretasi/src/domain/usecases/article/delete_article.dart'
    as _i55;
import 'package:interpretasi/src/domain/usecases/article/get_article.dart'
    as _i59;
import 'package:interpretasi/src/domain/usecases/article/get_article_detail.dart'
    as _i60;
import 'package:interpretasi/src/domain/usecases/article/report_article.dart'
    as _i78;
import 'package:interpretasi/src/domain/usecases/article/update_article.dart'
    as _i90;
import 'package:interpretasi/src/domain/usecases/article/upload_image.dart'
    as _i92;
import 'package:interpretasi/src/domain/usecases/auth/check_google_auth.dart'
    as _i51;
import 'package:interpretasi/src/domain/usecases/auth/resend_email_verification.dart'
    as _i80;
import 'package:interpretasi/src/domain/usecases/auth/sign_in_with_email.dart'
    as _i82;
import 'package:interpretasi/src/domain/usecases/auth/sign_in_with_google.dart'
    as _i84;
import 'package:interpretasi/src/domain/usecases/auth/sign_out_with_google.dart'
    as _i86;
import 'package:interpretasi/src/domain/usecases/auth/sign_up_with_email.dart'
    as _i87;
import 'package:interpretasi/src/domain/usecases/author/get_author.dart'
    as _i61;
import 'package:interpretasi/src/domain/usecases/author/report_author.dart'
    as _i79;
import 'package:interpretasi/src/domain/usecases/category/get_categories.dart'
    as _i64;
import 'package:interpretasi/src/domain/usecases/comment_article/delete_comment.dart'
    as _i7;
import 'package:interpretasi/src/domain/usecases/comment_article/get_comment_list.dart'
    as _i9;
import 'package:interpretasi/src/domain/usecases/comment_article/report_comment.dart'
    as _i20;
import 'package:interpretasi/src/domain/usecases/comment_article/send_comment.dart'
    as _i21;
import 'package:interpretasi/src/domain/usecases/like_article/check_like_status.dart'
    as _i52;
import 'package:interpretasi/src/domain/usecases/like_article/like_article.dart'
    as _i15;
import 'package:interpretasi/src/domain/usecases/on_boarding/get_boarding_list.dart'
    as _i63;
import 'package:interpretasi/src/domain/usecases/password/add_password.dart'
    as _i30;
import 'package:interpretasi/src/domain/usecases/password/change_password.dart'
    as _i48;
import 'package:interpretasi/src/domain/usecases/password/forgot_password.dart'
    as _i57;
import 'package:interpretasi/src/domain/usecases/user/check_user_verification.dart'
    as _i53;
import 'package:interpretasi/src/domain/usecases/user/get_user_profile.dart'
    as _i69;
import 'package:interpretasi/src/domain/usecases/user/update_user_profile.dart'
    as _i91;
import 'package:interpretasi/src/domain/usecases/user_article/change_to_moderated.dart'
    as _i50;
import 'package:interpretasi/src/domain/usecases/user_article/get_banned_article.dart'
    as _i62;
import 'package:interpretasi/src/domain/usecases/user_article/get_drafted_article.dart'
    as _i65;
import 'package:interpretasi/src/domain/usecases/user_article/get_moderated_article.dart'
    as _i66;
import 'package:interpretasi/src/domain/usecases/user_article/get_published_article.dart'
    as _i67;
import 'package:interpretasi/src/domain/usecases/user_article/get_rejected_article.dart'
    as _i68;
import 'package:interpretasi/src/domain/usecases/user_article/history_article.dart'
    as _i75;
import 'package:interpretasi/src/presentation/bloc/article/article_by_category_watcher/article_by_category_watcher_bloc.dart'
    as _i98;
import 'package:interpretasi/src/presentation/bloc/article/article_detail_watcher/article_detail_watcher_bloc.dart'
    as _i99;
import 'package:interpretasi/src/presentation/bloc/article/article_form/article_form_bloc.dart'
    as _i100;
import 'package:interpretasi/src/presentation/bloc/article/delete_article_actor/delete_article_actor_bloc.dart'
    as _i56;
import 'package:interpretasi/src/presentation/bloc/article/latest_article_watcher/latest_article_watcher_bloc.dart'
    as _i70;
import 'package:interpretasi/src/presentation/bloc/article/search_article_watcher/search_article_watcher_bloc.dart'
    as _i81;
import 'package:interpretasi/src/presentation/bloc/article/trending_article_watcher/trending_article_watcher_bloc.dart'
    as _i89;
import 'package:interpretasi/src/presentation/bloc/article/upload_image_actor/upload_image_actor_bloc.dart'
    as _i93;
import 'package:interpretasi/src/presentation/bloc/article/view_count_actor/view_count_actor_bloc.dart'
    as _i109;
import 'package:interpretasi/src/presentation/bloc/auth/auth_watcher/auth_watcher_bloc.dart'
    as _i101;
import 'package:interpretasi/src/presentation/bloc/auth/sign_in_with_email_form/sign_in_with_email_form_bloc.dart'
    as _i83;
import 'package:interpretasi/src/presentation/bloc/auth/sign_in_with_google_actor/sign_in_with_google_actor_bloc.dart'
    as _i85;
import 'package:interpretasi/src/presentation/bloc/auth/sign_up_with_email_form/sign_up_with_email_form_bloc.dart'
    as _i88;
import 'package:interpretasi/src/presentation/bloc/auth/verification_status_watcher/verification_status_watcher_bloc.dart'
    as _i96;
import 'package:interpretasi/src/presentation/bloc/author/author_watcher_bloc.dart'
    as _i102;
import 'package:interpretasi/src/presentation/bloc/boarding/boarding_watcher_bloc.dart'
    as _i104;
import 'package:interpretasi/src/presentation/bloc/category/category_watcher_bloc.dart'
    as _i105;
import 'package:interpretasi/src/presentation/bloc/comment_article/article_comment_watcher/article_comment_watcher_bloc.dart'
    as _i32;
import 'package:interpretasi/src/presentation/bloc/comment_article/delete_comment_actor/delete_comment_actor_bloc.dart'
    as _i8;
import 'package:interpretasi/src/presentation/bloc/comment_article/send_comment_actor/send_comment_actor_bloc.dart'
    as _i22;
import 'package:interpretasi/src/presentation/bloc/email_verification/email_verification_form_bloc.dart'
    as _i107;
import 'package:interpretasi/src/presentation/bloc/like_article_watcher/like_article_watcher_bloc.dart'
    as _i71;
import 'package:interpretasi/src/presentation/bloc/localization/localization_watcher_bloc.dart'
    as _i16;
import 'package:interpretasi/src/presentation/bloc/password/add_password_form/add_password_form_bloc.dart'
    as _i31;
import 'package:interpretasi/src/presentation/bloc/password/change_password_form/change_password_form_bloc.dart'
    as _i49;
import 'package:interpretasi/src/presentation/bloc/password/forgot_password_form/forgot_password_form_bloc.dart'
    as _i58;
import 'package:interpretasi/src/presentation/bloc/report/report_actor_bloc.dart'
    as _i108;
import 'package:interpretasi/src/presentation/bloc/theme/theme_watcher_bloc.dart'
    as _i23;
import 'package:interpretasi/src/presentation/bloc/user/user_form/user_form_bloc.dart'
    as _i94;
import 'package:interpretasi/src/presentation/bloc/user/user_watcher/user_watcher_bloc.dart'
    as _i95;
import 'package:interpretasi/src/presentation/bloc/user_article/banned_watcher/banned_watcher_bloc.dart'
    as _i103;
import 'package:interpretasi/src/presentation/bloc/user_article/drafted_watcher/drafted_watcher_bloc.dart'
    as _i106;
import 'package:interpretasi/src/presentation/bloc/user_article/moderated_actor/moderated_actor_bloc.dart'
    as _i72;
import 'package:interpretasi/src/presentation/bloc/user_article/moderated_watcher/moderated_watcher_bloc.dart'
    as _i73;
import 'package:interpretasi/src/presentation/bloc/user_article/read_history_watcher/read_history_watcher_bloc.dart'
    as _i76;
import 'package:interpretasi/src/presentation/bloc/user_article/rejected_watcher/rejected_watcher_bloc.dart'
    as _i77;
import 'package:interpretasi/src/presentation/bloc/user_article/user_article_published_watcher/published_watcher_bloc.dart'
    as _i74; // ignore_for_file: unnecessary_lambdas

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
    gh.factory<_i12.LikeArticleDataSource>(
        () => _i12.LikeArticleDataSourceImpl(gh<_i3.Client>()));
    gh.factory<_i13.LikeArticleRepository>(
        () => _i14.LikeArticleRepositoryImpl(gh<_i11.LikeArticleDataSource>()));
    gh.factory<_i15.LikeOrUnlikedArticle>(
        () => _i15.LikeOrUnlikedArticle(gh<_i13.LikeArticleRepository>()));
    gh.factory<_i16.LocalizationWatcherBloc>(
        () => _i16.LocalizationWatcherBloc());
    gh.factory<_i17.PasswordDataSource>(
        () => _i17.PasswordDataSourceImpl(gh<_i3.Client>()));
    gh.factory<_i18.PasswordRepository>(
        () => _i19.PasswordRepositoryImpl(gh<_i17.PasswordDataSource>()));
    gh.factory<_i20.ReportComment>(
        () => _i20.ReportComment(gh<_i5.CommentArticleRepository>()));
    gh.factory<_i21.SendComment>(
        () => _i21.SendComment(gh<_i5.CommentArticleRepository>()));
    gh.factory<_i22.SendCommentActorBloc>(
        () => _i22.SendCommentActorBloc(gh<_i21.SendComment>()));
    gh.factory<_i23.ThemeWatcherBloc>(() => _i23.ThemeWatcherBloc());
    gh.factory<_i24.UserArticleDataSource>(
        () => _i24.UserArticleDataSourceImpl(gh<_i3.Client>()));
    gh.factory<_i25.UserArticleRepository>(
        () => _i26.UserArticleRepositoryImpl(gh<_i24.UserArticleDataSource>()));
    gh.factory<_i27.UserDataSource>(
        () => _i27.UserDataSourceImpl(gh<_i3.Client>()));
    gh.factory<_i28.UserRepository>(
        () => _i29.UserRepositoryImpl(gh<_i27.UserDataSource>()));
    gh.factory<_i30.AddPassword>(
        () => _i30.AddPassword(gh<_i18.PasswordRepository>()));
    gh.factory<_i31.AddPasswordFormBloc>(
        () => _i31.AddPasswordFormBloc(gh<_i30.AddPassword>()));
    gh.factory<_i32.ArticleCommentWatcherBloc>(
        () => _i32.ArticleCommentWatcherBloc(gh<_i9.GetCommentList>()));
    gh.factory<_i33.ArticleDataSource>(
        () => _i33.ArticleDataSourceImpl(gh<_i3.Client>()));
    gh.factory<_i34.ArticleRepository>(
        () => _i35.ArticleRepositoryImpl(gh<_i33.ArticleDataSource>()));
    gh.factory<_i36.AuthDataSource>(() => _i36.AuthDataSourceImpl(
          client: gh<_i3.Client>(),
          googleSignIn: gh<_i10.GoogleSignIn>(),
        ));
    gh.factory<_i37.AuthRepository>(
        () => _i38.AuthRepositoryImpl(gh<_i36.AuthDataSource>()));
    gh.factory<_i39.AuthorDataSource>(
        () => _i39.AuthorDataSourceImpl(gh<_i3.Client>()));
    gh.factory<_i40.AuthorRepository>(
        () => _i41.AuthorRepositoryImpl(gh<_i39.AuthorDataSource>()));
    gh.factory<_i42.BoardingDataSource>(
        () => _i42.BoardingDataSourceImpl(gh<_i3.Client>()));
    gh.factory<_i43.BoardingRepository>(
        () => _i44.BoardingRepositoryImpl(gh<_i42.BoardingDataSource>()));
    gh.factory<_i45.CategoryDataSource>(
        () => _i45.CategoryDataSourceImpl(gh<_i3.Client>()));
    gh.factory<_i46.CategoryRepository>(
        () => _i47.CategoryRepositoryImpl(gh<_i45.CategoryDataSource>()));
    gh.factory<_i48.ChangePassword>(
        () => _i48.ChangePassword(gh<_i18.PasswordRepository>()));
    gh.factory<_i49.ChangePasswordFormBloc>(
        () => _i49.ChangePasswordFormBloc(gh<_i48.ChangePassword>()));
    gh.factory<_i50.ChangeToModerated>(
        () => _i50.ChangeToModerated(gh<_i25.UserArticleRepository>()));
    gh.factory<_i51.CheckGoogleAuth>(
        () => _i51.CheckGoogleAuth(gh<_i37.AuthRepository>()));
    gh.factory<_i52.CheckLikeStatus>(
        () => _i52.CheckLikeStatus(gh<_i13.LikeArticleRepository>()));
    gh.factory<_i53.CheckUserVerification>(
        () => _i53.CheckUserVerification(gh<_i28.UserRepository>()));
    gh.factory<_i54.CreateArticle>(
        () => _i54.CreateArticle(gh<_i34.ArticleRepository>()));
    gh.factory<_i55.DeleteArticle>(
        () => _i55.DeleteArticle(gh<_i34.ArticleRepository>()));
    gh.factory<_i56.DeleteArticleActorBloc>(
        () => _i56.DeleteArticleActorBloc(gh<_i55.DeleteArticle>()));
    gh.factory<_i57.ForgotPassword>(
        () => _i57.ForgotPassword(gh<_i18.PasswordRepository>()));
    gh.factory<_i58.ForgotPasswordFormBloc>(
        () => _i58.ForgotPasswordFormBloc(gh<_i57.ForgotPassword>()));
    gh.factory<_i59.GetArticle>(
        () => _i59.GetArticle(gh<_i34.ArticleRepository>()));
    gh.factory<_i60.GetArticleDetail>(
        () => _i60.GetArticleDetail(gh<_i34.ArticleRepository>()));
    gh.factory<_i61.GetAuthor>(
        () => _i61.GetAuthor(gh<_i40.AuthorRepository>()));
    gh.factory<_i62.GetBannedArticle>(
        () => _i62.GetBannedArticle(gh<_i25.UserArticleRepository>()));
    gh.factory<_i63.GetBoardingList>(
        () => _i63.GetBoardingList(gh<_i43.BoardingRepository>()));
    gh.factory<_i64.GetCategories>(
        () => _i64.GetCategories(gh<_i46.CategoryRepository>()));
    gh.factory<_i65.GetDraftedArticle>(
        () => _i65.GetDraftedArticle(gh<_i25.UserArticleRepository>()));
    gh.factory<_i66.GetModeratedArticle>(
        () => _i66.GetModeratedArticle(gh<_i25.UserArticleRepository>()));
    gh.factory<_i67.GetPublishedArticle>(
        () => _i67.GetPublishedArticle(gh<_i25.UserArticleRepository>()));
    gh.factory<_i68.GetRejectedArticle>(
        () => _i68.GetRejectedArticle(gh<_i25.UserArticleRepository>()));
    gh.factory<_i69.GetUserProfile>(
        () => _i69.GetUserProfile(gh<_i28.UserRepository>()));
    gh.factory<_i70.LatestArticleWatcherBloc>(
        () => _i70.LatestArticleWatcherBloc(gh<_i59.GetArticle>()));
    gh.factory<_i71.LikeArticleWatcherBloc>(() => _i71.LikeArticleWatcherBloc(
          checkLikeStatus: gh<_i52.CheckLikeStatus>(),
          likeArticle: gh<_i15.LikeOrUnlikedArticle>(),
        ));
    gh.factory<_i72.ModeratedActorBloc>(
        () => _i72.ModeratedActorBloc(gh<_i50.ChangeToModerated>()));
    gh.factory<_i73.ModeratedWatcherBloc>(
        () => _i73.ModeratedWatcherBloc(gh<_i66.GetModeratedArticle>()));
    gh.factory<_i74.PublishedWatcherBloc>(
        () => _i74.PublishedWatcherBloc(gh<_i67.GetPublishedArticle>()));
    gh.factory<_i75.ReadHistory>(
        () => _i75.ReadHistory(gh<_i25.UserArticleRepository>()));
    gh.factory<_i76.ReadHistoryWatcherBloc>(
        () => _i76.ReadHistoryWatcherBloc(gh<_i75.ReadHistory>()));
    gh.factory<_i77.RejectedWatcherBloc>(
        () => _i77.RejectedWatcherBloc(gh<_i68.GetRejectedArticle>()));
    gh.factory<_i78.ReportArticle>(
        () => _i78.ReportArticle(gh<_i34.ArticleRepository>()));
    gh.factory<_i79.ReportAuthor>(
        () => _i79.ReportAuthor(gh<_i40.AuthorRepository>()));
    gh.factory<_i80.ResendEmailVerification>(
        () => _i80.ResendEmailVerification(gh<_i37.AuthRepository>()));
    gh.factory<_i81.SearchArticleWatcherBloc>(
        () => _i81.SearchArticleWatcherBloc(gh<_i59.GetArticle>()));
    gh.factory<_i82.SignInWithEmail>(
        () => _i82.SignInWithEmail(gh<_i37.AuthRepository>()));
    gh.factory<_i83.SignInWithEmailFormBloc>(
        () => _i83.SignInWithEmailFormBloc(gh<_i82.SignInWithEmail>()));
    gh.factory<_i84.SignInWithGoogle>(
        () => _i84.SignInWithGoogle(gh<_i37.AuthRepository>()));
    gh.factory<_i85.SignInWithGoogleActorBloc>(
        () => _i85.SignInWithGoogleActorBloc(gh<_i84.SignInWithGoogle>()));
    gh.factory<_i86.SignOut>(() => _i86.SignOut(gh<_i37.AuthRepository>()));
    gh.factory<_i87.SignUpWithEmail>(
        () => _i87.SignUpWithEmail(gh<_i37.AuthRepository>()));
    gh.factory<_i88.SignUpWithEmailFormBloc>(
        () => _i88.SignUpWithEmailFormBloc(gh<_i87.SignUpWithEmail>()));
    gh.factory<_i89.TrendingArticleWatcherBloc>(
        () => _i89.TrendingArticleWatcherBloc(gh<_i59.GetArticle>()));
    gh.factory<_i90.UpdateArticle>(
        () => _i90.UpdateArticle(gh<_i34.ArticleRepository>()));
    gh.factory<_i91.UpdateUserProfile>(
        () => _i91.UpdateUserProfile(gh<_i28.UserRepository>()));
    gh.factory<_i92.UploadImage>(
        () => _i92.UploadImage(gh<_i34.ArticleRepository>()));
    gh.factory<_i93.UploadImageActorBloc>(
        () => _i93.UploadImageActorBloc(gh<_i92.UploadImage>()));
    gh.factory<_i94.UserFormBloc>(
        () => _i94.UserFormBloc(gh<_i91.UpdateUserProfile>()));
    gh.factory<_i95.UserWatcherBloc>(
        () => _i95.UserWatcherBloc(gh<_i69.GetUserProfile>()));
    gh.factory<_i96.VerificationStatusWatcherBloc>(() =>
        _i96.VerificationStatusWatcherBloc(gh<_i53.CheckUserVerification>()));
    gh.factory<_i97.AddViewCount>(
        () => _i97.AddViewCount(gh<_i34.ArticleRepository>()));
    gh.factory<_i98.ArticleByCategoryWatcherBloc>(
        () => _i98.ArticleByCategoryWatcherBloc(gh<_i59.GetArticle>()));
    gh.factory<_i99.ArticleDetailWatcherBloc>(
        () => _i99.ArticleDetailWatcherBloc(gh<_i60.GetArticleDetail>()));
    gh.factory<_i100.ArticleFormBloc>(() => _i100.ArticleFormBloc(
          create: gh<_i54.CreateArticle>(),
          update: gh<_i90.UpdateArticle>(),
          articleDetail: gh<_i60.GetArticleDetail>(),
        ));
    gh.factory<_i101.AuthWatcherBloc>(() => _i101.AuthWatcherBloc(
          checkGoogleAuth: gh<_i51.CheckGoogleAuth>(),
          signOut: gh<_i86.SignOut>(),
        ));
    gh.factory<_i102.AuthorWatcherBloc>(
        () => _i102.AuthorWatcherBloc(gh<_i61.GetAuthor>()));
    gh.factory<_i103.BannedWatcherBloc>(
        () => _i103.BannedWatcherBloc(gh<_i62.GetBannedArticle>()));
    gh.factory<_i104.BoardingWatcherBloc>(
        () => _i104.BoardingWatcherBloc(gh<_i63.GetBoardingList>()));
    gh.factory<_i105.CategoryWatcherBloc>(
        () => _i105.CategoryWatcherBloc(gh<_i64.GetCategories>()));
    gh.factory<_i106.DraftedWatcherBloc>(
        () => _i106.DraftedWatcherBloc(gh<_i65.GetDraftedArticle>()));
    gh.factory<_i107.EmailVerificationFormBloc>(() =>
        _i107.EmailVerificationFormBloc(gh<_i80.ResendEmailVerification>()));
    gh.factory<_i108.ReportActorBloc>(() => _i108.ReportActorBloc(
          article: gh<_i78.ReportArticle>(),
          author: gh<_i79.ReportAuthor>(),
          comment: gh<_i20.ReportComment>(),
        ));
    gh.factory<_i109.ViewCountActorBloc>(
        () => _i109.ViewCountActorBloc(gh<_i97.AddViewCount>()));
    return this;
  }
}

class _$RegisterModule extends _i110.RegisterModule {}
