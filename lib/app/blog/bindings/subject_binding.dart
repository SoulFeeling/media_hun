import 'package:get/get.dart';
import '../controllers/subject_detail_controller.dart';

class SubjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubjectDetailController>(() => SubjectDetailController());
  }
}
