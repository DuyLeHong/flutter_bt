import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class LargeScreen extends StatefulWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  _LargeScreenState createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          const Expanded(child: PeopleList(),flex: 2,),
          Expanded(child: Container(),flex: 4,)
        ],
      ),
    );
  }
}

class SmallScreen extends StatelessWidget {
  const SmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

List<People> peopleList = [
  People("Chu Dat", 18, "chudat97@gmail.com"),
  People("Xuan Tien", 21, "aha@gmail.com"),
  People("Xuan Hung", 22, "baasl@gmail.com"),
  People("Xuan Ha", 24, "câcc@gmail.com"),
  People("Nhuyen Huyen", 36, "sorry@gmail.com"),
  People("Alaatka", 18, "alssa@gmail.com"),
  People("Ha Ham", 30, "haham@gmail.com"),
  People("THu Ham", 50, "thuham@gmail.com"),
  People("Thien Nguyen", 22, "thien888@gmail.com"),
];

class PeopleList extends StatelessWidget {
  const PeopleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: peopleList.length,
      itemBuilder: (BuildContext context, int index) {
        return PeopleItem(peopleList[index]);
      },
    );
  }
}

class PeopleItem extends StatelessWidget {
  People people;

  PeopleItem(this.people);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16,left: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Name: ${people.name}",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16
            ),
          ),
          Text(
            "Age: ${people.age}",
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14
            ),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class People {
  var name;
  var age;
  var email;

  People(this.name, this.age, this.email);
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 500) {
            return const LargeScreen();
          }
          return const SmallScreen();
        },
      ),
    );
  }
}
