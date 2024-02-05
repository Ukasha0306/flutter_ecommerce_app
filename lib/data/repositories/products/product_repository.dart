
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_app/utils/constants/enums.dart';
import 'package:get/get.dart';
import '../../../features/shop/models/product_category_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../features/shop/controllers/firebase_storage_controller.dart';

class ProductRepository extends GetxController{

  static ProductRepository get instance => Get.find();


  final _db = FirebaseFirestore.instance;



  // get Limited featured product
  Future<List<ProductModel>> getFeaturedProducts()async{
    try{

      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).limit(4).get();

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();

    }
    on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }
    catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

  // get Limited featured product
  Future<List<ProductModel>> getAllFeaturedProducts()async{
    try{

      final snapshot = await _db.collection('Products').get();

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();

    }
    on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }
    catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

    // get product based on the Brand
  Future<List<ProductModel>> fetchProductByQuery(Query query)async{
    try{
     final querySnapshot = await query.get();
     final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
     return productList;

    }
    on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }
    catch (e){
      log("Error in fetchProductByQuery $e");
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> getFavouriteProducts(List<String> productIds)async{
    try{
      final snapshot = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();


    }
    on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }
    catch (e){
      throw 'Something went wrong. Please try again';
    }
  }


  Future<List<ProductModel>> getProductsForBrand({required String brandId, int limit = -1})async{

    try{
      final querySnapshot = limit == -1 ?
          await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).get():
      await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).limit(limit).get();


      final products = querySnapshot.docs.map((docs) => ProductModel.fromSnapshot(docs)).toList();
      print("The product Length ${products.length}");
      return products;

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

  Future<List<ProductModel>> getProductsForCategory({required String categoryId, int limit = -1})async{
    try{

      QuerySnapshot  productCategoryQuery= limit == -1 ?
          await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).get():
          await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).limit(limit).get();

      List<String> productIds = productCategoryQuery.docs.map((doc) => doc['productId'] as String).toList();

      final productsQuery = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();

      List<ProductModel> products = productsQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();

      return products;

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




  // upload product category data to the cloud Firebase

  Future<void> uploadProductCategory(List<ProductCategoryModel> productCategory)async{
    try{
      for(var productCategories in productCategory) {
        await _db.collection('ProductCategory').doc().set(productCategories.toJson());
      }
    }
    on FirebaseException catch (e){
      throw e.message!;
    }
    on SocketException catch (e){
      throw e.message;
    }on PlatformException catch (e){
      throw e.message!;
    }

    catch(e){
      throw e.toString();
    }
  }

  /// Upload dummy data to the cloud Firebase

Future<void> uploadDummyData(List<ProductModel> products)async{
    try{


      // Upload all the product data along with their images

      final storage = Get.put(FirebaseStorageController());

      // loop through each product

      for (var product in products){

        // get image data link from the local assets
        final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

        // upload image and get the url

        final url = await storage.uploadImageData('Products/Images', thumbnail, product.thumbnail.toString());

        // assign Url to product.thumbnail attribute

        product.thumbnail = url;

        // Product List of images
        if(product.images != null && product.images!.isNotEmpty){
          List<String> imageUrl = [];
          for(var image in product.images!){
            //get the data link form local assets

            final assetImage = await storage.getImageDataFromAssets(image);

            // upload image and get its url

            final url = await storage.uploadImageData('Products/Images', assetImage, image);

            // assign url to product.thumbnail attribute

            imageUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imageUrl);
        }

        // upload variation images

        if(product.productType == ProductType.variable.toString()){
          for(var variation in product.productVariations!){
            // get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(variation.image);

            // upload image and get it url
            final url = await storage.uploadImageData('Products/Images', assetImage, variation.image);

            // // assign url to variation.image attribute
            variation.image = url;
          }
        }


        // Store product in firestore

        await _db.collection("Products").doc(product.id).set(product.toJson());
      }

    } on FirebaseException catch (e){
      throw e.message!;
    }
    on SocketException catch (e){
      throw e.message;
    }on PlatformException catch (e){
      throw e.message!;
    }

    catch(e){
      throw e.toString();
    }
    finally{

    }
}



}