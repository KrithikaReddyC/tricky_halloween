import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final Map<String, String> recipe;
  final Function(Map<String, String>) onFavoriteToggled;
  final bool isFavorite;

  DetailsScreen({
    required this.recipe,
    required this.onFavoriteToggled,
    required this.isFavorite,
  });

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe['name']!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.recipe['details']!),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
                widget.onFavoriteToggled(widget.recipe);
              },
              child: Text(_isFavorite ? 'Unmark Favorite' : 'Mark as Favorite'),
            ),
          ],
        ),
      ),
    );
  }
}
