import 'package:get/get.dart';
import '../../data/local/datasources/sharedpref/shared_preference_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AsyncBindings extends Bindings {

  AsyncBindings();

  @override
  Future dependencies() async{

   await Get.putAsync<SharedPreferences>(() async {
      // final prefs = await SharedPreferences.getInstance();
      // await prefs.setString('name', 'Batman');
      return await SharedPreferences.getInstance();
    }, permanent: true); // Yes, we do get tag and permanent properties with this as well

   await Get.putAsync<SharedPreferenceHelper>(() async {

     return SharedPreferenceHelper(Get.find<SharedPreferences>());
   }, permanent: true); // Yes, we do get tag and permanent properties with this as well

   // Get.put(SharedPreferenceHelper(Get.find()));

  }
}
