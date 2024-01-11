part of 'fetch_data_cubit.dart';

@immutable
abstract class FetchDataState {}

class FetchDataInitial extends FetchDataState {}

class FetchLoaded extends FetchDataState {
  List<DataModel> model = [];

  FetchLoaded({required this.model});
}

class FetchLoading extends FetchDataState {}

class FetchDataErro extends FetchDataState {}
