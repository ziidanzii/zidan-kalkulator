import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<String> history;

  const HistoryPage({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Riwayat Kalkulasi")),
      body: Center(
  child: Container(
    constraints: BoxConstraints(
      minWidth: 100,
      maxWidth: 300,
    ),
    padding: EdgeInsets.all(16),
    child: history.isEmpty
        ? Center(child: Text("Belum ada riwayat", style: TextStyle(fontSize: 18)))
        : ListView.builder(
            itemCount: history.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(history[index], style: TextStyle(fontSize: 18)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
