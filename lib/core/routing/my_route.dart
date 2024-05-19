import 'package:application/featuers/dashboard/model/orderMenu/veiw/OrderMenu_page.dart';
import 'package:application/featuers/dashboard/veiw/dashboard_Page.dart';
import 'package:flutter/material.dart';

class MyRoute {
  static List<Route<dynamic>> initialRoutes = [
    MaterialPageRoute(builder: (_) => const DashboardPage()),
  ];

  static Route<dynamic> onNavigateByName(RouteSettings settings) {
    switch (settings.name) {
      case 'dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case 'new_product':
        return MaterialPageRoute(builder: (_) => const NewProductPage());
      default:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
    }
  }
}