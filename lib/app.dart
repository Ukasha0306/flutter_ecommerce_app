import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/bindings/general_bindings.dart';
import 'package:flutter_ecommerce_app/utils/theme/theme.dart';
import 'package:get/get.dart';
import 'utils/constants/color.dart';
import 'utils/routes/app_routes.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: const Scaffold(backgroundColor: TColors.primary , body: Center(child: CircularProgressIndicator(color: TColors.white,),),)
    );
  }
}