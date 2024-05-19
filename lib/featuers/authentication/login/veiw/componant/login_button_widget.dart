import 'package:application/core/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:application/featuers/authentication/forgetpassword/veiw/page/forgetpass_page.dart';
import 'package:application/featuers/authentication/registration/view/page/registration_page.dart';

class ButtonLoginWidget extends StatelessWidget {
  const ButtonLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        FilledButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue)),
            onPressed: () {
                        Navigator.pushNamed(context, 'dashboard');
            },
            child: const Text("login")
),
     const Spacer(),

        FilledButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ForgetPassPage()),
              );
            },
            child: const Text("forget password")),
     const Spacer(),

      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("create new account", style: context.getTheme.textTheme.labelMedium),
            InkWell(
              onTap: () {
                 Navigator.push(
                  context,
                   MaterialPageRoute(
                       builder: (context) => const RegistrationPage()),
                 );
              },
              child: const Text(
                "registrate",
                style: TextStyle(
                    color: Colors.green,
                    decorationStyle: TextDecorationStyle.solid,
                    decoration: TextDecoration.underline,
                    decorationThickness: 3),
              ),
            ),
          ],
        ),
             const Spacer(),

      ],
    );
  }
}
