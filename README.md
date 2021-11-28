<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

## Features

Coneectivity Service is for checking the internet connection using provider.



## Installation 

1. Add the latest version of package to your pubspec.yaml (and run`dart pub get`):
```yaml
dependencies:
  connectivity_service: ^0.0.3
```
2. Import the package and use it in your Flutter App.
```dart
import 'package:connectivity_service/connectivity_service.dart';
```
## Example



1. Add the provider in mateerial app

```dart
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<ConnectivitySatus>(
            create: (context) =>
                ConeectivityService().connectionStatusController.stream,
            initialData: ConnectivitySatus.offline)
      ],
      child: MaterialApp(
        title: 'Flutter Application',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Homepage(),
      ),
    );
  }
}

```


2. Then add 'NetworkSensitive' where you need.


```dart
import 'package:connectivity_service/enum/network_sensitivity.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: NetworkSensitive(
          child: Container(child:Text('Your Design here)),
        ),
      ),
    );
  }
}
```

2. In 'NetworkSensitive' page you can create your own design on the offline       section. For now it is a simple text 'No Internet!' but you can design here anything.