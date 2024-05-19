// part of 'parent_cubit.dart';

// @immutable
// sealed class ParentState {}

// final class ParentInitial extends ParentState {}






part of 'parent_cubit.dart';

@immutable
abstract class ParentState {}

class ParentInitial extends ParentState {}

class LanguageLoaded extends ParentState {
  final Map<String, dynamic> local;

  LanguageLoaded(this.local);
}

class LanguageLoadFailed extends ParentState {
  final String error;

  LanguageLoadFailed(this.error);
}

class ThemeModeChanged extends ParentState {
  final ThemeMode themeMode;

  ThemeModeChanged(this.themeMode);
}
