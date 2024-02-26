import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/models/payment_model.dart';

class PaymentID extends PaymentModel {
  String id;
  PaymentID(
      {required this.id,
      required super.cardHolderName,
      required super.cardNumber,
      required super.cvv,
      required super.expiryDate});

  factory PaymentID.fromJson(
      QueryDocumentSnapshot<Map<String, dynamic>> data, String id) {
    return PaymentID(
      id: id,
      cardHolderName: data["cardHolderName"],
      cardNumber: data["cardNumber"],
      cvv: data["cvv"],
      expiryDate: data["expiryDate"],
    );
  }
}
