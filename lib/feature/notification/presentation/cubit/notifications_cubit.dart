import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/feature/notification/domain/usecase/get_notification_usecase.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this.getNotificationUsecase)
    : super(NotificationsInitial());

  List notifications = [];

  late GetNotificationUsecase getNotificationUsecase;
  void getNotification(int userId) async {
    emit(NotificationsLoading());
    var response = await getNotificationUsecase.getNotification(userId);
    if (response is ApiSuccess) {
      notifications = response.data;
      emit(NotificationsSuccess());
    } else if (response is ApiFailure) {
      emit(NotificationsError());
    }
  }
}
