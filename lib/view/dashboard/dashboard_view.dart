import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezda_ecommerce/controller/dashboard_controller.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardController>(builder: (context, controller, _) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          onTap: (value) {
            controller.changePage(value);
          },
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.black,
          currentIndex: controller.selectedIndex,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(fontSize: 12),
          unselectedLabelStyle: TextStyle(fontSize: 12),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Fav"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
        body: controller.pages[controller.selectedIndex],
      );
    });
  }
}
