import 'package:chat_app/screens/signin.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('User Name'),
            accountEmail: const Text('User@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://scontent-hkt1-2.xx.fbcdn.net/v/t1.15752-9/287532336_566105578475699_19835476875067751_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=ae9488&_nc_ohc=pDleFNm9xXkAX8Py1Hk&tn=U5S2TDiCeQ5xAcSF&_nc_ht=scontent-hkt1-2.xx&oh=03_AVKJlIYVB8pN6Pi2ddbSlwso6Q7PqI6A1xkdQ4fhMaCX9w&oe=62DD5ACB',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Friends'),
          ),
          const ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
          ),
          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Request"),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          const ListTile(
            leading: Icon(Icons.description),
            title: Text('Policies'),
          ),
          const Divider(),
          ListTile(
            title: const Text('Exit'),
            leading: const Icon(Icons.exit_to_app),
            onTap: (){Navigator.pushNamed(context, SignIn.id);},
          ),
        ],
      ),
    );
  }
}