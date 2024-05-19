
import 'package:application/featuers/dashboard/model/product/controller/cubit/product_cubit.dart';
import 'package:application/featuers/dashboard/model/product/model/entity_model/product_model.dart';
import 'package:application/featuers/dashboard/model/product/model/repo/database_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'favourite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteStateLoading()) {
    init();
  }

  List<ProductModel> products = [];

  DatabaseRepo repo = DatabaseRepo();

  Future<void> init() async {
    emit(FavoriteStateLoading());
    await repo.initDB();

    products = await repo.fetchFavoriteProducts();
    if (products.isEmpty) {
      emit(FavoriteStateEmpty());
    } else {
      emit(FavoriteStateLoaded());
    }
  }

  Future<void> addItemToFavorite(int id, int value) async {
    await repo.updateFavorite(value, id);
    await init();
    await ProductCubit.instance.init();
    emit(FavoriteStateLoaded());
  }

  void addItemToCart(int id) {
    repo.updateCart(1, id);
    emit(FavoriteStateLoaded());
  }
}