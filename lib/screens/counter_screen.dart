import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    if (counter > 0) {
      counter--;
      setState(() {});
    } else {
      counter = 0;
    }
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text('Counter Screen'),
          elevation: 8,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Clicks Counter', style: fontSize30),
              Text('$counter', style: fontSize30),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomFloatingActions(
          increaseFn: increase,
          decreaseFn: decrease,
          resetFn: reset,
        ));
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;

  const CustomFloatingActions({
    Key? key,
    required this.increaseFn,
    required this.decreaseFn,
    required this.resetFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FloatingActionButton(
          elevation: 5,
          backgroundColor: Colors.indigoAccent,
          onPressed: () => decreaseFn(),
          child: const Icon(Icons.do_disturb_on, size: 50),
        ),
        FloatingActionButton(
          elevation: 5,
          backgroundColor: Colors.deepOrangeAccent,
          onPressed: () => resetFn(),
          child: const Icon(Icons.replay, size: 50),
          // () => setState(() => counter = 0),
        ),
        FloatingActionButton(
          elevation: 5,
          backgroundColor: Colors.teal,
          onPressed: () => increaseFn(),
          child: const Icon(Icons.add, size: 50),
          // () => setState(() => counter++),
        ),
      ],
    );
  }
}
