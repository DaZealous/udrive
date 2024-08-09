import 'package:get/get.dart';
import 'package:udrive/presentation/drive_start_screen/controller/drive_start_controller.dart';
class DriveStartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DriveStartController());
  }
}
