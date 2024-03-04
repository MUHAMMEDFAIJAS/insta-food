import 'package:hive/hive.dart';
part 'product3model.g.dart';

@HiveType(typeId: 3)
class Product3Model {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String price;

  @HiveField(2)
  final dynamic imagepath;

  Product3Model({
    required this.name,
    required this.price,
    required this.imagepath,
  });
}
