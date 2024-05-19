import 'package:application/core/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:application/core/utils/validation.dart';

class Login_Data_Widget extends StatelessWidget {
  Login_Data_Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        const Row(
          children: [
            Text(
              "Explore the flavors of the East in",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 201, 77, 68),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              " SPICE & SLICE",
              style: TextStyle(
                color: Color(0xFFA67C00),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Spacer(),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: TextEditingController(),
          keyboardType: TextInputType.emailAddress,
          validator: MyValidation().mailValidate,
          decoration: decoration.copyWith(
            label: Text("Username", style: context.getTheme.textTheme.bodyLarge),
            hintText: 'your mail',hintStyle: context.getTheme.textTheme.labelLarge
          ),
        ),
        const Spacer(),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: TextEditingController(),
          keyboardType: TextInputType.text,
          obscureText: true,
          obscuringCharacter: "*",
          decoration: decoration.copyWith(
            label: Text("Password", style: context.getTheme.textTheme.bodyLarge),
            suffixIcon: const Icon(Icons.remove_red_eye_outlined),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  InputDecoration decoration = const InputDecoration(
    floatingLabelAlignment: FloatingLabelAlignment.start,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
  );
}
