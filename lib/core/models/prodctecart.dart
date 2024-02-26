import 'package:hive/hive.dart';

part 'prodctecart.g.dart';

@HiveType(typeId: 0)
class ProdcteApp extends HiveObject {
  @HiveField(0)
  String prodcteid;
  @HiveField(1)
  String prodctename;
  @HiveField(2)
  String prodctenotes;
  @HiveField(3)
  double prodcteqty;
  @HiveField(4)
  double prodcteprice;
  @HiveField(5)
  double prodctetotalprice;
  @HiveField(6)
  String prodcteimage;

  ProdcteApp(
      {required this.prodcteid,
      required this.prodctename,
      required this.prodctenotes,
      required this.prodcteprice,
      required this.prodcteqty,
      required this.prodcteimage,
      required this.prodctetotalprice});

  Map<String, dynamic> toFirestore() {
    return {
      "prodcteid": prodcteid,
      "prodctename": prodctename,
      "prodctenotes": prodctenotes,
      "prodcteqty": prodcteqty,
      "prodcteprice": prodcteprice,
      "prodctetotalprice": prodctetotalprice,
    };
  }
}
