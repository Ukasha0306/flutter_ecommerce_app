
import 'package:flutter_ecommerce_app/features/authentication/screens/forget/forget_password_screen.dart';
import 'package:flutter_ecommerce_app/features/authentication/screens/login/login_screen.dart';
import 'package:flutter_ecommerce_app/features/authentication/screens/onboarding/onborading_screen.dart';
import 'package:flutter_ecommerce_app/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter_ecommerce_app/features/authentication/screens/signup/verify_email_screen.dart';
import 'package:flutter_ecommerce_app/features/personalization/screens/address/address.dart';
import 'package:flutter_ecommerce_app/features/personalization/screens/profile/profile_screen.dart';
import 'package:flutter_ecommerce_app/features/personalization/screens/settings/setting_screen.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/cart/cart_screen.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/checkout/checkout.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/home/home_screen.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/order/order.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/store/store.dart';
import 'package:flutter_ecommerce_app/features/shop/screens/wishlist/favourite-screen.dart';
import 'package:flutter_ecommerce_app/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes{

  static final pages = [
    GetPage(name: TRoutes.home, page: ()=>const HomeScreen()),
    GetPage(name: TRoutes.store, page: ()=>const StoreScreen()),
    GetPage(name: TRoutes.favourites, page: ()=>const FavouriteScreen()),
    GetPage(name: TRoutes.settings, page: ()=>const SettingScreen()),
    GetPage(name: TRoutes.productReviews, page: ()=>const ProductReviewScreen()),
    GetPage(name: TRoutes.order, page: ()=>const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: ()=>const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: ()=>const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: ()=>const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: ()=>const UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: ()=>const SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: ()=>const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: ()=>const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: ()=>const ForgetPasswordScreen()),
    GetPage(name: TRoutes.onBoarding, page: ()=>const OnBoardingScreen()),
  ];
}