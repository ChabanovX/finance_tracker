import 'package:objectbox/objectbox.dart';

@Entity()
class AccountEntity {
  @Id()
  int id = 0;

  late String name;
  late double balance;
  late String currency;

  AccountEntity();
}