import 'package:faq_demo_flutter/CommonUtils/CommonMethods.dart';
import 'package:faq_demo_flutter/Controllers/FAQController.dart';
import 'package:faq_demo_flutter/Models/request/AddUpdateDeleteRequest.dart';
import 'package:faq_demo_flutter/Models/response/FaqListResponse.dart'
    as faqListResponse;
import 'package:faq_demo_flutter/Models/response/ModuleListResponse.dart';
import 'package:faq_demo_flutter/Views/AdminAddUpdateScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminFaqListScreen extends StatefulWidget {
  @override
  _AdminFaqListScreenState createState() => _AdminFaqListScreenState();
}

class _AdminFaqListScreenState extends State<AdminFaqListScreen> {
  late List<faqListResponse.Data> faqlist;
  late List<Data> moduleList;
  var defaultChoiceIndex;
  var faqController = Get.put(FaqController());
  bool _loading = true;
  TextEditingController searchController = new TextEditingController();
  List<faqListResponse.Data> _searchResult = [];

  @override
  void initState() {
    getFaqList();
    // TODO: implement initState
    super.initState();
  }

  void getFaqList() async {
    faqController.getFaqList().then((value) => {
          setState(() {
            print("INSIDE " + value.toString());

            faqlist = value.data!;
            // _loading = false;
            print("INSIDE " + faqlist.toString());
            getModuleList();
          })
        });
  }

  void getModuleList() async {
    faqController.getModuleList().then((value) => {
          setState(() {
            moduleList = value.data!.where((e) => e.appName == 'APMS').toList();
            moduleList.insert(
                0,
                Data(
                    id: 1000, appName: "APMS", moduleName: "All", status: "a"));
            // moduleList.add(Data(
            //     status: "a", moduleName: "All", appName: "APMS", id: 1000));
            _loading = false;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        endDrawer: Drawer(
            backgroundColor: Colors.white,
            width: width / 1.7,
            child: _loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Container(
                    height: height,
                    width: width,
                    color: Colors.white,
                    child: Column(children: [
                      Stack(
                        children: [
                          Expanded(
                            child: Container(
                              height: width / 6.5,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/faq_search_bg.jpg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  // height: 60,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: width / 20),
                                  color: Colors.white,
                                  child: ListTile(
                                    leading: new Icon(Icons.search),
                                    dense: true,
                                    title: new TextField(
                                      controller: searchController,
                                      decoration: new InputDecoration(
                                          hintText: 'Search',
                                          border: InputBorder.none),
                                      onChanged: onSearchTextChanged,
                                    ),
                                    trailing: new IconButton(
                                      icon: new Icon(Icons.cancel),
                                      onPressed: () {
                                        searchController.clear();
                                        onSearchTextChanged('');
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // ListTile(
                          //   leading: new Icon(Icons.search),
                          //   title: new TextField(
                          //     controller: searchController,
                          //     decoration: new InputDecoration(
                          //         hintText: 'Search', border: InputBorder.none),
                          //     onChanged: onSearchTextChanged,
                          //   ),
                          //   trailing: new IconButton(
                          //     icon: new Icon(Icons.cancel),
                          //     onPressed: () {
                          //       searchController.clear();
                          //       onSearchTextChanged('');
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 64, left: 64, top: 32),
                        child: Column(
                          children: [
                            /*Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 8,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: moduleList.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 8),
                                    child: ChoiceChip(
                                      labelPadding: EdgeInsets.all(4.0),
                                      label: Text(
                                        moduleList[index].moduleName!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                            color: Colors.black,
                                            fontSize: 14),
                                      ),
                                      selected: defaultChoiceIndex == index,
                                      selectedColor: Colors.white10,
                                      onSelected: (value) {
                                        setState(() {
                                          // _searchResult.clear();

                                          defaultChoiceIndex =
                                          value ? index : defaultChoiceIndex;
                                          */ /*_searchResult.isEmpty
                                        ? {*/ /*
                                          faqlist = faqController
                                              .faqListResponse.value.data!;
                                          // _searchResult = faqlist;

                                          moduleList[index].moduleName! == "All"
                                              ? faqlist
                                              : faqlist = faqlist
                                              .where((e) =>
                                          e.module ==
                                              moduleList[index]
                                                  .moduleName!)
                                              .toList();
                                          */ /* }
                                        : null;*/ /*
                                        });
                                      },
                                      // backgroundColor: color,
                                      elevation: 1,
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 4),
                                    ),
                                  );
                                }),
                          ),*/
                            _searchResult.length != 0 ||
                                    searchController.text.isNotEmpty
                                ? Column(
                                    children: [
                                      Text(
                                          "${_searchResult.length} Results Found"),
                                      Container(
                                        margin: EdgeInsets.only(top: 16),
                                        child: ListView.builder(
                                            itemCount: _searchResult.length,
                                            shrinkWrap: true,
                                            physics: ClampingScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return Theme(
                                                data: Theme.of(context)
                                                    .copyWith(
                                                        dividerColor:
                                                            Colors.transparent),
                                                child: Card(
                                                  elevation: 6,
                                                  child: ExpansionTile(
                                                    title: Text(_searchResult
                                                        .elementAt(index)
                                                        .question!),
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                            _searchResult
                                                                .elementAt(
                                                                    index)
                                                                .answer!,
                                                            textAlign: TextAlign
                                                                .start),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  )
                                : Container(
                                    margin: EdgeInsets.only(top: 16),
                                    child: faqlist.isNotEmpty
                                        ? ListView.builder(
                                            itemCount: faqlist.length,
                                            shrinkWrap: true,
                                            physics: ClampingScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return Theme(
                                                data: Theme.of(context)
                                                    .copyWith(
                                                        dividerColor:
                                                            Colors.transparent),
                                                child: Card(
                                                  margin: EdgeInsets.only(
                                                      bottom: 12),
                                                  elevation: 6,
                                                  child: ExpansionTile(
                                                    title: Text(faqlist
                                                        .elementAt(index)
                                                        .question!),
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                            faqlist
                                                                .elementAt(
                                                                    index)
                                                                .answer!,
                                                            textAlign: TextAlign
                                                                .start),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            })
                                        : const Text("No Data Available")),
                          ],
                        ),
                      )
                    ]),
                  ))),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Builder(
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: Text(
                      "FAQ",
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.w600),
                    ),
                  );
                },
              ),
              /* SizedBox(width: width / 100),
              Text(
                "LIST",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
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
        body: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                height: height,
                width: width,
                color: Colors.white,
                child: Column(children: [
                  Stack(
                    children: [
                      Expanded(
                        child: Container(
                          height: width / 6.5,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/faq_search_bg.jpg"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Center(
                            child: Container(
                              // height: 60,
                              margin:
                                  EdgeInsets.symmetric(horizontal: width / 20),
                              color: Colors.white,
                              child: ListTile(
                                leading: new Icon(Icons.search),
                                dense: true,
                                title: new TextField(
                                  controller: searchController,
                                  decoration: new InputDecoration(
                                      hintText: 'Search',
                                      border: InputBorder.none),
                                  onChanged: onSearchTextChanged,
                                ),
                                trailing: new IconButton(
                                  icon: new Icon(Icons.cancel),
                                  onPressed: () {
                                    searchController.clear();
                                    onSearchTextChanged('');
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // ListTile(
                      //   leading: new Icon(Icons.search),
                      //   title: new TextField(
                      //     controller: searchController,
                      //     decoration: new InputDecoration(
                      //         hintText: 'Search', border: InputBorder.none),
                      //     onChanged: onSearchTextChanged,
                      //   ),
                      //   trailing: new IconButton(
                      //     icon: new Icon(Icons.cancel),
                      //     onPressed: () {
                      //       searchController.clear();
                      //       onSearchTextChanged('');
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 64),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.only(top: 16),
                          child: GestureDetector(
                            onTap: () {
                              Get.off(AdminAddUpdateScreen(
                                isUpdate: false,
                              ));
                            },
                            child: Container(
                              height: width / 40,
                              width: width / 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: Colors.blue,
                                /*boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 80,
                                  offset: Offset(0, 10),
                                )
                              ]*/
                              ),
                              child: Center(
                                child: Text(
                                  "Add FAQ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 8,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: moduleList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(right: 8),
                                  child: ChoiceChip(
                                    labelPadding: EdgeInsets.all(4.0),
                                    label: Text(
                                      moduleList[index].moduleName!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              color: Colors.black,
                                              fontSize: 14),
                                    ),
                                    selected: defaultChoiceIndex == index,
                                    selectedColor: Colors.white10,
                                    onSelected: (value) {
                                      setState(() {
                                        // _searchResult.clear();

                                        defaultChoiceIndex =
                                            value ? index : defaultChoiceIndex;
                                        /*_searchResult.isEmpty
                                        ? {*/
                                        faqlist = faqController
                                            .faqListResponse.value.data!;
                                        // _searchResult = faqlist;

                                        moduleList[index].moduleName! == "All"
                                            ? faqlist
                                            : faqlist = faqlist
                                                .where((e) =>
                                                    e.module ==
                                                    moduleList[index]
                                                        .moduleName!)
                                                .toList();
                                        /* }
                                        : null;*/
                                      });
                                    },
                                    // backgroundColor: color,
                                    elevation: 1,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4),
                                  ),
                                );
                              }),
                        ),
                        _searchResult.length != 0 ||
                                searchController.text.isNotEmpty
                            ? Column(
                                children: [
                                  Text("${_searchResult.length} Results Found"),
                                  Container(
                                    margin: EdgeInsets.only(top: 16),
                                    child: ListView.builder(
                                        itemCount: _searchResult.length,
                                        shrinkWrap: true,
                                        physics: ClampingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return Theme(
                                            data: Theme.of(context).copyWith(
                                                dividerColor:
                                                    Colors.transparent),
                                            child: Card(
                                              elevation: 6,
                                              child: ExpansionTile(
                                                title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(_searchResult
                                                        .elementAt(index)
                                                        .question!),
                                                    Row(
                                                      children: [
                                                        GestureDetector(
                                                            onTap: () {
                                                              AddUpdateDeleteRequest
                                                                  deleteRequest =
                                                                  AddUpdateDeleteRequest(
                                                                      flag:
                                                                          "Delete",
                                                                      qid: _searchResult
                                                                          .elementAt(
                                                                              index)
                                                                          .qid!
                                                                          .toString(),
                                                                      publishDate:
                                                                          getCurrentDate(
                                                                              "yyyy-MM-dd"),
                                                                      status:
                                                                          "");
                                                              faqController
                                                                  .deleteFaq(
                                                                      deleteRequest)
                                                                  .then(
                                                                      (value) =>
                                                                          {
                                                                            faqController.getFaqList().then((value) =>
                                                                                {
                                                                                  setState(() {
                                                                                    print("INSIDE " + value.toString());

                                                                                    _searchResult = value.data!;
                                                                                    _loading = false;
                                                                                    print("INSIDE " + _searchResult.toString());
                                                                                  })
                                                                                })
                                                                          });
                                                            },
                                                            child: Icon(Icons
                                                                .delete_forever)),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        GestureDetector(
                                                            onTap: () {
                                                              Get.off(
                                                                  AdminAddUpdateScreen(
                                                                data: _searchResult
                                                                    .elementAt(
                                                                        index),
                                                                isUpdate: true,
                                                              ));
                                                            },
                                                            child: Icon(
                                                                Icons.edit)),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        _searchResult
                                                            .elementAt(index)
                                                            .answer!,
                                                        textAlign:
                                                            TextAlign.start),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              )
                            : Container(
                                margin: EdgeInsets.only(top: 16),
                                child: faqlist.isNotEmpty
                                    ? ListView.builder(
                                        itemCount: faqlist.length,
                                        shrinkWrap: true,
                                        physics: ClampingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return Theme(
                                            data: Theme.of(context).copyWith(
                                                dividerColor:
                                                    Colors.transparent),
                                            child: Card(
                                              margin:
                                                  EdgeInsets.only(bottom: 12),
                                              elevation: 6,
                                              child: ExpansionTile(
                                                title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(faqlist
                                                        .elementAt(index)
                                                        .question!),
                                                    Row(
                                                      children: [
                                                        GestureDetector(
                                                            onTap: () {
                                                              AddUpdateDeleteRequest
                                                                  deleteRequest =
                                                                  AddUpdateDeleteRequest(
                                                                      flag:
                                                                          "Delete",
                                                                      qid: faqlist
                                                                          .elementAt(
                                                                              index)
                                                                          .qid!
                                                                          .toString(),
                                                                      publishDate:
                                                                          getCurrentDate(
                                                                              "yyyy-MM-dd"),
                                                                      status:
                                                                          "");
                                                              faqController
                                                                  .deleteFaq(
                                                                      deleteRequest)
                                                                  .then(
                                                                      (value) =>
                                                                          {
                                                                            faqController.getFaqList().then((value) =>
                                                                                {
                                                                                  setState(() {
                                                                                    print("INSIDE " + value.toString());

                                                                                    faqlist = value.data!;
                                                                                    _loading = false;
                                                                                    print("INSIDE " + faqlist.toString());
                                                                                  })
                                                                                })
                                                                          });
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .delete_forever,
                                                              color: Colors.red,
                                                            )),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        GestureDetector(
                                                            onTap: () {
                                                              Get.off(
                                                                  AdminAddUpdateScreen(
                                                                data: faqlist
                                                                    .elementAt(
                                                                        index),
                                                                isUpdate: true,
                                                              ));
                                                            },
                                                            child: Icon(
                                                              Icons.edit,
                                                              color:
                                                                  Colors.green,
                                                            )),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        faqlist
                                                            .elementAt(index)
                                                            .answer!,
                                                        textAlign:
                                                            TextAlign.start),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        })
                                    : const Text("No Data Available")),
                      ],
                    ),
                  )
                ]),
              )));
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    _searchResult = faqlist
        .where((faq) =>
            faq.question
                .toString()
                .toLowerCase()
                .contains(text.toLowerCase()) ||
            faq.answer.toString().toLowerCase().contains(text.toLowerCase()))
        .toList();
    setState(() {});
  }
}
