import 'package:baulkhos/project/widgets/bottombar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {

int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
 

  void _update(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

   void _onItemTapped(int index) {
   _update(index);
    if(index == 1){
      Navigator.pushNamed(context, '/search');

    }
    if(index == 0){
      Navigator.pushNamed(context, '/home');

    }
    if(index == 2){
      Navigator.pushNamed(context, '/profile');

    }
    if(index==3){
      Navigator.pushNamed(context, '/camera');
    }
   }

@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(title: Text("LAET"),),
    body: Center(
      child:
      Text(
        "hi",
        style: optionStyle,)),
    bottomNavigationBar: MyBottomNavigationBar(
      currentIndex:_selectedIndex ,
      onTap: _onItemTapped,),
    
  );
}
}