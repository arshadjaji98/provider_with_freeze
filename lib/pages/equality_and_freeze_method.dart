import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider_flutter/pages/model_for_freeze/person_model.dart';

class EqualityAndFreezeMethod extends StatefulWidget {
  const EqualityAndFreezeMethod({super.key});

  @override
  State<EqualityAndFreezeMethod> createState() =>
      _EqualityAndFreezeMethodState();
}

class _EqualityAndFreezeMethodState extends State<EqualityAndFreezeMethod> {
  List<PersonModel> personalList = [];

  @override
  void initState() {
    super.initState();
    var data = [
      {
        'name': 'RDJ',
      },
      {
        'name': 'RTJ',
      },
      {
        'name': 'RGJ',
      },
    ];
    for (int i = 0; i < data.length; i++) {
      personalList.add(PersonModel.fromJson(data[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: personalList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(personalList[index].name),
              );
            }),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Map<String, dynamic> data = {
            'name': null,
          };
          PersonModel model = PersonModel.fromJson(data);
          if (kDebugMode) {
            print("value ${model.name}");
            print(
              "new value ${model.name.toString()}",
            );
          }
          model = model.copyWith(name: 'new value');
        }));
  }
}
