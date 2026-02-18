import 'package:flutter/material.dart';
import '../lost_reports/lost_report_page.dart';
import '../found_reports/found_report_page.dart';

class HomePage extends StatelessWidget {
    @override
      Widget build(BuildContext context) {
            return Scaffold(
                    appBar: AppBar(
                              title: Text('Mafqoodati - Home'),
                    ),
                          body: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                                        children: [
                                                                      ElevatedButton(
                                                                                      onPressed: () => Navigator.push(
                                                                                                          context, MaterialPageRoute(builder: (_) => LostReportPage())),
                                                                                                                        child: Text('Report Lost Item'),
                                                                      ),
                                                                                  ElevatedButton(
                                                                                                  onPressed: () => Navigator.push(
                                                                                                                      context, MaterialPageRoute(builder: (_) => FoundReportPage())),
                                                                                                                                    child: Text('Report Found Item'),
                                                                                  ),
                                                        ],
                                            ),
                          ),
            );
      }
}
