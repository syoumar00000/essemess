import 'package:flutter/material.dart';
import 'package:igs/components/image/custom_image.dart';
import 'package:igs/models/date_helper_model.dart';
import 'package:igs/models/firebase_helper_model.dart';
import 'package:igs/models/message_model.dart';
import 'package:igs/models/user_model.dart';

class ChatBubble extends StatefulWidget {
  final MyUser partenaire;
  final Message message;
  final Animation<double> animation;

  ChatBubble(
      {Key? key,
      required this.partenaire,
      required this.message,
      required this.animation})
      : super(key: key);

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  final String myUid = FirebaseHelper().auth.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    //SizeTransition pour que chatbubble prenne la taille du sms
    return SizeTransition(
        sizeFactor:
            CurvedAnimation(parent: widget.animation, curve: Curves.easeIn),
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: bubble(myUid == widget.message.from),
          ),
        ));
  }

  //bubble pour que la bulle se place en fonction de celui qui envoie le sms
  List<Widget> bubble(bool moi) {
    CrossAxisAlignment alignment =
        (moi) ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    Color? color = (moi) ? Colors.pink[200] : Colors.blue[200];

    return <Widget>[
      (moi)
          ? Padding(padding: EdgeInsets.all(5.0))
          : CustomImage(
              color: Color(0XFFEA5863),
              imageUrl: widget.partenaire.imageUrl,
              initiales: widget.partenaire.initiales,
              radius: 15,
            ),
      Expanded(
          child: Column(
        crossAxisAlignment: alignment,
        children: <Widget>[
          Text(DateHelper().convert(widget.message.dateString)),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: color,
            child: Container(
              padding:
                  EdgeInsets.all((widget.message.imageUrl.isNotEmpty) ? 5 : 10),
              child:
                  /*   (widget.message.imageUrl.isNotEmpty)
                  ? CustomImage(
                      imageUrl: widget.message.imageUrl,
                      initiales: null,
                      radius: null,
                    )
                  :  */
                  (widget.message.text.isNotEmpty)
                      ? Text(
                          widget.message.text,
                          style: TextStyle(color: Colors.black),
                        )
                      : Container(),
            ),
          )
        ],
      )),
    ];
  }
}
