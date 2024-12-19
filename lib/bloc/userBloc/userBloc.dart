// user_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class UserEvent {
  late String username;
  late String password;
}

class LoginEvent extends UserEvent {}
class LogoutEvent extends UserEvent {}
class UpdateProfileEvent extends UserEvent {}

abstract class UserState {}

class UserInitial extends UserState {}

class AuthenticatedUser extends UserState {
  final String username;
  final String password;

  AuthenticatedUser({required this.username, required this.password});
}

class UnauthenticatedUser extends UserState {

}

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoginEvent>((event, emit) async {
      // Simulating login process
      await Future.delayed(Duration(seconds: 1));
      emit(AuthenticatedUser(username: event.username, password: event.password));
    });

    on<LogoutEvent>((event, emit) {
      emit(UnauthenticatedUser());
    });

    on<UpdateProfileEvent>((event, emit) async {
      // Simulating profile update
      await Future.delayed(const Duration(seconds: 1));
      emit(AuthenticatedUser(username:event.username,password: event.password));
    });
  }
}
