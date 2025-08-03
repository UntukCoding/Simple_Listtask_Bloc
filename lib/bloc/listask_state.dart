part of 'listask_bloc.dart';

@immutable
abstract class ListaskState {}

class ListaskInitial extends ListaskState {}


class ListaskLoading extends ListaskState {}

class ListaskLoaded extends ListaskState {
  List<Hasil> hasil;
  ListaskLoaded(this.hasil);
}

class ListaskError extends ListaskState {
  final String Error;
  ListaskError(this.Error);
}
