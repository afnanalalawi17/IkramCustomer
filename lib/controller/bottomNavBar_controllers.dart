import 'package:ekram_customer/view/tab_item.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
   final List<TabItem> icons = TabItem.tabItemsList;

  int selectedTab = 0;

  void onTabPress(int index) {
    if (selectedTab != index) {
    
        selectedTab = index;
    update();
      // widget.onTabChange(index);

      // _icons[index].status!.change(true);
      Future.delayed(const Duration(seconds: 1), () {
        // _icons[index].status!.change(false);
      });
    }
  }
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}