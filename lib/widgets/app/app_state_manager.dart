import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/domain/app_cashe.dart';

class AppTab {
  static const int shoppingList = 0;
  static const int tasksList = 1;
  static const int settings = 2;
}

class AppStateManager extends ChangeNotifier {
  bool _isInitialize = false;
  bool _onBoardingComplete = false;
  int _selectedTab = AppTab.shoppingList;
  final _appCache = AppCache();

  bool get isInitialize => _isInitialize;
  bool get isOnBoardingComplete => _onBoardingComplete;
  int get getSelectedTab => _selectedTab;

  void initializeApp() async{
    _onBoardingComplete = await _appCache.didOnBoardingCompleted();

    Timer(
      const Duration(seconds: 1),
      () {
        _isInitialize = true;
        notifyListeners();
      },
    );
  }

  void completeOnBoarding() async{
    _onBoardingComplete = true;
    await _appCache.completeOnBoarding();
    notifyListeners();
  }

  void goToTab(int index) {
    if (_selectedTab == index) return;
    _selectedTab = index;
    notifyListeners();
  }

  void showOnBoardingScreen() async{
    _onBoardingComplete = false;
    await _appCache.notCompleteOnBoarding();
    notifyListeners();
  }
}
