import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:application/core/utils/validation.dart';

class Required_Data_Widget extends StatelessWidget {
  const Required_Data_Widget({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  " Explore the flavors of the East in ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 201, 77, 68),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "SPICE & SLICE",
                  style: TextStyle(
                    color: Color(0xFFA67C00),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              keyboardType: TextInputType.name,
              validator: MyValidation().nameValidate,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
              ],
              decoration: const InputDecoration(
                labelText: "First Name",
                hintText: 'Your First Name',
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              keyboardType: TextInputType.name,
              validator: MyValidation().nameValidate,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
              ],
              decoration: const InputDecoration(
                labelText: "Last Name",
                hintText: 'Your Last Name',
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              keyboardType: TextInputType.phone,
              validator: MyValidation().phoneValidate,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'[A-Z||a-z]')),
              ],
              decoration: const InputDecoration(
                labelText: "Phone Number",
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              keyboardType: TextInputType.streetAddress,
              decoration: const InputDecoration(
                labelText: "Address",
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              keyboardType: TextInputType.emailAddress,
              validator: MyValidation().mailValidate,
              decoration: const InputDecoration(
                labelText: "Your E-mail",
                hintText: 'xxxxxxxxx@xxxxx.xxx',
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
              obscureText: true,
              obscuringCharacter: "*",
              decoration: const InputDecoration(
                labelText: "Password",
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
              ),
            ),
                        SizedBox(height: MediaQuery.of(context).size.height / 100),

              TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
              obscureText: true,
              obscuringCharacter: "*",
              decoration: const InputDecoration(
                labelText: "confirm Password",
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
