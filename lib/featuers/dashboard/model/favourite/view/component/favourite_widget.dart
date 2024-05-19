import 'dart:typed_data';
import 'package:application/featuers/dashboard/model/favourite/controller/cubit/favourite_cubit.dart';
import 'package:application/featuers/dashboard/model/product/model/entity_model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteItemWidget extends StatelessWidget {
  const FavoriteItemWidget({
    super.key,
    required this.productModel,
    required this.controller,
  });

  final ProductModel productModel;
  final FavoriteCubit controller;

  @override
  Widget build(BuildContext context) {
    // Determine if the app is currently in dark mode
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: isDarkMode ? const Color.fromARGB(255, 190, 188, 188) : Colors.transparent, 
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
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 4),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                return SizedBox(
                                  width: constraints.maxWidth,
                                  child: Text(
                                    productModel.desc ?? 'description',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    ),
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
                      /// Like
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
