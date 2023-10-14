import 'package:flutter/material.dart';
import 'package:voxvil_mobile/core/base/base.state.dart';

class NftCard extends BaseStateless {
  final Map<String, dynamic>? data;
  const NftCard(
    this.data, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String spendXp = data!['metadata'][7]['value'] ?? '0';
    String totalXp = data!['metadata'][0]['value'];
    String imgUrl = data!['image'];
    String availableXp = (int.parse(totalXp) - int.parse(spendXp)).toString();
    String companyName = data!['companyFullName'];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: SizedBox(
        height: dynamicHeight(context, 230),
        width: MediaQuery.of(context).size.width,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: themeData(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: dynamicHeight(context, 180),
                    width: dynamicWidth(context, 180),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(imgUrl),
                            fit: BoxFit.cover,
                            alignment: Alignment.center)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          companyName,
                          style: themeData(context).textTheme.titleMedium,
                        ),
                      ),
                      XpCard('TotalXP: ' + totalXp.toString()),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: XpCard('SpendXP: ' + spendXp.toString()),
                      ),
                      XpCard('AvailableXP: ' + availableXp.toString()),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class XpCard extends BaseStateless {
  final String title;
  const XpCard(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: themeData(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: themeData(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
