import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> recipes = [
    {'name': 'Spaghetti Bolognese', 'details': 'Ingredients and instructions for Spaghetti Bolognese...'},
    {'name': 'Chicken Curry', 'details': 'Ingredients and instructions for Chicken Curry...'},
    // Add more recipes as needed
  ];

  List<Map<String, String>> favoriteRecipes = [];

  // Check if the recipe is a favorite
  bool isFavorite(Map<String, String> recipe) {
    return favoriteRecipes.contains(recipe);
  }

  // Toggle the favorite status of a recipe
  void toggleFavorite(Map<String, String> recipe) {
    setState(() {
      if (isFavorite(recipe)) {
        favoriteRecipes.remove(recipe);
      } else {
        favoriteRecipes.add(recipe);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Book'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(favoriteRecipes: favoriteRecipes),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            title: Text(recipe['name']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    recipe: recipe,
                    isFavorite: isFavorite(recipe),
                    onFavoriteToggled: toggleFavorite,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
