import 'package:flutter_ecommerce_app/features/shop/models/banner_model.dart';
import 'package:flutter_ecommerce_app/features/shop/models/brand_model.dart';
import 'package:flutter_ecommerce_app/features/shop/models/product_attribute_model.dart';
import 'package:flutter_ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_app/features/shop/models/product_variation_model.dart';

import '../features/shop/models/category_model.dart';
import '../routes/routes.dart';
import 'constants/image_strings.dart';

class TDummyData {
  // List of banners

  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(
        imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
    BannerModel(
        imageUrl: TImages.banner3,
        targetScreen: TRoutes.favourites,
        active: true),
    BannerModel(
        imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
    BannerModel(
        imageUrl: TImages.banner5,
        targetScreen: TRoutes.settings,
        active: true),
    BannerModel(
        imageUrl: TImages.banner6,
        targetScreen: TRoutes.userAddress,
        active: true),
    BannerModel(
        imageUrl: TImages.banner8,
        targetScreen: TRoutes.checkout,
        active: false),
  ];

  // List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: "1", name: "Sports", image: TImages.sportIcon, isFeatured: true),
    CategoryModel(
        id: "5",
        name: "Furniture",
        image: TImages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: "2",
        name: "Electronics",
        image: TImages.electronicsIcon,
        isFeatured: true),
    CategoryModel(
        id: "3", name: "Clothes", image: TImages.clothIcon, isFeatured: true),
    CategoryModel(
        id: "4", name: "Animals", image: TImages.animalIcon, isFeatured: true),
    CategoryModel(
        id: "6", name: "Shoes", image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(
        id: "7",
        name: "Cosmetics",
        image: TImages.cosmeticsIcon,
        isFeatured: true),
    CategoryModel(
        id: "14",
        name: "Jewelery",
        image: TImages.jeweleryIcon,
        isFeatured: true),

    // subcategories
    CategoryModel(
        id: "8",
        name: "Sport Shoes",
        parentId: '1',
        image: TImages.sportIcon,
        isFeatured: false),
    CategoryModel(
        id: "9",
        name: "Track suits",
        parentId: '1',
        image: TImages.sportIcon,
        isFeatured: false),
    CategoryModel(
        id: "10",
        name: "Sports Equipments",
        parentId: '1',
        image: TImages.sportIcon,
        isFeatured: false),

    //furniture
    CategoryModel(
        id: "11",
        name: "Bedroom furniture",
        parentId: '5',
        image: TImages.furnitureIcon,
        isFeatured: false),
    CategoryModel(
        id: "12",
        name: "Kitchen furniture",
        parentId: '5',
        image: TImages.furnitureIcon,
        isFeatured: false),
    CategoryModel(
        id: "13",
        name: "Office furniture",
        parentId: '5',
        image: TImages.furnitureIcon,
        isFeatured: false),

    // electronics

    CategoryModel(
        id: "14",
        name: "Laptop",
        parentId: '2',
        image: TImages.electronicsIcon,
        isFeatured: false),
    CategoryModel(
        id: "15",
        name: "Mobile",
        parentId: '2',
        image: TImages.electronicsIcon,
        isFeatured: false),

    CategoryModel(
        id: "16",
        name: "Shirts",
        parentId: '3',
        image: TImages.clothIcon,
        isFeatured: false),
  ];

  // List of all products
  static final List<ProductModel> products = [
    ProductModel(
        id: '001',
        title: 'Green Nike sports shoe',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.productImage1,
        description: 'Green Nike sports shoe',
        brand: BrandModel(
            id: '1',
            image: TImages.nikeLogo,
            name: 'Nike',
            productsCount: 265,
            isFeatured: true),
        images: [
          TImages.productImage1,
          TImages.productImage23,
          TImages.productImage21,
          TImages.productImage9
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage1,
              description: 'This is a product description for the Green Nike sports shoe',
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: TImages.productImage23,
              attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 234,
              image: TImages.productImage23,
              attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '4',
              stock: 222,
              price: 232,
              image: TImages.productImage1,
              attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '5',
              stock: 0,
              price: 334,
              image: TImages.productImage21,
              attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '6',
              stock: 11,
              price: 332,
              image: TImages.productImage21,
              attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
        ],
        productType: 'ProductType.variable'),
    ProductModel(
        id: '002',
        title: 'Blue T-shirt for all ages',
        stock: 15,
        price: 35,
        isFeatured: true,
        thumbnail: TImages.productImage69,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '6',
          image: TImages.zaraLogo,
          name: 'Zara',
        ),
        images: [
          TImages.productImage68,
          TImages.productImage69,
          TImages.productImage5,
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '16',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '003',
        title: 'Leather brown Jacket',
        stock: 15,
        price: 38000,
        isFeatured: false,
        thumbnail: TImages.productImage64,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '6',
          image: TImages.zaraLogo,
          name: 'Zara',

        ),
        images: [
          TImages.productImage64,
          TImages.productImage65,
          TImages.productImage66,
          TImages.productImage67,
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '16',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '004',
        title: '4 Color collar t-shirt dry fit',
        stock: 15,
        price: 135,
        isFeatured: false,
        thumbnail: TImages.productImage60,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '6',
          image: TImages.zaraLogo,
          name: 'Zara',
        ),
        images: [
          TImages.productImage60,
          TImages.productImage61,
          TImages.productImage62,
          TImages.productImage63,
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '16',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Red', 'Yellow', 'Green', 'Blue']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage60,
              description:
                  'This is a product description for the 4 Color collar t-shirt dry fit',
              attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: TImages.productImage60,
              attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 234,
              image: TImages.productImage61,
              attributeValues: {'Color': 'Yellow', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '4',
              stock: 222,
              price: 232,
              image: TImages.productImage61,
              attributeValues: {'Color': 'yellow', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '5',
              stock: 0,
              price: 334,
              image: TImages.productImage62,
              attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '6',
              stock: 11,
              price: 332,
              image: TImages.productImage62,
              attributeValues: {'Color': 'Green', 'Size': 'EU 30'}),
          ProductVariationModel(
              id: '7',
              stock: 0,
              price: 334,
              image: TImages.productImage63,
              attributeValues: {'Color': 'Blue', 'Size': 'EU 30'}),
          ProductVariationModel(
              id: '8',
              stock: 11,
              price: 332,
              image: TImages.productImage63,
              attributeValues: {'Color': 'Blue', 'Size': 'EU 34'}),
        ],
        productType: 'ProductType.variable'),

    // Products after banner
    ProductModel(
        id: '005',
        title: 'Nike Air jorden shoes',
        stock: 15,
        price: 135,
        isFeatured: false,
        thumbnail: TImages.productImage10,
        description: 'Nike Air jorden shoes',
        brand: BrandModel(
            id: '1',
            image: TImages.nikeLogo,
            name: 'Nike',
            productsCount: 265,
            isFeatured: true),
        images: [
          TImages.productImage7,
          TImages.productImage8,
          TImages.productImage9,
          TImages.productImage10,
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '8',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Orange', 'Black', 'Brown']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 16,
              price: 36,
              salePrice: 12.6,
              image: TImages.productImage8,
              description:
                  'This is a product description for the Green Nike sports shoe',
              attributeValues: {'Color': 'Orange', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: TImages.productImage7,
              attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 14,
              price: 34,
              image: TImages.productImage9,
              attributeValues: {'Color': 'Brown', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '4',
              stock: 13,
              price: 33,
              image: TImages.productImage7,
              attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '5',
              stock: 12,
              price: 32,
              image: TImages.productImage9,
              attributeValues: {'Color': 'Brown', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '6',
              stock: 11,
              price: 31,
              image: TImages.productImage8,
              attributeValues: {'Color': 'Orange', 'Size': 'EU 32'}),
        ],
        productType: 'ProductType.variable'),

    ProductModel(
        id: '006',
        title: 'Samsung Galaxy (pink, 64 GB) (4 GB RAM)',
        stock: 15,
        price: 750,
        isFeatured: false,
        thumbnail: TImages.productImage11,
        description: 'Samsung Galaxy (pink, 64 GB) (4 GB RAM)',
        brand: BrandModel(
          id: '7',
          image: TImages.appleLogo,
          name: 'Samsung',
        ),
        images: [
          TImages.productImage11,
          TImages.productImage12,
          TImages.productImage13,
          TImages.productImage12,
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '8',
        productAttributes: [
          ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Red', 'Blue']),
        ],
        productType: 'ProductType.single'),

    ProductModel(
        id: '007',
        title: 'TOMI Dog Food',
        stock: 15,
        price: 20,
        isFeatured: false,
        thumbnail: TImages.productImage18,
        description: 'This is product description for TOMI Dog Food',
        brand: BrandModel(
          id: '7',
          image: TImages.appleLogo,
          name: 'Tomi',
        ),

        salePrice: 10,
        sku: 'ABR4568',
        categoryId: '4',
        productAttributes: [
          ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Red', 'Blue']),
        ],
        productType: 'ProductType.single'),

    // 008 after 040

    ProductModel(
        id: '009',
        title: 'Nike Air Jorden 19 Blue',
        stock: 15,
        price: 400,
        isFeatured: false,
        thumbnail: TImages.productImage19,
        description: 'This is product description for Nike Air Jorden 19 Blue',
        brand: BrandModel(
          id: '1',
          image: TImages.appleLogo,
          name: 'Nike',
        ),

        images: [
          TImages.productImage19,
          TImages.productImage20,
          TImages.productImage21,
          TImages.productImage22,
        ],

        salePrice: 200,
        sku: 'ABR4568',
        categoryId: '8',
        productAttributes: [
          ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Red', 'Blue']),
        ],
        productType: 'ProductType.single'),
  ];
}
