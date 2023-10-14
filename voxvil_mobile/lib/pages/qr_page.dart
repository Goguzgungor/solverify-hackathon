import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:voxvil_mobile/core/base/base.state.dart';
import 'package:voxvil_mobile/core/constants/app_constant.dart';
import 'package:voxvil_mobile/core/memory/hive_boxes.dart';
import 'package:voxvil_mobile/core/memory/hive_manager.dart';
import 'package:voxvil_mobile/core/network/http_manager.dart';
import 'package:voxvil_mobile/pages/home_page.dart';

class QrReader extends StatefulWidget {
  const QrReader({Key? key}) : super(key: key);

  @override
  State<QrReader> createState() => _QrReaderState();
}

class _QrReaderState extends BaseState<QrReader> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String? result;
  QRViewController? controller;
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: themeData.colorScheme.secondary,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 250,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.stopCamera();
    controller.scannedDataStream.listen((scanData) async {
      if (scanData != '') {
        setState(() {
          result = scanData.code;
        });
        print(result);
        controller.stopCamera();
        List<String> splitResult = result.toString().split(' ');
        Map<String, dynamic> nftData = await getNftData();
        Map<String, dynamic> updateReqBody = {
          'mintAdress': nftData['mintAdress'],
          'companyName': nftData['companyName'],
          "password": "somepassword",
          "totalXp":
              (int.parse(nftData['metadata'][0]['value']) + 100).toString(),
          "writingXp": nftData['metadata'][1]['value'],
          "strategyXp": nftData['metadata'][2]['value'],
          "opsXp": nftData['metadata'][3]['value'],
          "designXp": nftData['metadata'][4]['value'],
          "devXp": nftData['metadata'][5]['value'],
          "videoXp": nftData['metadata'][6]['value'],
          "spendXp": nftData['metadata'][7]['value'],
        };
        await updateNft(updateReqBody);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<Map<String, dynamic>> getNftData() async {
    String userPubkey =
        HiveManager.instance.getMapFromBox(HiveBoxes.USER, publicKey);
    Map<String, dynamic> body = {
      "company_name": "SPT",
      "publicKey": userPubkey
    };
    Map<String, dynamic> req = await HttpManager.instance
        .getCompanysNftJsonRequest('getCompanyNft', body);

    return req['message'];
  }

  Future<Map<String, dynamic>> updateNft(Map<String, dynamic> body) async {
    Map<String, dynamic> req =
        await HttpManager.instance.getCompanysNftJsonRequest('updateNFT', body);

    return req['message'];
  }
}
