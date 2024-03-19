import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tezda_ecommerce/controller/auth_controller.dart';
import 'package:tezda_ecommerce/controller/dashboard_controller.dart';
import 'package:tezda_ecommerce/view/auth_view/auth_view.dart';
import 'package:tezda_ecommerce/view/details_view/details_view.dart';
import 'package:tezda_ecommerce/view/splash_view/splash_view.dart';

import 'view/dashboard/dashboard_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthController(),
        ),
        ChangeNotifierProvider.value(
          value: DashBoardController(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tezda Shop',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashView(),
        '/auth': (context) => AuthView(),
        '/dashboard': (context) => DashBoardView(),
        '/detailview': (context) => ProductDetailsView(),
      },
    );
  }
}
