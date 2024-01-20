

import 'package:get/get.dart';

import '../../../data/repositories/banner/banner_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../models/banner_model.dart';

class BannerController extends GetxController{

  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  void updatePageIndicator(index){
    carousalCurrentIndex.value = index;
  }


  @override
  void onInit() {
    fetchBanners();
    super.onInit();

  }

  // Fetch banners

  Future<void> fetchBanners()async{

    try{
      isLoading.value = true;

      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // assign banners

      this.banners.assignAll(banners);


    }
    catch (e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
    finally{
      isLoading.value = false;

    }
  }
}