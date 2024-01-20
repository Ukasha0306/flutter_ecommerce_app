
import 'package:get/get.dart';
import '../../models/product_model.dart';
import '../../models/product_variation_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  RxMap selectedAttribute = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  // select attribute and variation

  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {}

  // check Attribute availability stock in variation
  // Set<String?> getAttributeAvailabilityInVariation(List<ProductVariationModel> variation, String attributeName) {}

  // check Product Variation Stock Status

  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  // Reset Selected Attribute when switching products

  void resetSelectedAttributes() {
    selectedAttribute.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
