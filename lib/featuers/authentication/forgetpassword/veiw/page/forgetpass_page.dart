// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:application/featuers/authentication/forgetpassword/veiw/componant/forgetpass_button_widget.dart';
import 'package:application/featuers/authentication/forgetpassword/veiw/componant/forgetpass_data_widget.dart';

class ForgetPassPage extends StatelessWidget {
  const ForgetPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      // backgroundColor: Color.fromARGB(255, 202, 237, 204),

          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 241, 234, 207),
            title:  Text("SPICE & SLICE RESTOURANT" 
            ,style: Theme.of(context).textTheme.displayLarge,  
            ),
          
          ),
          body: ForgetPasswordDataWidget(),
          
          bottomNavigationBar: const SizedBox(
            height: 100,
            child: ButtonForgetPass(),
          )),
    );
  }
}
