import 'package:flutter/material.dart';

class HidePassworld extends StatefulWidget {
  const HidePassworld({super.key});

  @override
  State<HidePassworld> createState() => _HidePassworldState();
}

class _HidePassworldState extends State<HidePassworld> {
  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text(
          "Change Theme",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              ValueListenableBuilder(
                  valueListenable: toggle,
                  builder: (context, value, child) {
                    return TextFormField(
                        obscureText: toggle.value,
                        decoration: InputDecoration(
                            hintText: 'Enter Passwrod',
                            suffix: IconButton(
                                onPressed: () {
                                  toggle.value = !toggle.value;
                                },
                                icon: Icon(
                                  toggle.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ))));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
