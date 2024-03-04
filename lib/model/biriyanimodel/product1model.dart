import 'package:hive/hive.dart';
part 'product1model.g.dart';

@HiveType(typeId: 0)
class ProductModel1 extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String price;

  @HiveField(2)
  final dynamic imagepath;

  ProductModel1({
    required this.name,
    required this.price,
    required this.imagepath,
    int? id,
  });
}
