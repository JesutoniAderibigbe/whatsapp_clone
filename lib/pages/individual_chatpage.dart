import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import '../models/chat_model.dart';
import '../models/chat_model.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class IndividualPage extends StatefulWidget {
  IndividualPage({
    Key? key,
  }) : super(key: key);

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  var index = 0;

  var currentIndex = [0, 1, 2, 3];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Color(0xff123456),
          leadingWidth: 50,
          titleSpacing: 5,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back, size: 24),
                CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColor,
                  radius: 10,
                  backgroundColor: Colors.blueGrey,
                  backgroundImage: NetworkImage(dummyData[index].avatarUrl),
                )
              ],
            ),
          ),
          title: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dummyData[index].name,
                      style: TextStyle(
                          fontSize: 18.5, fontWeight: FontWeight.bold)),
                  Text("Last seen today at 17:05am",
                      style: TextStyle(fontSize: 13))
                ],
              ),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
            IconButton(onPressed: () {}, icon: Icon(Icons.call)),
            PopupMenuButton<String>(onSelected: (value) {
              print(value);
            }, itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("View Group"),
                  value: "View Content",
                ),
                PopupMenuItem(
                  child: Text("Media,links and docks"),
                  value: "Media, links and docs",
                ),
                PopupMenuItem(
                  child: Text("Whatsapp Web"),
                  value: "Whatsapp Web",
                ),
                PopupMenuItem(
                  child: Text("Search"),
                  value: "Search",
                ),
                PopupMenuItem(
                  child: Text("Mute Notifications"),
                  value: "Mute Notifications",
                ),
                PopupMenuItem(
                  child: Text("Wallpaper"),
                  value: "Wallpaper",
                ),
              ];
            })
          ],
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                ListView(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Card(
                                margin: EdgeInsets.only(
                                    left: 2, right: 2, bottom: 8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: TextFormField(
                                  focusNode: focusNode,
                                  maxLines: 5,
                                  minLines: 1,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Type a  message",
                                    prefixIcon: IconButton(
                                      onPressed: () {
                                        focusNode.unfocus();
                                        focusNode.canRequestFocus = false;
                                        setState(() {
                                          show = !show;
                                        });
                                      },
                                      icon: Icon(Icons.emoji_emotions),
                                    ),
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.attach_file)),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.camera_alt))
                                      ],
                                    ),
                                    contentPadding: EdgeInsets.all(5),
                                  ),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8, right: 2, left: 2),
                            child: CircleAvatar(
                              backgroundColor: Colors.greenAccent,
                              radius: 25,
                              child: IconButton(
                                icon: Icon(Icons.mic, color: Colors.white),
                                onPressed: () {},
                              ),
                            ),
                          )
                        ],
                      ),
                      show ? emojiSelect() : Container(),
                    ],
                  ),
                )
              ],
            )));
  }

  Widget emojiSelect() {
    return EmojiPicker(
        config: Config(columns: 10),
        onEmojiSelected: (emoji, category) {
          print(emoji);
        });
  }
}
