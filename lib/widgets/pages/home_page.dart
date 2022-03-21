import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/navigation/app_page_paths.dart';
import 'package:my_to_do_shopping_list/widgets/app/app_state_manager.dart';
import 'package:my_to_do_shopping_list/widgets/pages/products_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static MaterialPage page(int currentTab) {
    return MaterialPage(
      name: AppPages.home,
      key: ValueKey(AppPages.home),
      child: HomePage(currentTab: currentTab),
    );
  }

  final int currentTab;

  const HomePage({Key? key, required this.currentTab}) : super(key: key);

  static List<Widget> pages = [
    const ProductsListWidget(title: 'Список покупок'),
    const Center(child: Text('Список дел')),
    const Center(child: Text('Настройки')),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(
      builder: (context, appStateManager, _) {
        return Scaffold(
          body: IndexedStack(index: currentTab, children: pages),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentTab,
            onTap: (index) =>
            // context.read<AppStateManager>().goToTab(index)
                Provider.of<AppStateManager>(context, listen: false)
                    .goToTab(index),
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
      },
    );
  }
}
