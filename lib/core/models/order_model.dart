import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/models/payment_model.dart';

class OrderModels {
  final String? userID;
  final String? notes;
  final DocumentReference? addressc;
  final PaymentModel? payment;
  final int? typePayment;
  final int? typeReceiving;
  final int? status;
  final double? tax;
  final double? discount;
  final double? delevieyServis;
  final double? net;
  final List<Map<String, dynamic>>? items;
  final DocumentReference? deliveryID;
  final String? documentID;

  OrderModels({
    this.userID,
    this.notes,
    this.addressc,
    this.payment,
    this.typePayment,
    this.typeReceiving,
    this.status,
    this.tax,
    this.discount,
    this.delevieyServis,
    this.net,
    this.items,
    this.deliveryID,
    this.documentID,
  });

  factory OrderModels.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>>? snapshot, String documentID) {
    Map<String, dynamic>? sy = snapshot?.data();
    PaymentModel? test;
    if (sy?["Payment"] != null) {
      DocumentReference payment = sy?["Payment"];
      payment.get().then((value) {
        dynamic py = value.data();
        // print(py.toString());
        test = PaymentModel.fromJsona(py);
      });
    }
    return OrderModels(
        userID: sy?["userID"],
        notes: sy?["notes"],
        documentID: snapshot?.id,
        // typePayment: int.tryParse(sy!["typePayment"].toString()),
        // typeReceiving: int.parse(sy!["typeReceiving"].toString()),
        // status: int.parse(sy!["status"].toString()),
        // tax: double.parse(sy!["tax"].toString()),
        // discount: double.parse(sy!["discount"].toString()),
        // delevieyServis: double.parse(sy!["delevieyServis"].toString()),
        // net: double.parse(sy!["net"].toString()),
        payment: test);
  }

// factory OrderModels.fromMap(Map<String, dynamic> map) {
// return OrderModels(
// userID: map['userID'] != null ? String?.fromMap(map['userID']) : null,
// notes: map['notes'] != null ? String?.fromMap(map['notes']) : null,
// addressc: map['addressc'] != null ? String?.fromMap(map['addressc']) : null,
// payment: map['payment'] != null ? String?.fromMap(map['payment']) : null,
// typePayment: map['typePayment'] != null ? int?.fromMap(map['typePayment']) : null,
// typeReceiving: map['typeReceiving'] != null ? int?.fromMap(map['typeReceiving']) : null,
// status: map['status'] != null ? int?.fromMap(map['status']) : null,
// tax: map['tax'] != null ? double?.fromMap(map['tax']) : null,
// discount: map['discount'] != null ? double?.fromMap(map['discount']) : null,
// delevieyServis: map['delevieyServis'] != null ? double?.fromMap(map['delevieyServis']) : null,
// net: map['net'] != null ? double?.fromMap(map['net']) : null,
// items: map['items'] != null ? List<Map<String, dynamic>>?.from(map['items']) : null,
// deliveryID: map['deliveryID'] != null ? DocumentReference?.fromMap(map['deliveryID']) : null,
// );
//  }

  Map<String, dynamic> toMap() => {
        'userID': userID,
        'notes': notes,
        'addressc': addressc,
        'payment': payment,
        'typePayment': typePayment,
        'typeReceiving': typeReceiving,
        'status': status,
        'tax': tax,
        'discount': discount,
        'delevieyServis': delevieyServis,
        'net': net,
        'items': items,
        'deliveryID': deliveryID,
      };

// OrderModels copyWith({
// String? userID, String? notes, String? addressc, String? payment, int? typePayment, int? typeReceiving, int? status, double? tax, double? discount, double? delevieyServis, double? net, List<Map<String, dynamic>>? items, DocumentReference? deliveryID, }) {
// return OrderModels(
// userID: userID ?? this.userID,
// notes: notes ?? this.notes,
// addressc: addressc ?? this.addressc,
// payment: payment ?? this.payment,
// typePayment: typePayment ?? this.typePayment,
// typeReceiving: typeReceiving ?? this.typeReceiving,
// status: status ?? this.status,
// tax: tax ?? this.tax,
// discount: discount ?? this.discount,
// delevieyServis: delevieyServis ?? this.delevieyServis,
// net: net ?? this.net,
// items: items ?? this.items,
// deliveryID: deliveryID ?? this.deliveryID,
// );
// }

  @override
  String toString() {
    return '${userID.toString()}, ${notes.toString()}, ${addressc.toString()}, ${payment.toString()}, ${typePayment.toString()}, ${typeReceiving.toString()}, ${status.toString()}, ${tax.toString()}, ${discount.toString()}, ${delevieyServis.toString()}, ${net.toString()}, ${items.toString()}, ${deliveryID.toString()}, ';
  }

  @override
  bool operator ==(other) =>
      other is OrderModels && documentID == other.documentID;

  @override
  int get hashCode => documentID.hashCode;
}
