part of 'athuntication_cubit.dart';

@immutable
abstract class AthunticationState {}

class AthunticationInitial extends AthunticationState {}

class AthunticationLoading extends AthunticationState {}

class AthunticationLoaded extends AthunticationState {}

class AthunticationError extends AthunticationState {}
