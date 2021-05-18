import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tarea2v2/variables.dart';

class UnirserPage extends StatefulWidget {
  _UnirserState createState() => _UnirserState();
}

class _UnirserState extends State<UnirserPage> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController salaController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();
  bool sinAudio = true;
  bool sinVideo = true;
  unirse() async {
    try {
      Map<FeatureFlagEnum, bool> featureflags = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED: false
      };
      if (Platform.isAndroid) {
        featureflags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        featureflags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
      var opciones = JitsiMeetingOptions(room: salaController.text)
        ..subject = descripcionController.text
        ..userDisplayName = nombreController.text
        ..audioMuted = sinAudio
        ..videoMuted = sinVideo
        ..featureFlags.addAll(featureflags);
      await JitsiMeet.joinMeeting(opciones);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 24),
                Text("Codigo de Sala", style: mystyle(20)),
                SizedBox(
                  height: 20,
                ),
                PinCodeTextField(
                  controller: salaController,
                  autoDisposeControllers: false,
                  animationType: AnimationType.fade,
                  appContext: context,
                  length: 6,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  onChanged: (value) {},
                ),
                SizedBox(height: 10),
                TextField(
                  controller: descripcionController,
                  style: mystyle(20),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Descripcion",
                    labelStyle: mystyle(15),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: nombreController,
                  style: mystyle(20),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nombre",
                    labelStyle: mystyle(15),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                CheckboxListTile(
                    value: sinVideo,
                    title: Text(
                      "Entrar sin Video",
                      style: mystyle(18, Colors.black),
                    ),
                    onChanged: (value) => setState(() {
                          sinVideo = value;
                        })),
                SizedBox(
                  height: 16,
                ),
                CheckboxListTile(
                    value: sinAudio,
                    title: Text(
                      "Entrar sin Audio",
                      style: mystyle(18, Colors.black),
                    ),
                    onChanged: (value) => setState(() {
                          sinAudio = value;
                        })),
                Divider(
                  height: 48,
                  thickness: 2.0,
                ),
                InkWell(
                  onTap: () => unirse(),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.greenAccent),
                    child: Center(
                      child: Text(
                        "Unirse a Reunion",
                        style: mystyle(20, Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
