import 'package:flutter/material.dart';
import 'package:voxvil_mobile/core/base/base.state.dart';

class CustomAppBar extends BaseStateless implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: SizedBox(
        width: width(context) - dynamicWidth(context, 40),
        height: dynamicHeight(context, 80),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: dynamicWidth(context, 220),
                height: dynamicHeight(context, 60),
                child: TextField(
                  style: themeData(context).textTheme.displaySmall,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20, top: 10),
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      fillColor: Color(0xff111C44),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(49)),
                          borderSide: BorderSide.none)),
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: const AssetImage(
                      'assets/person.png',
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Goktug Oguz',
                        style: themeData(context).textTheme.titleSmall,
                      ),
                    ],
                  )
                ],
              ),
            ]),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50.0);
}
