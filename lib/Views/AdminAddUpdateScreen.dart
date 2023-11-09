import 'package:faq_demo_flutter/CommonUtils/CommonMethods.dart';
import 'package:faq_demo_flutter/Controllers/FAQController.dart';
import 'package:faq_demo_flutter/Models/request/AddUpdateDeleteRequest.dart';
import 'package:faq_demo_flutter/Models/response/FaqListResponse.dart'
    as faqListResponse;
import 'package:faq_demo_flutter/Views/AdminFaqListScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/response/ModuleListResponse.dart';

class AdminAddUpdateScreen extends StatefulWidget {
  final faqListResponse.Data? data;
  final bool isUpdate;

  const AdminAddUpdateScreen({super.key, required this.isUpdate, this.data});

  @override
  State<AdminAddUpdateScreen> createState() => _AdminAddUpdateScreenState();
}

class _AdminAddUpdateScreenState extends State<AdminAddUpdateScreen> {
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();
  var faqController = Get.put(FaqController());
  late List<Data> moduleList;
  late List<String> moduleNames;
  var _selectedValue;
  bool _loading = true;
  bool questionValidate = false;
  bool answerValidate = false;

  @override
  void initState() {
    // TODO: implement initState
    // faqController.getModuleList().then((value) => {
    //       setState(() {
    //         print("INSIDE Modules" + value.data![0].appName!);
    //
    //         moduleList = value.data!.where((e) => e.appName == 'APMS').toList();
    //       })
    //     });

    faqController.getModuleList().then((value) => {
          setState(() {
            print("INSIDE Modules" + value.data![0].appName!);

            moduleList = value.data!.where((e) => e.appName == 'APMS').toList();
            widget.isUpdate
                ? {
                    questionController.text = widget.data!.question!,
                    answerController.text = widget.data!.answer!,
                    _selectedValue = moduleList
                        .where((element) =>
                            element.moduleName == widget.data!.module)
                        .first
                  }
                : null;
            _loading = false;
          })
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "FAQ",
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            /*SizedBox(width: width / 100),
            Text(
              "LIST",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )*/
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.share)),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          width: width / 2,
          margin: EdgeInsets.symmetric(horizontal: 32),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: questionController,
                  maxLength: 500,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Question',
                    hintText: 'Question',
                    errorText:
                        questionValidate ? 'Question Can\'t Be Empty' : null,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: TextField(
                    maxLines: 4,
                    maxLength: 1000,
                    controller: answerController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Answer',
                      errorText:
                          answerValidate ? 'Answer Can\'t Be Empty' : null,
                    ),
                  ),
                ),
                _loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Row(
                        children: [
                          Text("Choose Module : "),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<Data>(
                                hint: Text('Select'),
                                value: _selectedValue,
                                items: moduleList.map((Data value) {
                                  return DropdownMenuItem<Data>(
                                    value: value,
                                    child: Text(value.moduleName!,
                                        style:
                                            (TextStyle(color: Colors.black))),
                                  );
                                }).toList(),
                                onChanged: (Data? newValue) {
                                  setState(() {
                                    _selectedValue = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                Container(
                  margin: EdgeInsets.only(top: 48),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (questionController.text.isEmpty) {
                            // return "Quantity Can\'t Be Empty";
                            questionValidate = true;
                            setState(() {});
                            return;
                          }
                          if (answerController.text.isEmpty) {
                            // return "Quantity Can\'t Be Empty";
                            answerValidate = true;
                            setState(() {});
                            return;
                          }
                          if (_selectedValue == null) {
                            SnackBar(content: Text('Please Choose Module'));
                            setState(() {});
                            // showErrorSnackBar("Please Choose Gender");
                            return;
                          }

                          AddUpdateDeleteRequest addRequest;
                          widget.isUpdate
                              ? addRequest = AddUpdateDeleteRequest(
                                  flag: "Update",
                                  answer: answerController.value.text,
                                  createdBy: "V14514",
                                  module: _selectedValue.moduleName,
                                  question: questionController.value.text,
                                  status: "i",
                                  publishDate: widget.data!.publishDate,
                                  qid: widget.data!.qid.toString())
                              : addRequest = AddUpdateDeleteRequest(
                                  flag: "Insert",
                                  answer: answerController.value.text,
                                  createdBy: "V14514",
                                  module: _selectedValue.moduleName,
                                  question: questionController.value.text,
                                  status: "i",
                                  publishDate: getCurrentDate("yyyy-MM-dd"),
                                  qid: "0");
                          faqController.addNewFaq(addRequest).then((value) => {
                                Get.off(AdminFaqListScreen())
                                /* faqController
                                                                .getFaqList()
                                                                .then((value) => {
                                                                      setState(() {
                                                                        print("INSIDE " +
                                                                            value
                                                                                .toString());

                                                                        faqlist = value;
                                                                        _loading = false;
                                                                        print("INSIDE " +
                                                                            faqlist
                                                                                .toString());
                                                                      })
                                                                    })*/
                              });
                        },
                        child: Container(
                          height: width / 35,
                          width: width / 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: Colors.blue,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                )
                              ]),
                          child: Center(
                            child: Text(
                              "Draft",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (questionController.text.isEmpty) {
                            // return "Quantity Can\'t Be Empty";
                            questionValidate = true;
                            setState(() {});
                            return;
                          }
                          if (answerController.text.isEmpty) {
                            // return "Quantity Can\'t Be Empty";
                            answerValidate = true;
                            setState(() {});
                            return;
                          }
                          if (_selectedValue == null) {
                            const SnackBar(
                                content: Text('Please Choose Module'));
                            setState(() {});
                            // showErrorSnackBar("Please Choose Gender");
                            return;
                          }

                          AddUpdateDeleteRequest addRequest;
                          widget.isUpdate
                              ? addRequest = AddUpdateDeleteRequest(
                                  flag: "Update",
                                  answer: answerController.value.text,
                                  createdBy: "V14514",
                                  module: _selectedValue.moduleName,
                                  question: questionController.value.text,
                                  status: "a",
                                  publishDate: widget.data!.publishDate,
                                  qid: widget.data!.qid.toString())
                              : addRequest = AddUpdateDeleteRequest(
                                  flag: "Insert",
                                  answer: answerController.value.text,
                                  createdBy: "V14514",
                                  module: _selectedValue.moduleName,
                                  question: questionController.value.text,
                                  status: "a",
                                  publishDate: getCurrentDate("yyyy-MM-dd"),
                                  qid: "0");

                          faqController.addNewFaq(addRequest).then((value) => {
                                Get.off(AdminFaqListScreen())
                                /* faqController
                                                                .getFaqList()
                                                                .then((value) => {
                                                                      setState(() {
                                                                        print("INSIDE " +
                                                                            value
                                                                                .toString());

                                                                        faqlist = value;
                                                                        _loading = false;
                                                                        print("INSIDE " +
                                                                            faqlist
                                                                                .toString());
                                                                      })
                                                                    })*/
                              });
                        },
                        child: Container(
                          height: width / 35,
                          width: width / 10,
                          margin: EdgeInsets.only(left: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: Colors.blue,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                )
                              ]),
                          child: Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
