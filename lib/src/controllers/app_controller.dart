import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../src/data/repository.dart';

// SingleGetTickerProviderMixin
class AppController extends GetxController with GetTickerProviderStateMixin{
  final Repository repository;

  static AppController controller = Get.find();

  // var someLiveData = ApiResponse<Model>.loading("message").obs;
  AppController(this.repository);


  String? userClientToken;
  RxBool isUserClientLoggedIn = false.obs;

  @override
  void onInit() async {

    print('AppController_init()');
    //todo call getMaterial here and delete it from productDetailsPage
   /* userClientToken = await repository.userClientToken;
    userClientToken != null
        ? isUserClientLoggedIn.value = true
        : isUserClientLoggedIn.value = false;
    print('userClientTokenFromGlobal: $userClientToken');
    print('isLoggedIn: $isUserClientLoggedIn');

    currentCurrency = await repository.currency;
    if(isUserClientLoggedIn.value){
      // ShoppingCartController.controller.getCartDetails();
    }*/

    listenToFirebase();

    super.onInit();
  }

  @override
  void dispose() {
    // tabController!.dispose();
    super.dispose();
  }

  //todo remove: it is just an example
  void listenToFirebase() async{
/*    // final DataSnapshot dataSnapshot = await databaseReference.child("app_version").once();
    // print("dataSnapshot:$dataSnapshot");
    // print("databaseReference:${databaseReference.path}");

    databaseReference.child("constants/featured_product").onValue.listen((event) {
      // Handle changes to the "myVariable" variable here.
      final value = event.snapshot.value;
      print("Value of myVariable: $value");
    });*/
  }

  logOutUser() async {
    await repository.removeUser();
    repository.getUser().then((user) {
      print('AfterLogoutUser: ${user.toString()}');
    });
    isUserClientLoggedIn.value = false;
    // _handleLogoutExternalUserId();
    // Get.offAllNamed(HomePage.homePageRoute);
  }

  checkUserLogin({@required Function? isLogged, Function? isNotLogged}) {
    if (isUserClientLoggedIn.value) {
      isLogged!();
    } else {
      //isNotLogged();
      // Get.toNamed(LoginPage.loginPageRoute);
    }
  }
}