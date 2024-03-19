import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezda_ecommerce/controller/auth_controller.dart';

class StartView extends StatefulWidget {
  const StartView({super.key});

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(builder: (context, controller, _) {
      Provider.of<AuthController>(context).checkUser(context);
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
