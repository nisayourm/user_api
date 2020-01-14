import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  List users;
  Map userDate;
  Future setUser() async{
    String url = "https://reqres.in/api/users";
    http.Response response = await http.get(url);
    userDate = json.decode(response.body);
    // debugPrint(response.body);
    setState(() {
      users = userDate['data'];
    });
  }
  @override
  void initState() {
    super.initState();
    setUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User infomation"),
      ),
        body: ListView.builder(
          itemCount: users == null ? 0 : users.length,
          itemBuilder: (BuildContext context, int i){
            final user = users[i];
            
            return Card( 
              
                child: Container(
                
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage("${user["avatar"]}"),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text("${user["first_name"]}"),
                      )
                    ],
                  ),
                ),
            );
            
          },
        ),
        
    );
  }
}