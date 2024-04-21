import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sunilkulhadiya/screens/otp_verify.dart';

class GetMobileNo extends StatefulWidget {
  final String UsetType;
  final String SelectedCountryId;
  final String SelectedCountryFlage;
  final String SelectedCountryCode;
  final BuildContext context;

  const GetMobileNo({super.key,
    required this.UsetType,
    required this.SelectedCountryId,
    required this.SelectedCountryFlage,
    required this.SelectedCountryCode,
    required this.context});

  @override
  State<GetMobileNo> createState() => CreateSList();
}
class CreateSList extends State<GetMobileNo>{
  var TEXTmobileNo = "";
  final MobileNoController = TextEditingController();

  @override
  void initState(){
    super.initState();
    MobileNoController.addListener(MobilNoChanged);
  }
  @override
  void dispose(){
    super.dispose();
    MobileNoController.dispose();
  }
  void MobilNoChanged() {
    setState(() {
      TEXTmobileNo = MobileNoController.text;
    });
  }

  //--------------------------
  Future<void> LoginGetOtp() async {
    var body = {
      "tel_code": widget.SelectedCountryCode,
      "phone": TEXTmobileNo,
    };
    var jsonBody = json.encode(body);

    // you can replace your api link with this link
    var response = await
    http.post(Uri.parse("https://studylancer.yuktidea.com/api/student/login"),
        body: jsonBody,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        }
    );
    print("------------------response.body : ${response.body}");
    if (response.statusCode == 200) {
      Map<String, dynamic> mapData = json.decode(response.body);
      List jsonData = mapData.values.toList();
      print("------------------jsonData : ${jsonData}");
      print("------------------jsonData : ${jsonData[2]}");
      jsonData = jsonData[2];
      for(var dta in jsonData){
        // CountryListModule ndata =  CountryListModule(
        //     Id: dta["id"],
        //     Country: dta["name"], Code: dta["code"],
        //     Tel_Code: dta["tel_code"],
        //     Flage: dta["flag"]);
        // setState(() {
        //   CountryList.add(ndata);
        // });
      }
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
                  child: Text("Enter phone number",
                    style: TextStyle(color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400),),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Please enter your 10 digit mobile",
                    style: TextStyle(color: HexColor("#D9896A"),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.center,
                  child: Text("number to receive OTP",
                    style: TextStyle(color: HexColor("#D9896A"),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),),
                ),
              ),
              SliverToBoxAdapter(
                  child: Container(
                    width: DH * 0.95,
                    height: DH * 0.08,
                    margin: EdgeInsets.fromLTRB(DW * 0.19, DH/4, 0, 0),
                    child: Row(
                    children: [
                    Container(
                    width: DH * 0.06,
                    height: DH * 0.06,
                    child: SvgPicture.network(widget.SelectedCountryFlage),
                    ),
                    Container(
                    margin: EdgeInsets.fromLTRB(DW * 0.04, 0, 0, 0),
                    child: Text(widget.SelectedCountryCode,
                    style: TextStyle(color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),),
                    ),
                    Container(
                    alignment: Alignment.centerLeft,
                    width: DW * 0.5,
                    height: DH * 0.05,
                    decoration: BoxDecoration(
                    ),
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextFormField(
                    controller: MobileNoController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration.collapsed(
                    hintText: 'Mobile No.',
                    hintStyle: TextStyle(color: HexColor("#656366")),
                    ),
                    style: TextStyle(color: HexColor("#7D7E80"),
                    fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  ],
                  )
                  ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  width: DW * 0.65,
                  margin: EdgeInsets.fromLTRB(23, 0, 23, 0),
                  child: Divider(
                  color: HexColor("#7D7E80"),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  child: GestureDetector(
                  onTap: (){
                    print("mobile : ${TEXTmobileNo}");
                    print("mobile : ${TEXTmobileNo.length}");
                    if(TEXTmobileNo.length == 10){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              OTP_Verfy(UsetType: widget.UsetType,
                                SelectedCountryCode: widget.SelectedCountryCode,
                                UserMobile: TEXTmobileNo,
                                SelectedCountryId: widget.SelectedCountryId,
                                context: context,)
                      ));
                    }else{
                        showDialog(
                            context: context,
                            builder: (context)
                          {
                            return AlertDialog(
                              title: Text("Error"),
                              content: Text('Please enter correct Mobile No.'),
                            );
                          }
                        );
                    }
                  },
                  child: Container(
                  width: DW / 3,
                  height: DW / 8,
                  margin: EdgeInsets.fromLTRB(10, DH * 0.2, 10, 0),
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
                  child: Text("Verify", style: TextStyle(
                  color: HexColor("#F9D3B4"),
                  fontWeight: FontWeight.w400,
                  fontSize: 18
                  ),),
                  ),
                  ),
                ),

              ),

          ],
        )
      ),
    );
  }

} //CreateSList