// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors, must_be_immutable, constant_identifier_names, camel_case_types

import 'package:add_data/repo.dart';
import 'package:flutter/material.dart';

enum SUBMIT_STATUS { SUCCESS, FAIL, NONE }

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SUBMIT_STATUS status = SUBMIT_STATUS.NONE;

  TextEditingController controller = TextEditingController();

  TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  TextEditingController controller3 = TextEditingController();

  @override
  Widget build(BuildContext context) {

    if(status!=SUBMIT_STATUS.NONE){
      Future.delayed(Duration(seconds: 3),(){
        setState(() {
          status=SUBMIT_STATUS.NONE;
        });
      });
    }

    return Scaffold(
      body: status == SUBMIT_STATUS.SUCCESS
          ? Center(
              child: Icon(Icons.check),
            )
          : status == SUBMIT_STATUS.FAIL
              ? Center(
                  child: Icon(Icons.close),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: 50),
                    margin: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text(
                          "Add Student",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            SizedBox(height: 30),
                            Container(
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 8,
                                        blurStyle: BlurStyle.outer)
                                  ]),
                              child: TextField(
                                controller: controller,
                                decoration: InputDecoration(
                                    hintText: "Name", border: InputBorder.none),
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      // ignore: prefer_const_literals_to_create_immutables
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 8,
                                            blurStyle: BlurStyle.outer)
                                      ]),
                                  child: TextField(
                                    controller: controller1,
                                    decoration: InputDecoration(
                                      hintText: "phoneno",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      // ignore: prefer_const_literals_to_create_immutables
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 8,
                                            blurStyle: BlurStyle.outer)
                                      ]),
                                  child: TextField(
                                    controller: controller2,
                                    decoration: InputDecoration(
                                        hintText: "Roll no",
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      // ignore: prefer_const_literals_to_create_immutables
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 8,
                                            blurStyle: BlurStyle.outer)
                                      ]),
                                  child: TextField(
                                    controller: controller3,
                                    decoration: InputDecoration(
                                        hintText: "Course",
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          width: 360,
                          child: ElevatedButton(
                            onPressed: () {
                              Repo.postData(controller.text, controller1.text,
                                      controller2.text, controller3.text)
                                  .then((response){
                                    print(response.data);
                                    if(response.data=="SUCCESS"){
                                      setState(() {
                                        status = SUBMIT_STATUS.SUCCESS;
                                      });
                                    }else{
                                      setState(() {
                                        status = SUBMIT_STATUS.FAIL;
                                      });
                                    }
                                  }).catchError((err){
                                      setState(() {
                                        status = SUBMIT_STATUS.FAIL;
                                      });
                                  });
                            },
                            child: Text("send"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
