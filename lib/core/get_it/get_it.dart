import 'package:get_it/get_it.dart';
import 'package:qabilati/core/class/supabase_connect.dart';
import 'package:qabilati/feature/auth/data/repo_imp/repo_imp.dart';
import 'package:qabilati/feature/auth/domain/repo_abs/repo_abs.dart';
import 'package:qabilati/feature/auth/domain/usecase/check_verify.dart';
import 'package:qabilati/feature/auth/domain/usecase/create_verify_and_send_usecase.dart';
import 'package:qabilati/feature/auth/domain/usecase/login_usecase.dart';
import 'package:qabilati/feature/auth/domain/usecase/register_usecase.dart';
import 'package:qabilati/feature/auth/domain/usecase/upload_image_user_usecase.dart';
import 'package:qabilati/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:qabilati/feature/friends/data/repo_imp/friend_repo_ipm.dart';
import 'package:qabilati/feature/friends/domain/repo_abs/friend_repo_abs.dart';
import 'package:qabilati/feature/friends/domain/usecase/get_friends_usecase.dart';
import 'package:qabilati/feature/friends/presentation/cubit/friend_cubit.dart';
import 'package:qabilati/feature/notification/data/repo_imp/notifi_repo_imp.dart';
import 'package:qabilati/feature/notification/domain/repo_abs/notifi_repo_abs.dart';
import 'package:qabilati/feature/notification/domain/usecase/get_notification_usecase.dart';
import 'package:qabilati/feature/notification/presentation/cubit/notifications_cubit.dart';
import 'package:qabilati/feature/request_friend/data/repo_imp/repo_request_friend_imp.dart';
import 'package:qabilati/feature/request_friend/domain/repo_abs/repo_request_friend_abs.dart';
import 'package:qabilati/feature/request_friend/domain/usecase/change_status_usecase.dart';
import 'package:qabilati/feature/request_friend/domain/usecase/request_friend_usecase.dart';
import 'package:qabilati/feature/request_friend/domain/usecase/un_friend_usecase.dart';
import 'package:qabilati/feature/request_friend/presentation/cubit/request_friend_cubit.dart';
import 'package:qabilati/feature/search/data/repo_imp/repo_imp.dart';
import 'package:qabilati/feature/search/domain/repo_abs/repo_abs.dart';
import 'package:qabilati/feature/search/domain/usecase/get_search_usecase.dart';
import 'package:qabilati/feature/search/presentation/cubit/search_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> setUp() async {
  //===============================DATABASE CONNTECTION===========================
  getIt.registerLazySingleton(() => SupabaseConnect.instance);
  //===============================REPOSITORY=====================================
  getIt.registerLazySingleton<RepoAbs>(() => RepoImp());
  getIt.registerLazySingleton<RepoAbsSearch>(() => RepoImpSearch());
  getIt.registerLazySingleton<RepoRequestFriendAbs>(
    () => RepoRequestFriendImp(),
  );
  getIt.registerLazySingleton<FriendRepoAbs>(() => FriendRepoIpm());
  getIt.registerLazySingleton<NotifiRepoAbs>(() => NotifiRepoImp());

  //===============================USECASE========================================
  getIt.registerLazySingleton(() => LoginUsecase(getIt.get<RepoAbs>()));
  getIt.registerLazySingleton(() => RegisterUsecase(getIt.get<RepoAbs>()));

  getIt.registerLazySingleton(
    () => CreateVerifyAndSendUsecase(getIt.get<RepoAbs>()),
  );
  getIt.registerLazySingleton(() => CheckVerifyUseCase(getIt.get<RepoAbs>()));
  getIt.registerLazySingleton(
    () => GetSearchUsecase(getIt.get<RepoAbsSearch>()),
  );
  getIt.registerLazySingleton(
    () => UploadImageUserUsecase(getIt.get<RepoAbs>()),
  );
  getIt.registerLazySingleton(
    () => ChangeStatusUsecase(getIt.get<RepoRequestFriendAbs>()),
  );
  getIt.registerLazySingleton(
    () => UnFriendUsecase(getIt.get<RepoRequestFriendAbs>()),
  );
  getIt.registerLazySingleton(
    () => RequestFriendUsecase(getIt.get<RepoRequestFriendAbs>()),
  );
  getIt.registerLazySingleton(
    () => GetFriendsUsecase(getIt.get<FriendRepoAbs>()),
  );
  getIt.registerLazySingleton(
    () => GetNotificationUsecase(getIt.get<NotifiRepoAbs>()),
  );

  //===============================CUBIT STATREMANGEMENT==========================

  getIt.registerLazySingleton(
    () => AuthCubit(
      getIt.get<LoginUsecase>(),
      getIt.get<RegisterUsecase>(),
      getIt.get<CreateVerifyAndSendUsecase>(),
      getIt.get<CheckVerifyUseCase>(),
      getIt.get<UploadImageUserUsecase>(),
    ),
  );
  getIt.registerLazySingleton(() => SearchCubit(getIt.get<GetSearchUsecase>()));
  getIt.registerLazySingleton(
    () => RequestFriendCubit(
      getIt.get<ChangeStatusUsecase>(),
      getIt.get<UnFriendUsecase>(),
      getIt.get<RequestFriendUsecase>(),
    ),
  );
  getIt.registerLazySingleton(
    () => FriendsCubit(getIt.get<GetFriendsUsecase>()),
  );
  getIt.registerLazySingleton(
    () => NotificationsCubit(getIt.get<GetNotificationUsecase>()),
  );

  //=============================== CHECK INITIALIZATION ==========================
  await getIt.allReady();
}
