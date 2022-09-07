import 'package:cashflowplus/model/bisnis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './scr/menu/menu_view_detail.dart';
import './provider/bisnis_provider.dart';
import './provider/auth_provider.dart';
import './scr/widget/splash_screen.dart';
import './scr/menu/menu_demo.dart';
import './scr/login/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: BisnisProvider(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Cashflow+',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: auth.isAuth
              ? MenuDemoScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : LoginView(),
                ),
          routes: {
            MenuDemoScreen.routeName: (ctx) => MenuDemoScreen(),
          },
        ),
      ),
    );
  }
}
