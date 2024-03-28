import 'package:flutter/material.dart';
import 'package:lista_compras/view/splash.dart';

var formKey = GlobalKey<FormState>();
var txtValor1 = TextEditingController();
var txtValor2 = TextEditingController();
var txtValor3 = TextEditingController();
var txtValor4 = TextEditingController();

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              
              alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/new.webp'),
                fit: BoxFit.cover,
              ),
            ),
              padding: const EdgeInsets.symmetric(horizontal: 40),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const SizedBox(height: 60.0),
                      RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                  children: <TextSpan>[
                    TextSpan(
            text: 'Grocery',
            style: TextStyle(
              color: Colors.white, // Cor branca
            ),
                    ),
                    TextSpan(
            text: 'LIN',
            style: TextStyle(
              color: Color.fromARGB(255, 44, 2, 51), // Cor roxa
            ),
                    ),
                  ],
                ),
              ),
                      const Text(
                        "Cadastre-se",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 44, 2, 51)
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Crie a sua Conta",
                        style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 44, 2, 51)),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      TextFormField(
                        controller: txtValor1,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Informe seu nome';
              }
              
              
              return null;
            },
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Color.fromARGB(255, 44, 2, 51)),
                            borderRadius: BorderRadius.all(Radius.circular(18))
                          ),
                            hintText: "Usuário",hintStyle: TextStyle(color: Color.fromARGB(255, 44, 2, 51)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none),
                                
                            fillColor: Colors.white.withOpacity(0.7),
                            filled: true,
                            prefixIcon: const Icon(Icons.person)),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: txtValor2,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Informe um e-mail';
              }
              
              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value)) {
                return 'Informe um e-mail válido';
              }
             
              return null;
            },
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Color.fromARGB(255, 44, 2, 51)),
                            borderRadius: BorderRadius.all(Radius.circular(18))
                          ),
                            hintText: "Email",hintStyle: TextStyle(color: Color.fromARGB(255, 44, 2, 51)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none),
                            fillColor: Colors.white.withOpacity(0.7),
                            filled: true,
                            prefixIcon: const Icon(Icons.email)),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: txtValor3,
            validator: (value) {
                      if (value!.isEmpty ) {
                        return 'Informe sua senha';
                      }
                      if (value.length <5) {
                return 'Sua senha deve conter ao menos 5 caracteres';
              }
              
                      return null;
                    },

                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Color.fromARGB(255, 44, 2, 51)),
                            borderRadius: BorderRadius.all(Radius.circular(18))
                          ),
                          hintText: "Senha",hintStyle: TextStyle(color: Color.fromARGB(255, 44, 2, 51)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: Colors.white.withOpacity(0.7),
                          filled: true,
                          prefixIcon: const Icon(Icons.password),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: txtValor4,
                        validator: (value) {
                          if (value!.isEmpty ) {
                            return 'Informe sua senha';
                          }
                          
                          if(txtValor3.value != txtValor4.value){
                            return 'Sua senha deve coincidir!';
                          }
                          return null;
                        },
                        
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Color.fromARGB(255, 44, 2, 51)),
                            borderRadius: BorderRadius.all(Radius.circular(18))
                          ),
                          hintText: "Confirme a Senha",hintStyle: TextStyle(color: Color.fromARGB(255, 44, 2, 51)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: Colors.white.withOpacity(0.7),
                          filled: true,
                          prefixIcon: const Icon(Icons.password),
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    child: ElevatedButton(
                      
                      onPressed: () {

                        if (formKey.currentState!.validate()) {
                        
      
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            
                            builder: (BuildContext context) => SplashScreen(), 
                          ),
                        );
                        
                      } else {
                        
                      }

                        
                      },
                      child: const Text(
                        "Cadastrar",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                    width: 1.5,
                    color: Colors.white,
                  ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Color.fromARGB(255, 44, 2, 51),
                        
                      ),
                    ),
                  ),
                  const Center(child: Text("Ou")),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: Color.fromARGB(255, 44, 2, 51),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        
                        children: [
                          Container(
                            height: 30.0,
                            width: 30.0,
                          ),
                          const SizedBox(width: 18),
                          const Text(
                            "    Faça login com Google",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 44, 2, 51),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Já possui uma conta?"),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Entrar",
                          style: TextStyle(color: Color.fromARGB(255, 44, 2, 51)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
