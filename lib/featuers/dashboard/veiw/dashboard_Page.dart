import 'package:application/core/cubit/parent_cubit.dart';
import 'package:application/featuers/dashboard/controller/cubit/dashboard_cubit.dart';
import 'package:application/featuers/dashboard/model/card/veiw/page/card_page.dart';
import 'package:application/featuers/dashboard/model/favourite/view/page/favourite_page.dart';
import 'package:application/featuers/dashboard/model/product/veiw/page/product_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          DashboardCubit cubit = context.read<DashboardCubit>();
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  showSettingsDialog(context);
                },
                icon: const Icon(CupertinoIcons.settings_solid),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'new_product');
                  },
                  icon: const Icon(CupertinoIcons.plus),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  icon: const Icon(CupertinoIcons.person_fill),
                ),
              ],
            ),
            body: PageView(
              controller: cubit.pageController,
              onPageChanged: cubit.onChangeTab,
              children: const [
                ProductPage(),
                FavoritePage(),
                ReservationPage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.green,
              currentIndex: cubit.currentIndex,
              onTap: cubit.onChangeTab,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.collections),
                  label: 'Order Menu',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.heart),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cart),
                  label: 'Cart',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Settings',
            style: TextStyle(color: Color.fromARGB(255, 122, 100, 247)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(CupertinoIcons.sun_max_fill),
                title: const Text('Change Theme Mode'),
                onTap: () {
                  ParentCubit.instance.changeMode();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(CupertinoIcons.globe),
                title: const Text('Change Language'),
                onTap: () {
                  ParentCubit.instance.changeLang();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
