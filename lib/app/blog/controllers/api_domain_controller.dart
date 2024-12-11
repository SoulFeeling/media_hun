import 'package:get/get.dart';

class ApiDomainController extends GetxController {

  static const String domain1 = 'https://api.javainfo.cc/api/blog';
  static const String domain2 = 'http://192.168.1.3:8080/api/blog';

  var currentDomain = domain1.obs; // 默认域名

  void switchDomain() {
    if (currentDomain.value == domain1) {
      currentDomain.value = domain2;
    } else {
      currentDomain.value = domain1;
    }
  }
}