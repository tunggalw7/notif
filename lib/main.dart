///  ------------------------------
///    External Packages
///  ------------------------------

// ignore_for_file: unnecessary_this, prefer_equal_for_default_values
library globals;

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

final FlutterAppAuth appAuth = FlutterAppAuth();
final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

String globalString = "";
///  ------------------------------
///     Auth Variables
///  ------------------------------
// const AUTH0_DOMAIN = 'dev-poa-acpa.us.auth0.com';
// const AUTH0_CLIENT_ID = '1VpFyaWi2xuOYJYMopCAYbhqrFMQFhM9';
// const AUTH0_DOMAIN = '30abe0e1.auth.dev.upbond.io';
// const AUTH0_CLIENT_ID = 'Ef6a1BPWMEnId2TDXfs77';
const AUTH0_DOMAIN = 'lzg2dndj.auth.dev.upbond.io';
const AUTH0_CLIENT_ID = 'RJbah0KBO0rHvbILt1TBe';

const AUTH0_REDIRECT_URI = 'com.auth0.flutterdemo://login-callback';
const AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';


///  -----------------------------
///    Profile Widget
///  -----------------------------
class Profile extends StatelessWidget {
  final logoutAction;
  final String? name;
  final String? picture;

  Profile({this.logoutAction, this.name, this.picture});

  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    var safearea = MediaQuery.of(context).padding.top;

    var bag = true;
    var test = "1";
    int _selectedIndex = 0;

    void _onItemTapped(int index) {
      print("tapped");
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
    }

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 237, 245, 252),
        resizeToAvoidBottomInset: false, // set it to false
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                SizedBox(
                  height: 122,
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 150,
                        height:150,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color.fromRGBO(27, 57, 110, 65), width:4.0),
                            shape: BoxShape.circle,
                            image:DecorationImage(
                              fit:BoxFit.fill,
                              image: NetworkImage(picture ?? ''),
                            )
                        ),
                      ),
                      SizedBox(height: 24.0,),
                      Text('Name: $name'),
                      SizedBox(height: 48.0,),
                      // RaisedButton(
                      //   onPressed: () {
                      //     logoutAction();
                      //   },
                      //   child: Text('Logout'),
                      // )

                      Container(
                        padding:
                        const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                        child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(27, 57, 110, 65),
                                // shape: RoundedRectangleBorder(
                                //   borderRadius: BorderRadius.circular(20.0),
                                // ),
                                // elevation: 10,
                                minimumSize: const Size(150, 52)),
                            onPressed: () => logoutAction(),
                            icon: const Icon(Icons.arrow_right_alt),
                            label: const Text(
                              "Logout",
                              style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ]
                ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(

              icon: Icon(
                Icons.home_outlined,
                size: 30,
                  color: Colors.white
              ),
              label: "Home",

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_rounded,
                  color: Colors.white, size: 25),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border_rounded,
                  color: Colors.white, size: 30),
              label: "Favourites",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded,
                  color: const Color.fromRGBO(255, 255, 255, 200), size: 30),
              label: "Profile",
            ),

          ],
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromRGBO(255, 255, 255, 200),
          backgroundColor: const Color.fromRGBO(27, 57, 110, 65),
        ),
        // body: _widgetOptions.elementAt(_selectedIndex)
    );
  }
}

void _onItemTapped(int index) {
  print("tapped");
  // print(index);
  // Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => HomePage()),
  // );
  MaterialPageRoute(
    builder: (BuildContext context) => HomePage()
  );
}

///  ----------------------------
///       Login Widget 
///   ---------------------------

class Login extends StatelessWidget {
  final loginAction;
  final String? loginError;

  const Login(this.loginAction, this.loginError);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Container(
        //   height: 200,
        //   width: 200,
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: ExactAssetImage('assets/images/logo.png'),
        //       fit: BoxFit.fitHeight,
        //     ),
        //   ),
        // ),
        Container(
          padding:
          const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
          child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(27, 57, 110, 65),
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(20.0),
                  // ),
                  // elevation: 0,
                  minimumSize: const Size(150, 52)),
              onPressed: () => loginAction(),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text(
                "Login",
                style:
                TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
        ),
        Text(loginError ?? ''),
      ],
    );
  }
}

///  ----------------------------
///           App
///  ----------------------------


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


///  ----------------------------
///          App State 
///  ----------------------------

getIsLogin() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getBool("is_login");
}

getProfile() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return {
    "name" : pref.getBool("name"),
    "picture" : pref.getBool("picture")
  };
}

// return_type abcd () async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   return pref.getBool("is_login").toString();
// }


masukbos() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  globalString = "wwwwwok";
}

Future<String> sayHelloWorld() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return "Hello, World!";
}

class _MyAppState extends State<MyApp>  {
  bool isBusy = false;
  bool isLoggedIn = false;
  String? errorMessage;
  String? name;
  String? picture;

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context ) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title : 'Botejyu App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Botejyu App'),
          backgroundColor: Color.fromRGBO(27, 57, 110, 65),
        ),
        body: Center(
          child: isBusy
            ? CircularProgressIndicator()
            : !isLoggedIn
                ? Profile(logoutAction: logoutAction, name:name,picture: picture)
                : Login(loginAction, errorMessage),
        )
      )
    );
  }

  Map<String, dynamic> parseIdToken(String idToken) {
    final parts = idToken.split(r'.');
    assert(parts.length == 3);

    return jsonDecode(
      utf8.decode(base64Url.decode(base64Url.normalize(parts[1])))
    );
  }

  Future<Map> getUserDetails(String accessToken) async {
    const url = 'https://$AUTH0_DOMAIN/userinfo';
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get user details.');
    }
  }

  Future<void> loginAction() async {
    setState(() {
      isBusy = true;
      errorMessage = '';


    });

    try {
      // print("masuk sini1");
      String? deviceToken = await FirebaseMessaging.instance.getToken();
      print(deviceToken.toString());
      final AuthorizationTokenResponse? result = await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          AUTH0_CLIENT_ID,
          AUTH0_REDIRECT_URI,
          issuer: 'https://$AUTH0_DOMAIN',
          scopes: ['openid', 'profile', 'offline_access'],
          promptValues: ['login'],
          additionalParameters: {'device_token' : deviceToken.toString()}
          ),
      );


      // print("masuk sini2");
      // print(result!.idToken.toString());
      final idToken = parseIdToken(result!.idToken.toString());
      final profile = await getUserDetails(result.accessToken.toString());

      await secureStorage.write(
        key: 'refresh_token', value:result.refreshToken
      );

      print("masuk sini2 refresh_token");
      print("masuk sini2");
      print(idToken);

      saveSession(idToken['name'], idToken['picture']);

      setState((){
        isBusy = false;
        isLoggedIn = false;
        name = idToken['name'];
        picture = profile['picture'];


      });

    } catch(e,s) {
      print('Login error $e-stack:$s');
      setState((){
        isBusy = false;
        isLoggedIn = true;
        // errorMessage = e.toString();
      });

    }

  }

  void logoutAction() async {
    await secureStorage.delete(key:'refresh_token');
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("name");
    pref.remove("picture");
    pref.remove("is_login");
    setState(() {
      isLoggedIn = true;
      isBusy = false;
    });
  }

  saveSession(String name, String picture) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("name", name);
    await pref.setString("picture", picture);
    await pref.setBool("is_login", false);
  }

  @override
  void initState(){
    print('my init xxx');
    initAction();
    fcmAction();
    super.initState();


  }


  void fcmAction() async {
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();
    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    // if (initialMessage?.data['type'] == 'chat') {
    //   print('FCM masuk 1');
    // }
    print('FCM masuk 1: ${initialMessage?.data}');
    // Also handle any interaction when the app is in the background via a
    // Stream listener
    // Dalam kondisi apps ny sedang open
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.data['type'] == 'chat') {
        print('FCM masuk 3');
      }
      print('FCM on message: ${message.data}');
      print('FCM on message: ${message}');
    });

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    // Dalam Kondisi apps nya minimize / close
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data['type'] == 'chat') {
        print('FCM masuk 4');
      }
      print('FCM on message opened app 2 tunggal: ${message.data}');
      print('FCM on message 2 tunggal: ${message}');
      _navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
      // String? routeScreen = message.data['screen'];
      // if (routeScreen != null) {
      //   print('FCM on masokkk x 1');
      //   if (routeScreen == 'detail_product') {
      //     print('FCM on masokkk x true');
      //     _navigatorKey.currentState!.push(
      //       MaterialPageRoute(
      //         // builder: (context) => DetailProdukPage(
      //         //   name: message.data['name'] ?? '-',
      //         // ),
      //         builder: (context) => HomePage(),
      //       ),
      //     );
      //   } else {
      //     print('FCM on masokkk x 2');
      //     print('FCM on masokkk x 2 false');
      //     _navigatorKey.currentState!.push(
      //       MaterialPageRoute(
      //         builder: (context) => const HomePage(),
      //       ),
      //     );
      //   }
      // }
    });

    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
      print('FCM on background message: ${message.data}');
      print('FCM on background message 2: ${message}');
    });
  }

  void initAction() async {
    print("initAction");
    // final storedRefreshToken = await secureStorage.read(key:'refresh_token');
    // if(storedRefreshToken == null) return;
    print("refreshtok");
    // print(storedRefreshToken);

    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      isBusy = false;
      isLoggedIn = pref.getString("name") != null ? false : true;
      name = pref.getString("name");
      picture = pref.getString("picture");

    });

    // try {
    //   final response = await appAuth.token(
    //     TokenRequest(
    //       AUTH0_CLIENT_ID,
    //       AUTH0_REDIRECT_URI,
    //       issuer: AUTH0_ISSUER,
    //       refreshToken: storedRefreshToken,
    //       )
    //   );
    //
    //   final idToken = parseIdToken(response!.idToken.toString());
    //   final profile = await getUserDetails(response!.accessToken.toString());
    //
    //   secureStorage.write(key:'refresh_token',value:response.refreshToken);
    //
    //   setState(() {
    //     isBusy = false;
    //     isLoggedIn = false;
    //     name = idToken['name'];
    //     picture = profile['picture'];
    //
    //   });
    //
    // } catch(e,s){
    //   print('error on refreseh token: $e - stack $s');
    //   logoutAction();
    //
    // }

  }

  void initFCM() async {
    print('masooohook');
    print('mytoken my advntr');
    _firebaseMessaging.getToken().then((token) => print(token));

  }

}

