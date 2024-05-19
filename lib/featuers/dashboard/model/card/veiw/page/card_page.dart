import 'package:application/featuers/dashboard/model/card/controller/cubit/card_cubit.dart';
import 'package:application/featuers/dashboard/model/card/veiw/component/card_button.dart';
import 'package:application/featuers/dashboard/model/card/veiw/component/card_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});
         
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<CardCubit>(
        create: (context) => CardCubit(),
        child: BlocBuilder<CardCubit, CardState>(
          builder: (context, state) {
            final CardCubit controller = context.read<CardCubit>();
            return Scaffold(
              body: ReservationFormData(
                controller: controller,
              ),
              bottomNavigationBar: SizedBox(
                // child: FormButton(
                //   controller: controller,
                // ),
              ),
            );
          },
        ),
      ),
    );
  }
}