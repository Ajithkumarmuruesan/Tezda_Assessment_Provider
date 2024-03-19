import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezda_ecommerce/controller/dashboard_controller.dart';

class FavView extends StatefulWidget {
  const FavView({super.key});

  @override
  State<FavView> createState() => _FavViewState();
}

class _FavViewState extends State<FavView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DashBoardController>().getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardController>(builder: (context, controller, _) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFf5eded),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Favourites',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          // autofocus: true,
                          // focusNode: controller.searchFocus,
                          autovalidateMode: AutovalidateMode.onUserInteraction,

                          onChanged: (value) {},
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 25,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            hintText: 'Search',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.productListModel != null
                        ? controller.favProduct.length
                        : 0,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    itemBuilder: (context, index) {
                      return controller.favProduct.isEmpty
                          ? Center(child: Text('No more products'))
                          : InkWell(
                              onTap: () {
                                controller.productView(context,
                                    controller.favProduct[index]['index']);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.5,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(controller
                                                            .favProduct[index]
                                                        ['image'])
                                                    as ImageProvider<Object>),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          child: Text(
                                              controller.favProduct[index]
                                                  ['title'],
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            '£' +
                                                controller.favProduct[index]
                                                        ['price']
                                                    .toString(),
                                            style: TextStyle()),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        width: 0.5,
                                                        color: Colors.grey)),
                                                height: 30,
                                                width: 70,
                                                child: Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF22eaaa),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                height: 30,
                                                width: 70,
                                                child: Icon(
                                                  Icons.shopping_cart_outlined,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                    }),
              )
            ],
          ),
        ),
      );
    });
  }
}
