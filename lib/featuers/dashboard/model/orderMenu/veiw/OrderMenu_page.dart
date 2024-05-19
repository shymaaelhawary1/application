
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/featuers/dashboard/model/orderMenu/controller/cubit/order_menu_cubit.dart';

class NewProductPage extends StatelessWidget {
  const NewProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewProductCubit(),
      child: BlocBuilder<NewProductCubit, NewProductState>(
        builder: (context, state) {
          final NewProductCubit cubit = context.read<NewProductCubit>();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Add New Meal'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Name
                    const Text('Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.name,
                      controller: cubit.nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter meal name',
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// Description
                    const Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.text,
                      controller: cubit.descController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter meal description',
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// Current Price
                    const Text('Current Price', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      controller: cubit.qntController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter current price',
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// Image Picker
                    const Text('Select Image', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        IconButton(
                          onPressed: cubit.pickProductImage,
                          icon: const Icon(CupertinoIcons.photo),
                        ),
                        IconButton(
                          onPressed: cubit.takeProductImage,
                          icon: const Icon(CupertinoIcons.camera),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    /// Display Selected Image
                    if (cubit.image != null)
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.file(
                            File(cubit.image!.path),
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                    const SizedBox(height: 24),

                    /// Add Meal Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () => cubit.addProduct(context),
                        child: const Text("Add Meal"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
