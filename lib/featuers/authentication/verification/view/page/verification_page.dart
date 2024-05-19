import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/featuers/authentication/verification/controller/cubit/verification_cubit.dart';
import 'package:application/featuers/authentication/verification/view/componant/verification_button.dart';
import 'package:application/featuers/authentication/verification/view/componant/verification_data_widget.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => VerificationCubit(),
        child: BlocBuilder<VerificationCubit, VerificationState>(
          builder: (context, state) {
          final  VerificationCubit controller = context.read<VerificationCubit>();
            return Scaffold(
                // backgroundColor: Colors.green[50],
                appBar: AppBar(
                  backgroundColor: const Color.fromARGB(255, 241, 234, 207),
                  title: const Text(
                    "SPICE & SLICE RESTOURANT",
                    style: TextStyle(
                      color: Color(0xFFA67C00),
                    ),
                  ),
                ),
                body:  VerificationDataWidget(controller: VerificationCubit(),),
                bottomNavigationBar: const SizedBox(
                  height: 100,
                  child: ButtonVerificationWidget(),
                ));
          },
        ),
      ),
    );
  }
}
