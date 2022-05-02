import 'package:get/get.dart';
import 'package:getx_news_app/controller/news_controller.dart';

class MyBinding implements Bindings {

  // void initInstances() {
  //   super.initInstances();
  //   _instance = this;
  // }

  static late MyBinding _instance;
  static MyBinding get instance => _instance;



  @override
  void dependencies() {
//   Get.put(NewsController(),permanent: true);
  Get.lazyPut(()=>NewsController(),fenix: true);
  }

}

