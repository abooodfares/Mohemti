part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class ChangeCategory extends HomeState {}
final class AddTask extends HomeState {}

