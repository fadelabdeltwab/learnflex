
abstract class ContentState {}

class ContentInitial extends ContentState {}

class ContentLoading extends ContentState {}

class ContentLoaded extends ContentState {}

class ContentError extends ContentState {
  final String message;
  ContentError(this.message);
}
