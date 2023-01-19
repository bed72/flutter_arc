part of 'signup_cubit.dart';

@immutable
abstract class SignUpState {}

@immutable
class SignupInitialState extends SignUpState {}

@immutable
class SignUpLoadingState extends SignUpState {}

@immutable
class SignUpSuccessState extends SignUpState {
  late final SignUpModel value;

  SignUpSuccessState(this.value);
}

@immutable
class SignUpErrorState extends SignUpState {
  late final MessageModel value;

  SignUpErrorState(this.value);
}
