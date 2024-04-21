import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';


class Terms_Conditions extends StatefulWidget {
  final String WebUrl;
  final String Title;
  final BuildContext context;

  const Terms_Conditions({super.key,
    required this.WebUrl,
    required this.Title,
    required this.context});


  @override
  State<Terms_Conditions> createState() => CreateSList();
}
class CreateSList extends State<Terms_Conditions>{
  String TermsConditions = "";

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  //--------------------------
  Future<void> fetchProducts() async {
    var response = await
    http.get(Uri.parse("https://studylancer.yuktidea.com/api/terms-conditions"),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        }
    );
    print("--------------------Login : ${response.body}");
    print("--------------------T&C : ${response.statusCode}");
    //List<Map<String, dynamic>> map = [];
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      print("--------------------map : ${map}");
      print("--------------------Data : ${map["data"]["content"]}");
      setState(() {
        TermsConditions = map["data"]["content"];
      });
    }
  }

  //--------------------------
  @override
  Widget build(BuildContext context) {
    final double DW = MediaQuery.of(context).size.width;
    final double DH = MediaQuery.of(context).size.height;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: fetchProducts,
        child: Container(
          color: HexColor("#292929"),
          child: SafeArea(
              child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Container(
                            width: DW / 9,
                            height: DW / 9,
                            margin: EdgeInsets.fromLTRB(DW/1.3, 10, 10, 0),
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
                            child: Icon(Icons.close_rounded, size: 40, color: Colors.white,),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(DW/5.5, 20, 0, 0),
                      child: Row(
                        children: [
                          Container(
                            width: DW * 0.2,
                            height: DW * 0.25,
                            child: Image.asset("assets/images/doc.png",),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text("Terms of Service",
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,
                                      color: HexColor("#945439")),),
                                ),
                                Container(
                                  child: Text("update : 16/03/2023",
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,
                                      color: HexColor("#7D7E80")
                                    ),),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Html(data: TermsConditions,
                        style: {
                          "body": Style(
                            color: Colors.white,
                          ),
                          "h1": Style(
                              color: HexColor("#945439")
                          ),
                        },
                      ),
                    ),
                  ]
                ),
                ),
              ]
              ),
    ),
    ),
      ),
    );
  }

} //CreateSList