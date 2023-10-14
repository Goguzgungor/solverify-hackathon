import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:voxvil_mobile/core/base/base.state.dart';
import 'package:voxvil_mobile/core/constants/app_constant.dart';
import 'package:voxvil_mobile/core/memory/hive_boxes.dart';
import 'package:voxvil_mobile/core/memory/hive_manager.dart';
import 'package:voxvil_mobile/core/network/http_manager.dart';
import 'package:voxvil_mobile/core/widgets/nft_card.dart';

class NftPage extends BaseStateless {
  const NftPage({super.key});

  @override
  Widget build(BuildContext context) {
    String userPubkey =
        HiveManager.instance.getMapFromBox(HiveBoxes.USER, publicKey) ?? '';
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FutureBuilder(
            future: HttpManager.instance.getNftJsonRequest(userPubkey),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.data!['data'] == null) {
                return const Center(child: Text('Kırık'));
              }
              return SizedBox(
                  height: dynamicHeight(context, dynamicHeight(context, 750)),
                  child: ListView.builder(
                    itemCount: snapshot.data!['data'].length,
                    itemBuilder: (context, index) {
                      print(snapshot.data!['data'][index]);
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: NftCard(snapshot.data!['data'][index]),
                      );
                    },
                  ));
            },
          )
        ],
      ),
    );
  }
}
