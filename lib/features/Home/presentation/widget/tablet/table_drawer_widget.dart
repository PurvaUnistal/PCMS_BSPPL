import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_font.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/text_widget.dart';
import 'package:bsppl/features/Home/domain/bloc/home_bloc.dart';
import 'package:bsppl/features/Home/domain/model/drawer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabletDrawerWidget extends StatelessWidget {
  final FetchHomeDataState dataState;
  const TabletDrawerWidget({super.key, required this.dataState});

  @override
  Widget build(BuildContext context) {
    return Container(
       color: AppColor.appCyanColor,
       height: MediaQuery.of(context).size.height,
       child: Padding(
         padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
         child: SingleChildScrollView(
           child: Column(
             children: [
               SizedBox(
                 height: MediaQuery.of(context).size.height * 0.02,
               ),
               _logo(context: context),
               SizedBox(
                 height: MediaQuery.of(context).size.height * 0.04,
               ),
               _listBuilder(dataState: dataState),
               _changePassword(context: context),
               _logout(context: context),
             ],
           ),
         ),
       ),
    );
  }

  Widget _logo({required BuildContext context}) {
    return Hero(
      tag: 'logo',
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
/*            Image.asset(
              AppIcon.appLogo,
            ),*/
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
              child: Image.asset(
                Assets.appLogo,
                width: MediaQuery.of(context).size.width * 0.13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listBuilder({required FetchHomeDataState dataState}) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dataState.drawerList.length,
        itemBuilder: (context, index) {
          return _itemBuilder(context: context, drawerData: dataState.drawerList[index], index: index);
        });
  }

  Widget _itemBuilder({required BuildContext context, required DrawerModel drawerData, required int index}) {
    return GestureDetector(
      onTap: () {
        if(drawerData.isSelected == false){
          BlocProvider.of<HomeBloc>(context).add(HomeDrawerItemSelectedEvent(
              isSelected: true , index:  index, context: context));
        }
      },
      child: Padding(
        padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.01,
            bottom:  MediaQuery.of(context).size.width * 0.01),
        child: Column(
          children: [
            Row(
              children: [
                Icon(drawerData.icon, color: drawerData.isSelected == true ? AppColor.white :AppColor.black,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.008,
                ),
                Expanded(
                  child: TextWidget(drawerData.label,
                    fontSize: AppFont.font_13,
                    color: drawerData.isSelected == true ? AppColor.white :AppColor.black,
                    fontWeight: drawerData.isSelected == true ? FontWeight.w700 : FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Icon(drawerData.isSelected == true && drawerData.sublist.isNotEmpty  ?
                Icons.keyboard_arrow_down_sharp  : Icons.keyboard_arrow_right_sharp, color: AppColor.black,),
              ],
            ),
            drawerData.sublist.isNotEmpty && drawerData.isSelected == true
                ? _subListBuilder(context: context, drawerData: drawerData, listIndex: index)
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget _subListBuilder({required BuildContext context, required DrawerModel drawerData, required int listIndex}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: drawerData.sublist.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () {
               /*   Navigator.of(context).pop();*/
                  BlocProvider.of<HomeBloc>(context).add(HomeDrawerItemSubListSelectedEvent(
                      isSelected: true, index: index, listIndex: listIndex
                  ));
                },
                child: Row(
                  children: [
                    Icon(Icons.circle,
                      size: MediaQuery.of(context).size.height * 0.03,
                      color: drawerData.sublist[index].isSelected == true ? AppColor.white :AppColor.black,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Expanded(
                      child: TextWidget(drawerData.sublist[index].label.toString(),
                        fontSize: AppFont.font_12,
                        color: drawerData.sublist[index].isSelected  == true ? AppColor.white : AppColor.black,
                      ),
                    ),

                    //Icon( Icons.keyboard_arrow_right_sharp, color: AppColor.black,),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _changePassword({required BuildContext context}) {
    return Padding(
      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.01,
          bottom:  MediaQuery.of(context).size.width * 0.01),
      child: GestureDetector(
        onTap: () {
          // Navigator.pop(context);
        },
        child: Row(
          children: [
            Icon(Icons.password_rounded, color: AppColor.black,),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            TextWidget(AppString.changePassword,
              fontSize: AppFont.font_12,
            ),
          ],
        ),
      ),
    );
  }

  Widget _logout({required BuildContext context}) {
    return Padding(
      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.01,
          bottom:  MediaQuery.of(context).size.width * 0.01),
      child: GestureDetector(
        onTap: () {
         /* showModalBottomSheet(
              context: context,
              builder: (context) => const LogoutWidget()
          );*/
        },
        child: Row(
          children: [
            Icon(Icons.logout, color: AppColor.black,),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            TextWidget(AppString.logout,
              fontSize: AppFont.font_12,
            ),
          ],
        ),
      ),
    );
  }
}
