import 'package:bsppl/Utils/common_widget/app_color.dart';
import 'package:bsppl/Utils/common_widget/app_string.dart';
import 'package:bsppl/Utils/common_widget/button_widget.dart';
import 'package:bsppl/Utils/common_widget/dropdown_widget.dart';
import 'package:bsppl/Utils/common_widget/text_field_widget.dart';
import 'package:bsppl/Utils/loader/center_loader_widget.dart';
import 'package:bsppl/features/IssueToContractor/Engineer/domain/bloc/issue_to_contractor_bloc.dart';
import 'package:bsppl/features/IssueToContractor/Engineer/domain/bloc/issue_to_contractor_event.dart';
import 'package:bsppl/features/IssueToContractor/Engineer/domain/bloc/issue_to_contractor_state.dart';
import 'package:bsppl/features/IssueToContractor/Engineer/domain/model/section_name_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IssueToContractorPage extends StatefulWidget {
  const IssueToContractorPage({Key? key}) : super(key: key);

  @override
  State<IssueToContractorPage> createState() => _IssueToContractorPageState();
}

class _IssueToContractorPageState extends State<IssueToContractorPage> {

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<IssueToContractorBloc>(context).add(IssueToContractorPageLoadEvent(context: context));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.white,
      body: BlocBuilder<IssueToContractorBloc, IssueToContractorState>(
        builder: (context, state) {
          if(state is IssueToContractorFetchDataState) {
            return _itemBuilder(dataState: state);
          } else{
            return const Center(child: CenterLoaderWidget(),);
          }
        },
      ),
    );
  }

  Widget _itemBuilder({required IssueToContractorFetchDataState dataState}) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child : Column(
              children: [
                _verticalSpace(),
                _dateController(dataState: dataState),
                _verticalSpace(),
                _pipeBarCodeController(dataState: dataState),
                _verticalSpace(),
                _hotoController(dataState: dataState),
                _verticalSpace(),
                _selectSpreadDropDown(dataState: dataState),
                _verticalSpace(),
                _verticalSpace(),
                _button(),
              ],
            )
        )
    );
  }

  Widget _dateController({required IssueToContractorFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.date,
      hintText: AppString.date,
      controller: dataState.dateController,
      suffixIcon: Icon(Icons.calendar_today, color: AppColor.appBlueColor,),
      onTap: () {
        BlocProvider.of<IssueToContractorBloc>(context).add(
            SelectDateEvent(context: context,));
      },
    );
  }

  Widget _pipeBarCodeController({required IssueToContractorFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.pipeNo,
      controller: dataState.pipeBarCodeController,
      suffixIcon: IconButton(
        icon: Icon(Icons.qr_code_scanner_outlined, color: AppColor.appBlueColor,),
        onPressed: (){},
      ),
    );
  }




  Widget _hotoController({required IssueToContractorFetchDataState dataState}) {
    return TextFieldWidget(
      keyboardType: TextInputType.text,
      label: AppString.enterHoto,
      hintText: AppString.enterHoto,
      controller: dataState.hotoController,
    );
  }

  Widget _selectSpreadDropDown({required IssueToContractorFetchDataState dataState}) {
    return DropdownWidget<SectionNameModel>(
      label: AppString.selectSpread,
      hint: AppString.selectSpread,
      dropdownValue: dataState.sectionNameValue?.sectionName != null ? dataState.sectionNameValue : null,
      onChanged: (value) {
        BlocProvider.of<IssueToContractorBloc>(context).add(
            SelectSectionNameEvent(sectionNameValue: value));
      },
      items:dataState.sectionNameList,
    );
  }



  Widget _button() {
    //  return dataState.isLoader == false ?
    return ButtonWidget(
        text: AppString.submit,
        onPressed: () {
          //   BlocProvider.of<AddIssueToContractorBloc>(context).add(AddIssueToContractorSubmitDataEvent(context: context));
        }
    );
    //  ): const DottedLoaderWidget();
  }

  Widget _verticalSpace() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  }
}
