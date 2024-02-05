import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel{

  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;


  BrandModel({required this.id, required this.image, required this.name, this.isFeatured, this.productsCount});

  static BrandModel empty()=>BrandModel(id: '', image: '', name: '');

  toJson(){
    return {
      'Id':id,
      'Name':name,
      'Image':image,
      'ProductCount': productsCount,
      'IsFeatured': isFeatured,
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> document){
    final data = document;
    if(data.isEmpty) return BrandModel.empty();
    return BrandModel(
        id: data['Id'] ?? '',
        image: data['Image'] ?? '',
        name: data['Name'] ?? '',
    );
  }


  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    if (document.data() != null) {
      final data = document.data()!;

      // Map json record to the Model
      return BrandModel(
          id: document.id,
          name: data['Name'] ?? '',
          image: data['Image'] ?? '',
          productsCount: data['ProductCount'] ?? '',
          isFeatured: data['IsFeatured'] ?? false,
      );
    }

    else {
     return BrandModel.empty();
    }
  }
}