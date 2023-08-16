import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:newflutterproject/screens/recipe_detail_screen.dart';
import 'package:newflutterproject/screens/recipe_details_hot.dart';
import 'package:newflutterproject/screens/recipe_details_medium.dart';

import '../widgets/button.dart';


class VerticalSliderDemo extends StatefulWidget {
 
 final String foodname;
 final String servings;
 final String image;
 final List<String> medium;
 final List<String> mild;
 final List<String> hot;
 final List<String> steps;


 VerticalSliderDemo({required this.foodname, required this.servings, required this.image, required this.hot, required this.medium, required this.mild, required this.steps});
  @override
  _VerticalSliderDemoState createState() => _VerticalSliderDemoState();
}

class _VerticalSliderDemoState extends State<VerticalSliderDemo> {
  double _sliderValue = 0.5;
  
//  String get image => widget.image; 


  String _getValueLabel() {
    if (_sliderValue < 0.33) {
      return 'Mild';
    } else if (_sliderValue < 0.67) {
      return 'Medium';
    } else {
      return 'Hot';
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor:Color(0xffE55451),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: Text(
              (widget.foodname),
              style: TextStyle(
                fontSize: 20,
                fontFamily: GoogleFonts.amaranth().fontFamily,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
              Positioned(
            top: 50,
            left: 20,
            child: Text(
              'Please select your preferred spiciness level',
              style: TextStyle(
                fontSize: 14,
                fontFamily: GoogleFonts.amaranth().fontFamily,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Positioned(
            top:100,
            right: 150,
          child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _getValueLabel(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: GoogleFonts.amaranth().fontFamily,),
            ),
            // SizedBox(height: 10),
            Container(
              height: 300,
              child: SliderTheme(
                data: SliderThemeData(
                  trackHeight: 80,
                  trackShape: RectangularSliderTrackShape(),
                  thumbShape: CustomSliderThumbCircle(thumbRadius: 12),
                 valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                  valueIndicatorTextStyle: TextStyle(fontSize: 18),
                ),
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Slider(
                    value: _sliderValue,
                    onChanged: (newValue) {
                      setState(() {
                        _sliderValue = newValue;
                      });
                    },
                    activeColor: Colors.red,
                    inactiveColor:Color(0xff72CC50),
                    min: 0,
                    max: 1,
                    divisions: 2,
                    label: _getValueLabel(),
                  ),
                ),
              ),
            ),
          ],
        ),
          ),
          Positioned(
            bottom: 30,
            right: 50,
            left: 50,
            child: InkWell(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Color(0xffE55451),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text("Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                   fontFamily: GoogleFonts.amaranth().fontFamily,
                  ),
                  ),
                ),
              ),
            
              
               onTap: (){
                if(_getValueLabel() == 'Mild'){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetails(widget.image, widget.foodname, widget.servings, widget.medium, widget.steps)));
                }
                else if(_getValueLabel() == 'Medium'){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetailsMedium(widget.image, widget.foodname, widget.servings, widget.mild, widget.steps)));
                }
                else if(_getValueLabel() == 'Hot'){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetailsHot(widget.image, widget.foodname, widget.servings, widget.hot, widget.steps)));
                }
             
              },
            )
          ),
          

        ],
      ),
    );
      }
}

class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;

  const CustomSliderThumbCircle({
    required this.thumbRadius,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;
    final ColorTween colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.activeTickMarkColor,
    );
    final double radius = thumbRadius * (1.0 - enableAnimation.value);

    final Paint paint = Paint()
      ..color = colorTween.evaluate(enableAnimation)!
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, paint);
  }
}






