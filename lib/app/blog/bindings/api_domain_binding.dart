import 'package:get/get.dart';
import '../controllers/api_domain_controller.dart';
import '../controllers/subject_detail_controller.dart';

class ApiDomainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiDomainController>(() => ApiDomainController());
  }
}
