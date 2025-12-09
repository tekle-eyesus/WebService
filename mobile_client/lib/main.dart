import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // // NOTE: Use 10.0.2.2 for Android Emulator. Use localhost for iOS simulator. use localhost for chrome
    final HttpLink httpLink = HttpLink(
      'http://localhost:8080/graphql',
    );

    final ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(store: HiveStore()),
      ),
    );

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Simple Web Service',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final String query = """
    query GetGreeting(\$name: String) {
      hello(name: \$name)
    }
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GraphQL & Flutter"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Query(
          options: QueryOptions(
            document: gql(query),
            variables: const {
              'name': 'Tekleeyesus'
            }, // Sending variable to backend
            pollInterval: const Duration(seconds: 10),
          ),
          builder: (QueryResult result,
              {VoidCallback? refetch, FetchMore? fetchMore}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }

            if (result.isLoading) {
              return const CircularProgressIndicator();
            }

            // Display Result
            final String? greeting = result.data?['hello'];

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Response from Spring Boot:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  greeting ?? 'No data',
                  style: const TextStyle(fontSize: 24, color: Colors.blue),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: refetch,
                  child: const Text("Refresh"),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
