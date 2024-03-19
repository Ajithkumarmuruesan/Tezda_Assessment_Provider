import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezda_ecommerce/controller/dashboard_controller.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
        ),
        body: Consumer<DashBoardController>(builder: (context, controller, _) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Stack(
              children: [
                // IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(controller
                            .productListModel!
                            .products[controller.selectedProductIndex]
                            .images[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  top: MediaQuery.of(context).size.height * 0.30,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            controller
                                .productListModel!
                                .products[controller.selectedProductIndex]
                                .title!,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                controller
                                    .productListModel!
                                    .products[controller.selectedProductIndex]
                                    .price
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ' / kg',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Spain',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Text(
                              controller
                                  .productListModel!
                                  .products[controller.selectedProductIndex]
                                  .description!,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.addToFav(
                                      context, controller.selectedProductIndex);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 0.5, color: Colors.grey)),
                                  height: 40,
                                  width: 100,
                                  child: Icon(Icons.favorite_border),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF22eaaa),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                height: 40,
                                width: 150,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'ADD TO CART',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
