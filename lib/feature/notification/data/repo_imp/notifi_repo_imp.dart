import 'package:qabilati/feature/notification/data/api/notifi_api.dart';
import 'package:qabilati/feature/notification/domain/repo_abs/notifi_repo_abs.dart';

class NotifiRepoImp extends NotifiRepoAbs {
  @override
  Future getnotificaions(int userId) async {
    List response = await NotifiApi.selectEq(
      "notification",
      "notifi_receiver",
      userId,
    );
    return response;
  }
}
