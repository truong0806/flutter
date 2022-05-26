// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Flutter code sample for ScrollMetricsNotification

import 'package:flutter/material.dart';

void main() => runApp(const ScrollMetricsDemo());

class ScrollMetricsDemo extends StatefulWidget {
  const ScrollMetricsDemo({Key? key}) : super(key: key);

  @override
  State<ScrollMetricsDemo> createState() => ScrollMetricsDemoState();
}

class ScrollMetricsDemoState extends State<ScrollMetricsDemo> {
  double windowSize = 200.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ScrollMetrics Demo'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => setState(() {
            windowSize += 10.0;
          }),
        ),
        body: NotificationListener<ScrollMetricsNotification>(
          onNotification: (ScrollMetricsNotification notification) {
            ScaffoldMessenger.of(notification.context).showSnackBar(
              const SnackBar(
                content: Text('Scroll metrics changed!'),
              ),
            );
            return false;
          },
          child: Scrollbar(
            thumbVisibility: true,
            child: SizedBox(
              height: windowSize,
              width: double.infinity,
              child: const SingleChildScrollView(
                child: FlutterLogo(
                  size: 300.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
