import 'dart:io';
import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/text_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ImgLayoutWidget extends StatelessWidget {
  final File file;
  final Function() onTapGallery;
  final Function() onTapCamera;
  const ImgLayoutWidget({super.key, required this.file, required this.onTapCamera, required this.onTapGallery});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/3,
      height:MediaQuery.of(context).size.width/3,
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
              enableDrag: true,
              isScrollControlled: true,
              context: context, builder: (BuildContext context){
            return  Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child:
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text('Choose One',textAlign: TextAlign.center,
                        style: TextStyle(color: AppColor.appBlueColor,fontSize: 18, fontWeight: FontWeight.bold),),
                    ),
                    TextButton(child: Text('Gallery'), onPressed: onTapGallery),
                    TextButton(child: Text('Camera',), onPressed: onTapCamera,),
                    ButtonWidget(
                      text: 'Dismiss',
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            );
          });
        },
        child: DottedBorder(
          color: AppColor.grey,
          strokeWidth: 1,
          child: file.path == "" ||file.path.isEmpty ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(child: Icon(Icons.photo_camera_back_outlined),),
              Padding(
                padding:  EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                child: TextWidget(
                  AppString.photo,
                  fontSize: 12,
                  color: AppColor.grey,),
              ),
            ],
          ):Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.file(
                    file,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width/3,
                    height: MediaQuery.of(context).size.width/4.5 ,
                  )
                ],
              ),
              Container(
                  width: MediaQuery.of(context).size.width/3,
                  height:MediaQuery.of(context).size.width/3,
                  color : Colors.white.withOpacity(0.6),
                  child: Center(child: Icon(Icons.refresh, color: AppColor.appBlueColor,))),

            ],
          ),
        ),
      ),
    );
  }
}
