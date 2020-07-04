import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:sqlite_crud_flutter/RetrieveData.dart';
import 'DatabaseHelper.dart';

//i am going to call this myapp1 class in main file

class MyApp121 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Registration Screen",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  final dbHelper = DatabaseHelper.instance;
  String name,email,pass;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: new BoxDecoration(
          color: Colors.black,
          image: new DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.grey.withOpacity(.5),BlendMode.dstATop),
            image: new AssetImage(
              "asset/bg00.jpg"
            ),
          ),
        ),
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Join Us Now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: "DancingScript",
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                onChanged: (val){
                  name=val;
                },
                cursorColor: Colors.black,
                style: TextStyle(
                  height: 1
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[500],
                  prefixIcon: Icon(Icons.edit,color: Colors.blue[900],),
                  hintStyle: TextStyle(
                    color:Colors.black,
                  ),
                  hintText: "Enter your Name",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (val){
                  email=val;
                },
                cursorColor: Colors.black,
                style: TextStyle(
                  height: 1,
                ),
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  filled: true,
                  prefixIcon: Icon(Icons.email,color: Colors.blue[900],
                  ),
                  hintText: "Enter Your Email",
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (val){
                  pass=val;
                },
                cursorColor: Colors.black,
                obscureText: true,
                style: TextStyle(
                  height: 1,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[500],
                  prefixIcon: Icon(Icons.https,color: Colors.blue[900],),
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  hintText: "Enter Your Password",
                )
              ),
              SizedBox(
                height: 10,
              ),
              ButtonTheme(
                height: 50,
                minWidth: width-10,
                child: RaisedButton.icon(
                    onPressed: (){
                      _insert();
                    },
                    icon: Icon(Icons.save_alt,color: Colors.blue[900],),
                    label: Text("Register"),
                  color: Colors.black,
                  textColor: Colors.white,
                  splashColor: Colors.blue[700],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FabCircularMenu(
        fabColor: Colors.blue[900],
        fabSize: 50,
        ringColor: Colors.black12,
        ringDiameter: 300,
        ringWidth: 90,
        fabOpenColor: Colors.white,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.search,
              color: Colors.white,
            ),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RetrieveData(),
                ),
              );

            },
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.category,
              color: Colors.white,
            ),
          ),
          IconButton(
            //do something on button Press ????? Do it on this onpress
            onPressed: (){},
            icon: Icon(Icons.headset,color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  void   _insert() async{
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : name,
      DatabaseHelper.columnPass  : pass,
      DatabaseHelper.columnEmail  : email,
    };
    
    final id = await dbHelper.insert(row);
    print("Id is:   $id" );
  }
}
