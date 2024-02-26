import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/models/users_addrees.dart';

class Addressca extends UserAddressc {
  String id;
  Addressca(
      {required this.id,
      required super.address,
      required super.uuid,
      required super.appartment,
      required super.labelas,
      required super.postcode,
      required super.street});
  factory Addressca.fromJson(
      QueryDocumentSnapshot<Map<String, dynamic>> data,String id) {
    return Addressca(
      id: id,
      uuid: data["uuid"],
      address: data["Address"],
      appartment: data["Appartment"],
      labelas: data["Labelas"],
      postcode: data["Postcode"],
      street: data["street"],
    );
  }
}
