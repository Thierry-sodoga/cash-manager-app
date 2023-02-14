import 'package:CashManager/model/user.model.dart';
import 'package:CashManager/service/user%20info.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Users?>(
        future: getUser(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          Users? user = snapshot.requireData;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff184098),
              title: const Center(
                child: Text('Mon profile'),
              ),
            ),
            body: ListView(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    // gradient: LinearGradient(
                    //   colors: [
                    //     const Color(0xff184098),
                    //     Colors.deepOrange.shade300
                    //   ],
                    //   begin: Alignment.centerLeft,
                    //   end: Alignment.centerRight,
                    //   stops: const [0.5, 0.9],
                    // ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.white70,
                            minRadius: 60.0,
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage: NetworkImage(
                                  'https://images.app.goo.gl/poQdnLTfMBqbdMfc6'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${user!.fistname!} ${user.lastname!}",
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff184098),
                        ),
                      ),
                      Text(
                        user.email!,
                        style: const TextStyle(
                          color: Color(0xff184098),
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
