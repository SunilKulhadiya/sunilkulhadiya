import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';

import 'package:sunilkulhadiya/startup_screens/startup_screen.dart';

class Welcome_Screen extends StatefulWidget {
  final String UsetType;
  final String SelectedCountryId;
  final String SelectedCountryFlage;
  final String SelectedCountryCode;
  final BuildContext context;

  const Welcome_Screen({super.key,
    required this.UsetType,
    required this.SelectedCountryId,
    required this.SelectedCountryFlage,
    required this.SelectedCountryCode,
    required this.context});

  @override
  State<Welcome_Screen> createState() => CreateSList();
}

class CreateSList extends State<Welcome_Screen>{

  var TEXTmobileNo = "";
  final MobileNoController = TextEditingController();

  void MobilNoChanged() {
    setState(() {
      TEXTmobileNo = MobileNoController.text;
    });
  }
  //--------------------------
  Future<void> LogOut() async {
    // var body = {
    //   "tel_code": widget.SelectedCountryCode,
    //   "phone": TEXTmobileNo,
    // };
    // var jsonBody = json.encode(body);

    // you can replace your api link with this link
    var response = await
    http.post(Uri.parse("https://studylancer.yuktidea.com/api/logout"),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        }
    );
    print("------------------response.body : ${response.body}");
    if (response.statusCode == 200) {
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("You are successfully loged out",
          style: TextStyle(color: Colors.black),),
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
        backgroundColor: Colors.white,
      ),
    );

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const StartupScreen()),
            (Route route) => false);
  }
  //--------------------------
  Future<void> AcDelete() async {
    // var body = {
    //   "tel_code": widget.SelectedCountryCode,
    //   "phone": TEXTmobileNo,
    // };
    // var jsonBody = json.encode(body);

    // you can replace your api link with this link
    var response = await
    http.post(Uri.parse("https://studylancer.yuktidea.com/api/delete"),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        }
    );
    print("------------------response.body : ${response.body}");
    if (response.statusCode == 200) {
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 80,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Text(
                "Account successfully deleted",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),

        )
      ),
    );
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const StartupScreen()),
            (Route route) => false);
  }
  //--------------------------
  @override
  Widget build(BuildContext context) {
    final double DW = MediaQuery.of(context).size.width;
    final double DH = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: DW,
        color: HexColor("#292929"),
        child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, DH * 0.37, 0, 0),
                  alignment: Alignment.center,
                  child: Text("Welcome",
                    style: TextStyle(color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400),),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, DH * 0.03, 0, 0),
                  child: GestureDetector(
                    onTap: (){
                      LogOut();
                    },
                    child: Container(
                      height: DW / 8,
                      margin: EdgeInsets.fromLTRB(DW * 0.35, DH * 0.01, DW * 0.35, 0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: HexColor("#212426"),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Text("Logout", style: TextStyle(
                          color: HexColor("#F9D3B4"),
                          fontWeight: FontWeight.w400,
                          fontSize: 18
                      ),),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, DH * 0.01, 0, 0),
                  child: GestureDetector(
                    onTap: (){
                      AcDelete();
                    },
                    child: Container(
                      height: DW / 8,
                      margin: EdgeInsets.fromLTRB(DW * 0.3, DH * 0.015, DW * 0.3, 0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: HexColor("#212426"),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Text("Delete User", style: TextStyle(
                          color: HexColor("#F9D3B4"),
                          fontWeight: FontWeight.w400,
                          fontSize: 18
                      ),),
                    ),
                  ),
                ),
              ),

            ]
        ),
      ),
    );
  }
} //CreateSList