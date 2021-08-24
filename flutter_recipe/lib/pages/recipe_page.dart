import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe/components/recipe_list_item.dart';
import 'package:flutter_recipe/components/recipe_menu.dart';
import 'package:flutter_recipe/components/recipe_title.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildRecipeAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            RecipeTitle(),
            RecipeMenu(),
            RecipeListItem("coffee", "Made Coffee"),
            RecipeListItem("burger", "Made burger"),
            RecipeListItem("pizza", "Made pizza"),
          ],
        ),
      ),
    );
  }

  AppBar _buildRecipeAppbar() => AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        actions: [
          Icon(
            CupertinoIcons.search,
            color: Colors.black,
          ),
          SizedBox(
            width: 15,
          ),
          Icon(
            CupertinoIcons.heart,
            color: Colors.red,
          ),
          SizedBox(
            width: 15,
          ),
        ],
      );
}
