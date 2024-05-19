import 'package:application/featuers/dashboard/model/product/controller/cubit/product_cubit.dart';
import 'package:application/featuers/dashboard/model/product/model/repo/database_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'order_menu_state.dart';

class NewProductCubit extends Cubit<NewProductState> {
  NewProductCubit() : super(NewProductInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController qntController = TextEditingController();
  XFile? image;
  Future<void> pickProductImage() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);

    emit(NewProductInitial());
  }

  Future<void> takeProductImage() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.camera);
    emit(NewProductInitial());
  }

  Future<void> addProduct(context) async {
    DatabaseRepo db = DatabaseRepo();
    db.initDB();
    db.insertProduct(
      nameController.text,
      descController.text,
      0,
      int.parse(qntController.text),
      await image!.readAsBytes(),
    );
    await ProductCubit.instance.init();
    Navigator.pop(context);
  }
}