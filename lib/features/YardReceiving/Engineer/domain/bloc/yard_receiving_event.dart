import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class YardReceivingEvent extends Equatable{}

class YardReceivingPageLoadEvent extends YardReceivingEvent{
  final BuildContext context;
  YardReceivingPageLoadEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectDateEvent extends YardReceivingEvent{
  final BuildContext context;
  SelectDateEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectYardNameEvent extends YardReceivingEvent{
  final dynamic yardNameValue;
  SelectYardNameEvent({ required this.yardNameValue});
  @override
  List<Object?> get props => [yardNameValue];
}

class SelectQrCodeScannerEvent extends YardReceivingEvent{
  final dynamic qrCodeScanner;
  SelectQrCodeScannerEvent({ required this.qrCodeScanner});
  @override
  List<Object?> get props => [qrCodeScanner];
}
