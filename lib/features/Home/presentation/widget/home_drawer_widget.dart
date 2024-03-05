import 'package:bsppl/Utils/commonClass/user_info.dart';
import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_font.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/text_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/Utils/loader/dotted_loader.dart';
import 'package:bsppl/features/Home/domain/bloc/home_bloc.dart';
import 'package:bsppl/features/Home/domain/model/drawer_model.dart';
import 'package:bsppl/features/Home/presentation/widget/logout_widget.dart';
import 'package:bsppl/features/Login/domain/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDrawerWidget extends StatelessWidget {
  HomeDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
  builder: (context, state) {
    if(state is FetchHomeDataState) {
      return  Container(
        color: AppColor.white,
        width: MediaQuery.of(context).size.width/1.5,
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        child: ListView(
          children: [
            _header(context: context),
            const Divider(),
            _listBuilder(dataState: state),
            _changePassword(context: context),
            _logout(context: context),
          ],
          ),
        );
      }  else {
        return const Center(child: CenterLoaderWidget(),);
      }
  },
);
  }

  Widget _header({required BuildContext context}) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            Assets.appLogo,
            height: MediaQuery.of(context).size.width * 0.12,
            width: MediaQuery.of(context).size.width * 0.12,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.03,
        ),
        TextWidget("Purva",
          fontSize: AppFont.font_14,
        )
      ],
    );
  }

  Widget _listBuilder({required FetchHomeDataState dataState}) {
    return ListView.builder(
  //    scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: dataState.drawerList.length,
        itemBuilder: (context, index) {
        return _itemBuilder(context: context, drawerData: dataState.drawerList[index], index: index);
      });
  }

  Widget _itemBuilder({required BuildContext context, required DrawerModel drawerData, required int index}) {
    return GestureDetector(
      onTap: () {
        if(drawerData.sublist.isEmpty){
          Navigator.pop(context);
        }
        if(drawerData.isSelected == false){
          BlocProvider.of<HomeBloc>(context).add(HomeDrawerItemSelectedEvent(
              isSelected: true , index:  index, context: context));
        }
      },
      child: Padding(
        padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.02,
            bottom:  MediaQuery.of(context).size.width * 0.02),
        child: Column(
          children: [
            Row(
              children: [
                Icon(drawerData.icon, color: drawerData.isSelected == true ? AppColor.appBlueColor :AppColor.black,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                Expanded(
                  child: TextWidget(drawerData.label,
                    fontSize: AppFont.font_13,
                    color: drawerData.isSelected == true ? AppColor.appBlueColor :AppColor.black,
                    fontWeight: drawerData.isSelected == true ? FontWeight.w700 : FontWeight.w400,
                  ),
                ),

                Icon(drawerData.isSelected == true && drawerData.sublist.isNotEmpty  ?
                Icons.keyboard_arrow_down_sharp  : Icons.keyboard_arrow_right_sharp, color: AppColor.black,),
              ],
            ),
            drawerData.isSublistLoader == false
                || drawerData.isSublistLoader == null ?
            drawerData.sublist.isNotEmpty && drawerData.isSelected == true
                ? _subListBuilder(context: context, drawerData: drawerData, listIndex: index)
                : const SizedBox.shrink(): const DottedLoaderWidget(),
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
                  Navigator.of(context).pop();
                  BlocProvider.of<HomeBloc>(context).add(HomeDrawerItemSubListSelectedEvent(
                     isSelected: true, index: index, listIndex: listIndex
                  ));
                },
                child: Row(
                  children: [
                    Icon(Icons.circle,
                      size: MediaQuery.of(context).size.width * 0.03,
                      color: drawerData.sublist[index].isSelected == true ? AppColor.appBlueColor :AppColor.black,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Expanded(
                      child: TextWidget(drawerData.sublist[index].label.toString(),
                        fontSize: AppFont.font_12,
                        color: drawerData.sublist[index].isSelected  == true ? AppColor.appBlueColor : AppColor.black,
                      ),
                    ),

                    Icon( Icons.keyboard_arrow_right_sharp, color: AppColor.black,),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _changePassword({required BuildContext context}) {
    return Padding(
      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.02,
          bottom:  MediaQuery.of(context).size.width * 0.02),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
/*          Navigator.push(context,
              MaterialPageRoute(builder: (_) =>  const ChangePasswordPage()));*/
        },
        child: Row(
          children: [
            Icon(Icons.password_rounded, color: AppColor.black,),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
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
      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.02,
          bottom:  MediaQuery.of(context).size.width * 0.02),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => const LogoutWidget()
          );
        },
        child: Row(
          children: [
            Icon(Icons.logout, color: AppColor.black,),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            Text(AppString.logout,),
          ],
        ),
      ),
    );
  }
}
