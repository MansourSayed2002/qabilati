import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/notification/domain/repo_abs/notifi_repo_abs.dart';

class GetNotificationUsecase {
  late NotifiRepoAbs notifiRepoAbs;
  GetNotificationUsecase(this.notifiRepoAbs);

  Future<ApiResult> getNotification(int userId) async {
    try {
      List response = await notifiRepoAbs.getnotificaions(userId);
      log(response.toString());
      return ApiSuccess(response);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
