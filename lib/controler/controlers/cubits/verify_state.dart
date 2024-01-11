part of 'verify_cubit.dart';

@immutable
abstract class VerifyState {}

class VerifyInitial extends VerifyState {}

class VerifyLoading extends VerifyState {}

class VerifyLoaded extends VerifyState {}

class VerifyError extends VerifyState {}
