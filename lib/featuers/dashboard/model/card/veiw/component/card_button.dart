// import 'dart:developer';

// import 'package:application/featuers/dashboard/model/card/controller/cubit/card_cubit.dart';
// import 'package:application/featuers/dashboard/model/product/model/repo/database_repo.dart';
// import 'package:application/featuers/dashboard/veiw/dashboard_Page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class FormButton extends StatelessWidget {
//   const FormButton({super.key, required this.controller});

//    final CardCubit controller;
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//      value: controller,  
//     child: BlocBuilder<CardCubit, CardState>(
//         builder: (context, state) {
//                 CardCubit controller = context.read<CardCubit>();

//           return Row(
//             children: [
//               SizedBox(height: MediaQuery.of(context).size.height / 30),
//               FilledButton(
//                   style: const ButtonStyle(
//                       backgroundColor: MaterialStatePropertyAll(Colors.blue)),
//                   onPressed: () async {
//                     await (await DatabaseRepo.instance).insert(
//                       name: 'shaimaa',
//                       phone: '01014234354',
//                       ordername: 'family mail',
//                       address: 'menouf',
//                     );
//                     log("added successfully");
//                     await controller.addUser();
//                   },
//                   child: const Text("confirm")),
//               SizedBox(width: MediaQuery.of(context).size.width / 2),
//               FilledButton(
//                   style: const ButtonStyle(
//                       backgroundColor: MaterialStatePropertyAll(Colors.blue)),
//                   onPressed: () => {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const DashboardPage()),
//                         ),
//                       },
//                   child: const Text("cancel")),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
