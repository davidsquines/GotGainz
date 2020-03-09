import 'package:flutter/material.dart';
import 'dart:convert';

class ExercisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green[300],
        body: Center(
            child: FutureBuilder(builder: (context, snapshot){
              var showData=json.decode(snapshot.data.toString());
              return ListView.builder(

                itemBuilder: (BuildContext context, index){
                  return ListTile(
                    title: Text(showData[index]['exercise_name']),
                    subtitle: Text(showData[index]['body_part']),
                  );
                },
                itemCount: showData.length,
              );
            }, future: DefaultAssetBundle.of(context).loadString("assets/exerciseList.json"),
          ),
        ),
      ),
    );
  }
}
