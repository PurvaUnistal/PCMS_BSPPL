import 'package:bsppl/Utils/common_widget/app_bar_widget.dart';
import 'package:flutter/material.dart';

class QrCodeWidget extends StatefulWidget {
  const QrCodeWidget({super.key});

  @override
  State<QrCodeWidget> createState() => _QrCodeWidgetState();
}

class _QrCodeWidgetState extends State<QrCodeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "QR Code",
      ),

    );
  }
}
