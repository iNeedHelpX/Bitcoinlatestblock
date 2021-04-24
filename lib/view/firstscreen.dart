import 'dart:convert';
import 'dart:async';
import 'package:btclatestblock/API/apicall.dart';
import 'package:btclatestblock/model/colors.dart';
import 'package:btclatestblock/model/custombox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class StarWarsData extends StatefulWidget {
  @override
  StarWarsState createState() => StarWarsState();
}

class StarWarsState extends State<StarWarsData> {
  Map data = Map();
  late DateTime date = DateTime(2021);
  List userData = [];

  Future<ApiResponse> getSWData() async {
    var res = await http.get(
      Uri.https("blockchain.info", "/latestblock"),
    );
    data = json.decode(res.body);

    setState(() {
      userData = data[data];
    });
    date = DateTime.fromMillisecondsSinceEpoch(data['time'] * 1000);

    return ApiResponse.fromJson(jsonDecode(res.body));
  }

  @override
  void initState() {
    super.initState();

    getSWData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backdropper2,
        body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 200),
              CustomBox(
                  boomtitle: "BitCoin Latest Block",
                  title: "Hash:",
                  hash: data['hash'].toString(),
                  timetitle: "time: ",
                  time: date.toString(),
                  heighttitle: "height: ",
                  height: data['height'].toString(),
                  img: Image.asset('assets/bitcoin.png')),
              SizedBox(height: 25),
              Container(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Linkify(
                  onOpen: (link) async {
                    if (await canLaunch(link.url)) {
                      await launch(link.url);
                    } else {
                      throw 'Could not launch $link';
                    }
                  },
                  text:
                      "Buy BitCoin here: https://paxful.com/roots/buy-bitcoin/index?kiosk=AZ3Q3oqrQbE",
                  style: TextStyle(color: Colors.yellow, fontSize: 21),
                  linkStyle: TextStyle(fontSize: 22, color: backdropper3),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
