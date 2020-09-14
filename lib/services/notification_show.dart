import 'package:flutter/material.dart';
import 'notification.dart';
import 'service.dart';
import 'package:hexcolor/hexcolor.dart';

class notification extends StatefulWidget {
  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {

  Future<NotificationService> futurenotifications;

  @override
  void initState() {
    super.initState();
    futurenotifications = service.getnotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<NotificationService>(
          future: futurenotifications,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Statedata(notifications :snapshot.data.data.notifications);
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
  List <Notifications> notifications;

  Statedata({this.notifications});

  String date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#DBCBD8'),
      appBar: AppBar(
        backgroundColor: Hexcolor('#101935'),
        title: Text('Government Guidelines'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1 ,horizontal: 4),
            child: Column(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 3,
                  padding: EdgeInsets.all(10.0),

                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex:1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Hexcolor('#9AD4D6'),
                          ),
                          child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[

                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            notifications[index].title.length > 9 ?
                                            notifications[index].title.substring(0,10):
                                            notifications[index].title,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                          ),
                        ),
                      ),
                      Expanded(
                        flex:2,
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Hexcolor('#F2FDFF'),

                            ),
                            child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        notifications[index].title.length > 9 ?
                                        (notifications[index].title.substring(10)):
                                        (notifications[index].title),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                        ),),
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        notifications[index].link,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                        ),),
                                    ),
                                  ),
                                ]
                            )

                        ),
                      )

                    ],
                  )
              )
            ]
            ),
          );
        },
      ),
    );
  }
}



