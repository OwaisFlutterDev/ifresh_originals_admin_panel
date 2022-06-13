import 'package:get/get.dart';
import 'package:ifresh_originals_admin_panel/controller/price_controller.dart';

class HomeController extends GetxController{

  var selectedIndex = 0;

  final PriceController priceController = Get.put(PriceController());
  @override
  void onInit() {
    super.onInit();

    priceController.getAllPriceData();

  }

}