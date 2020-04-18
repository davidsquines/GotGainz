import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:fitness_app/databases/exercises.dart';

class WorkoutList extends StatefulWidget {
  @override
  _WorkoutListState createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  Future<List<Exercises>> _getExercises() async{
    var data = await http.get("http://www.json-generator.com/api/json/get/bTNIKaWSqa?indent=2");
    var jsonData = json.decode(data.body);

    List<Exercises> exercises = [];

    for(var u in jsonData){
      Exercises ex = Exercises(u["id"],u["exercise_name"],u["body_part"],u["strength"],u["hypertrphy"]
      ,u["cardio"]);
      exercises.add(ex);
    }
    print(exercises.length);
    return exercises;

  }

  @override
  Widget build(BuildContext context) {
    /*
    return
       Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<List<Exercises>>(
          future: db.getAllExercise(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int position) {
                  Exercises exercise = snapshot.data[position];
                  return Card(
                    child: ListTile(title: Text(exercise.exercise_name)),
                  );
                },
              );
            } else {
              return Center(child: Text('Still Broken'));
            }
          },
        ),
    );

     */

    return new Scaffold(
      appBar: new AppBar(
        title: Text("Exercise List")
      ),
      body: Container(
        child: FutureBuilder(
          future: _getExercises(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data == null){
              return Container(
                child: Center(
                  child: Text("Loading...")
                ),
              );
            }else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].exercise_name),
                    onTap: (){
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) => DetailsPage(snapshot.data[index]) )
                      );
                    },
                  );
                },
              );
            }
          },
        ),

      ),


      /*
      appBar: AppBar(title: Text("Exercise List"),),
      body: Container(
        child: FutureBuilder(builder: (context, snapshot){
          var showData=json.decode(snapshot.data.toString());
          return ListView.builder(

            itemBuilder: (BuildContext context, int index){
              return ListTile(
                title: Text(showData[index]['exercise_name']),
                subtitle: Text(showData[index]['body_part']),
                onTap: (){
                  Navigator.push(context,  
                    new MaterialPageRoute(builder: (context) => DetailsPage(snapshot.data[index]) )
                  );
                },
              );
            },
            itemCount: showData.length,
          );
        }, future: DefaultAssetBundle.of(context).loadString("assets/exerciseList.json"),

        ),
      ),

       */

    );
  }
}

class DetailsPage extends StatelessWidget {
  final Exercises exercise;
  DetailsPage(this.exercise);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(exercise.exercise_name),
      )
    );
  }



}
