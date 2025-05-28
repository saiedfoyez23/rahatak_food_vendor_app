import 'package:get/get.dart';

class OrderController extends GetxController {
  RxString changeOrder = "New Orders".obs;

  RxString firstChangeStatus = "".obs;
  RxBool firstOrderTrack = false.obs;
  RxBool firstOrder = false.obs;

  RxString secondChangeStatus = "".obs;
  RxBool secondOrderTrack = false.obs;
  RxBool secondOrder = false.obs;

  RxString thirdChangeStatus = "".obs;
  RxBool thirdOrderTrack = false.obs;
  RxBool thirdOrder = false.obs;

  void updateOrderType(String type) {
    changeOrder.value = type;
  }

  void toggleOrderTrack(int index) {
    switch (index) {
      case 0:
        firstOrderTrack.value = !firstOrderTrack.value;
        break;
      case 1:
        secondOrderTrack.value = !secondOrderTrack.value;
        break;
      case 2:
        thirdOrderTrack.value = !thirdOrderTrack.value;
        break;
    }
  }

  void updateOrderStatus(int index, String status) {
    switch (index) {
      case 0:
        firstChangeStatus.value = status;
        firstOrderTrack.value = false;
        break;
      case 1:
        secondChangeStatus.value = status;
        secondOrderTrack.value = false;
        break;
      case 2:
        thirdChangeStatus.value = status;
        thirdOrderTrack.value = false;
        break;
    }
  }

  void toggleOrderDetails(int index) {
    switch (index) {
      case 0:
        firstOrder.value = !firstOrder.value;
        break;
      case 1:
        secondOrder.value = !secondOrder.value;
        break;
      case 2:
        thirdOrder.value = !thirdOrder.value;
        break;
    }
  }
}