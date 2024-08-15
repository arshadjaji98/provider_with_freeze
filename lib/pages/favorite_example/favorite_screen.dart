import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/provider/favorite_provider.dart';

import 'my_favortie_items.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyFavortieItemsScreen()));
              },
              child: const Icon(Icons.favorite, color: Colors.white)),
          const SizedBox(width: 20)
        ],
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: const Text(
          "Favorite Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Consumer<FavoriteProvider>(
                    builder: (context, value, child) {
                  return ListTile(
                    onTap: () {
                      if (value.selectedItem.contains(index)) {
                        value.removeItems(index);
                      } else {
                        value.addItems(index);
                      }
                    },
                    title: Text("Item $index"),
                    trailing: Icon(value.selectedItem.contains(index)
                        ? Icons.favorite
                        : Icons.favorite_border),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
