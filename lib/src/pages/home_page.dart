import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tarea2v2/src/pages/consultas/crearr_page.dart';
import 'package:tarea2v2/src/pages/consultas/unirser_page.dart';
import 'package:tarea2v2/variables.dart';

class HomePage extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController tabController;
  Widget crearTab(String nombre) {
    return Container(
      width: 150,
      height: 50,
      child: Card(
          child: Center(
        child: Text(
          nombre,
          style: mystyle(15, Colors.black),
        ),
      )),
    );
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          centerTitle: true,
          title: Text(
            "Selecionar opcion",
            style: mystyle(20, Colors.white, FontWeight.w700),
          ),
          bottom: TabBar(
            controller: tabController,
            tabs: [crearTab("Crear Reunion"), crearTab("Unirse a Reunion")],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [CrearrPage(), UnirserPage()],
        ));
  }
}
