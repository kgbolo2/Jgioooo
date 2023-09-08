part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

class UserGetDone extends UserState {
  final User? user;
  const UserGetDone({required this.user});
}
