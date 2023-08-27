import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SensorDataScreen extends StatefulWidget{
  final String foodname;
    SensorDataScreen(this.foodname);
  @override
  _SensorDataScreen createState() => _SensorDataScreen();
  
}
  
  class _SensorDataScreen extends State <SensorDataScreen>{
    String _display = '';
    String  _displaytemp ='';
    String _displaysalt = '';
    final _database = FirebaseDatabase.instance.ref();

    @override
    void initState(){
      super.initState();
      _activateListeners();
    }

    void _activateListeners(){
      _database.child('sensordata/MLX/obj').onValue.listen((event) {
        final Object? obj = event.snapshot.value;
        setState(() {
          _display = '$obj';
        });
      });

           _database.child('sensordata/MLX/Temp').onValue.listen((event) {
        final Object? Temp = event.snapshot.value;
        setState(() {
          _displaytemp = '$Temp';
        });
      });

             _database.child('sensordata/TDS/level').onValue.listen((event) {
        final Object? level = event.snapshot.value;
        setState(() {
          _displaysalt = '$level';
        });
      });

    }
     

  
    // SensorDataScreen(this.foodname);
  //final ref = FirebaseDatabase.instance.ref('Sensordata');
 

//final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
  
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
            child: Text(widget.foodname,
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
            top: 80,
            left: 20,
            child: Container(
              width: 310,
              height: 100,
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
              top: 100,
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
        top: 130,
        left: 40,
        child: Text(_displaysalt,
         textAlign: TextAlign.left, 
         style: TextStyle(
        color: Colors.black.withOpacity(0.5),
         fontFamily: GoogleFonts.amaranth().fontFamily,
        fontSize: 16,
        height: 1,
      ),)
      ),
      Positioned(
            top: 200,
            left: 20,
            child: Container(
              width: 310,
              height: 100,
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
              top: 230,
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
        top: 260,
        left: 40,
        child: Text(_displaytemp + '*C',
         textAlign: TextAlign.left, 
         style: TextStyle(
        color: Colors.black.withOpacity(0.5),
         fontFamily: GoogleFonts.amaranth().fontFamily,
        fontSize: 16,
        height: 1,
      ),)
      ),
      Positioned(
            top: 320,
            left: 20,
            child: Container(
              width: 310,
              height: 100,
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
              top: 340,
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
        top: 370,
        left: 40,
        child: Text(_display,
         textAlign: TextAlign.left, 
         style: TextStyle(
        color: Colors.black.withOpacity(0.5),
         fontFamily: GoogleFonts.amaranth().fontFamily,
        fontSize: 16,
        height: 1,
      ),)
      ),
       Positioned(
        top: 440,
        left: 50,
        right: 50,
        child: InkWell(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Color(0xffE55451),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text("Stop Buzzer",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                   fontFamily: GoogleFonts.amaranth().fontFamily,
                  ),
                  ),
                ),
              ),
            )
      ),  
        ],
      ),
    );
  }

  }