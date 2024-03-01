import 'package:bsppl/Utils/commonClass/enums.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/features/Backfilling/presentation/backfilling_page.dart';
import 'package:bsppl/features/Bending/presentation/bending_page.dart';
import 'package:bsppl/features/ClearingGrading/presentation/clearing_grading_page.dart';
import 'package:bsppl/features/Dashboard/presentation/page/dashboard_page.dart';
import 'package:bsppl/features/HDPE%20Duct/presentation/hdpe_duct_page.dart';
import 'package:bsppl/features/Hindrace/presentation/hindrance_page.dart';
import 'package:bsppl/features/Home/domain/model/drawer_model.dart';
import 'package:bsppl/features/HydroTesting/presentation/hydro_testing_page.dart';
import 'package:bsppl/features/IssueToContractor/presentation/issue_to_contractor_page.dart';
import 'package:bsppl/features/JointCoating/presentation/joint_coating_page.dart';
import 'package:bsppl/features/Levelling/presentation/levelling_page.dart';
import 'package:bsppl/features/Lower/presentation/lower_page.dart';
import 'package:bsppl/features/OFCBlowing/presentation/ofc_blowing_page.dart';
import 'package:bsppl/features/Radiography/presentation/radiography_page.dart';
import 'package:bsppl/features/RouteHandOver/presentation/route_handover_page.dart';
import 'package:bsppl/features/RouteSurvey/presentation/route_survey_page.dart';
import 'package:bsppl/features/Stringing/presentation/page/stringing_page.dart';
import 'package:bsppl/features/Trenching/presentation/page/trenching_page.dart';
import 'package:bsppl/features/UT/presentation/ut_page.dart';
import 'package:bsppl/features/Welding/presentation/page/welding_page.dart';
import 'package:bsppl/features/YardReceiving/presentation/yard_receiving_page.dart';
import 'package:flutter/material.dart';

class HomeHelper {


  static Future<dynamic> fetchDrawerList({required BuildContext context}) async {

    try{
       List<DrawerModel> drawerList = [];
       drawerList.add(DrawerModel(widget: const DashboardView(), icon: Icons.home_outlined,
           label: AppString.dashboard, sublist: [], isSelected: true));

       List<DrawerSubModel> systemAdminList = await fetchSystemAdminSubList();

       drawerList.add(DrawerModel(widget: const YardReceivingPage(), icon: Icons.yard_outlined,
           label: AppString.yardReceiving, sublist: [],  isSelected: false, actionButtonWidget: null));

       drawerList.add(DrawerModel(widget: const IssueToContractorPage(), icon: Icons.warning_amber_outlined,
           label: AppString.hoto, sublist: [],  isSelected: false, actionButtonWidget: null));

       drawerList.add(DrawerModel(widget: const RouteSurveyPage(), icon: Icons.alt_route_sharp,
           label: AppString.routeSurvey, sublist: [],  isSelected: false, actionButtonWidget: null));

       drawerList.add(DrawerModel(widget: const RouteHandOverPage(), icon: Icons.handshake_outlined,
           label: AppString.rouHandover, sublist: [],  isSelected: false, actionButtonWidget: null));

       drawerList.add(DrawerModel(widget: const ClearingGradingPage(), icon: Icons.auto_graph,
           label: AppString.clearingGrading, sublist: [],  isSelected: false, actionButtonWidget: null));

       drawerList.add(DrawerModel(widget: const BendingPage(), icon: Icons.webhook_rounded,
           label: AppString.bending, sublist: [],  isSelected: false, actionButtonWidget: null));

       drawerList.add(DrawerModel(widget: const StringingPage(), icon: Icons.stream,
           label: AppString.stringing, sublist: [],  isSelected: false, actionButtonWidget: null));

       drawerList.add(DrawerModel(widget: const TrenchingPage(), icon: Icons.comment_bank_outlined,
           label: AppString.trenChing, sublist: [],  isSelected: false, actionButtonWidget: null));

       drawerList.add(DrawerModel(widget: const WeldingPage(), icon: Icons.transgender_outlined,
           label: AppString.welding, sublist: [],  isSelected: false, actionButtonWidget: null));

       drawerList.add(DrawerModel(widget: const RadiographyPage(), icon: Icons.graphic_eq,
           label: AppString.radiography, sublist: [],  isSelected: false, actionButtonWidget: null));

       drawerList.add(DrawerModel(widget: const UTPage(), icon: Icons.cloud,
           label: AppString.ut, sublist: [],  isSelected: false, actionButtonWidget: null));

       drawerList.add(DrawerModel(widget: const JointCoatingPage(), icon: Icons.join_inner_outlined,
           label: AppString.jointCoating, sublist: [],  isSelected: false, actionButtonWidget: null));

       drawerList.add(DrawerModel(widget: const BackfillingPage(), icon: Icons.newspaper,
           label: AppString.backFilling, sublist: [],  isSelected: false, actionButtonWidget: null));

       drawerList.add(DrawerModel(widget: const LowerPage(), icon: Icons.insights,
           label: AppString.lower, sublist: [],  isSelected: false, actionButtonWidget: null));

       drawerList.add(DrawerModel(widget: const LevellingPage(), icon: Icons.file_present,
           label: AppString.levelling, sublist: [],  isSelected: false, actionButtonWidget: null));

       drawerList.add(DrawerModel(widget: const HydroTextingPage(), icon: Icons.fire_hydrant_alt_outlined,
           label: AppString.hydroTexting, sublist: [],  isSelected: false, actionButtonWidget: null));

       drawerList.add(DrawerModel(widget: const HdpeDuctPage(), icon: Icons.padding_outlined,
           label: AppString.hdpeDuct, sublist: [],  isSelected: false, actionButtonWidget: null));

       drawerList.add(DrawerModel(widget: const OfcBlowingPage(), icon: Icons.offline_share,
           label: AppString.ofcSplicing, sublist: [],  isSelected: false, actionButtonWidget: null));

       drawerList.add(DrawerModel(widget: const HindrancePage(), icon: Icons.hiking_outlined,
           label: AppString.hindrance, sublist: [],  isSelected: false, actionButtonWidget: null));

       return drawerList;
    }catch(e){
      return null;
    }
  }


  static Widget _rousurveyInsertAction({required BuildContext context}) {
    return Row(
      children: [
         IconButton(onPressed: () {
          /* BlocProvider.of<AddRouteSurveyBloc>(context).add(AddRouteSurveyPageLoadEvent(context: context));
           Navigator.push(context,
               MaterialPageRoute(builder: (_) => const  AddRouteSurveyPage()));*/
         }, icon: const Icon(Icons.add)),

        IconButton(onPressed: () {

        }, icon: const Icon(Icons.filter_alt_outlined)),
      ],
    );
  }

  static Widget _bendingActionWidget({required BuildContext context}) {
    return Row(
      children: [
        IconButton(onPressed: () {
        /*  BlocProvider.of<AddBendingBloc>(context).add(AddBendingPageLoadEvent(context: context));
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const  AddBendingPage()));*/
        }, icon: const Icon(Icons.add)),

        IconButton(onPressed: () {

        }, icon: const Icon(Icons.filter_alt_outlined)),
      ],
    );
  }

  static Widget _weldingActionButton({required BuildContext context}) {
    return Row(
      children: [
        IconButton(onPressed: () {
         /* BlocProvider.of<AddWeldingBloc>(context).add(AddWeldingPageLoadEvent(context: context));
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const  AddWeldingPage()));*/
        }, icon: const Icon(Icons.add)),

        IconButton(onPressed: () {

        }, icon: const Icon(Icons.filter_alt_outlined)),
      ],
    );
  }

  static Widget _backFillingActionWidget({required BuildContext context}) {
    return Row(
      children: [
        IconButton(onPressed: () {
        /*  BlocProvider.of<AddBackFillingBloc>(context).add(AddBackFillingPageLoadEvent(context: context));
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const  AddBackFillingPage()));*/
        }, icon: const Icon(Icons.add)),

        IconButton(onPressed: () {

        }, icon: const Icon(Icons.filter_alt_outlined)),
      ],
    );
  }


  static Widget _clearingGradingAction({required BuildContext context}) {
    return Row(
      children: [
        IconButton(onPressed: () {
         /* BlocProvider.of<AddClearingGradingBloc>(context).add(AddClearingGradingPageLoadEvent(context: context));
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const  AddClearingGradingPage()));*/
        }, icon: const Icon(Icons.add)),

        IconButton(onPressed: () {

        }, icon: const Icon(Icons.filter_alt_outlined)),
      ],
    );
  }

  static Widget _soilresistivityinsertActionWidget({required BuildContext context}) {
    return Row(
      children: [
        IconButton(onPressed: () {
         /* BlocProvider.of<AddSoilResistivityBloc>(context).add(AddSoilResistivityPageLoadEvent(context: context));
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const  AddSoilResistivityPage()));*/
        }, icon: const Icon(Icons.add)),

        IconButton(onPressed: () {

        }, icon: const Icon(Icons.filter_alt_outlined)),
      ],
    );
  }

  static Widget _rouHandoverActionWidget({required BuildContext context}) {
    return Row(
      children: [
        IconButton(onPressed: () {
         /* BlocProvider.of<AddRouHandoverBloc>(context).add(AddRouHandoverLoadEvent(context: context));
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const  AddRouHandoverPage()));*/
        }, icon: const Icon(Icons.add)),

        IconButton(onPressed: () {

        }, icon: const Icon(Icons.filter_alt_outlined)),
      ],
    );
  }

  static Widget _trenchingActionWidget({required BuildContext context}) {
    return Row(
      children: [
        IconButton(onPressed: () {
        /*  BlocProvider.of<AddTrenChingBloc>(context).add(AddTrenChingPageLoadEvent(context: context));
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const  AddTrenChingPage()));*/
        }, icon: const Icon(Icons.add)),

        IconButton(onPressed: () {

        }, icon: const Icon(Icons.filter_alt_outlined)),
      ],
    );
  }

  static Widget _stringingActionWidget({required BuildContext context}) {
    return Row(
      children: [
        IconButton(onPressed: () {
         /* BlocProvider.of<AddStringingBloc>(context).add(AddStringingPageLoadEvent(context: context));
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const  AddStringingPage()));*/
        }, icon: const Icon(Icons.add)),

        IconButton(onPressed: () {

        }, icon: const Icon(Icons.filter_alt_outlined)),
      ],
    );
  }

  static Future<dynamic> fetchSystemAdminSubList() async {

    try{
      List<DrawerSubModel> drawerSubList = [];
      drawerSubList.add(DrawerSubModel(
        label: 'Add User',
        widget: Container(),
        isSelected: false,
      ));

      drawerSubList.add(DrawerSubModel(
        label: 'Update User',
        widget: Container(),
        isSelected: false,
      ));

      drawerSubList.add(DrawerSubModel(
        label: 'Update Company',
        widget: Container(),
        isSelected: false,
      ));
      return drawerSubList;
    }catch(e){
      return null;
    }
  }

  static Future<dynamic> fetchAppBottomBarItems({required BuildContext context, 
            required RoleType appModule}) async {
     try{
       List<BottomNavigationBarItem> bottomNavigationBarItemList = [];

/*         if (appModule == RoleType.serviceCenter){
            bottomNavigationBarItemList.add(BottomNavigationBarItem(
              icon: const Icon(Icons.fire_truck_outlined,),
              label: AppString.running,
            ));
            bottomNavigationBarItemList.add(BottomNavigationBarItem(
              icon: const Icon(Icons.assignment_outlined,),
              label: AppString.assign,
            ));

            bottomNavigationBarItemList.add(BottomNavigationBarItem(
              icon: const Icon(Icons.person_pin,),
              label: AppString.profile,
            ));
          }*/

          return bottomNavigationBarItemList;
     }catch(e){
   //    SnackBarErrorWidget(context).show(message: "Bottom Bar Error");
       return null;
     }
  }

  static Future<dynamic> fetchPageWidgets({required BuildContext context,
    required RoleType appModule}) async {
    try{
      List<Widget> pageWidgetList = [];
      return pageWidgetList;
    }catch(e){
    //  SnackBarErrorWidget(context).show(message: "Page Widget Error");
      return null;
    }
  }

}