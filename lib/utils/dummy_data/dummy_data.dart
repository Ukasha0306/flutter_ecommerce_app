import 'package:flutter_ecommerce_app/features/shop/models/brand_category_model.dart';
import 'package:flutter_ecommerce_app/features/shop/models/product_category_model.dart';

import '../../features/shop/models/banner_model.dart';
import '../../features/shop/models/brand_model.dart';
import '../../features/shop/models/category_model.dart';
import '../../features/shop/models/product_attribute_model.dart';
import '../../features/shop/models/product_model.dart';
import '../../features/shop/models/product_variation_model.dart';
import '../constants/image_strings.dart';
import '../routes/routes.dart';

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


  // List of all Brand

    static final List<BrandModel> brand = [

      BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', isFeatured: true, productsCount: 256),
      BrandModel(id: '6', image: TImages.adidasLogo, name: 'Adidas', isFeatured: true, productsCount: 20),
      BrandModel(id: '7', image: TImages.jordanLogo, name: 'Jordan', isFeatured: true,  productsCount: 15),
      BrandModel(id: '4', image: TImages.pumaLogo, name: 'Puma', isFeatured: true, productsCount: 20),
      BrandModel(id: '2', image: TImages.zaraLogo, name: 'Zara',  productsCount: 13),
      BrandModel(id: '3', image: TImages.appleLogo, name: 'Apple',  productsCount: 10),
      BrandModel(id: '8', image: TImages.kenwoodLogo, name: 'KenwoodLogo',  productsCount: 25),
      BrandModel(id: '10', image: TImages.hermanMillerLogo, name: 'HermanMiller',  productsCount: 35),
      BrandModel(id: '9', image: TImages.ikeaLogo, name: 'Ikea',  productsCount: 14),
      BrandModel(id: '5',image: TImages.acerlogo, name: 'Acer',  productsCount: 7),
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
        id: "4", name: "Animal", image: TImages.animalIcon, isFeatured: true),
    CategoryModel(
        id: "6", name: "Shoes", image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(
        id: "7", name: "Cosmetics", image: TImages.jeweleryIcon, isFeatured: true),

    CategoryModel(
        id: "14",
        name: "Jewelery",
        image: TImages.jeweleryIcon,
        isFeatured: true),

    // subcategories
    CategoryModel(
        id: "8", name: "Sport Shoes", parentId: '1', image: TImages.sportIcon, isFeatured: false),
    CategoryModel(
        id: "9", name: "Track suits", parentId: '1', image: TImages.sportIcon, isFeatured: false),
    CategoryModel(
        id: "10", name: "Sports Equipments", parentId: '1', image: TImages.sportIcon, isFeatured: false),

    //furniture
    CategoryModel(
        id: "11", name: "Bedroom furniture", parentId: '5', image: TImages.furnitureIcon, isFeatured: false),
    CategoryModel(
        id: "12", name: "Kitchen furniture", parentId: '5', image: TImages.furnitureIcon, isFeatured: false),
    CategoryModel(
        id: "13", name: "Office furniture", parentId: '5', image: TImages.furnitureIcon, isFeatured: false),

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


    static final List<BrandCategoryModel> brandCategory = [
      BrandCategoryModel(brandId: '1', categoryId: '1'),
      BrandCategoryModel(brandId: '1', categoryId: '8'),
      BrandCategoryModel(brandId: '2', categoryId: '3'),
      BrandCategoryModel(brandId: '3', categoryId: '2'),
      BrandCategoryModel(brandId: '4', categoryId: '6'),
      BrandCategoryModel(brandId: '5', categoryId: '2'),
      BrandCategoryModel(brandId: '6', categoryId: '1'),
      BrandCategoryModel(brandId: '7', categoryId: '6'),
      BrandCategoryModel(brandId: '8', categoryId: '5'),
      BrandCategoryModel(brandId: '9', categoryId: '5'),
      BrandCategoryModel(brandId: '10', categoryId: '12'),
    ];

    static final List<ProductCategoryModel> productCategory = [
      ProductCategoryModel(productId: '001', categoryId: '1'),
      ProductCategoryModel(productId: '002', categoryId: '8'),
      ProductCategoryModel(productId: '003', categoryId: '1'),
      ProductCategoryModel(productId: '004', categoryId: '8'),
      ProductCategoryModel(productId: '005', categoryId: '1'),
      ProductCategoryModel(productId: '006', categoryId: '1'),
      ProductCategoryModel(productId: '007', categoryId: '1'),
      ProductCategoryModel(productId: '008', categoryId: '1'),
      ProductCategoryModel(productId: '009', categoryId: '1'),
      ProductCategoryModel(productId: '010', categoryId: '8'),
      ProductCategoryModel(productId: '011', categoryId: '1'),
      ProductCategoryModel(productId: '012', categoryId: '3'),
      ProductCategoryModel(productId: '013', categoryId: '3'),
      ProductCategoryModel(productId: '014', categoryId: '3'),
      ProductCategoryModel(productId: '015', categoryId: '2'),
      ProductCategoryModel(productId: '016', categoryId: '2'),
      ProductCategoryModel(productId: '017', categoryId: '2'),
      ProductCategoryModel(productId: '018', categoryId: '2'),
      ProductCategoryModel(productId: '019', categoryId: '4'),
      ProductCategoryModel(productId: '020', categoryId: '4'),
      ProductCategoryModel(productId: '021', categoryId: '4'),
      ProductCategoryModel(productId: '022', categoryId: '2'),
      ProductCategoryModel(productId: '023', categoryId: '2'),
      ProductCategoryModel(productId: '024', categoryId: '2'),
      ProductCategoryModel(productId: '025', categoryId: '2'),
      ProductCategoryModel(productId: '026', categoryId: '1'),
      ProductCategoryModel(productId: '027', categoryId: '1'),
      ProductCategoryModel(productId: '028', categoryId: '1'),
      ProductCategoryModel(productId: '029', categoryId: '4'),
      ProductCategoryModel(productId: '030', categoryId: '4'),
      ProductCategoryModel(productId: '031', categoryId: '4'),
      ProductCategoryModel(productId: '032', categoryId: '5'),
      ProductCategoryModel(productId: '033', categoryId: '5'),
      ProductCategoryModel(productId: '034', categoryId: '5'),
      ProductCategoryModel(productId: '035', categoryId: '5'),
      ProductCategoryModel(productId: '036', categoryId: '5'),
      ProductCategoryModel(productId: '037', categoryId: '5'),
      ProductCategoryModel(productId: '038', categoryId: '12'),
      ProductCategoryModel(productId: '039', categoryId: '12'),
      ProductCategoryModel(productId: '040', categoryId: '12'),


    ];




  static final List<ProductModel> products = [

    // Nike
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
        title: 'Nike Air Max Red & Black',
        stock: 10,
        price: 600.0,
        isFeatured: true,
        thumbnail: TImages.productImage21,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '1',
          image: TImages.nikeLogo,
          name: 'Nike',
        ),
        images: [
          TImages.productImage21,
          TImages.productImage21,
          TImages.productImage21,

        ],
        salePrice: 400.0,
        sku: 'ABR4568',
        categoryId: '8',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '003',
        title: 'Nike Air Jorden 19 Blue',
        stock: 10,
        price: 350.0,
        isFeatured: false,
        thumbnail: TImages.productImage19,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '1',
          image: TImages.nikeLogo,
          name: 'Nike',

        ),
        images: [
          TImages.productImage19,
          TImages.productImage19,
          TImages.productImage19,

        ],
        salePrice: 200.0,
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '004',
        title: 'Nike Air Jorden 6 Orange',
        stock: 10,
        price: 500.0,
        isFeatured: false,
        thumbnail: TImages.productImage20,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '1',
          image: TImages.nikeLogo,
          name: 'Nike',
        ),
        images: [
          TImages.productImage20,
          TImages.productImage20,
          TImages.productImage20,

        ],
        salePrice: 250.0,
        sku: 'ABR4568',
        categoryId: '8',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '005',
        title: 'Nike Basketball shoes Black & Green',
        stock: 10,
        price: 700.0,
        isFeatured: false,
        thumbnail: TImages.productImage22,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '1',
          image: TImages.nikeLogo,
          name: 'Nike',
        ),
        images: [
          TImages.productImage22,
          TImages.productImage22,
          TImages.productImage22,

        ],
        salePrice: 500.0,
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '006',
        title: 'Nike Track suit Black',
        stock: 10,
        price: 200.0,
        isFeatured: false,
        thumbnail: TImages.productImage24,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '1',
          image: TImages.nikeLogo,
          name: 'Nike',
        ),
        images: [
          TImages.productImage24,
          TImages.productImage24,
          TImages.productImage24,

        ],

        sku: 'ABR4568',
        categoryId: '9',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '007',
        title: 'Nike Track suit Blue',
        stock: 10,
        price: 150.0,
        isFeatured: false,
        thumbnail: TImages.productImage25,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '1',
          image: TImages.nikeLogo,
          name: 'Nike',
        ),
        images: [
          TImages.productImage25,
          TImages.productImage25,
          TImages.productImage25,

        ],

        sku: 'ABR4568',
        categoryId: '9',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '008',
        title: 'Nike Track suit Green',
        stock: 10,
        price: 170.0,
        isFeatured: false,
        thumbnail: TImages.productImage27,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '1',
          image: TImages.nikeLogo,
          name: 'Nike',
        ),
        images: [
          TImages.productImage27,
          TImages.productImage27,
          TImages.productImage27,

        ],

        sku: 'ABR4568',
        categoryId: '9',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '009',
        title: 'Nike Track suit Red',
        stock: 10,
        price: 230.0,
        isFeatured: false,
        thumbnail: TImages.productImage27,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '1',
          image: TImages.nikeLogo,
          name: 'Nike',
        ),
        images: [
          TImages.productImage26,
          TImages.productImage26,
          TImages.productImage26,

        ],

        sku: 'ABR4568',
        categoryId: '9',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '010',
        title: 'Nike wild horse shoes',
        stock: 10,
        price: 350.0,
        isFeatured: false,
        thumbnail: TImages.productImage23,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '1',
          image: TImages.nikeLogo,
          name: 'Nike',
        ),
        images: [
          TImages.productImage23,
          TImages.productImage23,
          TImages.productImage23,

        ],
        salePrice: 200.0,
        sku: 'ABR4568',
        categoryId: '8',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
          id: '011',
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
             ),
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



    // Zara
    ProductModel(
        id: '012',
        title: 'Blue T-shirt for all ages',
        stock: 15,
        price: 35,
        isFeatured: false,
        thumbnail: TImages.productImage69,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '2',
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
        id: '013',
        title: '4 Color collar t-shirt dry fit',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.productImage60,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '2',
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
    ProductModel(
        id: '014',
        title: 'Leather Jacket for all ages',
        stock: 15,
        price: 35,
        isFeatured: false,
        thumbnail: TImages.productImage3,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '2',
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
          ProductAttributeModel(name: 'Color', values: ['Black', 'Brown',]),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage3,
              description:
              'This is a product description for the Leather Jacket',
              attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: TImages.productImage3,
              attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 234,
              image: TImages.productImage65,
              attributeValues: {'Color': 'Brown', 'Size': 'EU 34'}),
          ProductVariationModel(
              id: '4',
              stock: 222,
              price: 232,
              image: TImages.productImage65,
              attributeValues: {'Color': 'Brown', 'Size': 'EU 32'}),
        ],
        productType: 'ProductType.variable'),


    // Iphone
    ProductModel(
        id: '015',
        title: 'APPLE Iphone 8 (Back, 64 GB)',
        stock: 15,
        price: 480.0,
        isFeatured: true,
        thumbnail: TImages.productImage14,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '3',
          image: TImages.appleLogo,
          name: 'Iphone',
        ),
        images: [
          TImages.productImage14,
          TImages.productImage15,
          TImages.productImage16,
          TImages.productImage17,
        ],
        salePrice: 380.0,
        sku: 'ABR4568',
        categoryId: '15',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '016',
        title: 'Iphone 14 Pro (Back, 64 GB)',
        stock: 15,
        price: 480.0,
        isFeatured: false,
        thumbnail: TImages.productImage52,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '3',
          image: TImages.appleLogo,
          name: 'Iphone',
        ),
        images: [
          TImages.productImage52,
          TImages.productImage52,
          TImages.productImage52,
        ],
        salePrice: 380.0,
        sku: 'ABR4568',
        categoryId: '15',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '017',
        title: 'Iphone 14  (White, 64 GB)',
        stock: 15,
        price: 450.0,
        isFeatured: false,
        thumbnail: TImages.productImage53,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '3',
          image: TImages.appleLogo,
          name: 'Iphone',
        ),
        images: [
          TImages.productImage53,
          TImages.productImage53,
          TImages.productImage53,
        ],
        salePrice: 380.0,
        sku: 'ABR4568',
        categoryId: '15',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '018',
        title: 'Iphone 12 Black, Blue, Red & Green',
        stock: 15,
        price: 256,
        isFeatured: false,
        thumbnail: TImages.productImage73,
        description: 'Iphone 12 Black, Blue, Red & Green',
        brand: BrandModel(
            id: '3',
            image: TImages.appleLogo,
            name: 'Iphone',
            productsCount: 30,
            isFeatured: true),
        images: [
          TImages.productImage73,
          TImages.productImage72,
          TImages.productImage71,
          TImages.productImage70
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '15',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Black', 'Blue', 'Red', 'Green']),
          ProductAttributeModel(
              name: 'Size', values: ['64 GB', '128 Gb',]),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 250,
              salePrice: 230,
              image: TImages.productImage73,
              description: 'This is a product description for the Iphone 12',
              attributeValues: {'Color': 'Black', 'Size': '64 GB'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 250,
              image: TImages.productImage73,
              attributeValues: {'Color': 'Black', 'Size': '128 GB'}),
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 234,
              image: TImages.productImage71,
              attributeValues: {'Color': 'Blue', 'Size': '64 GB'}),
          ProductVariationModel(
              id: '4',
              stock: 22,
              price: 232,
              image: TImages.productImage70,
              attributeValues: {'Color': 'Red', 'Size': '64 GB'}),
          ProductVariationModel(
              id: '5',
              stock: 0,
              price: 334,
              image: TImages.productImage70,
              attributeValues: {'Color': 'Red', 'Size': '128 GB'}),
          ProductVariationModel(
              id: '6',
              stock: 11,
              price: 332,
              image: TImages.productImage72,
              attributeValues: {'Color': 'Green', 'Size': '64 GB'}),
          ProductVariationModel(
              id: '7',
              stock: 11,
              price: 332,
              image: TImages.productImage72,
              attributeValues: {'Color': 'Green', 'Size': '128 GB'}),
        ],
        productType: 'ProductType.variable'),

    // Puma

    ProductModel(
        id: '019',
        title: 'Puma Slipper For Boys',
        stock: 15,
        price: 480.0,
        isFeatured: false,
        thumbnail: TImages.productImage77,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '4',
          image: TImages.pumaLogo,
          name: 'Puma',
        ),
        images: [
          TImages.productImage76,
          TImages.productImage75,
          TImages.productImage74,
        ],
        salePrice: 380.0,
        sku: 'ABR4568',
        categoryId: '6',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '020',
        title: 'Puma Shoes For Boys',
        stock: 15,
        price: 250.0,
        isFeatured: false,
        thumbnail: TImages.productImage2,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '4',
          image: TImages.pumaLogo,
          name: 'Puma',
        ),
        images: [
          TImages.productImage2,
          TImages.productImage2,
          TImages.productImage2,
        ],
        salePrice: 220.0,
        sku: 'ABR4568',
        categoryId: '6',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '021',
        title: 'Puma Slipper For Boys',
        stock: 15,
        price: 480.0,
        isFeatured: false,
        thumbnail: TImages.productImage78,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '4',
          image: TImages.pumaLogo,
          name: 'Puma',
        ),
        images: [
          TImages.productImage78,
          TImages.productImage78,
          TImages.productImage78,
        ],
        salePrice: 380.0,
        sku: 'ABR4568',
        categoryId: '6',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),

    //acer

    ProductModel(
        id: '022',
        title: 'Acer laptop (16GB Ram, 250SSD)',
        stock: 15,
        price: 480.0,
        isFeatured: false,
        thumbnail: TImages.productImage47,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '5',
          image: TImages.acerlogo,
          name: 'Acer',
        ),
        images: [
          TImages.productImage48,
          TImages.productImage49,
          TImages.productImage50,
        ],
        sku: 'ABR4568',
        categoryId: '14',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '023',
        title: 'Acer laptop (16GB Ram, 512SSD)',
        stock: 15,
        price: 480.0,
        isFeatured: false,
        thumbnail: TImages.productImage48,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '5',
          image: TImages.acerlogo,
          name: 'Acer',
        ),
        images: [
          TImages.productImage48,
          TImages.productImage48,
          TImages.productImage48,
        ],
        sku: 'ABR4568',
        categoryId: '14',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '024',
        title: 'Acer laptop (32GB Ram, 512SSD)',
        stock: 15,
        price: 480.0,
        isFeatured: false,
        thumbnail: TImages.productImage49,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '5',
          image: TImages.acerlogo,
          name: 'Acer',
        ),
        images: [
          TImages.productImage49,
          TImages.productImage49,
          TImages.productImage49,
        ],
        sku: 'ABR4568',
        categoryId: '14',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '025',
        title: 'Acer Laptop',
        stock: 15,
        price: 256,
        isFeatured: false,
        thumbnail: TImages.productImage56,
        description: 'Acer Laptop',
        brand: BrandModel(
            id: '5',
            image: TImages.acerlogo,
            name: 'Acer',
            productsCount: 25,
            isFeatured: true),
        images: [
          TImages.productImage56,
          TImages.productImage57,
          TImages.productImage58,
          TImages.productImage59
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '14',
        productAttributes: [
          ProductAttributeModel(
              name: 'Brand', values: ['Acer']),
          ProductAttributeModel(
              name: 'Specs', values: ['128 SSD ', '256 SSD', '512 SSD']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 250,
              salePrice: 230,
              image: TImages.productImage56,
              description: 'This is a product description for the Iphone 12',
              attributeValues: {'Brand': 'Acer', 'Specs': '128 SSD'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 250,
              image: TImages.productImage57,
              attributeValues: {'Brand': 'Acer', 'Size': '256 SSD'}),
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 234,
              image: TImages.productImage58,
              attributeValues: {'Brand': 'Acer', 'Size': '512 SSD'}),
          ProductVariationModel(
              id: '4',
              stock: 22,
              price: 232,
              image: TImages.productImage59,
              attributeValues: {'Brand': 'Acer', 'Size': '256 GB'}),
        ],
        productType: 'ProductType.variable'),

    // Adidas

    ProductModel(
        id: '026',
        title: 'Adidas MLS 24 TRAINING BALL',
        stock: 15,
        price: 30.0,
        isFeatured: false,
        thumbnail: TImages.productImage28,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '6',
          image: TImages.adidasLogo,
          name: 'Adidas',
        ),
        images: [
          TImages.productImage28,
          TImages.productImage28,
          TImages.productImage28,
        ],
        sku: 'ABR4568',
        categoryId: '10',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '027',
        title: 'Adidas Cricket Bat',
        stock: 15,
        price: 30.0,
        isFeatured: false,
        thumbnail: TImages.productImage30,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '6',
          image: TImages.adidasLogo,
          name: 'Adidas',
        ),
        images: [
          TImages.productImage30,
          TImages.productImage30,
          TImages.productImage30,
        ],
        sku: 'ABR4568',
        categoryId: '10',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '028',
        title: 'Adidas Tennis racket ',
        stock: 10,
        price: 45.0,
        isFeatured: false,
        thumbnail: TImages.productImage31,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '6',
          image: TImages.adidasLogo,
          name: 'Adidas',
        ),
        images: [
          TImages.productImage31,
          TImages.productImage31,
          TImages.productImage31,
        ],
        sku: 'ABR4568',
        categoryId: '10',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),

    // Jorden

    ProductModel(
        id: '029',
        title: 'Jorden Shoes Orange',
        stock: 10,
        price: 200.0,
        isFeatured: false,
        thumbnail: TImages.productImage8,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '7',
          image: TImages.jordanLogo,
          name: 'Jorden',
        ),
        images: [
          TImages.productImage8,
          TImages.productImage8,
          TImages.productImage8,

        ],

        sku: 'ABR4568',
        categoryId: '8',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '030',
        title: 'Jorden Shoes Red',
        stock: 10,
        price: 200.0,
        isFeatured: false,
        thumbnail: TImages.productImage7,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '7',
          image: TImages.jordanLogo,
          name: 'Jorden',
        ),
        images: [
          TImages.productImage7,
          TImages.productImage7,
          TImages.productImage7,

        ],

        sku: 'ABR4568',
        categoryId: '8',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '031',
        title: 'Jorden Shoes White',
        stock: 10,
        price: 200.0,
        isFeatured: false,
        thumbnail: TImages.productImage79,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '7',
          image: TImages.jordanLogo,
          name: 'Jorden',
        ),
        images: [
          TImages.productImage79,
          TImages.productImage79,
          TImages.productImage79,

        ],

        sku: 'ABR4568',
        categoryId: '8',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),

    //kenwood

    ProductModel(
        id: '032',
        title: 'Bedroom wardrobe',
        stock: 10,
        price: 200.0,
        isFeatured: false,
        thumbnail: TImages.productImage35,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '8',
          image: TImages.kenwoodLogo,
          name: 'Kenwood',
        ),
        images: [
          TImages.productImage35,
          TImages.productImage35,
          TImages.productImage35,

        ],

        sku: 'ABR4568',
        categoryId: '11',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '033',
        title: 'Bedroom Sofa',
        stock: 10,
        price: 150.0,
        isFeatured: false,
        thumbnail: TImages.productImage34,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '8',
          image: TImages.kenwoodLogo,
          name: 'Kenwood',
        ),
        images: [
          TImages.productImage34,
          TImages.productImage34,
          TImages.productImage34,

        ],

        sku: 'ABR4568',
        categoryId: '11',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '034',
        title: 'Bedroom Bed',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.productImage32,
        description: 'Bedroom Bed',
        brand: BrandModel(
            id: '8',
            image: TImages.kenwoodLogo,
            name: 'Kenwood',
            productsCount: 15,
            isFeatured: true),
        images: [
          TImages.productImage43,
          TImages.productImage44,
          TImages.productImage45,
          TImages.productImage46
        ],
        salePrice: 30,
        sku: 'ABR4568',
        categoryId: '11',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Black', 'Grey', 'Brown', 'Comforter']),
          ProductAttributeModel(
              name: 'Size', values: ['70 sq ft', '132 sq ft',]),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 34,
              price: 134,
              salePrice: 122.6,
              image: TImages.productImage43,
              description: 'This is a product description for the Bedroom Bed',
              attributeValues: {'Color': 'Black', 'Size': '70 sq ft'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 132,
              image: TImages.productImage43,
              attributeValues: {'Color': 'Black', 'Size': '132 sq ft'}),
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 234,
              image: TImages.productImage44,
              attributeValues: {'Color': 'Grey', 'Size': '70 sq ft'}),
          ProductVariationModel(
              id: '4',
              stock: 222,
              price: 232,
              image: TImages.productImage45,
              attributeValues: {'Color': 'Brown', 'Size': '132 sq ft'}),
          ProductVariationModel(
              id: '5',
              stock: 0,
              price: 334,
              image: TImages.productImage46,
              attributeValues: {'Color': 'Comforter', 'Size': '70 sq ft'}),
          ProductVariationModel(
              id: '6',
              stock: 11,
              price: 332,
              image: TImages.productImage46,
              attributeValues: {'Color': 'Comforter', 'Size': '132 sq ft'}),
        ],
        productType: 'ProductType.variable'),

    // ikea
    ProductModel(
        id: '035',
        title: 'Bedroom Lamp',
        stock: 10,
        price: 200.0,
        isFeatured: false,
        thumbnail: TImages.productImage33,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '9',
          image: TImages.ikeaLogo,
          name: 'Ikea',
        ),
        salePrice: 180.0,
        images: [
          TImages.productImage33,
          TImages.productImage33,
          TImages.productImage33,

        ],
        sku: 'ABR4568',
        categoryId: '11',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '036',
        title: 'Ikea Office Chair',
        stock: 10,
        price: 200.0,
        isFeatured: false,
        thumbnail: TImages.productImage39,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '9',
          image: TImages.ikeaLogo,
          name: 'Ikea',
        ),
        salePrice: 180.0,
        images: [
          TImages.productImage39,
          TImages.productImage39,
          TImages.productImage39,

        ],
        sku: 'ABR4568',
        categoryId: '11',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '037',
        title: 'Ikea Office Desk',
        stock: 10,
        price: 200.0,
        isFeatured: false,
        thumbnail: TImages.productImage41,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '9',
          image: TImages.ikeaLogo,
          name: 'Ikea',
        ),
        salePrice: 180.0,
        images: [
          TImages.productImage41,
          TImages.productImage41,
          TImages.productImage41,

        ],
        sku: 'ABR4568',
        categoryId: '11',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),


    //hermanMiller
    ProductModel(
        id: '038',
        title: 'Kitchen refrigerator colloquially fridge',
        stock: 10,
        price: 500.0,
        isFeatured: false,
        thumbnail: TImages.productImage38,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '10',
          image: TImages.hermanMillerLogo,
          name: 'HermanMiller',
        ),
        salePrice: 450.0,
        images: [
          TImages.productImage38,
          TImages.productImage38,
          TImages.productImage38,

        ],
        sku: 'ABR4568',
        categoryId: '12',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '039',
        title: 'Kitchen dining table',
        stock: 10,
        price: 430.0,
        isFeatured: false,
        thumbnail: TImages.productImage37,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '10',
          image: TImages.hermanMillerLogo,
          name: 'HermanMiller',
        ),
        salePrice: 450.0,
        images: [
          TImages.productImage37,
          TImages.productImage37,
          TImages.productImage37,

        ],
        sku: 'ABR4568',
        categoryId: '12',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),
    ProductModel(
        id: '040',
        title: 'Kitchen Counter',
        stock: 10,
        price: 500.0,
        isFeatured: false,
        thumbnail: TImages.productImage36,
        description: 'This is a dummy product description.',
        brand: BrandModel(
          id: '10',
          image: TImages.hermanMillerLogo,
          name: 'HermanMiller',
        ),
        salePrice: 450.0,
        images: [
          TImages.productImage36,
          TImages.productImage36,
          TImages.productImage36,

        ],
        sku: 'ABR4568',
        categoryId: '12',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ],
        productType: 'ProductType.single'),










  ];


// List of all products
// static final List<ProductModel> products = [
//   ProductModel(
//       id: '001',
//       title: 'Green Nike sports shoe',
//       stock: 15,
//       price: 135,
//       isFeatured: true,
//       thumbnail: TImages.productImage1,
//       description: 'Green Nike sports shoe',
//       brand: BrandModel(
//           id: '1',
//           image: TImages.nikeLogo,
//           name: 'Nike',
//           productsCount: 265,
//           isFeatured: true),
//       images: [
//         TImages.productImage1,
//         TImages.productImage23,
//         TImages.productImage21,
//         TImages.productImage9
//       ],
//       salePrice: 30,
//       sku: 'ABR4568',
//       categoryId: '1',
//       productAttributes: [
//         ProductAttributeModel(
//             name: 'Color', values: ['Green', 'Black', 'Red']),
//         ProductAttributeModel(
//             name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//       ],
//       productVariations: [
//         ProductVariationModel(
//             id: '1',
//             stock: 34,
//             price: 134,
//             salePrice: 122.6,
//             image: TImages.productImage1,
//             description: 'This is a product description for the Green Nike sports shoe',
//             attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
//         ProductVariationModel(
//             id: '2',
//             stock: 15,
//             price: 132,
//             image: TImages.productImage23,
//             attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
//         ProductVariationModel(
//             id: '3',
//             stock: 0,
//             price: 234,
//             image: TImages.productImage23,
//             attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
//         ProductVariationModel(
//             id: '4',
//             stock: 222,
//             price: 232,
//             image: TImages.productImage1,
//             attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
//         ProductVariationModel(
//             id: '5',
//             stock: 0,
//             price: 334,
//             image: TImages.productImage21,
//             attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
//         ProductVariationModel(
//             id: '6',
//             stock: 11,
//             price: 332,
//             image: TImages.productImage21,
//             attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
//       ],
//       productType: 'ProductType.variable'),
//   ProductModel(
//       id: '002',
//       title: 'Blue T-shirt for all ages',
//       stock: 15,
//       price: 35,
//       isFeatured: true,
//       thumbnail: TImages.productImage69,
//       description: 'This is a dummy product description.',
//       brand: BrandModel(
//         id: '6',
//         image: TImages.zaraLogo,
//         name: 'Zara',
//       ),
//       images: [
//         TImages.productImage68,
//         TImages.productImage69,
//         TImages.productImage5,
//       ],
//       salePrice: 30,
//       sku: 'ABR4568',
//       categoryId: '16',
//       productAttributes: [
//         ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
//         ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
//       ],
//       productType: 'ProductType.single'),
//   ProductModel(
//       id: '003',
//       title: 'Leather brown Jacket',
//       stock: 15,
//       price: 38000,
//       isFeatured: false,
//       thumbnail: TImages.productImage64,
//       description: 'This is a dummy product description.',
//       brand: BrandModel(
//         id: '6',
//         image: TImages.zaraLogo,
//         name: 'Zara',
//
//       ),
//       images: [
//         TImages.productImage64,
//         TImages.productImage65,
//         TImages.productImage66,
//         TImages.productImage67,
//       ],
//       salePrice: 30,
//       sku: 'ABR4568',
//       categoryId: '16',
//       productAttributes: [
//         ProductAttributeModel(
//             name: 'Color', values: ['Green', 'Red', 'Blue']),
//         ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
//       ],
//       productType: 'ProductType.single'),
//   ProductModel(
//       id: '004',
//       title: '4 Color collar t-shirt dry fit',
//       stock: 15,
//       price: 135,
//       isFeatured: false,
//       thumbnail: TImages.productImage60,
//       description: 'This is a dummy product description.',
//       brand: BrandModel(
//         id: '6',
//         image: TImages.zaraLogo,
//         name: 'Zara',
//       ),
//       images: [
//         TImages.productImage60,
//         TImages.productImage61,
//         TImages.productImage62,
//         TImages.productImage63,
//       ],
//       salePrice: 30,
//       sku: 'ABR4568',
//       categoryId: '16',
//       productAttributes: [
//         ProductAttributeModel(
//             name: 'Color', values: ['Red', 'Yellow', 'Green', 'Blue']),
//         ProductAttributeModel(
//             name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//       ],
//       productVariations: [
//         ProductVariationModel(
//             id: '1',
//             stock: 34,
//             price: 134,
//             salePrice: 122.6,
//             image: TImages.productImage60,
//             description:
//                 'This is a product description for the 4 Color collar t-shirt dry fit',
//             attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
//         ProductVariationModel(
//             id: '2',
//             stock: 15,
//             price: 132,
//             image: TImages.productImage60,
//             attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
//         ProductVariationModel(
//             id: '3',
//             stock: 0,
//             price: 234,
//             image: TImages.productImage61,
//             attributeValues: {'Color': 'Yellow', 'Size': 'EU 34'}),
//         ProductVariationModel(
//             id: '4',
//             stock: 222,
//             price: 232,
//             image: TImages.productImage61,
//             attributeValues: {'Color': 'yellow', 'Size': 'EU 32'}),
//         ProductVariationModel(
//             id: '5',
//             stock: 0,
//             price: 334,
//             image: TImages.productImage62,
//             attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
//         ProductVariationModel(
//             id: '6',
//             stock: 11,
//             price: 332,
//             image: TImages.productImage62,
//             attributeValues: {'Color': 'Green', 'Size': 'EU 30'}),
//         ProductVariationModel(
//             id: '7',
//             stock: 0,
//             price: 334,
//             image: TImages.productImage63,
//             attributeValues: {'Color': 'Blue', 'Size': 'EU 30'}),
//         ProductVariationModel(
//             id: '8',
//             stock: 11,
//             price: 332,
//             image: TImages.productImage63,
//             attributeValues: {'Color': 'Blue', 'Size': 'EU 34'}),
//       ],
//       productType: 'ProductType.variable'),
//
//   // Products after banner
//   ProductModel(
//       id: '005',
//       title: 'Nike Air jorden shoes',
//       stock: 15,
//       price: 135,
//       isFeatured: false,
//       thumbnail: TImages.productImage10,
//       description: 'Nike Air jorden shoes',
//       brand: BrandModel(
//           id: '1',
//           image: TImages.nikeLogo,
//           name: 'Nike',
//           productsCount: 265,
//           isFeatured: true),
//       images: [
//         TImages.productImage7,
//         TImages.productImage8,
//         TImages.productImage9,
//         TImages.productImage10,
//       ],
//       salePrice: 30,
//       sku: 'ABR4568',
//       categoryId: '8',
//       productAttributes: [
//         ProductAttributeModel(
//             name: 'Color', values: ['Orange', 'Black', 'Brown']),
//         ProductAttributeModel(
//             name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//       ],
//       productVariations: [
//         ProductVariationModel(
//             id: '1',
//             stock: 16,
//             price: 36,
//             salePrice: 12.6,
//             image: TImages.productImage8,
//             description:
//                 'This is a product description for the Green Nike sports shoe',
//             attributeValues: {'Color': 'Orange', 'Size': 'EU 34'}),
//         ProductVariationModel(
//             id: '2',
//             stock: 15,
//             price: 132,
//             image: TImages.productImage7,
//             attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
//         ProductVariationModel(
//             id: '3',
//             stock: 14,
//             price: 34,
//             image: TImages.productImage9,
//             attributeValues: {'Color': 'Brown', 'Size': 'EU 34'}),
//         ProductVariationModel(
//             id: '4',
//             stock: 13,
//             price: 33,
//             image: TImages.productImage7,
//             attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
//         ProductVariationModel(
//             id: '5',
//             stock: 12,
//             price: 32,
//             image: TImages.productImage9,
//             attributeValues: {'Color': 'Brown', 'Size': 'EU 32'}),
//         ProductVariationModel(
//             id: '6',
//             stock: 11,
//             price: 31,
//             image: TImages.productImage8,
//             attributeValues: {'Color': 'Orange', 'Size': 'EU 32'}),
//       ],
//       productType: 'ProductType.variable'),
//
//   ProductModel(
//       id: '006',
//       title: 'Samsung Galaxy (pink, 64 GB) (4 GB RAM)',
//       stock: 15,
//       price: 750,
//       isFeatured: false,
//       thumbnail: TImages.productImage11,
//       description: 'Samsung Galaxy (pink, 64 GB) (4 GB RAM)',
//       brand: BrandModel(
//         id: '7',
//         image: TImages.appleLogo,
//         name: 'Samsung',
//       ),
//       images: [
//         TImages.productImage11,
//         TImages.productImage12,
//         TImages.productImage13,
//         TImages.productImage12,
//       ],
//       salePrice: 30,
//       sku: 'ABR4568',
//       categoryId: '8',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
//         ProductAttributeModel(
//             name: 'Color', values: ['Green', 'Red', 'Blue']),
//       ],
//       productType: 'ProductType.single'),
//
//   ProductModel(
//       id: '007',
//       title: 'TOMI Dog Food',
//       stock: 15,
//       price: 20,
//       isFeatured: false,
//       thumbnail: TImages.productImage18,
//       description: 'This is product description for TOMI Dog Food',
//       brand: BrandModel(
//         id: '7',
//         image: TImages.appleLogo,
//         name: 'Tomi',
//       ),
//
//       salePrice: 10,
//       sku: 'ABR4568',
//       categoryId: '4',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
//         ProductAttributeModel(
//             name: 'Color', values: ['Green', 'Red', 'Blue']),
//       ],
//       productType: 'ProductType.single'),
//
//   // 008 after 040
//
//   ProductModel(
//       id: '009',
//       title: 'Nike Air Jorden 19 Blue',
//       stock: 15,
//       price: 400,
//       isFeatured: false,
//       thumbnail: TImages.productImage19,
//       description: 'This is product description for Nike Air Jorden 19 Blue',
//       brand: BrandModel(
//         id: '1',
//         image: TImages.appleLogo,
//         name: 'Nike',
//       ),
//
//       images: [
//         TImages.productImage19,
//         TImages.productImage20,
//         TImages.productImage21,
//         TImages.productImage22,
//       ],
//
//       salePrice: 200,
//       sku: 'ABR4568',
//       categoryId: '8',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
//         ProductAttributeModel(
//             name: 'Color', values: ['Green', 'Red', 'Blue']),
//       ],
//       productType: 'ProductType.single'),

}
