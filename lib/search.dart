import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _controller = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _searchQuery.isEmpty
            ? Text('Search Page')  
            : Text('Searching for "$_searchQuery"'),  
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _controller.clear(); 
                _searchQuery = '';     
              });
            },
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56.0),  
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
              ),
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;  
                });
              },
            ),
          ),
        ),
      ),
      body: Center(
        child: Text(
          _searchQuery.isEmpty
              ? 'Type something to search...'  
              : 'Searching for "$_searchQuery"',  
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
