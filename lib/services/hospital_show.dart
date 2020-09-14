import 'package:flutter/material.dart';
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
        backgroundColor: Colors.blue[900],
        title: Text('Locations'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: regional.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1 ,horizontal: 4),
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    onTap: () {},
                    title: Text(regional[index].state),
                    subtitle: Text((regional[index].totalBeds).toString()),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


