import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:application/featuers/dashboard/model/product/controller/cubit/product_cubit.dart';
import 'package:application/featuers/dashboard/model/product/model/entity_model/product_model.dart';
import 'package:application/core/build_context_extension.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
    required this.productModel,
    required this.controller,
  });

  final ProductModel productModel;
  final ProductCubit controller;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color.fromARGB(255, 14, 14, 14),
            width: 0.4,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: isDarkMode ? Color.fromARGB(255, 210, 209, 209) : Colors.transparent,  
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.memory(
                          productModel.image ?? Uint8List(5),
                          height: 50,
                          width: 50,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productModel.name ?? 'product',
                              style: context.getTheme.textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 4),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                return SizedBox(
                                  width: constraints.maxWidth,
                                  child: Text(
                                    productModel.desc ?? 'description',
                                    style: context.getTheme.textTheme.labelLarge,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Text(
                            (productModel.availableQuantity ?? 0).toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(thickness: 0.5),

                  /// Actions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        child: productModel.favorite == 1
                            ? const Icon(
                                CupertinoIcons.heart_fill,
                                color: Colors.red,
                              )
                            : const Icon(
                                CupertinoIcons.heart,
                                color: Colors.red,
                              ),
                        onTap: () {
                          if (productModel.favorite == 1) {
                            controller.addItemToFavorite(productModel.id ?? 0, 0);
                          } else {
                            controller.addItemToFavorite(productModel.id ?? 0, 1);
                          }
                        },
                      ),

                      /// Divider
                      Container(
                        height: 30,
                        width: 0.5,
                        color: Colors.grey,
                      ),

                      /// Cart
                      InkWell(
                        child: const Icon(
                          CupertinoIcons.cart,
                          color: Colors.blue,
                        ),
                        onTap: () {
                          // Handle cart action here
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
