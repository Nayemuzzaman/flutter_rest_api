import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rest_api/models/article_model.dart';
import 'package:flutter_rest_api/network/network_enum.dart';
import 'package:flutter_rest_api/network/network_helper.dart';
import 'package:flutter_rest_api/network/network_service.dart';
import 'package:flutter_rest_api/network/query_param.dart';
import 'package:flutter_rest_api/static/static_values.dart';
import 'package:flutter_rest_api/widgets/article_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rest Api',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RendererBinding.instance.setSemanticsEnabled(true);

    return Scaffold(
      appBar: AppBar(
        title: const Text("News article list"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final List<Articles> articles = snapshot.data as List<Articles>;

            return ListView.builder(
              itemBuilder: (context, index) {
                return ArticleWidget(article: articles[index]);
              },
              itemCount: articles.length,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 25,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Something went wrong'),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future<List<Articles>?> getData() async {
    final response = await NetworkService.sendRequest(
        requestType: RequestType.get,
        url: StaticValues.apiUrl,
        queryParam: QP.apiQP(
            apiKey: StaticValues.apiKey, country: StaticValues.apiCountry));

    print(response?.statusCode);

    return NetworkHelper.filterResponse(
        callBack: _listOfArticlesFromJson,
        response: response,
        parameterName: CallBackParameterName.articles,
        onFailureCallBackWithMessage: (errorType, msg) {
          print('Error type-$errorType - Message $msg');
          return null;
        });
  }
    List<Articles> _listOfArticlesFromJson(json) => (json as List)
      .map((e) => Articles.fromJson(e as Map<String, dynamic>))
      .toList();

}
