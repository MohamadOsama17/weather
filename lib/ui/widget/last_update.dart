import 'package:flutter/material.dart';


class LastUpdate extends StatelessWidget {
 
 DateTime lastUpdate;
 LastUpdate({@required this.lastUpdate});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Updated: ${TimeOfDay.fromDateTime(lastUpdate).format(context)}'
      ,style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.black45,
      ),
          ),

      ),
    );
  }
}