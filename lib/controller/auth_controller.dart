import 'package:flutter/material.dart';
import 'package:tezda_ecommerce/model/get_model/login_response_model.dart';
import 'package:tezda_ecommerce/model/post_model/login_model.dart';
import 'package:tezda_ecommerce/services/api_services.dart';
import 'package:tezda_ecommerce/services/local_storage_service.dart';

class AuthController extends ChangeNotifier {
  final loginFormKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var obscurePassword = true;
  LoginResponseModel? loginResponseModel;

  passwordView() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future checkUser(BuildContext context) async {
    final res = await LocalStroage().getSaveValue('accssToken');

    if (res != '') {
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      Navigator.pushReplacementNamed(context, '/auth');
    }
  }

  Future login(BuildContext context) async {
    try {
      final res = await Apiservice().login(LoginRequest(
          username: userNameController.text,
          password: passwordController.text));
      loginResponseModel = res;
      if (loginResponseModel!.token != '') {
        String accessToken = loginResponseModel!.token.toString();
        final res =
            await LocalStroage().setandSaveValue('accssToken', accessToken);
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else {
        final snackBar =
            SnackBar(content: Text('Invalid username or password'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pushReplacementNamed(context, '/auth');
      }
    } catch (e) {
      final snackBar = SnackBar(content: Text('Invalid username or password'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
