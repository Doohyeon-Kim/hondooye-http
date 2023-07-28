import 'package:flutter/material.dart';
import 'package:hondooye_http/hondooye_http.dart';

import 'theme_notifier.dart';

void main() {
  runApp(ThemeNotifier(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  const MyHomePage({Key? key, required this.title}) : super(key: key);
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
            final HdyHttp yourHttp =
                HdyHttpUtils.generateHttp(scheme: "https", host: 'api.agify.io');
            final HdyHttp yourHttp2 = HdyHttpUtils.generateHttp(
                scheme: "https",
                host: 'api.agify.io',
                jsonDecodingOption: JsonDecodingOption.noOption);
            final HdyHttp yourHttp3 = HdyHttpUtils.generateHttp(
                scheme: "https",
                host: 'api.agify.io',
                jsonDecodingOption: JsonDecodingOption.utf8);
            final HdyHttp yourHttp4 =
                HdyHttpUtils.generateHttp(scheme: "https", host: 'httpbin.org');

            await yourHttp.client
                .get(path: '', queryParameters: {"name": "dhkim"});
            await yourHttp2.client.external(
                uriAddress: 'https://api.agify.io?name=dhkim', method: "GET");
            await yourHttp3.client.external(
                uriAddress: 'https://api.agify.io?name=dhkim', method: "GET");
            await yourHttp4.client.get(path: 'get');
            await yourHttp4.client.post(path: 'post', body: {});
            await yourHttp4.client.put(path: 'put', body: {});
            await yourHttp4.client.delete(path: 'delete', body: {});
            await yourHttp4.client.patch(path: 'patch', body: {});
          },
          child: const Text("Test"),
        ),
      ),
    );
  }
}
