import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/app_images.dart';
import 'package:my_to_do_shopping_list/navigation/app_pages.dart';
import 'package:my_to_do_shopping_list/widgets/app/app_state_manager.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: AppPages.onBoardingPath,
      key: ValueKey(AppPages.onBoardingPath),
      child: const OnBoardingPage(),
    );
  }

  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('Подсказки'),
        actions: [
          IconButton(
            onPressed: Provider.of<AppStateManager>(context).completeOnBoarding,
            icon: const Icon(Icons.chevron_right),
          ),
        ],
        actionsIconTheme: const IconThemeData(size: 32.0),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _buildPages(),
            _pageIndicator(),
            _buildActionButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPages() {
    return Expanded(
      child: PageView(
        controller: _pageController,
        children: [
          _pageView(
            text: 'Смахните влево по строке списка для её удаления',
            imageProvider: AppImages.emptyTrolley,
          ),
          _pageView(
            text: 'Смахните вправо по строке для её редактирования',
            imageProvider: AppImages.emptyTrolley,
          ),
          _pageView(
            text: 'Коснитесь строки, чтобы пометить её как выполненную',
            imageProvider: AppImages.emptyTrolley,
          ),
          _pageView(
            text:
                'Коснитесь значка завершения для удаления всех выполненных строк',
            imageProvider: AppImages.emptyTrolley,
          ),
        ],
      ),
    );
  }

  Widget _pageView(
      {required String text, required ImageProvider imageProvider}) {
    final textStyle = Theme.of(context).textTheme.headline3;
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              //fit: BoxFit.fitWidth,
              image: imageProvider,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            text,
            textAlign: TextAlign.center,
            style: textStyle,
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Widget _pageIndicator() {
    return SmoothPageIndicator(
      controller: _pageController,
      count: 4,
      effect: const WormEffect(
        activeDotColor: Colors.teal,
        dotWidth: 14,
        dotHeight: 14,
        spacing: 12,
      ),
    );
  }

  Row _buildActionButton() {
    final textStyle = Theme.of(context).textTheme.bodyText2;
    final style = textStyle?.copyWith(color: Colors.teal);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          child: Text('Пропустить', style: style,),
          onPressed:  Provider.of<AppStateManager>(context).completeOnBoarding,
        ),
        const SizedBox(
          width: 12,
        ),
      ],
    );
  }
}
