import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp( new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:<Widget>[
          Stack(
        children:[
          Container(
        height:300.0,
              color: Color(getColorHexFromStr('#fff5ea')),
    ),
          Column(
            children:<Widget> [
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 15.0),
                child: Material(
                  elevation: 10.0,
                    borderRadius:BorderRadius.circular(25.0),
                  child: TextFormField(
                    decoration:InputDecoration(
                      prefixIcon: Icon(Icons.search,color:Colors.black),
                      contentPadding: EdgeInsets.only(left:15.0, top:15.0),
                        hintText:"Search Food",
                        hintStyle:TextStyle(color: Colors.grey)
                    )
                  ),
                ),
              ),
              SizedBox(height:15.0),
              Padding(
              padding : EdgeInsets.only(left:15.0),
              child: Container(
                padding:EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  border: Border(left: BorderSide(
                          color: Colors.red,
                          style: BorderStyle.solid,
                          width: 10.0))),
                  child:Row(

                    children:[
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text('POPULAR MEALS',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Timesroman',
                          fontWeight: FontWeight.bold)),
                        SizedBox(height:5.0),
                Text('THIS WEEK',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Timesroman',
                        fontWeight: FontWeight.bold)),
                      ],
                      )
                    ],
                  ),
              ),
              ),
              Padding (
                padding:EdgeInsets.only(bottom: 15.0),
              ),
              Container(
                padding: EdgeInsets.only(top: 0.0,left:10.0),
                height: 125.0,
                width:500.0,
                color: Colors.red,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Widget_Mayai(),
                    SizedBox(width: 10.0),
                    Widget_ChapoNDengu(),
                    SizedBox(width: 10.0),
                    Widget_ChapoBeans(),
                    SizedBox(width: 10.0),


                  ],
                ),
              )
            ],
              )
        ]
    ),
          SizedBox(height: 15.0),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'TODAY:',
              style: TextStyle(
                  fontFamily: 'Timesroman',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 12.0, right: 12.0),
                child: Container(
                  height: 275.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(image: AssetImage('assets/ugali_pork.jpg'), fit: BoxFit.cover)
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    ),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 150.0, left: 60.0),
                  child: Column(
                    children: <Widget>[
                      Text('BEST OF',
                        style: TextStyle(
                            fontFamily: 'Timesroman',
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text('THE DAY',
                        style: TextStyle(
                            fontFamily: 'Timesroman',
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: 3.0,
                        width: 50.0,
                        color: Colors.orange,
                      )
                    ],
                  )
              )
            ],
          )
        ],
      ),
    );



  }
  Widget_Mayai(){
    return Container(
        height: 125.0,
        width:210.0,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
    color: Colors.white,
    ),
    child: Row(
    children: [
    Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12.0),
    image: DecorationImage(image: AssetImage('assets/ugali_mayai.jpg'),


    ),
    ),
    height:120.0,
    width:100,
    ),
    SizedBox(width: 20.0,),
    Column( mainAxisAlignment:MainAxisAlignment.center ,
    children: [
    Text('Ugali',
    style:  TextStyle(
    fontSize: 20.0,),),
    Text('Mayai',
    style: TextStyle(
    fontSize: 20.0,),),
    Container(
    height: 2.0,
    width:75.0,
    color:Colors.black,
    )


    ],

    )
    ],

    ),

    );

  }
  Widget_ChapoNDengu(){
    return Container(
      height: 125.0,
      width:210.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(image: AssetImage('assets/ugali_mayai.jpg'),


              ),
            ),
            height:120.0,
            width:100,
          ),
          SizedBox(width: 20.0,),
          Column( mainAxisAlignment:MainAxisAlignment.center ,
            children: [
              Text('Chapo',
                style:  TextStyle(
                  fontSize: 20.0,),),
              Text('Ndengu',
                style: TextStyle(
                  fontSize: 20.0,),),
              Container(
                height: 2.0,
                width:75.0,
                color:Colors.black,
              )


            ],

          )
        ],

      ),

    );

  }
  Widget_ChapoBeans(){
    return Container(
      height: 125.0,
      width:210.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(image: AssetImage('assets/ugali_mayai.jpg'),


              ),
            ),
            height:120.0,
            width:100,
          ),
          SizedBox(width: 20.0,),
          Column( mainAxisAlignment:MainAxisAlignment.center ,
            children: [
              Text('Chapo',
                style:  TextStyle(
                  fontSize: 20.0,),),
              Text('Beans',
                style: TextStyle(
                  fontSize: 20.0,),),
              Container(
                height: 2.0,
                width:75.0,
                color:Colors.black,
              )


            ],

          )
        ],

      ),

    );

  }


}
