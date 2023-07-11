import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Counter Functions"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
            ),
          ],
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('$clickCounter',
                style: const TextStyle(
                    fontSize: 160, fontWeight: FontWeight.bold)),
            Text(
              clickCounter == 1 ? "click" : "clicks",
              style: const TextStyle(fontSize: 40),
            )
          ]),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
                icon: Icons.refresh_outlined,
                onPress: () {
                  setState(() {
                    clickCounter = 0;
                  });
                }),
            const SizedBox(height: 20),
            CustomButton(
                icon: Icons.plus_one,
                onPress: () {
                  setState(() {
                    clickCounter++;
                  });
                }),
            const SizedBox(height: 20),
            CustomButton(
              icon: Icons.exposure_minus_1_outlined,
              onPress: () {
                setState(() {
                  if (clickCounter == 0) return;
                  clickCounter--;
                });
              },
            )
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPress;

  const CustomButton({
    super.key,
    required this.icon,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        // shape: const StadiumBorder(),
        elevation: 5,
        onPressed: onPress,
        child: Icon(icon));
  }
}
