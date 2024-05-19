import 'package:flutter/material.dart';
import 'package:application/featuers/authentication/login/veiw/page/login_page.dart';
import 'package:application/featuers/authentication/verification/view/page/verification_page.dart';

class ButtonForgetPass extends StatelessWidget {
  const ButtonForgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.blue)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const VerificationPage()),
            );
          },
          child: const Text("confirm"),
        ),
        FilledButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.blue)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
          child: const Text("back to login"),

        ),
      ],
    );
  }
}
