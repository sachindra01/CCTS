import 'package:ccts/src/config/style.dart';
import 'package:flutter/material.dart';
class CustomDialog extends StatelessWidget {
   final VoidCallback?onOkpressed;
   final Color  ? bgColor;
   final String ? submitText;
   final String ? alertMessageText;
   final Color  ? alertMessageTextColor;
   final double  ? alertMessageTextSize;
   final Color  ? submitTextColor;
   final double ? submitTextSize;
    const CustomDialog({super.key, this.onOkpressed, this.bgColor, this.submitText, this.submitTextColor, this.alertMessageText, this.alertMessageTextColor, this.alertMessageTextSize, this.submitTextSize});


    @override
    Widget build(BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: dialogContent(context),
      );
    }

    Widget dialogContent(BuildContext context) {
      return Container(
        margin: const EdgeInsets.only(left: 0.0,right: 0.0),
        child: Stack(
          children: <Widget>[
            Container(  
              padding: const EdgeInsets.only(
              top: 18.0,
              ),
              margin: const EdgeInsets.only(top: 13.0,right: 8.0),
              decoration: BoxDecoration(
                color:bgColor??red,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ]
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(  
                    height: 20.0,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(alertMessageText??"You are not register User!\nRegister now?", style:TextStyle(fontSize: alertMessageTextSize?? 15.0,color:alertMessageTextColor?? Colors.white)),
                    )//
                  ),
                  const SizedBox(height: 24.0),
                  InkWell(
                    onTap:onOkpressed,
                    child: Container(
                      padding: const EdgeInsets.only(top: 15.0,bottom:15.0),
                      decoration: const BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0)),
                      ),
                      child:   Text(submitText??
                        "OK",
                        style: TextStyle(color: submitTextColor??Colors.green,fontSize:submitTextSize?? 25.0),
                        textAlign: TextAlign.center,
                      ),
                    )
                  )
                ],
              ),
            ),
            Positioned(
              right: 0.0,
              child: GestureDetector(
                onTap: (){
                    Navigator.of(context).pop();
                },
                child: const Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                  radius: 14.0,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.close, color: Colors.red),
                  ),
                ),
              ),
            ), 
          ],
        ),
      );
    }
  }