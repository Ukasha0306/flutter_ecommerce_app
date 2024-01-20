
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce_app/features/shop/models/banner_model.dart';
import 'package:flutter_ecommerce_app/utils/exceptions/format_exceptions.dart';
import 'package:flutter_ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../firebase_storage_controller.dart';

class BannerRepository extends GetxController{

  static BannerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> fetchBanners()async{

    try{
      final result = await _db.collection("Banners").where('Active', isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on  FormatException catch (_){
      throw const TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }
    catch(e){
      throw 'Something went wrong while fetching Banners';
    }
  }


  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      final storage = Get.put(FirebaseStorageController());

      // loop through each banner
      for (var banner in banners) {
        // get image link from the local assets
        final file = await storage.getImageDataFromAssets(banner.imageUrl);

        // upload image and get the url
        final url =
        await storage.uploadImageData("Banners", file, banner.targetScreen);

        // Assign Url to banner.imageUrl attribute

        banner.imageUrl = url;

        // store banner in Firestore
        await _db.collection("Banners").doc().set(banner.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}