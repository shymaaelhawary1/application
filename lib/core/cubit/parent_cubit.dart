// import 'dart:convert';

// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:meta/meta.dart';

// part 'parent_state.dart';

// class ParentCubit extends Cubit<ParentState> {
//   static final ParentCubit instance = ParentCubit();

//   ThemeMode thememode = ThemeMode.light;
//   ParentCubit() : super(ParentInitial()) {
//     loadLanguage();
//   }
//   Map<String, dynamic> local = {};
//   String lang = 'en';

//   Future<void> loadLanguage() async {
//     String s = await rootBundle.loadString('assets/lang/$lang.json');

//      local = json.decode(s);
//      emit(ParentInitial());
//   }

//   void changeMode() {
//     if (thememode == ThemeMode.dark) {
//       thememode = ThemeMode.light;

//     }
//     else{
//         thememode = ThemeMode.dark;

//     }
//         emit(ParentInitial());

//   }
//   void changeLang() {
//      lang = lang == 'ar' ? 'en' : 'ar';
//      loadLanguage();
//      emit(ParentInitial());
//    }

// }


















import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'parent_state.dart';

class ParentCubit extends Cubit<ParentState> {
  ParentCubit._privateConstructor() : super(ParentInitial()) {
    loadLanguage();
  }

  static final ParentCubit _instance = ParentCubit._privateConstructor();
  static ParentCubit get instance => _instance;

  ThemeMode themeMode = ThemeMode.light;
  Map<String, dynamic> local = {};
  String lang = 'en';

  Future<void> loadLanguage() async {
    try {
      String s = await rootBundle.loadString('assets/lang/$lang.json');
      local = json.decode(s);
      emit(LanguageLoaded(local));
    } catch (e) {
      emit(LanguageLoadFailed(e.toString()));
    }
  }

  void changeMode() {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    emit(ThemeModeChanged(themeMode));
  }

  void changeLang() {
    lang = lang == 'ar' ? 'en' : 'ar';
    loadLanguage();
    emit(ParentInitial());
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
