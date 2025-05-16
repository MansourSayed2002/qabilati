part of 'friend_cubit.dart';

@immutable
sealed class FriendsState {}

final class FriendInitial extends FriendsState {}

final class FriendLoading extends FriendsState {}

final class FriendSuccess extends FriendsState {}

final class FriendError extends FriendsState {}
