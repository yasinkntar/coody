import 'package:cloud_firestore/cloud_firestore.dart';

class UserAddressc {
  String address, appartment, street, postcode, uuid;
  int labelas;
  UserAddressc(
      {required this.address,
      required this.uuid,
      required this.appartment,
      required this.labelas,
      required this.postcode,
      required this.street});

  factory UserAddressc.fromJson(
      QueryDocumentSnapshot<Map<String, dynamic>> data) {
    return UserAddressc(
      uuid: data["uuid"],
      address: data["Address"],
      appartment: data["Appartment"],
      labelas: data["Labelas"],
      postcode: data["Postcode"],
      street: data["street"],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Address'] = address;
    data['Appartment'] = appartment;
    data['Labelas'] = labelas;
    data['Postcode'] = postcode;
    data['street'] = street;
    return data;
  }

  Map<String, dynamic> toFirestore() {
    return {
      "street": street,
      "postcode": postcode,
      "labelas": labelas,
      "appartment": appartment,
      "address": address,
    };
  }
}
