import 'package:flutter/material.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Flex demo - Code Fresher"),
          ),
        ),
        body: Column(
          children: [
            const Expanded(
              child: FlutterWidget(),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: const Divider(thickness: 2, color: Colors.lightGreen),
            ),
            const Expanded(
              child: AndroidWidget(),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: const Divider(thickness: 2, color: Colors.lightGreen),
            ),
            const Expanded(
              child: JavaCoreWidget(),
            )
          ],
        ),
      ),
    );
  }
}

class AndroidWidget extends StatelessWidget {
  const AndroidWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Lập trình Android",
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Java + Kotlin",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  )
                ],
              )),
          Expanded(
              flex: 1,
              child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlWvB7JEzj-2BjXDBtOl_WHFE4zRsniCyjIQ&usqp=CAU')),
        ],
      ),
    );
  }
}

class JavaCoreWidget extends StatelessWidget {
  const JavaCoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBy7lAhCz9Jeq2b0EPQ6yaI2Za4WUPBgfnVtaRptwu306CLHUzHP81aLe_hHvSvZwPAr0&usqp=CAU')),
          Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Lập trình Java cơ bản",
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Cho người mới bắt đầu",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

class FlutterWidget extends StatelessWidget {
  const FlutterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStE80StFXxu1ku5vp52LpR3DLx4OXUmby_7A&usqp=CAU'),
          ),
          Expanded(
            flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Lập trình Flutter",
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Thực chiến dự án app mobile 2022",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
