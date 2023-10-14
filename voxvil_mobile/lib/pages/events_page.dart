import 'package:flutter/material.dart';
import 'package:voxvil_mobile/core/base/base.state.dart';
import 'package:voxvil_mobile/pages/qr_page.dart';

class EventsPage extends BaseStateless {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: dynamicHeight(context, 750),
        child: ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QrReader()));
                },
                child: EventCard()),
          ),
          itemCount: 6,
        ));
  }
}

class EventCard extends BaseStateless {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dynamicHeight(context, 150),
      width: width(context) - dynamicWidth(context, 40),
      child: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: themeData(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(16)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: dynamicHeight(context, 120),
                  width: dynamicWidth(context, 120),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage('assets/card_image.png'))),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Superteam Turkey',
                        style: themeData(context).textTheme.titleMedium),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today,
                              color: themeData(context).colorScheme.onPrimary),
                          Text('21.11.2023',
                              style: themeData(context).textTheme.titleSmall),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 10),
                      child: Row(
                        children: [
                          Icon(Icons.lock_clock,
                              color: themeData(context).colorScheme.onPrimary),
                          Text('14:00 - 21:00',
                              style: themeData(context).textTheme.titleSmall),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            color: themeData(context).colorScheme.onPrimary),
                        Text('Fraktal/Istanbul',
                            style: themeData(context).textTheme.titleSmall),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
