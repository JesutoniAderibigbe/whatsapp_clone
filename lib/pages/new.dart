import 'package:flutter/material.dart';

class New extends StatelessWidget {
  const New({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            Row(
              children: [Icon(Icons.favorite)],
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.topCenter,
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(color: Colors.green),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text("Total Balance",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          SizedBox(width: 50),
                          Text("Transcation History"),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                      SizedBox(height: 70),
                      Row(
                        children: [
                          Column(
                            children: [
                              Icon(Icons.food_bank),
                              Text('Add Money'),
                            ],
                          ),
                          SizedBox(width: 30),
                          Column(
                            children: [Icon(Icons.food_bank), Text("Transfer")],
                          ),
                          SizedBox(width: 30),
                          Column(
                            children: [Icon(Icons.food_bank), Text("Withdraw")],
                          ),
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ));
  }
}
