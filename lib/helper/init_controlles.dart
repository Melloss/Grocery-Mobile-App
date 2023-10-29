import 'package:get/get.dart';
import '../controllers/order_conteroller.dart';

Future<void> initControllers() async {
  Get.lazyPut(() => OrderController());
}
