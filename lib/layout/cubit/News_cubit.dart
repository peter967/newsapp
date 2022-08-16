import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/local/cache_helper.dart';
import '../../shared/api/Dio/dio_helper.dart';

import '../../modules/business/business_screen.dart';
import '../../modules/science/science_screen.dart';

import '../../modules/sports/sports_screen.dart';

part 'app_cubit_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsCubitInitial());
  static NewsCubit get(context) => BlocProvider.of<NewsCubit>(context);
  int currentIndex = 0;
  bool isDark = false;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
  ];
  List<Widget> screens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportsScreen(),
  ];
  List<dynamic> business = [];
  List<dynamic> science = [];
  List<dynamic> sports = [];
  List<dynamic> search = [];
  void getSearch(String value) {
    search = [];
    emit(NewsGetScienceSuccessState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': value,
        'apiKey': '7f1a3727fb7a42a7968e705273ea697c',
      },
    ).then((value) {
      search = value!.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

  Future getBusiness() async {
    emit(NewsLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '7f1a3727fb7a42a7968e705273ea697c',
    }).then((value) {
      business = value!.data['articles'];

      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewSGetBusinessErrorState(error.toString()));
    });
  }

  Future getSports() async {
    emit(NewsLoadingState());

    if (sports.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '7f1a3727fb7a42a7968e705273ea697c',
      }).then((value) {
        sports = value!.data['articles'];

        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewSGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  Future getScience() async {
    emit(NewsLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '7f1a3727fb7a42a7968e705273ea697c',
      }).then((value) {
        science = value!.data['articles'];

        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewSGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  void onTap(int index) {
    currentIndex = index;
    if (index == 1) getScience();
    if (index == 2) getSports();
    emit(NewsBottomNavState());
  }

  changeTheme({bool? fromSherd}) {
    if (fromSherd != null) {
      isDark = fromSherd;
      emit(AppChangeThemeState());
    } else {
      isDark = !isDark;

      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeThemeState());
      });
    }
  }

  void navigateTo(context, widget) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      );
}
