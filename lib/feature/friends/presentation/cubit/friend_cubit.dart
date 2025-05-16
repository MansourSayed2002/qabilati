import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/feature/friends/domain/usecase/get_friends_usecase.dart';

part 'friend_state.dart';

class FriendsCubit extends Cubit<FriendsState> {
  FriendsCubit(this.getFriendsUseCase) : super(FriendInitial());
  late GetFriendsUsecase getFriendsUseCase;
  List friendList = [];
  Future<void> getFriend() async {
    emit(FriendLoading());
    friendList.clear();
    var result = await getFriendsUseCase.getFriend();
    if (result is ApiSuccess) {
      friendList = result.data;
      emit(FriendSuccess());
    } else if (result is ApiFailure) {
      emit(FriendError());
    }
  }
}
