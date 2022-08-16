part of 'News_cubit.dart';

@immutable
abstract class NewsState {}

class NewsCubitInitial extends NewsState {}

class NewsBottomNavState extends NewsState {}

class NewsGetBusinessSuccessState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewSGetBusinessErrorState extends NewsState {
  final String error;

  NewSGetBusinessErrorState(this.error);
  
}

class NewsGetSportsSuccessState extends NewsState {}

class NewSGetSportsErrorState extends NewsState {
  final String error;
  NewSGetSportsErrorState(this.error);
}

class NewsGetScienceSuccessState extends NewsState {}

class NewSGetScienceErrorState extends NewsState {
  final String error;
  NewSGetScienceErrorState(this.error);
}

class AppChangeThemeState extends NewsState {}
class NewsGetSearchSuccessState extends NewsState {}
class NewsGetSearchErrorState extends NewsState {
  final String error;
  NewsGetSearchErrorState(this.error);
}