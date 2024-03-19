import 'package:flutter/material.dart';
import 'package:tezda_ecommerce/model/get_model/product_list_model.dart';
import 'package:tezda_ecommerce/model/get_model/profile_details_model.dart';
import 'package:tezda_ecommerce/services/api_services.dart';
import 'package:tezda_ecommerce/services/local_storage_service.dart';
import 'package:tezda_ecommerce/view/fav_view/fav_view.dart';
import 'package:tezda_ecommerce/view/product_view/product_liset_view.dart';
import 'package:tezda_ecommerce/view/profile_view/profile_view.dart';

class DashBoardController extends ChangeNotifier {
  // DashBoardController() {
  //   getProduct();
  // }
  var favProduct = [];
  // var totalProduct = [];
  ProductListModel? productListModel;
  UserProfileDetailsModel? userProfileDetailsModel;
  List pages = [ProductListView(), FavView(), ProfileView()];
  int selectedIndex = 0;
  int selectedProductIndex = 0;
  List<ProductListModel>? fav;

  Future getProduct() async {
    // String accToken = await LocalStroage().getSaveValue('accssToken');
    try {
      final res = await Apiservice().getProductList();
      if (res != null) {
        productListModel = res;
      }
      notifyListeners();
      await getUserProfile();
    } catch (e) {}
  }

  void productView(BuildContext context, int index) {
    selectedProductIndex = index;
    notifyListeners();
    Navigator.pushNamed(context, '/detailview');
  }

  Future getUserProfile() async {
    try {
      String accToken = await LocalStroage().getSaveValue('accssToken');
      final res = await Apiservice().getProfileDetails(accToken);
      if (res != null) {
        userProfileDetailsModel = res;
      }
    } catch (e) {}
  }

  void changePage(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void addToFav(BuildContext context, int index) {
    favProduct.add({
      'image': productListModel!.products[index].images[0],
      'title': productListModel!.products[index].title!,
      'price': productListModel!.products[index].price!,
      'index': index,
    });
    final snackBar = SnackBar(content: Text('Product Added to Favorite'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    notifyListeners();
  }
}
