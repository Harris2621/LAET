import 'package:baulkhos/project/widgets/bottombar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;

   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex=index;
    });
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
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Enter search keyword',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // Handle search query change
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Perform search action
                String query = _searchController.text;
                // You can perform search actions using this query
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(currentIndex:_selectedIndex ,onTap: _onItemTapped,),
    );
  }
}
