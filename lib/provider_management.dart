import 'package:belajarprovider/provider_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderManagement extends StatelessWidget {
  ProviderManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        print("1. Provider widget build");
        return ProviderCounter();
      },
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text("Provider Management"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              /*Consumer<ProviderCounter>(
                builder: (context, providerCounter, child) {
                  print("2. Consumer dijalankan");
                  return Text(
                    '${providerCounter.counter}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),*/
              Text(
                '${context.watch<ProviderCounter>().counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<ProviderCounter>().increment();
                  },
                  child: Text("Tambah")),
              ElevatedButton(
                  onPressed: () {
                    Provider.of<ProviderCounter>(context, listen: false)
                        .decrement();
                    //context.read<ProviderCounter>().decrement();
                  },
                  child: Text("Kurang")),
            ],
          ),
        ),
      ),
    );
  }
}
