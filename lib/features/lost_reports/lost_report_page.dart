import 'package:flutter/material.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../core/widgets/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LostReportPage extends StatefulWidget {
    @override
      _LostReportPageState createState() => _LostReportPageState();
}

class _LostReportPageState extends State<LostReportPage> {
    final nameController = TextEditingController();
      final descriptionController = TextEditingController();

        void submitReport() {
              FirebaseFirestore.instance.collection('lost_reports').add({
                      'name': nameController.text,
                            'description': descriptionController.text,
                                  'timestamp': FieldValue.serverTimestamp(),
              });
                  ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Lost report submitted')),
                  );
                      Navigator.pop(context);
        }

          @override
            Widget build(BuildContext context) {
                  return Scaffold(
                          appBar: AppBar(title: Text('Report Lost Item')),
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
