import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_font.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/text_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/features/Home/domain/bloc/home_bloc.dart';
import 'package:bsppl/features/Home/presentation/widget/home_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneHomeWidget extends StatefulWidget {
  const PhoneHomeWidget({super.key});

  @override
  State<PhoneHomeWidget> createState() => _PhoneHomeWidgetState();
}

class _PhoneHomeWidgetState extends State<PhoneHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: HomeDrawerWidget(),
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: AppColor.white),
          title:BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if(state is FetchHomeDataState){
                  return TextWidget(state.title,
                    color: AppColor.white, fontSize: AppFont.font_16, fontWeight: FontWeight.w700,);
                } else {
                  return TextWidget(AppString.appName,
                    color: AppColor.white, fontSize: AppFont.font_16, fontWeight: FontWeight.w700,);
                }
              }
          ),
          actions: [
            BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if(state is FetchHomeDataState){
                    return state.actionButtonWidget;
                  } else {
                    return const SizedBox.shrink();
                  }
                }
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[AppColor.appBlueColor, AppColor.appCyanColor]),
            ),
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if(state is FetchHomeDataState){
                return state.childWidget;
              } else {
                return const Center(child: CenterLoaderWidget(),);
              }
            }
        )
    );
  }
}
