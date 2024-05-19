import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:application/featuers/authentication/verification/controller/cubit/verification_cubit.dart';

class VerificationDataWidget extends StatelessWidget {
   const VerificationDataWidget({super.key, required this.controller });
  
      final  VerificationCubit controller ;
  // Required_Data_Widget({super.key, required this.controller});
  //  final RegistrationCubit controller;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('Enter Verification Code:',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 169, 58, 52),
              fontSize: 30,
              fontWeight: FontWeight.bold)),
      const Text(
        " A verification code was sent to your email ",
        textAlign: TextAlign.center,
      ),
       const SizedBox(height: 100,),
        
    
      PinCodeTextField(
        mainAxisAlignment: MainAxisAlignment.center,
        appContext: context,
        pastedTextStyle: TextStyle(
          color: Colors.green.shade600,
          fontWeight: FontWeight.bold,
        ),
        length: 5,
        obscureText: true,
        obscuringCharacter: '*',
        scrollPadding: const EdgeInsets.all(30),

        blinkWhenObscuring: true,
        animationType: AnimationType.fade,
        // validator: (v) {
        //   if (v!.length < 3) {

        //     return "I'm from validator";
        //   } else {
        //     return null;
        //   }
        // },
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(20),
          fieldHeight:  MediaQuery.of(context).size.width/6,
          fieldWidth: MediaQuery.of(context).size.width/6,
          activeFillColor: Colors.white,
          fieldOuterPadding:  EdgeInsets.only(right: MediaQuery.of(context).size.width/30),
          // inactiveFillColor: const Color.fromARGB(255, 187, 182, 165)
        ),
        cursorColor: Colors.black,
        animationDuration: const Duration(milliseconds: 300),
        controller: controller.pincodecontroller,
        keyboardType: TextInputType.number,
        boxShadows: const [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black12,
            blurRadius: 10,
          )
        ],
        onCompleted: (v) {
          debugPrint("Completed");
        },
        // onTap: () {
        //   print("Pressed");
        // },
        onChanged: (value) {
        
  
        },
      
      ),

      // SizedBox(height: 20),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//       children:[
//         TextField(
//         textAlign: TextAlign.center,
//         decoration: InputDecoration(
//           counterText: '',
//           border: OutlineInputBorder(),
//         ),
//         keyboardType: TextInputType.number,
//         maxLength: 1,
//         ),

//         TextField(
//         textAlign: TextAlign.center,
//         decoration: InputDecoration(
//           counterText: '',
//           border: OutlineInputBorder(),
//         ),
//         keyboardType: TextInputType.number,
//         maxLength: 1,
//         ),

//         TextField(
//         textAlign: TextAlign.center,
//         decoration: InputDecoration(
//           counterText: '',
//           border: OutlineInputBorder(),
//         ),
//         keyboardType: TextInputType.number,
//         maxLength: 1,
//         ),

//         TextField(
//         textAlign: TextAlign.center,
//         decoration: InputDecoration(
//           counterText: '',
//           border: OutlineInputBorder(),
//         ),
//         keyboardType: TextInputType.number,
//         maxLength: 1,
//         ),
//       ],
//     )
    ]);
  }
}
