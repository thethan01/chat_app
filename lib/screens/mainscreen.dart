import 'package:chat_app/constants.dart';
import 'package:chat_app/data/data.dart';
import 'package:chat_app/screens/chat_rooms.dart';
import 'package:chat_app/screens/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const String id = "main_screen";
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer:  NavBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(top: 5, right: 20, left: 20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    _key.currentState!.openDrawer();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://scontent-hkt1-2.xx.fbcdn.net/v/t1.15752-9/287532336_566105578475699_19835476875067751_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=ae9488&_nc_ohc=pDleFNm9xXkAX8Py1Hk&tn=U5S2TDiCeQ5xAcSF&_nc_ht=scontent-hkt1-2.xx&oh=03_AVKJlIYVB8pN6Pi2ddbSlwso6Q7PqI6A1xkdQ4fhMaCX9w&oe=62DD5ACB"),
                            fit: BoxFit.cover)),
                  ),
                ),
                const Text(
                  'Chats',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
                ),
                IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: SvgPicture.asset("assets/icons/newmess.svg")),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            searchBar(),
            const SizedBox(
              height: 20,
            ),
            userStory(),
            avatarMessage(context)
          ],
        ),
      ),
    );
  }

  Padding avatarMessage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: List.generate(userMessages.length, (index) {
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>
                  const ChatRooms()));
            },
            child: Row(
              children: [
                SizedBox(
                  height: 77,
                  width: 65,
                  child: Stack(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    userMessages[index]['img']),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                        bottom: 15,
                        left: 40,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: online,
                              shape: BoxShape.circle,
                              border: Border.all(width: 3, color: white)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                    width: 10
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userMessages[index]['name'],
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 140,
                        child: Text(
                          userMessages[index]['message'] + " - " + userMessages[index]['created_at'],
                          style:  const TextStyle(
                              color: Colors.grey,
                              fontSize: 15
                          ),overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  SingleChildScrollView userStory() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: SizedBox(
                height: 77,
                width: 65,
                child: SvgPicture.asset("assets/icons/yourstory.svg"),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(userStories.length, ((index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: SizedBox(
                      height: 77,
                      width: 65,
                      child: Stack(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(userStories[index]['img']),
                                    fit: BoxFit.cover)),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 40,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: online,
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 3, color: white)),
                            ),
                          ),
                          Center(
                            child: Padding(
                                padding: const EdgeInsets.only(top: 63),
                                child: Text(
                                  userStories[index]['name'],
                                  style: const TextStyle(color: Colors.grey),
                                )),
                          )
                        ],
                      ),
                    ),
                  );
                }))),
          ),
        ],
      ),
    );
  }

  Container searchBar() {
    return Container(
      width: double.infinity,
      height: 40,
      decoration:
      BoxDecoration(color: grey, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: _searchController,
        cursorColor: Colors.black,
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: black,
          ),
          hintText: "Search",
        ),
      ),
    );
  }

  Row topBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => Scaffold.of(context).openDrawer(),
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://scontent-hkt1-2.xx.fbcdn.net/v/t1.15752-9/287532336_566105578475699_19835476875067751_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=ae9488&_nc_ohc=pDleFNm9xXkAX8Py1Hk&tn=U5S2TDiCeQ5xAcSF&_nc_ht=scontent-hkt1-2.xx&oh=03_AVKJlIYVB8pN6Pi2ddbSlwso6Q7PqI6A1xkdQ4fhMaCX9w&oe=62DD5ACB"),
                    fit: BoxFit.cover)),
          ),
        ),
        const Text(
          'Chats',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        ),
        IconButton(
            onPressed: () {
            },
            icon: SvgPicture.asset("assets/icons/newmess.svg")),
      ],
    );
  }
}
