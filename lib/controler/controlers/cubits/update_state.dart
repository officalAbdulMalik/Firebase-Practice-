part of 'update_cubit.dart';

@immutable
abstract class UpdateState {}

class UpdateInitial extends UpdateState {}

class UpdateLoaded extends UpdateState {}

class UpdateLoading extends UpdateState{}

class UpdateError extends UpdateState {}
