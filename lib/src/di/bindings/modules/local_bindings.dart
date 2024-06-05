import 'package:get/get.dart';
import 'package:mytasks/src/data/local/datasources/database/database_helper.dart';
import '../../../data/local/datasources/sharedpref/shared_preference_helper.dart';
import '../../../data/local/local_data_source.dart';

class LocalBindings extends Bindings{

  LocalBindings();

  @override
  void dependencies() {

    Get.put(DatabaseHelper(Get.find()), permanent: true);

    Get.put(SharedPreferenceHelper(Get.find()), permanent: true);

    Get.lazyPut<LocalDataSource?>(() {
      return LocalDataSource(Get.find(),Get.find());
    }, fenix: true);
  }
}