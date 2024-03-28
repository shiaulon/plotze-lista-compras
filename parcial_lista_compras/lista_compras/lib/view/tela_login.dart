import 'package:flutter/material.dart';
import 'package:lista_compras/view/splash.dart';
import 'package:lista_compras/view/tela_cadastro.dart';

var formKey = GlobalKey<FormState>();
var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();
  String email = 'shiaulon@mail.com';
  String senha = '123456';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
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
              children: [
                _header(context),
                _inputField(context),
                _forgotPassword(context),
                _signup(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _header(context) {
    return  Column(
      children: [
        SizedBox(height: 30,),
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
        const Text(
          "Bem vindo de volta!",textAlign: TextAlign.center,
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 44, 2, 51),)
          ,
        ),
        
        SizedBox(height: 10,),
        Text("Entre seus dados para entrar", style: TextStyle(color: Color.fromARGB(255, 44, 2, 51)),),
      ],
    );
  }

  _inputField(context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: txtValor1,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Informe um e-mail';
              }
              
              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value)) {
                return 'Informe um e-mail válido';
              }
              if(value!=email){
                return 'seu email nao esta cadastrado';
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
                    borderSide: BorderSide.none
                ),
                fillColor: Colors.white.withOpacity(0.7),
                filled: true,
                prefixIcon: const Icon(Icons.person)),
          ),
          const SizedBox(height: 25),
          TextFormField(
            controller: txtValor2,
            validator: (value) {
                      if (value!.isEmpty ) {
                        return 'Informe sua senha';
                      }
                      if (value.length <5) {
                return 'Sua senha deve conter ao menos 5 caracteres';
              }
              if(value!=senha){
                return 'sua senha nao esta correta';
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
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                        
      
                        Navigator.pushReplacement(context, MaterialPageRoute<void>(
                            builder: (BuildContext context) => SplashScreen(), 
                          ),);
                        
                      } else {
                        
                      }
            },
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
            child: const Text(
              "Login",
              style: TextStyle(fontSize: 20,color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  _forgotPassword(context) {
    return TextButton(
      onPressed: () {},
      child: const Text("Esqueceu sua senha?",
        style: TextStyle(color: Color.fromARGB(255, 44, 2, 51)),
      ),
    );
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Não possui uma conta ainda? "),
        TextButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute<void>(
      builder: (BuildContext context) => const SignupPage(),
    ),);
            },
            child: const Text("Cadastrar-se", style: TextStyle(color: Color.fromARGB(255, 44, 2, 51)),)
        )
      ],
    );
  }
}