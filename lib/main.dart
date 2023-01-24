import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Başlagıç',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Başlangıç'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int aktifButon = 0;
  bool checkliMi = false;
  String istenenYazi = '';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                print('remove');
              },
              icon: Icon(Icons.remove)),
          Icon(Icons.add)
        ],
      ),
      body: Center(
        child: Column(
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                color: Color(0xffff0000),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Yazi('Şu anki değer: $_counter'),
            Sayac(
              'Dışarıdaki değer: $_counter',
              ilkDeger: 3,
            ),
            TextButton(
                onPressed: () {
                  print('Incroment pressed');
                  _incrementCounter();
                },
                child: Text('İncroment')),
            YaziYazmaYeri(istenenYazi: istenenYazi),
            Checkbox(
                value: checkliMi,
                onChanged: (value) {
                  print(value);
                  setState(() {
                    if (value != null) {
                      checkliMi = value;
                    }
                  });
                }),
            ElevatedButton(
              onPressed: aktifButon == 0
                  ? () {
                      print('0');
                      setState(() {
                        aktifButon = (aktifButon + 1) % 3;
                        istenenYazi = 'sifir';
                      });
                    }
                  : null,
              child: Text('0'),
            ),
            ElevatedButton(
              onPressed: aktifButon == 1
                  ? () {
                      print('1');
                      setState(() {
                        aktifButon = (aktifButon + 1) % 3;
                        istenenYazi = 'bir';
                      });
                    }
                  : null,
              child: Text('1'),
            ),
            ElevatedButton(
              onPressed: aktifButon == 2
                  ? () {
                      print('2');
                      setState(() {
                        aktifButon = (aktifButon + 1) % 3;
                        istenenYazi = 'iki';
                      });
                    }
                  : null,
              child: Text('2'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: 'Bir',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'İki',
          ),
        ],
      ),
    );
  }
}

class YaziYazmaYeri extends StatefulWidget {
  final String istenenYazi;
  const YaziYazmaYeri({
    Key? key,
    required this.istenenYazi,
  }) : super(key: key);

  @override
  State<YaziYazmaYeri> createState() => _YaziYazmaYeriState();
}

class _YaziYazmaYeriState extends State<YaziYazmaYeri> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      print('yeni değer: ${controller.text}');
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant YaziYazmaYeri oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.istenenYazi != widget.istenenYazi) {
      controller.text = widget.istenenYazi;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        print(value);
      },
      decoration: InputDecoration(
          suffixIcon: IconButton(
        icon: Icon(Icons.delete),
        onPressed: (() {
          controller.text = '';
        }),
      )),
    );
  }
}

class Yazi extends StatelessWidget {
  final String icerik;

  const Yazi(String this.icerik, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(icerik);
  }
}

class Sayac extends StatefulWidget {
  final String baslik;
  final int ilkDeger;
  const Sayac(this.baslik, {super.key, required this.ilkDeger});

  @override
  State<Sayac> createState() => _SayacState();
}

class _SayacState extends State<Sayac> {
  int sayi = 0;
  @override
  void initState() {
    super.initState();
    sayi = widget.ilkDeger;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          sayi++;
        });
      },
      child: Text('${widget.baslik},icerideki:$sayi'),
    );
  }
}
