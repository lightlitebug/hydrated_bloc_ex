import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_bloc_ex/blocs/counter/counter_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Hydrated Bloc Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hydrated Bloc'),
      ),
      body: Center(
        child: Text(
          '${context.watch<CounterBloc>().state.counter}',
          style: TextStyle(fontSize: 52),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 0,
            child: Icon(Icons.add),
            onPressed: () {
              context.read<CounterBloc>().add(IncrementCounterEvent());
            },
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 1,
            child: Icon(Icons.remove),
            onPressed: () {
              context.read<CounterBloc>().add(DecrementCounterEvent());
            },
          ),
        ],
      ),
    );
  }
}
