import 'package:baulkhos/project/screens/dashboard.dart';
import 'package:baulkhos/project/screens/profile.dart';
import 'package:baulkhos/project/screens/search.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
List<Widget> WidgetList = [
  DashboardScreen(),
  SearchScreen(),
  Profilescreen()

];
int _selectedIndex = 0;
 
 
 void onItemTap(index){
  setState(() {
    _selectedIndex = index;
  });
 }

  

   

@override
Widget build(BuildContext context){
  return Scaffold(
   
    body: Center(
      child: WidgetList[_selectedIndex]),
   bottomNavigationBar:BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap:onItemTap,
      selectedItemColor: Colors.amber[800],
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
         
      ],
    )
    
  );
}
}