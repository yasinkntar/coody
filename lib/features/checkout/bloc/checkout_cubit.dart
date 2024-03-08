import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/features/checkout/models/addresscid.dart';
import 'package:coody/core/models/prodctecart.dart';
import 'package:coody/core/services/local_storage.dart';
import 'package:coody/features/checkout/bloc/checkout_state.dart';
import 'package:coody/features/checkout/com/addressccom.dart';
import 'package:coody/features/checkout/com/paymentconp.dart';
import 'package:coody/features/checkout/models/paymentid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class CheckoutCubit extends Cubit<CheckoutStates> {
  CheckoutCubit() : super(CheckoutInitState());

  TypePayment? typePayment;
  TypeReceiving? typeReceiving;
  Addressca? selectaddressc;
  PaymentID? selectpayment;
  List<ProdcteApp>? items;
  double totalitems = 0;
  double tataltax = 0;
  double discout = 0;
  double deilverservsie = 0;
  double net = 0;
  getdata() {
    emit(CheckoutLodingState());
    try {
      var box = Hive.box<ProdcteApp>(CartLocal.tablecart);
      typePayment = TypePayment.cash;
      typeReceiving = TypeReceiving.pickup;
      items = box.values.toList();
      if (items!.isNotEmpty) {
        calculator();
      }
      emit(CheckoutSuccessState());
    } catch (e) {
      emit(CheckoutErrorState(error: e.toString()));
    }
  }

  calculator() {
    totalitems = items!.fold(0, (p, c) => p + c.prodctetotalprice);
    tataltax = totalitems * 0.14;
    discout = totalitems * 0.2;
    if (typeReceiving == TypeReceiving.delivery) {
      deilverservsie = 15;
    } else {
      deilverservsie = 0;
    }
    net = (totalitems + tataltax + deilverservsie) - discout;
  }

  void changedtypepayment(TypePayment typePaymenat) {
    emit(CheckoutLodingState());
    typePayment = typePaymenat;
    calculator();
    emit(CheckoutChangedTypeState());
  }

  void changedtypeReceiving(TypeReceiving typereceiving) {
    emit(CheckoutLodingState());
    typeReceiving = typereceiving;
    calculator();
    emit(CheckoutChangedTypeState());
  }

  void deleteAllProdcte() {
    try {
      var box = Hive.box<ProdcteApp>(CartLocal.tablecart);

      box.deleteAll(box.keys);
    } catch (e) {
      emit(CheckoutErrorState(error: e.toString()));
    }
  }

  void changeditempayment(PaymentID paymenat) {
    emit(CheckoutLodingState());
    selectpayment = paymenat;
    calculator();
    emit(CheckoutChangedTypeState());
  }

  void changeditemReceiving(Addressca addressc) {
    emit(CheckoutLodingState());
    selectaddressc = addressc;
    calculator();
    emit(CheckoutChangedTypeState());
  }

  void palechorder() {
    try {
      emit(CheckoutLodingState());
      var db = FirebaseFirestore.instance;
      User? user;
      String? userID;
      List<Map<String, dynamic>> lisa = [];
      user = FirebaseAuth.instance.currentUser;
      userID = user?.uid;
      DateFormat format = DateFormat("yyyy-MM-dd hh:mm:ss");
      var date = format.parse(DateTime.now().toString());
      for (var element in items!) {
        lisa.add(element.toFirestore());
      }
      //  ("/Payment/${selectpayment!.id}")
      db.collection('Orders').add(
        {
          'userID': userID,
          'TypePayment': typePayment!.index,
          'Payment': typePayment == TypePayment.visa
              ? db.collection('Payment').doc(selectpayment?.id)
              : null,
          'TypeReceiving': typeReceiving!.index,
          'Addressc': typeReceiving == TypeReceiving.delivery
              ? db.collection('Addressc').doc(selectpayment?.id)
              : null,
          'DateOrderd': date,
          'status': 0,
          'DeliveryID': null,
          'Tax': tataltax,
          'Discount': discout,
          'DelevieyServis': deilverservsie,
          'Net': net,
          'Items': FieldValue.arrayUnion(lisa)
        },
      ).then((valuse) {
        deleteAllProdcte();
        emit(PalecOrderSuccessState(uuid: valuse.id));
      });
    } catch (e) {
      emit(CheckoutErrorState(error: e.toString()));
    }
  }
}
