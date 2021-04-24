import 'package:btclatestblock/model/constants.dart';
import 'package:btclatestblock/model/gradient.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class CustomBox extends StatefulWidget {
  final String boomtitle;
  final String title;
  final String hash;
  final String timetitle;
  final String time;

  final String heighttitle;
  final String height;

  final Image img;

  CustomBox({
    Key? key,
    required this.boomtitle,
    required this.title,
    required this.hash,
    required this.timetitle,
    required this.time,
    required this.heighttitle,
    required this.height,
    required this.img,
  }) : super(key: key);

  @override
  _CustomBoxState createState() => _CustomBoxState();
}

class _CustomBoxState extends State<CustomBox> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 16, 15, 0),
            child: Container(
              padding: EdgeInsets.only(
                  left: 15,
                  top: Constants.avatarRadius,
                  right: Constants.padding,
                  bottom: Constants.padding),
              width: 450,
              margin: EdgeInsets.only(top: Constants.avatarRadius),
              decoration: _decor(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _boomTitle(),
                  _textTitle(),
                  _textHash(),
                  _textTimeTitle(),
                  _textTime(),
                  _textHeightTitle(),
                  _textHeight(),
                ],
              ),
            ),
          ),
          _buildAvatar(),
        ],
      ),
    );
  }

  BoxDecoration _decor() {
    return BoxDecoration(
        gradient: radGradient(),
        borderRadius: BorderRadius.circular(Constants.padding),
        boxShadow: [
          BoxShadow(
              color: Colors.black26, offset: Offset(11, 10), blurRadius: 10),
        ]);
  }

  Align _boomTitle() {
    return Align(
      alignment: Alignment.topCenter,
      child: Text(
        widget.boomtitle,
        textAlign: TextAlign.center,
        style:
            TextStyle(color: text7, fontSize: 24, fontWeight: FontWeight.w900),
      ),
    );
  }

  Align _textTitle() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        widget.title,
        textAlign: TextAlign.center,
        style:
            TextStyle(color: text6, fontSize: 20, fontWeight: FontWeight.w900),
      ),
    );
  }

  Align _textHash() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        widget.hash,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Align _textTimeTitle() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        widget.timetitle,
        textAlign: TextAlign.center,
        style:
            TextStyle(color: text6, fontSize: 20, fontWeight: FontWeight.w900),
      ),
    );
  }

  Align _textTime() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        widget.time,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Align _textHeightTitle() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        widget.heighttitle,
        textAlign: TextAlign.center,
        style:
            TextStyle(color: text6, fontSize: 20, fontWeight: FontWeight.w900),
      ),
    );
  }

  Align _textHeight() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        widget.height,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Positioned _buildAvatar() {
    return Positioned(
      left: 0,
      right: 0,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: Constants.avatarRadius,
        child: ClipRRect(
            //borderRadius: BorderRadius.all(Radius.circular(23)),
            child: Image.asset("assets/bitcoin.png")),
      ),
    );
  }
}
