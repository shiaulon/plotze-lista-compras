import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton( 
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent, 
        title: RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
      ),
      children: <TextSpan>[
        TextSpan(
          text: 'Grocery',
          style: TextStyle(
            color: Colors.white, 
          ),
        ),
        TextSpan(
          text: 'LIN',
          style: TextStyle(
            color: Color.fromARGB(255, 44, 2, 51), 
          ),
        ),
      ],
    ),
  ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/new.webp'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 85,),
              Container(
                
                height: 250,
                width: 220,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 44, 2, 51), 
                    width: 2, 
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  image: DecorationImage(
                    image: AssetImage('assets/images/lin.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              
              SizedBox(height: 45.0),
              Container(
                width: double.infinity, 
                height: 500,
                decoration:  BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 44, 2, 51), 
                    width: 2, 
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 45,),
                    Text(
                      'Lin Shiau Lon Rocha',
                      style: TextStyle(
                        height: 1,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 44, 2, 51),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 35,),
                    Padding(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      child: Text(
                        '24 anos. Estudante de engenharia de computação na Unaerp e anteriormente na UFG. Fundador e CEO da GroceryLIN. Gênio, bilionário, playboy e filantropo, além de obviamente bonito e sexy!',
                        textAlign: TextAlign.justify, 
                        style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 44, 2, 51)),),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      padding: EdgeInsets.only(left: 20,right: 20),
                      width: double.infinity,
                    ),
                    SizedBox(height: 5,),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
