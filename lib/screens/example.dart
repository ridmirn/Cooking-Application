import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SensorDataScreen extends StatelessWidget{
  final String foodname;

  SensorDataScreen(this.foodname);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE55451),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: Text(
              foodname,
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
            top: 100,
            left: 20,
            child: Container(
              width: 310,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(4,4),
                    blurRadius: 3
                  )
                ],
                color: Colors.white,
                )
              ),
            ),
            Positioned(
              top: 120,
              left: 40,
              child: Text('Salt Level',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontFamily: GoogleFonts.amaranth().fontFamily,
                fontSize: 18,
                height: 1,
              ),
              ),
            ),
            Positioned(
        top: 150,
        left: 40,
        child: Text('Medium',
         textAlign: TextAlign.left, 
         style: TextStyle(
        color: Colors.black.withOpacity(0.5),
         fontFamily: GoogleFonts.amaranth().fontFamily,
        fontSize: 16,
        height: 1,
      ),)
      ),
      Positioned(
            top: 230,
            left: 20,
            child: Container(
              width: 310,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(4,4),
                    blurRadius: 3
                  )
                ],
                color: Colors.white,
                )
              ),
            ),
            Positioned(
              top: 250,
              left: 40,
              child: Text('Temperature',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontFamily: GoogleFonts.amaranth().fontFamily,
                fontSize: 18,
                height: 1,
              ),
              ),
            ),
            Positioned(
        top: 280,
        left: 40,
        child: Text('75 * C',
         textAlign: TextAlign.left, 
         style: TextStyle(
        color: Colors.black.withOpacity(0.5),
         fontFamily: GoogleFonts.amaranth().fontFamily,
        fontSize: 16,
        height: 1,
      ),)
      ),
      Positioned(
            top: 360,
            left: 20,
            child: Container(
              width: 310,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(4,4),
                    blurRadius: 3
                  )
                ],
                color: Colors.white,
                )
              ),
            ),
            Positioned(
              top: 380,
              left: 40,
              child: Text('Readiness',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontFamily: GoogleFonts.amaranth().fontFamily,
                fontSize: 18,
                height: 1,
              ),
              ),
            ),
            Positioned(
        top: 410,
        left: 40,
        child: Text('Still Cooking',
         textAlign: TextAlign.left, 
         style: TextStyle(
        color: Colors.black.withOpacity(0.5),
         fontFamily: GoogleFonts.amaranth().fontFamily,
        fontSize: 16,
        height: 1,
      ),)
      ),



          
        ],
      ),
    );
  }

}