// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product2model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Product2ModelAdapter extends TypeAdapter<Product2Model> {
  @override
  final int typeId = 2;

  @override
  Product2Model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product2Model(
      name: fields[0] as String,
      price: fields[1] as String,
      imagepath: fields[2] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Product2Model obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.imagepath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product2ModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
