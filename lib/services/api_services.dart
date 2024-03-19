import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tezda_ecommerce/config/constant/api_constant.dart';
import 'package:tezda_ecommerce/model/get_model/login_response_model.dart';
import 'package:tezda_ecommerce/model/get_model/product_list_model.dart';
import 'package:tezda_ecommerce/model/get_model/profile_details_model.dart';
import 'package:tezda_ecommerce/model/post_model/login_model.dart';

class Apiservice {
  final Dio client = Dio();

  Future<LoginResponseModel?> login(LoginRequest loginModel) async {
    try {
      final Map<String, String> body = {
        'username': loginModel.username.toString(),
        'password': loginModel.password.toString()
      };
      final response = await client.post(loginUrl,
          options: Options(headers: {'Content-Type': 'application/json'}),
          data: jsonEncode(body));
      var responseData = response.data;
      final LoginResponseModel loginResponseModel =
          LoginResponseModel.fromJson(responseData);
      return loginResponseModel;
    } catch (e) {
      print('Error during login: $e');
      return null;
    }
  }

  Future<ProductListModel?> getProductList() async {
    try {
      final res = await client.get(getProduct);
      final ProductListModel productListModel =
          ProductListModel.fromJson(res.data);
      return productListModel;
    } catch (e) {
      print(e);
    }
  }

  Future<UserProfileDetailsModel?> getProfileDetails(String accessToken) async {
    try {
      final res = await client.get(profile,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      final UserProfileDetailsModel userProfileDetailsModel =
          UserProfileDetailsModel.fromJson(res.data);
      return userProfileDetailsModel;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
