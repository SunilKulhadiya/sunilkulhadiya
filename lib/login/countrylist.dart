import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sunilkulhadiya/modules/country_list_module.dart';
import 'package:sunilkulhadiya/screens/get_mobile_no.dart';

class CountryList extends StatefulWidget {
  final String UsetType;
  final BuildContext context;

  const CountryList({super.key,
    required this.UsetType,
    required this.context});

  @override
  State<CountryList> createState() => CreateSList();
}
class CreateSList extends State<CountryList>{
  List<CountryListModule> CountryList = [];
  ScrollController LVcontroller = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchCountryList();
  }

  //--------------------------
  Future<void> fetchCountryList() async {
    var response = await
    http.get(Uri.parse("https://studylancer.yuktidea.com/api/countries"),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        }
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> mapData = json.decode(response.body);
      List jsonData = mapData.values.toList();
      jsonData = jsonData[2];
      for(var dta in jsonData){
        CountryListModule ndata =  CountryListModule(
            Id: dta["id"],
            Country: dta["name"], Code: dta["code"],
            Tel_Code: dta["tel_code"],
            Flage: dta["flag"]);
        setState(() {
          CountryList.add(ndata);
        });
      }
    }
  }
  //--------------------------
  @override
  Widget build(BuildContext context) {
    final double DW = MediaQuery.of(context).size.width;
    final double DH = MediaQuery.of(context).size.height;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: fetchCountryList,
        child: Container(
          width: DW,
          height: DH,
          color: HexColor("#292929"),
          child: SafeArea(
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
                        margin: EdgeInsets.fromLTRB(0, 10, DW * 0.8, 0),
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
                  Container(
                    child: Text("Select your country",
                      style: TextStyle(color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400),),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    width: DW * 0.9,
                    height: DH * 0.08,
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: HexColor("#4B4E4F"),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    alignment: Alignment.centerLeft,

                        child: Row(
                          children: [
                            Container(
                              child: Icon(Icons.search, size: 30, color: HexColor("#D9896A"),),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(7, 0, 0, 0),
                              child: Text("Search", style: TextStyle(color: Colors.white),),
                            ),
                          ],
                        )
                  ),
                  Container(
                    width: DW,
                    height: DH * 0.75,

                    child: ListView(
                      children: [
                        Container(
                            height: DH * 0.75,
                            width: DW,
                            child: ListView.builder(
                              controller: LVcontroller,
                              itemCount: CountryList.isEmpty ? 0 : CountryList.length,
                              itemBuilder: (BuildContext context, int index) =>

                              Container(
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                    GetMobileNo(UsetType: widget.UsetType,
                                    SelectedCountryId: (CountryList[index].Id).toString(),
                                    SelectedCountryFlage: CountryList[index].Flage,
                                    SelectedCountryCode: CountryList[index].Tel_Code,
                                    context: context)));
                                  },
                                child: Container(
                                    width: DW * 0.95,
                                    height: DH * 0.1,
                                    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: HexColor("#272727"),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    key: UniqueKey(),
                                    child: Container(
                                        key: new PageStorageKey(
                                          "keydata$index",
                                        ),

                                        child: Row(
                                          children: [
                                            Container(
                                              width: DH * 0.08,
                                              height: DH * 0.08,
                                              child: SvgPicture.network(CountryList[index].Flage),
                                            ),
                                            Container(
                                              width: DW * 0.6,
                                              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                              child: Text(CountryList[index].Country,
                                                style: TextStyle(fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),),
                                            ),
                                            Container(
                                              child: Text(CountryList[index].Tel_Code,
                                                style: TextStyle(fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),),
                                            ),
                                          ],
                                        )
                                    ),
                                  ),
                                )
                              )




                              )
                          )
                        ]
                    )

                  ),
                ],
              )
          ),
        ),
      ),
    );
  }

} //CreateSList