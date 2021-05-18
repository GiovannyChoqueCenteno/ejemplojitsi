import 'package:flutter/material.dart';
import 'package:tarea2v2/variables.dart';
import 'package:uuid/uuid.dart';

class CrearrPage extends StatefulWidget {
  _CrearrState createState() => _CrearrState();
}

class _CrearrState extends State<CrearrPage> {
  String codigo = '';
  crearCodigo() {
    setState(() {
      codigo = Uuid().v1().substring(0, 6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "Crear codigo",
                style: mystyle(20),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Codigo",
                  style: mystyle(30),
                ),
                SelectableText(
                  codigo,
                  style: mystyle(30, Colors.purple),
                )
              ],
            ),
            SizedBox(
              height: 45,
            ),
            InkWell(
              onTap: () => crearCodigo(),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 50,
                decoration: BoxDecoration(color: Colors.greenAccent),
                child: Center(
                  child: Text(
                    "Crear Codigo",
                    style: mystyle(20, Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
