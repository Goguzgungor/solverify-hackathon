import 'package:flutter/material.dart';
import 'package:voxvil_mobile/core/base/base.state.dart';
import 'package:voxvil_mobile/core/constants/app_constant.dart';

class RewardsPage extends BaseStateless {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: dynamicHeight(context, 750),
        width: width(context) - dynamicWidth(context, 40),
        child: ListView.builder(
          itemCount: rewardParams.length,
          itemBuilder: (context, index) {
            if (index > 1) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: RewardCard(
                    rewardParams[index]['title'],
                    rewardParams[index]['XP'],
                    rewardParams[index]['subTitle'],
                    themeData(context).colorScheme.secondary),
              );
            }
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: RewardCard(
                  rewardParams[index]['title'],
                  rewardParams[index]['XP'],
                  rewardParams[index]['subTitle'],
                  themeData(context).colorScheme.surface),
            );
          },
        ));
  }
}

class RewardCard extends BaseStateless {
  final String title;
  final String xp;
  final String subTitle;
  final Color color;
  const RewardCard(this.title, this.xp, this.subTitle, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context) - dynamicWidth(context, 40),
      height: dynamicHeight(context, 100),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: themeData(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: themeData(context).textTheme.titleLarge),
              SizedBox(height: dynamicHeight(context, 10)),
              Text(subTitle,
                  style: themeData(context).textTheme.titleSmall!.copyWith(
                      color: themeData(context).colorScheme.onPrimary)),
            ],
          ),
          SizedBox(
            width: dynamicWidth(context, 113),
            height: dynamicHeight(context, 60),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Text('$xp XP',
                    style: themeData(context).textTheme.titleMedium),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
