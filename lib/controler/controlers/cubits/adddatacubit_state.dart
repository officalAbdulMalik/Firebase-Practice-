part of 'adddatacubit_cubit.dart';

@immutable
abstract class AdddatacubitState {}

class AdddatacubitInitial extends AdddatacubitState {}

class AddDataLoadedState extends AdddatacubitState{}

class AddDataLoadingState extends AdddatacubitState{}

class AddDataErrorState extends AdddatacubitState{}

class Internetconnected extends AdddatacubitState{}