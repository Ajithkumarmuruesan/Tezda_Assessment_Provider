import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tezda_ecommerce/controller/dashboard_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardController>(builder: (context, controller, _) {
      return Scaffold(
        backgroundColor: Color(0xFFf5eded),
        body: Center(
            child: Card(
          elevation: 4,
          margin: EdgeInsets.all(16),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      NetworkImage(controller.userProfileDetailsModel!.image!),
                ),
                SizedBox(height: 16),
                Text(
                  controller.userProfileDetailsModel!.firstName!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  controller.userProfileDetailsModel!.email!,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  controller.userProfileDetailsModel!.gender!,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        )),
      );
    });
  }
}
