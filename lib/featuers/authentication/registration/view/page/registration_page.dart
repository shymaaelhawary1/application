import 'package:flutter/material.dart';
import 'package:application/featuers/authentication/registration/view/componant/registration_button.dart';
import 'package:application/featuers/authentication/registration/view/componant/registration_data_widget.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: const Required_Data_Widget(),
        bottomNavigationBar: const SizedBox(
          height: 300,
          child: ButtonWidget(),
        ));

      }
}
