import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/navigation/app_links.dart';

class AppRouteParser extends RouteInformationParser<AppLink>{

  @override
  Future<AppLink> parseRouteInformation(RouteInformation routeInformation) async{
    final appLink = AppLink.fromLocation(routeInformation.location);
    return appLink;
  }

  @override
  RouteInformation restoreRouteInformation(AppLink configuration) {
    final location = configuration.toLocation();
    return RouteInformation(location: location);
  }
}