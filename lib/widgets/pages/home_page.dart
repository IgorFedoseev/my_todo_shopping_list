import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/widgets/pages/products_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> pages = [
    const ProductsListWidget(title: 'Список покупок'),
    const Center(child: Text('Список дел')),
    const Center(child: Text('Profile')),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
