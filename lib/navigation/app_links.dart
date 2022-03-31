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

  static AppLink fromLocation(String? location) {
    location = Uri.decodeFull(location ?? '');
    final uri = Uri.parse(location);
    final params = uri.queryParameters;
    final currentTab = int.tryParse(params[AppLink.tabParam] ?? '');
    final itemId = params[AppLink.idParam];
    final link = AppLink(
      location: uri.path,
      currentTab: currentTab,
      itemId: itemId,
    );
    return link;
  }

  String toLocation() {
    String addKeyValuePair({required String key, String? value}) =>
        value == null ? '' : '$key=$value&';
    switch (location) {
      case splashScreen:
        return splashScreen;
      case onBoardingPath:
        return onBoardingPath;
      case productCreateEditWidgetPath:
        var loc = '$productCreateEditWidgetPath?';
        loc += addKeyValuePair(
          key: idParam,
          value: itemId,
        );
        return Uri.encodeFull(loc);
      default:
        var loc = '$homePath?';
        loc += addKeyValuePair(
          key: tabParam,
          value: currentTab.toString(),
        );
        return Uri.encodeFull(loc);
    }
  }
}
