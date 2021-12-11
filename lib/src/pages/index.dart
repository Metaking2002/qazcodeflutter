//import 'package:flutter/material.dart';
//import 'package:permission_handler/permission_handler.dart';
//import './call.dart';
//
//class IndexPage extends StatefulWidget {
//  static String id = 'onboardasdsdaing';
//  @override
//  State<StatefulWidget> createState() {
//    return new IndexState();
//  }
//}
//
//class IndexState extends State<IndexPage> {
//  /// create a channelController to retrieve text value
//  final _channelController = TextEditingController();
//
//  /// if channel textfield is validated to have error
//  bool _validateError = false;
//
//  @override
//  void dispose() {
//    // dispose input controller
//    _channelController.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    double height = MediaQuery.of(context).size.height;
//    double width = MediaQuery.of(context).size.width;
//    return Scaffold(
//      backgroundColor: Colors.white,
//        appBar: AppBar(
//          title: Text('Поис каналов'),
//        ),
//        body: Center(
//          child: Column(
//            children: <Widget>[
//              Flexible(
//                child: Padding(
//                  padding:  EdgeInsets.all(width/10),
//                  child: Image.asset('assets/search.png'),
//                ),
//              ),
//
//              Container(
//                  padding: EdgeInsets.symmetric(horizontal: 20),
//                  height: height / 5,
//
//                  child: Column(
//                    children: <Widget>[
//                      Row(children: <Widget>[]),
//                      Row(children: <Widget>[
//                        Expanded(
//                            child: TextField(
//                          controller: _channelController,
//                          decoration: InputDecoration(
//                              errorText: _validateError
//                                  ? "Название канала обязательна"
//                                  : null,
//                              border: UnderlineInputBorder(
//                                  borderSide: BorderSide(width: 1)),
//                              hintText: 'Название сети'),
//                        ))
//                      ]),
//                      Padding(
//                          padding: EdgeInsets.symmetric(vertical: 20),
//                          child: Row(
//                            children: <Widget>[
//                              Expanded(
//                                child: RaisedButton(
//                                  onPressed: () => onJoin(),
//                                  child: Text("Войти", style: TextStyle(fontFamily: 'Montserrat'),),
//                                  color: Color(0xFF3D3868),
//                                  textColor: Colors.white,
//                                ),
//                              )
//                            ],
//                          ))
//                    ],
//                  )),
//            ],
//          ),
//        ));
//  }
//
//  onJoin() async {
//    // update input validation
//    setState(() {
//      _channelController.text.isEmpty
//          ? _validateError = true
//          : _validateError = false;
//    });
//    if (_channelController.text.isNotEmpty) {
//      // await for camera and mic permissions before pushing video page
//      await _handleCameraAndMic();
//      // push video page with given channel name
//      Navigator.push(
//          context,
//          MaterialPageRoute(
//              builder: (context) => new CallPage(
//                    channelName: _channelController.text,
//                  )));
//    }
//  }
//
//  _handleCameraAndMic() async {
//    await PermissionHandler().requestPermissions(
//        [PermissionGroup.camera, PermissionGroup.microphone]);
//  }
//}
