import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Swipe",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHome(),      
    );
  }
}
class MyHome extends StatelessWidget {
  final List<String> items=List<String>.generate(30, (i)=>"Items ${i+1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe to dismiss",
        style: TextStyle(
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder:(context,int index){
          
          return Dismissible(
            key: Key(items[index]),            
            onDismissed: (direction){
              items.removeAt(index);
              
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Item dismissed."),
              ));
            },
            background: Container(
              color: Colors.red,
            ),
            child: ListTile(
              title: Text(items[index]),
            ),
          
          );
        },
      ),
      
    );
  }
}