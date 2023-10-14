import 'package:flutter/material.dart';
import 'package:voxvil_mobile/core/base/base.state.dart';
import 'package:voxvil_mobile/core/constants/app_constant.dart';
import 'package:voxvil_mobile/core/widgets/custom_app_bar.dart';
import 'package:voxvil_mobile/pages/events_page.dart';
import 'package:voxvil_mobile/pages/nft_page.dart';
import 'package:voxvil_mobile/pages/rewards_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final PageController _pageController = PageController();
ValueNotifier<int> stateIndex = ValueNotifier<int>(0);

class _HomePageState extends BaseState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: dynamicHeight(20),
            ),
            ValueListenableBuilder(
              valueListenable: stateIndex,
              builder: (context, value, child) {
                return SizedBox(
                  height: 30,
                  child: Center(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: titleParams.length,
                      itemBuilder: (context, index) {
                        if (index == stateIndex.value) {
                          return InkWell(
                              onTap: () {
                                _pageController.animateToPage(index,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: DecideTitle(
                                  titleParams[index], Colors.white));
                        } else {
                          return InkWell(
                              onTap: () {
                                _pageController.animateToPage(index,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: DecideTitle(titleParams[index],
                                  themeData.colorScheme.onSecondary));
                        }
                      },
                    ),
                  ),
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: stateIndex,
              builder: (context, value, child) {
                return SizedBox(
                  height: dynamicHeight(750),
                  child: PageView(
                    onPageChanged: (value) {
                      stateIndex.value = value;
                    },
                    controller: _pageController,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          NftPage(),
                        ],
                      ),
                      RewardsPage(),
                      EventsPage(),
                    ],
                  ),
                );
              },
            )
          ]),
        ),
      ),
    );
  }
}

class DecideTitle extends BaseStateless {
  final String title;
  final Color color;
  const DecideTitle(this.title, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context) / 3,
      child: Center(
        child: Text(
          title,
          style:
              themeData(context).textTheme.titleMedium!.copyWith(color: color),
        ),
      ),
    );
  }
}
