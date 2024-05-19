import 'package:application/core/build_context_extension.dart';
import 'package:application/core/utils/validation.dart';
import 'package:application/featuers/dashboard/model/card/controller/cubit/card_cubit.dart';
import 'package:flutter/material.dart';

class ReservationFormData extends StatelessWidget {
  const ReservationFormData({super.key, required this.controller});

  final CardCubit controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Reservation'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: context.getTheme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.green),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name'.tr,
                    labelStyle: context.getTheme.textTheme.bodyLarge,
                    border: InputBorder.none,
                  ),
                  validator: MyValidation().nameValidate,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: context.getTheme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.green),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number'.tr,
                    labelStyle: context.getTheme.textTheme.bodyLarge,
                    border: InputBorder.none,
                  ),
                  validator: MyValidation().phoneValidate,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: context.getTheme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.green),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Order Name'.tr,
                    labelStyle: context.getTheme.textTheme.bodyLarge,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  validator: MyValidation().nameValidate,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: context.getTheme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.green),
                ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: TextEditingController(),
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    labelText: 'Address'.tr,
                    labelStyle: context.getTheme.textTheme.bodyLarge,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
