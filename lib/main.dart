import 'dart:convert';

import 'package:apiintegration5/Quotes.dart';
import 'package:flutter/material.dart';
import 'RespMain.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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




  Future<List<Quotes>> fetchquotes()  async {
    final response = await http.get(Uri.parse("https://dummyjson.com/quotes"));
    if (response.statusCode == 200) {
      var getQuotesData = json.decode(response.body.toString());
      var res=RespMain.fromJson(getQuotesData);
      var listquotes =res.quotes ;
      return listquotes;
    } else {
      throw Exception('Failed to load quotes');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child:  FutureBuilder(
          future: fetchquotes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var  plist = snapshot.data as List<Quotes>;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: plist == null ? 0 : plist.length,
                itemBuilder: (BuildContext context, int index) {
                  Quotes st = plist[index];
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            child: Column(
                              children: <Widget>[
                                Text('id: ${st.id}'),
                                Text('quote: ${st.quote}'),
                                Text('author: ${st.author}'),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
