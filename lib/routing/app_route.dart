import 'package:flutter/material.dart';
import 'package:grocery_app/constants/constants.dart';
import 'package:grocery_app/views/category/category_view.dart';
import 'package:grocery_app/views/category_list/category_list_view.dart';
import 'package:grocery_app/views/home/home_view.dart';
import 'package:grocery_app/views/login/login_view.dart';
import 'package:grocery_app/views/product/product_view.dart';
import 'package:grocery_app/views/product_list/product_list_view.dart';
import 'package:grocery_app/views/splash/splash_view.dart';


class AppRoute {


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppConstant.splashView:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
        );
      case AppConstant.loginView:
        return MaterialPageRoute(
          builder: (context) => LoginView(),
        );

      case AppConstant.homeView:
        return MaterialPageRoute(
          builder: (context) => HomeView(),
        );
      case AppConstant.categoryListView:
        return MaterialPageRoute(
          builder: (context) => CategoryListView(),
        );
      case AppConstant.categoryView:
        return MaterialPageRoute(
          builder: (context) => CategoryView(),
        );
      case AppConstant.productListView:
        return MaterialPageRoute(
          builder: (context) => ProductListView(),
        );
      case AppConstant.productView:
        return MaterialPageRoute(
          builder: (context) => ProductView(),
        );


      default:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
        );
    }
  }
}
