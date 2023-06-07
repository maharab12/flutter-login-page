import 'package:flutter/material.dart';
import 'package:test_1/utils/routs.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool ChangeButton = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context)async{
    if(_formkey.currentState!.validate()) {
      setState(() {
        ChangeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRouts.HomeRouts);
      setState(() {
        ChangeButton = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
    child: SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
        children: [
        Image.asset("assets/images/undraw_secure_login_pdn4 - Copy.png",
        fit: BoxFit.cover,),

        Text("Welcome $name"

          ,style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,

        ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
            child:Column(children: [
              TextFormField(

                decoration:
                const InputDecoration(
                    hintText: "Enter UserName",
                    labelText: "UserName"),
                validator: (value){
                  if(value!.isEmpty){
                    return "Username cannot be empty";
                  }
                  return null;

                },

                onChanged: (value){
                  name = value;
                  setState(() {

                  });
                },
              ),

              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(hintText: "Enter Password",
                    labelText: "Passwrod"),
                validator: (value){
                  if(value!.isEmpty){
                    return "password cannot be empty";
                  }
                  else if (value.length<6){
                    return "password lengh should be at lest 6 char";

                  };
                  return null;
                  },
              ),


              const SizedBox(
                height: 60,
              ),
              //inkwell is for making container clickable
              Material(
                color: Colors.black45,
                //shape: ChangeButton?BoxShape.circle:BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(ChangeButton?50:4),
                child: InkWell(
                  onTap: () =>moveToHome(context),
//to make the login button animated
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),

                    width: ChangeButton?55: 150,
                    height: 55,

                    alignment: Alignment.center,
                    child: ChangeButton?const Icon(Icons.done,color:Colors.white,):const Text("Login/SignUp",style:
                      TextStyle(color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 19

                      )
                      ),

                  ),
                ),
              )

              // ElevatedButton(
              //   child: Text("Login/SignUp"),
              //   style: TextButton.styleFrom(minimumSize: Size(50, 50)),
              //   onPressed:(){
              //     Navigator.pushNamed(context, MyRouts.HomeRouts);
              //
              //   },
              //
              // )

            ],
            )

        )


        ],
    ),
      )
    ),
    );


  }
}
