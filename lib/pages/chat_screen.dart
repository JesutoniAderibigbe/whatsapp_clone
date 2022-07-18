import 'package:flutter/material.dart';

import 'individual_chatpage.dart';
import '../models/chat_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => IndividualPage()));
      },
      child: new ListView.builder(
          itemCount: dummyData.length,
          itemBuilder: (context, index) => new Column(children: [
                new Divider(
                  height: 10.0,
                ),
                new ListTile(
                    leading: new CircleAvatar(
                      foregroundColor: Theme.of(context).primaryColor,
                      backgroundColor: Colors.grey,
                      backgroundImage:
                          new NetworkImage(dummyData[index].avatarUrl),
                    ),
                    title: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Text(dummyData[index].name,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        new Text(dummyData[index].time,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.0)),
                      ],
                    ),
                    subtitle: new Container(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: new Text(dummyData[index].message,
                          style: TextStyle(color: Colors.grey, fontSize: 15.0)),
                    )),
              ])),
    );
  }
}
