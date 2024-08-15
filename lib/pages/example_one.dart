import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/provider/example_one_provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ExampleOneProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.green,
            title: const Text("Provider Tutorials",
                style: TextStyle(color: Colors.white))),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Consumer<ExampleOneProvider>(
                      builder: (context, value, child) {
                    return Slider(
                        value: value.value,
                        onChanged: (val) {
                          value.setValue(val);
                        });
                  }),
                  Consumer<ExampleOneProvider>(
                      builder: (context, value, child) {
                    return Row(children: [
                      Expanded(
                          child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(value.value)),
                              child: const Center(child: Text("Container 1")))),
                      Expanded(
                          child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(value.value)),
                              child: const Center(child: Text("Container 1"))))
                    ]);
                  })
                ])));
  }
}
