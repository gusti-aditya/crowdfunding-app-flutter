import 'package:flutter/material.dart';

class PortofolioView extends StatelessWidget {
  const PortofolioView({
    Key? key,
  }) : super(key: key);

  static const routeName = '/portofolio_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Portofolio'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Anda belum berinvestasi dimanapun',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ],
          ),
        ));
  }
}
