import 'package:qabilati/feature/friends/data/api/friend_api.dart';
import 'package:qabilati/feature/friends/domain/repo_abs/friend_repo_abs.dart';

class FriendRepoIpm extends FriendRepoAbs {
  @override
  Future getFriend(Map<String, dynamic> params) async {
    var response = await FriendApi.getFriend("get_friend", params);
    return response;
  }
}
