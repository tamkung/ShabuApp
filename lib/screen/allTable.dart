import 'package:flutter/material.dart';
import 'package:shabu_app/config/constant.dart';
import 'package:shabu_app/screen/table/addTable.dart';
import 'package:shabu_app/screen/table/editTable.dart';

class AllTable extends StatefulWidget {
  const AllTable({Key? key}) : super(key: key);

  @override
  _AllTableState createState() => _AllTableState();
}

class _AllTableState extends State<AllTable> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Store'),
          backgroundColor: pColor,
        ),
        body: TabBarView(
          children: [
            AddTable(),
            EditTable(),
          ],
        ),
        bottomNavigationBar: Container(
          child: TabBar(
            indicatorColor: Colors.red,
            labelColor: tColor,
            tabs: [
              Tab(
                text: 'เพิ่มโต๊ะ',
                //icon: Icon(Icons.add),
              ),
              Tab(
                text: 'แก้ไขโต๊ะ',
                //icon: Icon(Icons.view_agenda),
              ),
            ],
          ),
          color: Colors.black54,
        ),
      ),
    );
  }
}
