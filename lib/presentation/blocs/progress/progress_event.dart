import 'package:equatable/equatable.dart';

sealed class ProgressEvent extends Equatable {
  const ProgressEvent();

  @override
  List<Object?> get props => [];
}

final class ProgressLoadRequested extends ProgressEvent {
  const ProgressLoadRequested();
}

final class ProgressRefreshRequested extends ProgressEvent {
  const ProgressRefreshRequested();
}
