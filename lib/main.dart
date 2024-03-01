import 'dart:developer';
import 'dart:io';

import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/routes/routes.dart';
import 'package:bsppl/Utils/routes/routes_name.dart';
import 'package:bsppl/features/Backfilling/domain/bloc/backfilling_bloc.dart';
import 'package:bsppl/features/Bending/domain/bloc/bending_bloc.dart';
import 'package:bsppl/features/ClearingGrading/domain/bloc/clearing_grading_bloc.dart';
import 'package:bsppl/features/Dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:bsppl/features/HDPE%20Duct/domain/bloc/hdpe_duct_bloc.dart';
import 'package:bsppl/features/Home/domain/bloc/home_bloc.dart';
import 'package:bsppl/features/HydroTesting/domain/bloc/hydro_test_bloc.dart';
import 'package:bsppl/features/InternetConnection/domain/bloc/network_bloc.dart';
import 'package:bsppl/features/IssueToContractor/domain/bloc/issue_to_contractor_bloc.dart';
import 'package:bsppl/features/JointCoating/domain/bloc/joint_bloc.dart';
import 'package:bsppl/features/Levelling/domain/bloc/levelling_bloc.dart';
import 'package:bsppl/features/Login/domain/bloc/login_bloc.dart';
import 'package:bsppl/features/Lower/domain/bloc/lower_bloc.dart';
import 'package:bsppl/features/OfcBlowing/domain/bloc/ofc_blowing_bloc.dart';
import 'package:bsppl/features/Radiography/domain/bloc/radiography_bloc.dart';
import 'package:bsppl/features/RouteHandOver/domain/bloc/route_hand_over_bloc.dart';
import 'package:bsppl/features/RouteSurvey/domain/bloc/route_survey_bloc.dart';
import 'package:bsppl/features/Stringing/domain/bloc/stringing_bloc.dart';
import 'package:bsppl/features/Trenching/domain/bloc/trenching_bloc.dart';
import 'package:bsppl/features/UT/domain/bloc/ut_bloc.dart';
import 'package:bsppl/features/Welding/domain/bloc/welding_bloc.dart';
import 'package:bsppl/features/YardReceiving/domain/bloc/yard_receiving_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => NetworkBloc()),
        BlocProvider(create: (BuildContext context) => LoginBloc()),
        BlocProvider(create: (BuildContext context) => HomeBloc()),
        BlocProvider(create: (BuildContext context) => DashboardBloc()),
        BlocProvider(create: (BuildContext context) => RouteSurveyBloc()),
        BlocProvider(create: (BuildContext context) => RouteHandOverBloc()),
        BlocProvider(create: (BuildContext context) => ClearingGradingBloc()),
        BlocProvider(create: (BuildContext context) => BendingBloc()),
        BlocProvider(create: (BuildContext context) => StringingBloc()),
        BlocProvider(create: (BuildContext context) => TrenchingBloc()),
        BlocProvider(create: (BuildContext context) => WeldingBloc()),
        BlocProvider(create: (BuildContext context) => RadioGraphyBloc()),
        BlocProvider(create: (BuildContext context) => UTBloc()),
        BlocProvider(create: (BuildContext context) => JointCoatingBloc()),
        BlocProvider(create: (BuildContext context) => BackfillingBloc()),
        BlocProvider(create: (BuildContext context) => LowerBloc()),
        BlocProvider(create: (BuildContext context) => LevellingBloc()),
        BlocProvider(create: (BuildContext context) => HydroTestBloc()),
        BlocProvider(create: (BuildContext context) => HdpeDuctBloc()),
        BlocProvider(create: (BuildContext context) => OfcBlowingBloc()),
        BlocProvider(create: (BuildContext context) => YardReceivingBloc()),
        BlocProvider(create: (BuildContext context) => IssueToContractorBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColor.appBlueColor,
          ),
        ),
        title: AppString.appName,
      //  home: QRViewExample(),
         initialRoute: RoutesName.splashView,
        onGenerateRoute: Routes.generateRoute,
        debugShowCheckedModeBanner: false,
      ),

    );
  }
}


class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testing QR Code"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.qr_code_scanner_outlined),
            onPressed: (){
              _buildQrView(context);
            },),

          if (result != null)
            Text(
               // 'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                'Barcode Type: ${describeIdentity(result!.format)}   Data: ${result!.code}')
          else
            const Text('Scan a code'),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(8),
                child: ElevatedButton(
                    onPressed: () async {
                      await controller?.toggleFlash();
                      setState(() {});
                    },
                    child: FutureBuilder(
                      future: controller?.getFlashStatus(),
                      builder: (context, snapshot) {
                        return Text('Flash: ${snapshot.data}');
                      },
                    )),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: ElevatedButton(
                    onPressed: () async {
                      await controller?.flipCamera();
                      setState(() {});
                    },
                    child: FutureBuilder(
                      future: controller?.getCameraInfo(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          return Text(
                              'Camera facing ${describeEnum(snapshot.data!)}');
                        } else {
                          return const Text('loading');
                        }
                      },
                    )),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () async {
                    await controller?.pauseCamera();
                  },
                  child: const Text('pause',
                      style: TextStyle(fontSize: 20)),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () async {
                    await controller?.resumeCamera();
                  },
                  child: const Text('resume',
                      style: TextStyle(fontSize: 20)),
                ),
              )
            ],
          ),

        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}