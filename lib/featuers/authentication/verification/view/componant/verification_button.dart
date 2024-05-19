import 'package:flutter/material.dart';
import 'package:application/featuers/authentication/login/veiw/page/login_page.dart';

class ButtonVerificationWidget extends StatelessWidget {
  const ButtonVerificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
FilledButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 24, 153, 10))),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
          child: const Text("back to login"),

        ),


        SizedBox(width: MediaQuery.of(context).size.width / 3),

        FilledButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 24, 153, 10))),
          onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
          },
          child: const Text("ok"),
        ),

    
          ],
    );
  }
}