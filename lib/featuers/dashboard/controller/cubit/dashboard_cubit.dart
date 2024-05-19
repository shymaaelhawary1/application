
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  /// dashboard config
  PageController pageController = PageController();
  int currentIndex = 0;

  void onChangeTab(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
    emit(DashboardInitial());
  }

  DashboardCubit() : super(DashboardInitial());
}
