import 'package:flutter/material.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../core/widgets/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoundReportPage extends StatefulWidget {
    @override
      _FoundReportPageState createState() => _FoundReportPageState();
}

class _FoundReportPageState extends State<FoundReportPage> {
    final nameController = TextEditingController();
      final descriptionController = TextEditingController();

        void submitReport() {
              FirebaseFirestore.instance.collection('found_reports').add({
                      'name': nameController.text,
                            'description': descriptionController.text,
                                  'timestamp': FieldValue.serverTimestamp(),
              });
                  ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Found report submitted')),
                  );
                      Navigator.pop(context);
        }

          @override
            Widget build(BuildContext context) {
                  return Scaffold(
                          appBar: AppBar(title: Text('Report Found Item')),
                                body: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                                  child: Column(
                                                              children: [
                                                                            CustomTextField(controller: nameController, hint: 'Item Name'),
                                                                                        SizedBox(height: 20),
                                                                                                    CustomTextField(controller: descriptionController, hint: 'Description'),
                                                                                                                SizedBox(height: 20),
                                                                                                                            CustomButton(text: 'Submit', onPressed: submitReport),
                                                              ],
                                                  ),
                                ),
                  );
            }
}
