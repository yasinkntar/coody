import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesModel {
  String text, urlimage;
  bool selete;
  CategoriesModel(
      {required this.selete, required this.text, required this.urlimage});
  factory CategoriesModel.fromJson(
      QueryDocumentSnapshot<Map<String, dynamic>> data) {
    return CategoriesModel(
        selete: false, text: data['name'], urlimage: data['urlimage']);
  }
}
