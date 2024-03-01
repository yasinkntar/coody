// class Prodcte {
//   String? catgoryName;
//   String? drescption;
//   String? fullName;
//   String? price;
//   List<ProductChoice>? productChoice;
//   List<String>? image;
//   List<Ingredients>? ingredients;

//   Prodcte(
//       {this.catgoryName,
//       this.drescption,
//       this.fullName,
//       this.price,
//       this.productChoice,
//       this.image,
//       this.ingredients});

//   Prodcte.fromJson(Map<String, dynamic> json) {
//     catgoryName = json['CatgoryName'];
//     drescption = json['Drescption'];
//     fullName = json['FullName'];
//     price = json['price'];
//     // if (json['ProductChoice'] != null) {
//     //   productChoice = <ProductChoice>[];
//     //   json['ProductChoice'].forEach((v) {
//     //     productChoice!.add( ProductChoice.fromJson(v));
//     //   });
//     // }
//     image = json['image'].cast<String>();
//     if (json['ingredients'] != null) {
//       ingredients = <Ingredients>[];
//       json['ingredients'].forEach((v) {
//         ingredients!.add( Ingredients.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['CatgoryName'] = this.catgoryName;
//     data['Drescption'] = this.drescption;
//     data['FullName'] = this.fullName;
//     data['price'] = this.price;
//     if (this.productChoice != null) {
//       data['ProductChoice'] =
//           this.productChoice!.map((v) => v.toJson()).toList();
//     }
//     data['image'] = this.image;
//     if (this.ingredients != null) {
//       data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class ProductChoice {
//   String? name;
//   String? position;
//   String? qtyMax;
//   String? qtymin;

//   ProductChoice({this.name, this.position, this.qtyMax, this.qtymin});

//   ProductChoice.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     position = json['position'];
//     qtyMax = json['qtyMax'];
//     qtymin = json['qtymin'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['name'] = this.name;
//     data['position'] = this.position;
//     data['qtyMax'] = this.qtyMax;
//     data['qtymin'] = this.qtymin;
//     return data;
//   }
// }

// class Ingredients {
//   String? imageurl;
//   String? name;

//   Ingredients({this.imageurl, this.name});

//   Ingredients.fromJson(Map<String, dynamic> json) {
//     imageurl = json['imageurl'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['imageurl'] = this.imageurl;
//     data['name'] = this.name;
//     return data;
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class Prodcte {
  String catgory;
  String description;
  String fullname;
  int price;
  String urlimage;
  String uid;
  Prodcte(
      {required this.catgory,
      required this.description,
      required this.fullname,
      required this.price,
      required this.uid,
      required this.urlimage});
  factory Prodcte.fromJson(
      QueryDocumentSnapshot<Map<String, dynamic>> json, String id) {
    return Prodcte(
      uid: id,
      catgory: json['catgory'],
      fullname: json['fullname'],
      description: json['description'],
      price: int.parse(json['price'].toString()),
      urlimage: json['urlimage'],
    );
  }
}
