import 'package:objectbox/objectbox.dart';

@Entity()
class CategoryEntity {
  @Id(assignable: true)
  int id = 0;

  late String name;
  late String emoji;
  late bool isIncome;

  CategoryEntity();
}