import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FootballImagesChanger extends GetxController{

  RxInt imageCounter = 0.obs;

  imageUpdaterFunction() {

    if(imageCounter.value<2){
      imageCounter.value = imageCounter.value + 1;
    }

    else if(imageCounter.value>2) {
      imageCounter.value = imageCounter.value - 1;
    }
    else{
      imageCounter.value = 0;
    }
  }
}