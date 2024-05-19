import 'package:flutter/material.dart';
import 'package:application/core/utils/validation.dart';

class ForgetPasswordDataWidget extends StatelessWidget {
  const ForgetPasswordDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [ 
        const Spacer(),
        const Row(
          children:[
        Text(" if you forget password of your account in  ",textAlign:TextAlign.center,style: TextStyle(color: Color.fromARGB(255, 201, 77, 68), fontSize: 15,fontWeight: FontWeight.bold),),
      Text("SPICE & SLICE",style: TextStyle( color:Color(0xFFA67C00),fontSize: 12,fontWeight: FontWeight.bold,),)
      ]),
      const Text("please enter your correct  E-mail for verification code will send to you in a message ",style:TextStyle( fontSize:20,)),
      const Spacer(),
       TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: TextEditingController(),
          keyboardType: TextInputType.name,
          validator: MyValidation().mailValidate ,
          decoration: const InputDecoration(
            floatingLabelAlignment: FloatingLabelAlignment.start,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border:  OutlineInputBorder(
               borderSide: BorderSide(
              color:Colors.black,
              width: 2 ),
              borderRadius: BorderRadius.all(Radius.circular(30.0)),),
           
           focusedBorder:  OutlineInputBorder(
               borderSide: BorderSide(
              color:Colors.blue,
              width: 2 ),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),),
          
           errorBorder:  OutlineInputBorder(
               borderSide: BorderSide(
              color:Colors.red,
              width: 2 ),
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          
          label: Text("verify by mail or phone"),
          hintText: 'your mail or phone number',)  
)    ,            const Spacer(flex: 2,),

           
      ],);
  }
}