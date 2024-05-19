import 'package:application/featuers/dashboard/model/product/model/entity_model/product_model.dart';
import 'package:application/featuers/dashboard/model/product/model/repo/database_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  static ProductCubit instance = ProductCubit();

  ProductCubit() : super(ProductStateLoading()) {
    init();
  }

  List<ProductModel> products = [];

  DatabaseRepo repo = DatabaseRepo();

  Future<void> init() async {
    emit(ProductStateLoading());
    await repo.initDB();

    products = await repo.fetchProducts();
    if (products.isEmpty) {
      emit(ProductStateEmpty());
    } else {
      emit(ProductStateLoaded());
    }
  }

  void addItemToFavorite(int id, int value) {
    repo.updateFavorite(value, id);
    init();
    emit(ProductStateLoaded());
  }

  void addItemToCart(int id) {
    repo.updateCart(1, id);
    emit(ProductStateLoaded());
  }
}