import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/text_widget.dart';
import 'package:bsppl/features/Home/domain/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneDashboardWidget extends StatefulWidget {
  const PhoneDashboardWidget({super.key,});

  @override
  State<PhoneDashboardWidget> createState() => _PhoneDashboardWidgetState();
}

class _PhoneDashboardWidgetState extends State<PhoneDashboardWidget> {
  final ScrollController listScrollController = ScrollController();

  @override
  void initState() {
    listScrollController.addListener(_scrollListener);
    super.initState();
  }
  _scrollListener() {
    FocusScope.of(context).requestFocus(FocusNode());
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if(state is FetchHomeDataState){
            return _listBuilder(dataState: state);
          } else {
            return const SizedBox.shrink();
          }
        }
    );
  }

  Widget _listBuilder({required FetchHomeDataState dataState}) {
    return Container(
       margin: const EdgeInsets.all(10.0),
       child:  ListView.builder(
           controller: listScrollController,
           keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
           itemCount: dataState.drawerList.length,
           itemBuilder: (context, index) {
           return index != 0 ?
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                 style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all(Colors.white),
                 ),
                   onPressed: () {
                     BlocProvider.of<HomeBloc>(context).add(HomeDrawerItemSelectedEvent(
                         isSelected: true , index:  index, context: context));
                   },
                   icon: Icon(dataState.drawerList[index].icon, color: AppColor.appBlueColor,),
                   label: TextWidget(dataState.drawerList[index].label),
           ),
              ),
            ) : const SizedBox.shrink();
       }),
    );
  }
}
