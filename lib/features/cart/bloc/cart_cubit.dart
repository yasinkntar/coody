import 'package:coody/features/cart/bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coody/core/models/prodctecart.dart';
import 'package:coody/core/services/local_storage.dart';
import 'package:hive_flutter/adapters.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitState());
  List<ProdcteApp>? notes;

  addtocart(ProdcteApp model) async {
    emit(CartLodingState());
    try {
      var box = Hive.box<ProdcteApp>(CartLocal.tablecart);
      await box.add(model);
      emit(CartSuccessState());
    } catch (e) {
      emit(CartErrorState(error: e.toString()));
    }
  }

  fetchAllProdcte() {
    emit(CartLodingState());
    try {
      var notesBox = Hive.box<ProdcteApp>(CartLocal.tablecart);

      notes = notesBox.values.toList();
      emit(CartSuccessState());
    } catch (e) {
      emit(CartErrorState(error: e.toString()));
    }
  }

  updateqty(int qty, int index) async {
    emit(CartLodingState());
    try {
      var notesBox = Hive.box<ProdcteApp>(CartLocal.tablecart);
      // prodcte.prodcteqty = qty.toDouble();
      // prodcte.prodctetotalprice = qty * prodcte.prodcteprice;
      ProdcteApp? prodcte = notesBox.getAt(index);
      prodcte!.prodcteqty = qty.toDouble();
      prodcte.prodctetotalprice = qty * prodcte.prodcteprice;
      notesBox.put(index, prodcte);

      emit(CartSuccessState());
    } catch (e) {
      emit(CartErrorState(error: e.toString()));
    }
  }

  removecartat(int index) {
    emit(CartLodingState());
    try {
      var notesBox = Hive.box<ProdcteApp>(CartLocal.tablecart);
      notesBox.deleteAt(index);

      emit(CartSuccessState());
    } catch (e) {
      emit(CartErrorState(error: e.toString()));
    }
  }
}
