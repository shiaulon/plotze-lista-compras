import 'package:flutter/material.dart';
import 'package:lista_compras/main.dart';
import 'package:lista_compras/view/sobre.dart';
import 'package:lista_compras/view/tela_login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  extendBodyBehindAppBar: true,
  appBar: AppBar(
  actions: [
    IconButton(
      icon: Icon(Icons.logout_outlined,color: Color.fromARGB(255, 44, 2, 51)),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => LoginPage(), 
          ),
        );
      },
    ),
  ],
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

  body: Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/new.webp'),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      children: [
        SizedBox(height: 80,),
        Image.asset('assets/images/homem.png',height: 200,),
        const SizedBox(height: 40.0),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                    color: Color.fromARGB(255, 44, 2, 51), 
                    width: 2, 
                  ),
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40.0),
                topLeft: Radius.circular(40.0),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 213, 174, 217),
                  ),
                  child: Icon(Icons.list_alt, color: Color.fromARGB(255, 44, 2, 51), size: 50,),
                ),
                SizedBox(height: 25,),
                Text(
                  'Facilitando Suas Compras',
                  style: TextStyle(
                    height: 1,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 44, 2, 51)
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.only(right: 30,left: 30),
                  child: Text('Comece a usar nosso app e economize tempo além de ter mais comodidade na hora de fazer suas compras.',textAlign: TextAlign.center,),
                ),
                SizedBox(height: 25,),
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  width: double.infinity,
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          width: 1.5,
                          color: Colors.white,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        backgroundColor: Color.fromARGB(255, 44, 2, 51)
                      ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => MyHomePage(), 
                          ),
                        );
                      }, 
                      child: Text(
                        'COMEÇE JÁ', 
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => AboutPage(), 
                      ),
                    );
                  }, 
                  child: Text(
                    'SOBRE O DESENVOLVEDOR', 
                    style: TextStyle(color: Color.fromARGB(255, 44, 2, 51))
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);
  }
}