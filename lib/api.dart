import 'dart:convert';

import 'package:crudsapp/getsimpleApi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class API extends StatefulWidget {
  const API({Key? key}) : super(key: key);

  @override
  State<API> createState() => _APIState();
}

class _APIState extends State<API> {
  List<GetSampleApi>? apiList;
  @override
  void initState() {
    // TODO: implement initState
    getApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          if (apiList != null) getlist(),
        ],
      ),
    );
  }

  Widget getlist() {
    return Expanded(
      child: ListView.builder(
        itemCount: apiList!.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 5,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Text('${apiList![index].title}'),
            ),
          );
        },
      ),
    );
  }

  Future<void> getApi() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    var result = await http.get(Uri.parse(url));
    apiList = jsonDecode(result.body)
        .map((item) => GetSampleApi.fromJson(item))
        .toList()
        .cast<GetSampleApi>();

    setState(() {});
  }
}
