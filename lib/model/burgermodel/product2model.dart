import 'package:hive/hive.dart';
part 'product2model.g.dart';

@HiveType(typeId: 2)
class Product2Model {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String price;

  @HiveField(2)
  final dynamic imagepath;
    @HiveField(3)
  


  Product2Model({
    required this.name,
    required this.price,
    required this.imagepath,
  });
}
