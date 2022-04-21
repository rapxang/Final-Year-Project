import 'package:flutter/material.dart';
import 'package:myapp/model/advertisement_model.dart';

import '../../Services/AdvertisementService.dart';

class ConfirmDialog extends StatefulWidget {
  final Advertisement advertisement;
  final Function refresh;

  ConfirmDialog(this.advertisement, this.refresh);

  @override
  State<ConfirmDialog> createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {

  bool isDisabled = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        isDisabled ? Container(
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(color: Colors.white,),
          ),
        ): GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        isDisabled ? Container(
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(color: Colors.white,),
          ),
        ): GestureDetector(
          onTap: () async {
            setState(() {
              isDisabled = true;
            });
            await AdvertisementService().deleteAdvertisement(widget.advertisement);
            Navigator.pop(context);
            widget.refresh();
            setState(() {
              isDisabled = false;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Confirm",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
      title: Text("Are you sure you want to delete this post"),
    );
  }
}
