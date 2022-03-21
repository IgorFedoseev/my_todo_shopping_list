import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/widgets/app/app_state_manager.dart';
import 'package:my_to_do_shopping_list/widgets/pages/products_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static List<Widget> pages = [
    const ProductsListWidget(title: 'Список покупок'),
    const Center(child: Text('Список дел')),
    const Center(child: Text('Настройки')),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(builder: (context, tabManager, _) {
      return Scaffold(
        body: IndexedStack(index: tabManager.getSelectedTab, children: pages),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabManager.getSelectedTab,
          onTap: (index) => tabManager.goToTab(index),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Покупки',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task_outlined),
              label: 'Дела',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Настройки',
            ),
          ],
        ),
      );
    });
  }
}
