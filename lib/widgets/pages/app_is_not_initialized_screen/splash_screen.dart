import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/navigation/app_links.dart';
import 'package:my_to_do_shopping_list/widgets/app/app_state_manager.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(
      name: AppLink.splashScreen,
      key: ValueKey(AppLink.splashScreen),
      child: SplashScreen(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline2;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Загрузка...',
                style: textStyle,
              ),
               const SizedBox(height: 8.0),
               SizedBox(
                 width: 130,
                 child: LinearProgressIndicator(
                  color: Colors.teal,
                   backgroundColor: Colors.teal[200],
              ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
