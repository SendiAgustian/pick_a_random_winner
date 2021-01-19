import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tagging/flutter_tagging.dart';
import 'package:pick_a_random_winner/Screens/winner_detail.dart';
import 'package:pick_a_random_winner/models/name_data.dart';
import 'package:pick_a_random_winner/utils/color_app_utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ParticipantsName> _participantsNameList = [];
  String _displayName, _selectedValuesJson = 'Nothing to show';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick a Random Winner"),
        centerTitle: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Text('*Penerima Voucher:',
                    style: TextStyle(
                      color: Color(0xffc4c4c4),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Container(
                padding: EdgeInsets.only(top: 15, left: 10, bottom: 20),
                child: FlutterTagging<ParticipantsName>(
                  initialItems: _participantsNameList,
                  textFieldConfiguration: TextFieldConfiguration(
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 15,
                        ),
                        hintText: "misal. Sendi Agustian",
                        fillColor: Colors.white70),
                  ),
                  additionCallback: (String value) {
                    return ParticipantsName(
                      name: value,
                    );
                  },
                  findSuggestions: NameService.getNames,
                  configureChip: (lang) {
                    return ChipConfiguration(
                      label: Text(lang.name),
                      backgroundColor: ColorApp.blueColor,
                      labelStyle: TextStyle(color: Colors.white),
                      deleteIconColor: Colors.white,
                    );
                  },
                  configureSuggestion: (lang) {
                    return SuggestionConfiguration(
                      title: Text(lang.name),
                      additionWidget: Chip(
                        avatar: Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        ),
                        label: Text('Tambahkan'),
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                        ),
                        backgroundColor: ColorApp.blueColor,
                      ),
                    );
                  },
                  onChanged: () {
                    setState(() {
                      _selectedValuesJson = _participantsNameList
                          .map<String>((lang) => '\n${lang.toJson()}')
                          .toList()
                          .toString();
                      _selectedValuesJson =
                          _selectedValuesJson.replaceFirst('}]', '}\n]');
                    });
                  },
                ),
              ),
            ],
          ),
          Container(
            color: Colors.transparent,
            height: 100,
            child: Center(
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () async {
                  _startRandomParticipans().then(
                    (value) => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WinnerDetailScreen(value),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 80,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorApp.blueColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    'Random Now',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorApp.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              _displayName ?? '-',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String> _startRandomParticipans() async {
    final _random = new Random();
    for (int i = 0; i < 50; i++) {
      ParticipantsName _winner =
          _participantsNameList[_random.nextInt(_participantsNameList.length)];
      setState(() {
        _displayName = _winner.name;
      });
      await Future.delayed(const Duration(microseconds: 5000));
    }
    return _displayName;
  }
}
