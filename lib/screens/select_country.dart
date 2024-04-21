import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:sunilkulhadiya/screens/welcome_screen.dart';

class Select_Country extends StatefulWidget {
  final String UsetType;
  final String SelectedCountryId;
  final String SelectedCountryFlage;
  final String SelectedCountryCode;
  final BuildContext context;

  const Select_Country({super.key,
    required this.UsetType,
    required this.SelectedCountryId,
    required this.SelectedCountryFlage,
    required this.SelectedCountryCode,
    required this.context});

  @override
  State<Select_Country> createState() => CreateSList();
}

class CreateSList extends State<Select_Country>{

  var SelectCountryForStudy = "";
  var SelectCountryIDForStudy = "";

  //--------------------------
  Future<void> Proceed() async {
    var body = {
      "country_id": SelectCountryIDForStudy,
    };
    var jsonBody = json.encode(body);

    // you can replace your api link with this link
    var response = await
    http.post(Uri.parse("https://studylancer.yuktidea.com/api/select/country"),
        body: jsonBody,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        }
    );
    print("------------------response.body : ${response.body}");
    if (response.statusCode == 200) {
    }
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
                  margin: EdgeInsets.fromLTRB(10, DH * 0.05, DW * 0.86, 0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: DW / 10,
                      height: DW / 9,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Icon(Icons.arrow_back_ios, size: 30, color: Colors.white,),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Select Country",
                    style: TextStyle(color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400),),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(0, DH * 0.03, 0, 0),
                  child: Text("Please select the country where",
                    style: TextStyle(color: HexColor("#D9896A"),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.center,
                  child: Text("you want to study",
                    style: TextStyle(color: HexColor("#D9896A"),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                    width: DW * 0.93,
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(DW * 0.033, DH * 0.05, DW * 0.033, 0),
                    child: Row(
                      children: [
                        Container(
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.fromLTRB(29, 5, 0, 0),
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: HexColor("#272727"),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: SelectCountryIDForStudy == "21" ? Colors.grey : HexColor("#292929"),
                                          offset: Offset(0.0, 1.7), //(x,y)
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    child: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            SelectCountryForStudy = "Austrailia";
                                            SelectCountryIDForStudy = "21";
                                          });
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: SizedBox.fromSize(
                                            size: Size.fromRadius(68), // Image radius
                                            child: Image.asset('assets/images/Austrelia.png', fit: BoxFit.cover),
                                          ),
                                        )
                                    )
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(30, 10, 0, 0),
                                  child: Text("Australia", style: (
                                      TextStyle(fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white)),),
                                ),
                              ],
                            )
                        ),

                        Container(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(29, 5, 0, 0),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: HexColor("#272727"),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: SelectCountryIDForStudy == "22" ? Colors.grey : HexColor("#292929"),
                                        offset: Offset(0.0, 1.7), //(x,y)
                                        blurRadius: 6.0,
                                      ),
                                    ],
                                  ),
                                  child: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        SelectCountryForStudy = "Canada";
                                        SelectCountryIDForStudy = "22";
                                      });
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox.fromSize(
                                        size: Size.fromRadius(68), // Image radius
                                        child: Image.asset('assets/images/canada.png', fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(30, 10, 0, 0),
                                  child: Text("Canada", style: (
                                      TextStyle(fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white)),),
                                ),
                              ],
                            )
                        ),
                      ],
                    )
                ),
              ),
              SliverToBoxAdapter(
                    child: Container(
                      height: DW / 8,
                      margin: EdgeInsets.fromLTRB(DW * 0.3, DH * 0.2, DW * 0.3, 0),
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
                      child: GestureDetector(
                        onTap: (){
                          if(SelectCountryIDForStudy == ""){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Please select atleas one country"),
                                elevation: 10,
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(5),
                              ),
                            );
                          }else {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    Welcome_Screen(UsetType: "",
                                      SelectedCountryCode: "",
                                      SelectedCountryFlage: "",
                                      SelectedCountryId: "",
                                      context: context,)
                            ));
                          }
                        },
                        child: Text("Proceed", style: TextStyle(
                            color: HexColor("#F9D3B4"),
                            fontWeight: FontWeight.w400,
                            fontSize: 18
                        ),),
                      )
                    ),
                  ),
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text("Can’t see the country of your interest?", style: (
                      TextStyle(fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(0, DH * 0.03, 0, 0),
                  child: Text("Consult with us",
                    style: TextStyle(color: HexColor("#D9896A"),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),),
                ),
              ),

            ]
        ),
      ),
    );
  }
} //CreateSList