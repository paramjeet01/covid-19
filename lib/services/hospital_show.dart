import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'hospitals.dart';
import 'service.dart';

class hospital extends StatefulWidget {
  @override
  _hospitalState createState() => _hospitalState();
}

class _hospitalState extends State<hospital> {

  Future<Hospital> futurehospital;

  @override
  void initState() {
    super.initState();
    futurehospital = service.gethospitals();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Hospital>(
          future: futurehospital,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Statedata(regional :snapshot.data.data.regional);
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
  List <Regional> regional;

  Statedata({this.regional});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Hexcolor('#101935'),
        title: Text('Hospital Dashboard'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: regional.length,
        itemBuilder: (context, index){
          return
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1 ,horizontal: 4),
              child: Card(
                child: Text('StateName: ${regional[index].state} \nRural hospitals:${regional[index].ruralHospitals} \nRural Beds:${regional[index].ruralBeds} \nUrban Beds:${regional[index].urbanBeds} \n Total hospitals:${regional[index].totalHospitals}\nTotal Beds:${regional[index].totalBeds}'
              ),
            ),
            );
        },
      ),
    );
  }
}


