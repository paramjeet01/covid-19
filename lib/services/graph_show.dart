import 'package:flutter/material.dart';
import 'graph.dart';
import 'service.dart';

class graph extends StatefulWidget {
  @override
  _graphState createState() => _graphState();
}

class _graphState extends State<graph> {

  Future<Graph> futuregraph;

  @override
  void initState() {
    super.initState();
    futuregraph = service.getgraphs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Graph>(
          future: futuregraph,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Statedata(data:snapshot.data.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}


class Statedata extends StatelessWidget {
  List<Datum> data;

  Statedata({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Locations'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return listitem(index);
        },
      ),
    );
  }

  listitem(index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
      child: Card(
        child: ListTile(
          title: Text(data[index].patientId.toString()),
          subtitle: Text(data[index].status),
        ),
      ),
    );
  }
}

