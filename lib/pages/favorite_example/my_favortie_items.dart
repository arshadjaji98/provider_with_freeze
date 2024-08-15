import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/favorite_provider.dart';

class MyFavortieItemsScreen extends StatefulWidget {
  const MyFavortieItemsScreen({super.key});

  @override
  State<MyFavortieItemsScreen> createState() => _MyFavortieItemsScreenState();
}

class _MyFavortieItemsScreenState extends State<MyFavortieItemsScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
            title: const Text("Favorite Items",
                style: TextStyle(color: Colors.white))),
        body: Column(children: [
          Expanded(
              child: ListView.builder(
                  itemCount: favoriteProvider.selectedItem.length,
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
                  }))
        ]));
  }
}
