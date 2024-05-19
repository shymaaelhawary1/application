import 'package:flutter/material.dart';
import 'package:application/featuers/authentication/login/veiw/componant/login_button_widget.dart';
import 'package:application/featuers/authentication/login/veiw/componant/login_data_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key,});
  // required this.firstname, required this.lastname});
  // final String firstname, lastname;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
              // backgroundColor: Colors.green[50],

          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 241, 234, 207),
            title: const Text("SPICE & SLICE RESTOURANT" ,style: TextStyle( color:Color(0xFFA67C00),),),
          ),
          body: Login_Data_Widget(),
          bottomNavigationBar: const SizedBox(
            height: 300,
            child: ButtonLoginWidget(),
          )),
    );
  }
}
