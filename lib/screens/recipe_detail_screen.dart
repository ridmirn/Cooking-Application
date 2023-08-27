import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newflutterproject/screens/sensor_data.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeDetails extends StatelessWidget {

final String image;
final String foodname;
final String servings;
final List<String> medium;
final List<String> steps;
RecipeDetails(this.image, this.foodname, this.servings, this.medium, this.steps);
 
  
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: (size.height / 2),
        maxHeight: (size.height/ 1.2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        parallaxEnabled: true,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,    
               //child: Hero(
               // tag: Food.image,
                 child: Image(
                      height: (size.height / 2) + 50,
                      width: double.infinity,
                      fit: BoxFit.cover,
                       //image: AssetImage("assests/image2.png" ),
                       image: NetworkImage(image),
                    ),
               //),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        ),
        panel: Padding(
          //padding: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(color: Colors.black.withOpacity(
                    0.3,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    ),
                ),
              ),
            SizedBox(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    foodname,
                     style: TextStyle(
                      color: Colors.black,
                      fontFamily: GoogleFonts.amaranth().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                     ),
                  ),
                 MaterialButton(
                   onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SensorDataScreen(foodname))),
                   child: Container(       
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color(0xffE55451),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text("Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                     fontFamily: GoogleFonts.amaranth().fontFamily,
                    ),
                    ),
                  ),
                   ),
                 ),

                ],
              ),
              //  SizedBox(
              //   height: 30,
              // ),
              //  Text(foodname,
              //  style: _textTheme.titleMedium,
              //  ),
              //   SizedBox(
              //   height: 5,
              // ),
               Text( servings + " Serving",
                     style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontFamily: GoogleFonts.amaranth().fontFamily,
                      fontSize: 14,
            )
               ),
              //  SizedBox(
              //   height: 10,
              //  ),
               Divider(
                color: Colors.black.withOpacity(0.3),
               ),
               Expanded(child: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black.withOpacity(0.3),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                      tabs: [
                      Tab(text: "Ingridents".toUpperCase(),
                      ),
                      Tab(text: "Preparation".toUpperCase(),
                      ),
                    ],
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.3),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          //Ingridents(ingridents: ingridents),
                           ListView.builder(
                            itemCount: medium.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(medium[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: GoogleFonts.amaranth().fontFamily,
                                ),),
                              );
                            },

                           ),
                            ListView.builder(
                              itemCount: steps.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(steps[index],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: GoogleFonts.amaranth().fontFamily,
                                  ),),
                                );
                              },
                            )

                        
                        ],
                        ),
                        ),

                  ],),
               ))
            ],
            
          ),
        ),

      ),


    );


  }
}

