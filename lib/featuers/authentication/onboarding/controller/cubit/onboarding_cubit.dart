import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:application/featuers/authentication/onboarding/model/onboarding_model.dart';
import 'package:application/featuers/authentication/registration/view/page/registration_page.dart';

part 'onboarding_state.dart';

class OnboardingControllerCubit extends Cubit<OnboardingControllerState> {
  OnboardingControllerCubit() : super(OnboardingControllerInitial());

  PageController pageController = PageController();

  void onChangeToNext() {
    pageController.nextPage(duration: const Duration(microseconds: 250), curve: Curves.linear);
  }

  Future<void> onCallSkip(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('onboarding', true);
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const RegistrationPage(),
      ),
    );
  }

  List data = [
    OnboardingModel(
      image: 'assets/images/img1.jpeg',
      title: 'Discover By Your Self',
      subtitle: 'Discover the rich array of Eastern flavors at our restaurant, Spice & Slice, where exquisite tastes come together to take you on a delightful culinary journey. Experience the unique blend of rich flavors and distinctive tastes that will tantalize your taste buds and leave you craving for more',
      color: Color.fromARGB(255, 168, 199, 169),
    ),
    OnboardingModel(
      image: 'assets/images/img2.jpeg',
      title: 'All You Like  ',
      subtitle: 'At Spice & Slice, we invite you to embark on a culinary adventure like no other. Step into a world where every dish tells a story, where every bite is a celebration of flavor. From the fragrant spices of the East to the artful presentation of our dishes, ',
      color: Color.fromARGB(255, 182, 204, 221),
    ),
    OnboardingModel(
      image: 'assets/images/img3.jpeg',
      title: 'More Comfortable',
      subtitle: 'At Spice & Slice, we are all about comfort. Whether you are craving familiar flavors or eager to explore something new, our dishes are crafted to bring you a sense of ease and satisfaction',
      color: Color.fromARGB(255, 228, 202, 201),
    ),
  ];
}