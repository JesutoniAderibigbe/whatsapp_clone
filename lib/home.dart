import 'package:flutter/material.dart';

import 'pages/call_screen.dart';
import 'pages/camera_screen.dart';
import 'pages/chat_screen.dart';
import 'pages/status_screen.dart';

class WhatsappHome extends StatefulWidget {
  const WhatsappHome({Key? key}) : super(key: key);

  @override
  State<WhatsappHome> createState() => _WhatsappHomeState();
}

class _WhatsappHomeState extends State<WhatsappHome>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Whatsapp Clone"),
        backgroundColor: Color.fromARGB(255, 26, 94, 28),
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            new Tab(
              icon: new Icon(Icons.camera_alt),
            ),
            new Tab(text: "CHATS"),
            new Tab(
              text: "STATUS",
            ),
            new Tab(text: "CALLS")
          ],
        ),
        actions: [
          Icon(
            Icons.search,
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 5)),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text("New group"),
                value: "New group",
              ),
              PopupMenuItem(
                child: Text("New Broadcast"),
                value: "New broadcast",
              ),
              PopupMenuItem(
                child: Text("Whatsapp Web"),
                value: "Whatsapp Web",
              ),
              PopupMenuItem(
                child: Text("Starred messages"),
                value: "Starred messages",
              ),
              PopupMenuItem(
                child: Text("Settings"),
                value: "Settings",
              ),
            ];
          })
        ],
      ),
      body: TabBarView(controller: _tabController, children: [
        CameraScreen(),
        ChatScreen(),
        StatusScreen(),
        CallScreen()
      ]),
      floatingActionButton: new FloatingActionButton(
          backgroundColor: Colors.green,
          child: new Icon(Icons.message, color: Colors.white),
          onPressed: () => print("open chats")),
    );
  }
}
