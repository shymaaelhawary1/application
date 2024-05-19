import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/featuers/authentication/onboarding/controller/cubit/onboarding_cubit.dart';
import 'package:application/featuers/authentication/onboarding/view/component/onboarding_button.dart';
import 'package:application/featuers/authentication/onboarding/view/component/onboarding_data.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<OnboardingControllerCubit>(
        create: (context) => OnboardingControllerCubit(),
        child: BlocBuilder<OnboardingControllerCubit, OnboardingControllerState>(
          builder: (context, state) {
            OnboardingControllerCubit controller = context.read<OnboardingControllerCubit>();
            return Scaffold(
              body: OnboardingBody(
                controller: controller,
              ),
              bottomNavigationBar: OnboardingButtonWidget(
                controller: controller,
              ),
            );
          },
        ),
      ),
    );
  }
}