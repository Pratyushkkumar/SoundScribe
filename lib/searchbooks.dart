import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookSearchPage extends StatefulWidget {
  @override
  _BookSearchPageState createState() => _BookSearchPageState();
}

class _BookSearchPageState extends State<BookSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<BookItem> _searchResults = [];
  

  Future<void> _searchBooks(String query) async {
    final apiKey = 'AIzaSyBT7Kutnd82yDxwx5g2cnUbDPK-pOueBAw';
    final apiUrl =
        'https://www.googleapis.com/books/v1/volumes?q=${Uri.encodeComponent(query)}&key=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['items'] != null) {
        setState(() {
          _searchResults = List<BookItem>.from(
            data['items'].map((item) => BookItem.fromJson(item)),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Embark on a Book Hunt'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(217, 47, 171, 134),
      ),
      backgroundColor: Color.fromARGB(255, 228, 250, 241),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(

              controller: _searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                filled: true,
                    fillColor: Colors.white,
                labelText: 'Search for a book',
                suffixIcon: IconButton(
                  onPressed: () {
                    _searchBooks(_searchController.text);
                  },
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final book = _searchResults[index];
                return ListTile(
                  title: Text(book.title),
                  subtitle: Text(book.author),
                    );
                  })),
        ],
      ),
    );
  }
}

class BookItem {
  final String title;
  final String author;

  BookItem({required this.title, required this.author});

  factory BookItem.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'];
    final title = volumeInfo['title'];
    final authors = volumeInfo['authors'] ?? ['Unknown Author'];
    final author = authors.join(', ');

    return BookItem(title: title, author: author);
  }
}
