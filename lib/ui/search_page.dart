import 'package:flutter/material.dart';


class SelectionPage extends StatefulWidget {
  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<SelectionPage> {
  TextEditingController  textEditingController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select City To Get Weather'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              labelText: 'City',
              icon: IconButton(
                onPressed: (){
                  Navigator.pop(context,textEditingController.text.toString());
                },
                icon: Icon(Icons.search),
              )
            ),
          ),
        ),
      ),
    );
  }
}