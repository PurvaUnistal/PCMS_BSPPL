import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/features/Home/domain/bloc/home_bloc.dart';
import 'package:bsppl/features/Home/presentation/widget/tablet/header_widget.dart';
import 'package:bsppl/features/Home/presentation/widget/tablet/table_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabletHomeWidget extends StatefulWidget {
  const TabletHomeWidget({super.key});

  @override
  State<TabletHomeWidget> createState() => _TabletHomeWidgetState();
}

class _TabletHomeWidgetState extends State<TabletHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey[100],
        body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if(state is FetchHomeDataState){
                return Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width/3.5,
                        child: TabletDrawerWidget(dataState: state)),
                    Expanded(
                      flex: 1,
                      child: Column(
                          children: [
                            HeaderWidget(dataState: state),
                            Expanded(child: state.childWidget),
                          ]
                      ),
                    ),

                  ],
                );
              } else {
                return const Center(child: CenterLoaderWidget(),);
              }
            }
        )
    );
  }
}
