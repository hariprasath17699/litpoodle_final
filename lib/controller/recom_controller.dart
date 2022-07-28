import 'package:get/state_manager.dart';
import 'package:litpoodle/models/recommended_model.dart';
import 'package:litpoodle/models/services/remote_service.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var recomlist = List<RecommentationsList>().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var recommendationlist = await RemoteServices.fetchProducts();
      if (recommendationlist != null) {
        recomlist.value = recomlist;
      }
    } finally {
      isLoading(false);
    }
  }
}
