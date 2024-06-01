import 'package:get/get.dart';
import '../../../data/local/datasources/sharedpref/shared_preference_helper.dart';
import '../../../data/local/local_data_source.dart';

class LocalBindings extends Bindings {

  LocalBindings();

  @override
  void dependencies() {

    Get.put(SharedPreferenceHelper(Get.find()), permanent: true);

    Get.lazyPut<LocalDataSource?>(() {
      return LocalDataSource(Get.find());
    }, fenix: true);
  }
}