part of 'signup_cubit.dart';

@immutable
abstract class SignUpState {}

class SignupInitialState extends SignUpState {}

@immutable
class SignUpLoadingState extends SignUpState {}

@immutable
class SignUpSuccessState extends SignUpState {
  late final SignUpEntity value;

  SignUpSuccessState(this.value);
}

@immutable
class SignUpErrorState extends SignUpState {
  late final MessageEntity value;

  SignUpErrorState(this.value);
}
