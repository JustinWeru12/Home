import 'package:flutter/material.dart';
import 'package:home/constants/constants.dart';
import 'package:home/services/authentication.dart';
import 'package:home/services/crud.dart';

class DrawerBody extends StatefulWidget {
  DrawerBody({Key key, this.userId, this.logoutCallback}) : super(key: key);

  final BaseAuth auth = new Auth();

  final String userId;
  final VoidCallback logoutCallback;
  void _signOut() async {
    try {
      await auth.signOut();
      logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  @override
  _DrawerBodyState createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<DrawerBody> {
  String userId;
  CrudMethods crudObj = new CrudMethods();
  String userMail;
  String _fullNames;
  String profilPicture;
  String image;
  bool isDriver = false;
  @override
  void initState() {
    super.initState();
    crudObj.getDataFromUserFromDocument().then((value) {
      Map<String, dynamic> dataMap = value.data();
      print(value);
      setState(() {
        userId = dataMap['userId'];
        userMail = dataMap['email'];
        _fullNames = dataMap['fullNames'];
        profilPicture = dataMap['picture'];
        isDriver = dataMap['isDriver'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.0),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kPrimaryColor,
              kSecondaryColor,
              // Colors.transparent
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountEmail: new Text(
                  userMail ?? '',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                accountName: Row(
                  children: <Widget>[
                    new Text(
                      _fullNames ?? '',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ],
                ),
                currentAccountPicture: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: kPrimaryColor,
                      width: 4,
                    ),
                  ),
                  child: new GestureDetector(
                    child: profilPicture != null
                        ? Center(
                            child: new CircleAvatar(
                              backgroundImage: new NetworkImage(profilPicture),
                              maxRadius: 70.0,
                              minRadius: 60.0,
                            ),
                          )
                        : CircleAvatar(
                            child: Image.asset('assets/images/profile.png'),
                            minRadius: 60,
                            maxRadius: 93,
                          ),
                    onTap: () => print("This is your current account."),
                  ),
                ),
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: AssetImage("assets/images/landscape.png"),
                        fit: BoxFit.fill)),
              ),
              ListTile(
                leading: Icon(Icons.home, color: kTextColor),
                title:
                    Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () => {
                  Navigator.of(context).pop(),
                  Navigator.pushReplacementNamed(context, '/'),
                },
              ),
              divider(),
              ListTile(
                leading: Icon(Icons.delivery_dining, color: kTextColor),
                title: Text('Orders',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () => {
                  Navigator.of(context).pop(),
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => OrderPage()))
                },
              ),
              divider(),
              ListTile(
                leading: Icon(Icons.drive_eta_rounded, color: kTextColor),
                title: Text('Booked Rides',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () => {
                  Navigator.of(context).pop(),
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ReservedPage()))
                },
              ),
              divider(),
              ListTile(
                leading: Icon(Icons.person, color: kTextColor),
                title: Text('My Account',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () => {
                  Navigator.of(context).pop(),
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ProfilePage()))
                },
              ),
              divider(),
              ListTile(
                leading: Icon(Icons.help, color: kTextColor),
                title: Text('Get in Touch',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () => {
                  Navigator.of(context).pop(),
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => HelpPage())),
                },
              ),
              divider(),
              ListTile(
                leading: Icon(Icons.exit_to_app, color: kTextColor),
                title: Text('Logout',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () async {
                  Navigator.of(context).pop();
                  widget._signOut();
                  Navigator.of(context).pushReplacementNamed('/');
                },
              ),
              // Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/onboarding1.png',
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget divider() {
    return Divider(
      color: Colors.blue.withOpacity(0.85),
      height: 10,
      indent: 50,
      endIndent: 20,
    );
  }
}
