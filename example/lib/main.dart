import 'package:flutter/material.dart';
import 'package:hondooye_http/hondooye_http.dart';

import 'theme_notifier.dart';

void main() {
  runApp(ThemeNotifier(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeNotifier.of(context)!.theme,
      builder: (BuildContext context, ThemeData themeData, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Hondooye Package Test App',
          theme: themeData,
          home: const MyHomePage(title: 'Hondooye'),
        );
      },
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final HdyHttp yourHttp = HdyHttpUtils.generateHttp(scheme: "https", host: 'jsonplaceholder.typicode.com', port: 443);
            final HdyHttp yourHttp2 = HdyHttpUtils.generateHttp(
                scheme: "https", host: 'jsonplaceholder.typicode.com', jsonDecodingOption: JsonDecodingOption.noOption, port: 443);
            final HdyHttp yourHttp3 = HdyHttpUtils.generateHttp(
                scheme: "https", host: 'jsonplaceholder.typicode.com', jsonDecodingOption: JsonDecodingOption.utf8, port: 443);
            final HdyHttp yourHttp4 = HdyHttpUtils.generateHttp(scheme: "https", host: 'jsonplaceholder.typicode.com', port: 443);

            await yourHttp.client.get(path: '/posts/1', headerList: [
              {"header1": "header1", "header2": "header2"}
            ]);
            await yourHttp2.client.custom(uriAddress: 'https://jsonplaceholder.typicode.com/posts/1', method: "GET");
            await yourHttp3.client.custom(uriAddress: 'https://jsonplaceholder.typicode.com/posts/1', method: "GET");
            await yourHttp4.client.get(path: '/posts/1');
            await yourHttp4.client.post(
              path: '/posts',
              body: {
                "title": "Test Post",
                "body": "This is a test",
                "userId": 1
              },
            );
            await yourHttp4.client.put(path: '/posts/1', body: {
              "id": 1,
              "title": "Updated Post",
              "body": "This is an updated test",
              "userId": 1
            });
            await yourHttp4.client.delete(path: '/posts/1', body: {});
            await yourHttp4.client.patch(path: '/posts/1', body: {
              "title": "Patched Post"
            });
          },
          child: const Text("Test"),
        ),
      ),
    );
  }
}
