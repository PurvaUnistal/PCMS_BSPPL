import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/routes/routes.dart';
import 'package:bsppl/Utils/routes/routes_name.dart';
import 'package:bsppl/features/Backfilling/Engineer/domain/bloc/backfilling_bloc.dart';
import 'package:bsppl/features/Bending/Engineer/domain/bloc/bending_bloc.dart';
import 'package:bsppl/features/ClearingGrading/Engineer/domain/bloc/clearing_grading_bloc.dart';
import 'package:bsppl/features/Dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:bsppl/features/HDPE%20Duct/Engineer/domain/bloc/hdpe_duct_bloc.dart';
import 'package:bsppl/features/Home/domain/bloc/home_bloc.dart';
import 'package:bsppl/features/HydroTesting/Engineer/domain/bloc/hydro_test_bloc.dart';
import 'package:bsppl/features/InternetConnection/domain/bloc/network_bloc.dart';
import 'package:bsppl/features/IssueToContractor/Engineer/domain/bloc/issue_to_contractor_bloc.dart';
import 'package:bsppl/features/JointCoating/Engineer/domain/bloc/joint_bloc.dart';
import 'package:bsppl/features/Levelling/Engineer/domain/bloc/levelling_bloc.dart';
import 'package:bsppl/features/Login/domain/bloc/login_bloc.dart';
import 'package:bsppl/features/Lower/Engineer/domain/bloc/lower_bloc.dart';
import 'package:bsppl/features/OfcBlowing/Engineer/domain/bloc/ofc_blowing_bloc.dart';
import 'package:bsppl/features/PipeCoating/Engineer/domain/bloc/pipe_coating_bloc.dart';
import 'package:bsppl/features/Radiography/Engineer/domain/bloc/radiography_bloc.dart';
import 'package:bsppl/features/RouteHandOver/Engineer/domain/bloc/route_hand_over_bloc.dart';
import 'package:bsppl/features/RouteSurvey/Engineer/domain/bloc/route_survey_bloc.dart';
import 'package:bsppl/features/Stringing/Engineer/domain/bloc/stringing_bloc.dart';
import 'package:bsppl/features/Trenching/Engineer/domain/bloc/trenching_bloc.dart';
import 'package:bsppl/features/UT/Engineer/domain/bloc/ut_bloc.dart';
import 'package:bsppl/features/Welding/Engineer/domain/bloc/welding_bloc.dart';
import 'package:bsppl/features/YardReceiving/Engineer/domain/bloc/yard_receiving_bloc.dart';
import 'package:bsppl/qr_code_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        BlocProvider(create: (BuildContext context) => PipeCoatingBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColor.appBlueColor,
          ),
        ),
        title: AppString.appName,
     //  home: ScnnerPage(),
         initialRoute: RoutesName.splashView,
        onGenerateRoute: Routes.generateRoute,
        debugShowCheckedModeBanner: false,
      ),

    );
  }
}
class ScnnerPage extends StatefulWidget {
  const ScnnerPage({super.key});

  @override
  State<ScnnerPage> createState() => _ScnnerPageState();
}

class _ScnnerPageState extends State<ScnnerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: IconButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => QRViewExample()));

          },
icon: Icon(Icons.qr_code_scanner_outlined),
        ),
      ),
    );
  }
}
