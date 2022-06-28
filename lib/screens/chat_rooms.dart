import 'package:chat_app/constants.dart';
import 'package:chat_app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatRooms extends StatefulWidget {
  const ChatRooms({Key? key}) : super(key: key);

  @override
  State<ChatRooms> createState() => _ChatRoomsState();
}

class _ChatRoomsState extends State<ChatRooms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: getBody(),
      bottomSheet: Container(
        height: 80,
        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.01)),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 5, right: 5, left: 5),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/action.svg")),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/camera.svg")),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/gallery.svg")),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/audio.svg")),
              Container(
                width: (MediaQuery.of(context).size.width - 30) / 2,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: grey, borderRadius: BorderRadius.circular(20)),
                      width: (MediaQuery.of(context).size.width - 130) / 2,
                      height: 36,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Aa" ,suffixIcon: Icon(Icons.emoji_emotions_outlined)),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/icons/like.svg")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset("assets/icons/back.svg"),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/call.svg"),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/videocall.svg"),
        ),
      ],
      title: Row(
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1517070208541-6ddc4d3efbcb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3319&q=80"),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Tayler Nix",
                style: TextStyle(
                    fontSize: 17, color: black, fontWeight: FontWeight.bold),
              ),
              Text(
                "Messenger",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget getBody() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        SingleChildScrollView(
          child: Column(
            children: List.generate(messages.length, (index) {
              return BubbleChat(
                  isMe: messages[index]['isMe'],
                  message: messages[index]['message'],
                  messageType: messages[index]['messageType'],
                  profileImage: messages[index]['profileImg']);
            }),
          ),
        )
      ],
    );
  }
}

class BubbleChat extends StatelessWidget {
  final bool isMe;
  final String profileImage;
  final String message;
  final int messageType;

  const BubbleChat({
    Key? key,
    required this.isMe,
    required this.profileImage,
    required this.message,
    required this.messageType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isMe) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 2, top: 2),
        child: Row(
          children: [
            Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(profileImage), fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: grey, borderRadius: getBorder(messageType)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(message,
                    style: const TextStyle(fontSize: 17),
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: primary, borderRadius: getBorder(messageType)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  message,
                  style: const TextStyle(fontSize: 17, color: white),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  getBorder(int messageType) {
    if (!isMe) {
      if (messageType == 1) {
        return const BorderRadius.only(
            topLeft: Radius.circular(18),
            bottomLeft: Radius.circular(4),
            topRight: Radius.circular(18),
            bottomRight: Radius.circular(18));
      } else if (messageType == 2) {
        return const BorderRadius.only(
            topLeft: Radius.circular(4),
            bottomLeft: Radius.circular(4),
            topRight: Radius.circular(18),
            bottomRight: Radius.circular(18));
      } else if (messageType == 3) {
        return const BorderRadius.only(
            topLeft: Radius.circular(4),
            bottomLeft: Radius.circular(18),
            topRight: Radius.circular(18),
            bottomRight: Radius.circular(18));
      }
    } else {
      if (messageType == 1) {
        return const BorderRadius.only(
            topLeft: Radius.circular(18),
            bottomLeft: Radius.circular(18),
            topRight: Radius.circular(18),
            bottomRight: Radius.circular(4));
      } else if (messageType == 2) {
        return const BorderRadius.only(
            topLeft: Radius.circular(18),
            bottomLeft: Radius.circular(18),
            topRight: Radius.circular(4),
            bottomRight: Radius.circular(4));
      } else if (messageType == 3) {
        return const BorderRadius.only(
            topLeft: Radius.circular(18),
            bottomLeft: Radius.circular(18),
            topRight: Radius.circular(4),
            bottomRight: Radius.circular(18));
      }
    }
  }
}
