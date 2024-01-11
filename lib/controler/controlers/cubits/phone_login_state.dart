part of 'phone_login_cubit.dart';

@immutable
abstract class PhoneLoginState {}

class PhoneLoginInitial extends PhoneLoginState {}

class PhoneLoginLoading extends PhoneLoginState {}

class PhoneLoginLoaded extends PhoneLoginState {}

class PhoneLoginError extends PhoneLoginState {}
