import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import '../widgets/ChatMessageView.dart';

class ChatBot extends StatefulWidget {



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChatState();
  }


}

class ChatState extends State<ChatBot> {

  String value = "Who are you?";

  final TextEditingController _textController = new TextEditingController();

  final List<ChatMessage> _messages = <ChatMessage>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getReply("Hi", addMsg: true);
  }

  void getReply(String message, {bool addMsg : true}) async {
    AuthGoogle authGoogle = await AuthGoogle(fileJson: "lib/src/assets/FlutterDemo-60c88856a0dc.json").build();
    Dialogflow dialogflow = Dialogflow(authGoogle: authGoogle);

    AIResponse response = await dialogflow.detectIntent(message);
    print(response.getMessage());

    ChatMessage cm = new ChatMessage(                         //new
      text: response.getMessage().toString(),
      name: "Robot"//new
    );                                                             //new

    setState(() {
      if(addMsg){
        _messages.insert(0, cm);                                //new
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Container(
        child: new Column(                                        //modified
          children: <Widget>[                                         //new
            new Flexible(                                             //new
              child: new ListView.builder(                            //new
                padding: new EdgeInsets.all(8.0),                     //new
                reverse: true,                                        //new
                itemBuilder: (_, int index) => _messages[index],      //new
                itemCount: _messages.length,                          //new
              ),                                                      //new
            ),                                                        //new
            new Divider(height: 1.0),                                 //new
            new Container(                                            //new
              decoration: new BoxDecoration(
                  color: Theme.of(context).cardColor),                  //new
              child: _buildTextComposer(),                       //modified
            ),                                                        //new
          ],                                                          //new
        ),
      ),
    );
  }


  Widget _buildTextComposer() {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          new Flexible(child:
          new TextField(
            controller: _textController,
            onSubmitted: _handleSubmitted,
            decoration: new InputDecoration.collapsed(
                hintText: "Send a message"),
          )),
          new IconButton(icon: Icon(Icons.send), onPressed: () => _handleSubmitted(_textController.text))
        ],
      ),
    );
  }

   void _handleSubmitted(String text) {
    if(text.length==0){
      return;
    }
     ChatMessage message = new ChatMessage(                         //new
       text: text,
       name: "Rakesh Gujari"//new
     );                                                             //new
     setState(() {                                                  //new
       _messages.insert(0, message);                                //new
     });
     getReply(text);
    _textController.clear();
  }
}