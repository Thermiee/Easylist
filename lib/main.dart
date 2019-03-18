import 'package:flutter/material.dart';
import './pages/auth.dart';
import './pages/product.dart';
import 'pages/product_admin.dart';
import 'pages/productsPage.dart';
import 'package:scoped_model/scoped_model.dart';
import './scoped-models/mainModel.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: MainModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.green,
          accentColor: Colors.lightBlue,
          buttonColor: Colors.lightBlue,
          // fontFamily: 'Oswald'
        ),
        home: AuthPage(),
        routes: {
          '/productpage': (BuildContext context) => ProductsPage(),
          '/admin': (BuildContext context) => ProductsAdminPage(),
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'product') {
            final int index = int.parse(pathElements[2]);
            return MaterialPageRoute<bool>(
                builder: (BuildContext context) => ProductPage(index));
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => ProductsPage());
        },
      ),
    );
  }
}
