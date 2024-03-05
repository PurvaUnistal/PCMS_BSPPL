import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/features/Dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:bsppl/features/Dashboard/presentation/widget/phone_dashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  @override
  void initState() {
    BlocProvider.of<DashboardBloc>(context).add(
        DashboardPageLoadEvent(context: context));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if(state is FetchDashboardDataState){
          return const PhoneDashboardWidget();
        } else {
          return const Center(child: CenterLoaderWidget());
        }
      },
    );
  }
}