import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget{


  final Function(int) onChange;
  const HeightWidget({super.key, required this.onChange});


  @override
  State<StatefulWidget> createState() => HeightWidgetState();

}

class HeightWidgetState extends State<HeightWidget>{

  //initial height
  int _height=150;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation:20,
          shape:const RoundedRectangleBorder(),
          child:Column(
            children:[


             const Text("HEIGHT",style:TextStyle(
                 fontSize:30,
                 color:Colors.black45,
                 fontWeight: FontWeight.bold)
              ),


             const SizedBox(
                height:5,
              ),


              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children:[
                  Text(_height.toString(),style:const TextStyle(fontSize:40)
                  ),

                  const SizedBox(
                    width:10,
                  ),


                 const Text("Cm",style:TextStyle(
                     fontSize:20,
                     color:Colors.black45,
                     fontWeight: FontWeight.bold)
                  ),

                ],
              ),

              //slider for height
              Slider(
                min:0,  //minimum height
                max:240, //maximum height
                value:_height.toDouble(),
                thumbColor:Colors.red,  //to change the color of thumb in slider
                activeColor: Colors.blue,
                onChanged: (value){
                  setState((){
                    _height=value.toInt();
                  });
                  widget.onChange(_height);
                },
              ),

            ],
          ),
        ),

    );

  }

}