class AppLink {
  static const String homePath = '/';
  static const String splashScreen = '/splash_screen';
  static const String onBoardingPath = '/on_boarding';
  static const String productCreateEditWidgetPath = '/product';
  static const String tabParam = 'tab';
  static const String idParam = 'id';

  String? location;
  int? currentTab;
  String? itemId;

  AppLink({
    this.location,
    this.currentTab,
    this.itemId,
  });
}
