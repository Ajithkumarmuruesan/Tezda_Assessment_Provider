import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezda_ecommerce/controller/auth_controller.dart';
import 'package:tezda_ecommerce/view/auth_view/auth_widget.dart/login_auth_widget.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf5eded),
      body: Consumer<AuthController>(builder: (context, controller, _) {
        return Login();
      }),
    );
  }
}
