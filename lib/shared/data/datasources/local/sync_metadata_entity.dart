import 'package:objectbox/objectbox.dart';

@Entity()
class SyncMetadataEntity {
  @Id()
  int id = 0;
  
  @Unique()
  late String key;
  
  late String value;
  
  SyncMetadataEntity();
  
  SyncMetadataEntity.create({
    required this.key,
    required this.value,
  });
}
