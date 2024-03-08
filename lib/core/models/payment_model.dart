import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentModel {
  String cardNumber, expiryDate, cardHolderName, cvv;
  PaymentModel(
      {required this.cardHolderName,
      required this.cardNumber,
      required this.cvv,
      required this.expiryDate});

  factory PaymentModel.fromJson(
      QueryDocumentSnapshot<Map<String, dynamic>> data) {
    return PaymentModel(
      cardHolderName: data["cardHolderName"],
      cardNumber: data["cardNumber"],
      cvv: data["cvv"],
      expiryDate: data["expiryDate"],
    );
  }
  factory PaymentModel.fromJsona(Map<String, dynamic> data) {
    print(data);
    return PaymentModel(
      cardHolderName: data["cardHolderName"],
      cardNumber: data["cardNumber"],
      cvv: data["cvv"],
      expiryDate: data["expiryDate"],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cardHolderName'] = cardHolderName;
    data['cardNumber'] = cardNumber;
    data['cvv'] = cvv;
    data['expiryDate'] = expiryDate;
    return data;
  }
}
