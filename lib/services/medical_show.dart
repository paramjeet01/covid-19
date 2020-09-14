import 'package:flutter/material.dart';
import 'medical.dart';
import 'service.dart';

class medical extends StatefulWidget {
  @override
  _medicalState createState() => _medicalState();
}

class _medicalState extends State<medical> {
  Future<Medical> futuremedical;

  @override
  void initState() {
    super.initState();
    futuremedical = service.getmedicals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Medical>(
          future: futuremedical,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return data(medicalcolleges: snapshot.data.data.medicalColleges);
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

class data extends StatelessWidget {

  List <MedicalColleges> medicalcolleges;

  data({this.medicalcolleges});

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
        itemCount: medicalcolleges.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1 ,horizontal: 4),
            child: Card(
              child: ListTile(
                title: Text(medicalcolleges[index].state),
                subtitle: Text(medicalcolleges[index].name),
              ),
            ),
          );
        },
      ),
    );
  }
}


