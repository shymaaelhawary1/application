import 'package:application/core/build_context_extension.dart';
import 'package:application/core/cubit/parent_cubit.dart';
import 'package:application/featuers/dashboard/model/product/controller/cubit/product_cubit.dart';
import 'package:application/featuers/dashboard/model/product/veiw/component/product_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ProductCubit.instance,
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          final ProductCubit controller = context.read<ProductCubit>();
          return BlocProvider(
            create: (context) => ParentCubit.instance,
            child: BlocBuilder<ParentCubit, ParentState>(
              builder: (context, state) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(
                       'items_page_title'.tr
                      //  ParentCubit.instance.local['item_page_title'] ?? ''
                      
                      ,)
                      ,),

                  body: state is ProductStateLoading
                      ? const CircularProgressIndicator()
                      : state is ProductStateEmpty
                          ? const Center(
                              child: Icon(
                                CupertinoIcons.delete,
                                size: 100,
                                color: Colors.blue,
                              ),
                            )
                          : ListView.builder(
                              itemBuilder: (_, int index) => ProductItemWidget(
                                productModel: controller.products[index],
                                controller: controller,
                              ),
                              itemCount: controller.products.length,
                            ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
