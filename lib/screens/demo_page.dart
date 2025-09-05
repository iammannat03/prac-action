import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                'Demo Page',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Text(
                      'Demo Page $index',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    );
                  },
                ),
              ),
              Text(
                'Demo Page',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
