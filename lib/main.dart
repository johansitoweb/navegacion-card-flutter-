import 'package:flutter/material.dart';  

void main() {  
  runApp(MyApp());  
}  

class MyApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      title: 'Flutter Navigation Example',  
      theme: ThemeData(  
        primarySwatch: Colors.blue,  
      ),  
      home: HomeScreen(),  
    );  
  }  
}  

class HomeScreen extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(title: Text('Home Screen')),  
      body: Center(  
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,  
          children: <Widget>[  
            CardWidget(title: 'Card 1', color: Colors.red, context: context),  
            CardWidget(title: 'Card 2', color: Colors.green, context: context),  
            CardWidget(title: 'Card 3', color: Colors.blue, context: context),  
          ],  
        ),  
      ),  
    );  
  }  
}  

class CardWidget extends StatelessWidget {  
  final String title;  
  final Color color;  
  final BuildContext context;  

  CardWidget({required this.title, required this.color, required this.context});  

  @override  
  Widget build(BuildContext context) {  
    return Card(  
      color: color,  
      margin: EdgeInsets.all(10),  
      child: InkWell(  
        onTap: () {  
          Navigator.push(  
            this.context,  
            MaterialPageRoute(  
              builder: (context) => DetailScreen(title: title),  
            ),  
          );  
        },  
        child: Container(  
          padding: EdgeInsets.all(20),  
          child: Center(  
            child: Text(  
              title,  
              style: TextStyle(color: Colors.white, fontSize: 24),  
            ),  
          ),  
        ),  
      ),  
    );  
  }  
}  

class DetailScreen extends StatelessWidget {  
  final String title;  

  DetailScreen({required this.title});  

  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: Text('Detail Screen'),  
      ),  
      body: Center(  
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,  
          children: <Widget>[  
            Text(  
              'Details of $title',  
              style: TextStyle(fontSize: 30),  
            ),  
            SizedBox(height: 20),  
            ElevatedButton(  
              onPressed: () {  
                Navigator.pop(context);  
              },  
              child: Text('Back to Home'),  
            ),  
          ],  
        ),  
      ),  
    );  
  }  
}

