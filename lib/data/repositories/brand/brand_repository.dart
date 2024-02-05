import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../features/shop/controllers/firebase_storage_controller.dart';
import '../../../features/shop/models/brand_category_model.dart';
import '../../../features/shop/models/brand_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController{

  static BrandRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;


  // get all brands

  Future<List<BrandModel>> getAllBrands()async{

    try{
      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
    }
    on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }

  }

  // get brands for category

  Future<List<BrandModel>> getBrandsForCategory(String categoryId)async{
    try{

      // query to get all document where categoryId matches the provided categoryId
      QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryId).get();

      log("The category id $categoryId");

      // extract brandsId form the documents
      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();

      // query to get all the documents where the brandId is the list of brandIds FieldPath.documentId to query documents in Collection
      final brandsQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();
      // Extract brand names or other relevant data from the documents


      List<BrandModel> brands = brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
      return brands;
    }
    on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }
    catch(e){
      log("The error in $e");
      throw 'Something went wrong in getBrandsForCategory . Please try again';
    }

  }


  Future<void> uploadBrandCategory(List<BrandCategoryModel> brandCategory)async{
    try{
      for(var model in brandCategory) {
        await _db.collection('BrandCategory').doc().set(model.toJson());
      }
    }
    on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  Future<void> uploadDummyData(List<BrandModel> brands) async {
    try {
      final storage = Get.put(FirebaseStorageController());

      // loop through each banner
      for (var brand in brands) {
        // get image link from the local assets
        final file = await storage.getImageDataFromAssets(brand.image);

        // upload image and get the url
        final url =
        await storage.uploadImageData("Brands", file, brand.name);

        // Assign Url to banner.imageUrl attribute

        brand.image = url;

        // store banner in Firestore
        await _db.collection("Brands").doc(brand.id).set(brand.toJson());
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