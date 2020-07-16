import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Chat App"),
      ),
      body: Home_Screen(),
    );
  }
}

class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  TextEditingController _controller = new TextEditingController();
  final List<Chat_Msg> _list = <Chat_Msg>[];
  Widget _textComposer()
  {
    return IconTheme(
      data: new IconThemeData(
        color: Colors.blue
      ),
      child: new Container(
        margin: EdgeInsets.symmetric(
          horizontal: 8.0
        ),
        child: Row(
          children: [
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(hintText: "Enter text"),
                controller: _controller,
                onSubmitted: _handleSubmitted,
              ),
            ),
            new Container(
              margin: EdgeInsets.symmetric(
                  horizontal: 4.0
              ),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmitted(_controller.text),
              ),
            ),
          ],
        )
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Flexible(
          child: new ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_,int index)=>_list[index],
            itemCount: _list.length,
          ),
        ),new Divider(
          height: 1.0,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposer(),
        )
      ],
    );
  }

  void _handleSubmitted(String value) {
    _controller.clear();
    Chat_Msg chat_msg = new Chat_Msg(text: value);
   setState(() {
     _list.insert(0, chat_msg);
   });
  }
}

class Chat_Msg extends StatelessWidget {
  String _name = "Maulik";
  String text;

  Chat_Msg({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 10.0
      ),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Container(
            margin: EdgeInsets.only(
                right: 16.0
            ),
            child: new CircleAvatar(
              child: Text(_name[0]),
            ),
          ), new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Text(
                _name,
                style: Theme.of(context).textTheme.subhead,
              ),
              new Container(
                margin: EdgeInsets.only(
                    top: 5.0
                ),
                child: new Text(
                    text
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}





