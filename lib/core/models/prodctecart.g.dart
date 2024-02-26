// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prodctecart.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProdcteAppAdapter extends TypeAdapter<ProdcteApp> {
  @override
  final int typeId = 0;

  @override
  ProdcteApp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProdcteApp(
      prodcteid: fields[0] as String,
      prodctename: fields[1] as String,
      prodctenotes: fields[2] as String,
      prodcteprice: fields[4] as double,
      prodcteqty: fields[3] as double,
      prodcteimage: fields[6] as String,
      prodctetotalprice: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ProdcteApp obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.prodcteid)
      ..writeByte(1)
      ..write(obj.prodctename)
      ..writeByte(2)
      ..write(obj.prodctenotes)
      ..writeByte(3)
      ..write(obj.prodcteqty)
      ..writeByte(4)
      ..write(obj.prodcteprice)
      ..writeByte(5)
      ..write(obj.prodctetotalprice)
      ..writeByte(6)
      ..write(obj.prodcteimage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProdcteAppAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
