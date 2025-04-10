import 'package:flutter/material.dart';
import 'package:comic/main.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}



class _RegisterPageState extends State<RegisterPage> {
  bool _hidingPW=true;
  bool _hidingCPW=true;
  Icon _activePW = Icon(Icons.visibility);
  Icon _activeCPW = Icon(Icons.visibility);
  TextEditingController idCtr= TextEditingController();
  TextEditingController namaCtr= TextEditingController();
  TextEditingController judulCtr= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Text("")),
              Text(" Register",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
              ),
              Expanded(child: Text("")),
              SizedBox(height: 50,)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Text("")),
              Text(" Buat akun baru",
                style: TextStyle(
                  fontSize: 20,
                  ),
              ),
              Expanded(child: Text("")),
            ]
          ),
          SizedBox(height: 70,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Text("")),
              SizedBox(width: 200, child: TextField(
                decoration: InputDecoration(
                    labelText: " First Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                    ),
                    filled: true,
                    ),
                ),
              ),
              SizedBox(width: 10,),
              SizedBox(width: 200, child: TextField(
                decoration: InputDecoration(
                    labelText: " Last Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                    ),
                    
                    filled: true,
                    ),
                ),
              ),
              Expanded(child: Text("")),
            ]
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Text("")),
              SizedBox(width: 410, child: TextField(
                decoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                    ),
              
                    filled: true,
                    prefixIcon: const Icon(Icons.person),
                    ),
                ),
              ),
              Expanded(child: Text("")),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Text("")),
              SizedBox(width: 410, child: TextField(
                decoration: InputDecoration(
                  
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                    ),
              
                    filled: true,
                    prefixIcon: const Icon(Icons.email_outlined),
                    ),
                    keyboardType: TextInputType.emailAddress
                ),
              ),
              Expanded(child: Text("")),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Text("")),
              SizedBox(width: 410, child: TextField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                    ),
                    filled: true,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: 
                      IconButton(onPressed: (){
                        setState(() {
                          _hidingPW = !_hidingPW;
                          if(_hidingPW){
                            _activePW = Icon(Icons.visibility);
                          }
                          else{
                            _activePW = Icon(Icons.visibility_off);
                          }
                        });
                        }, icon: _activePW)
                  ),
                  obscureText: _hidingPW, 
                ),
              ),
              
              Expanded(child: Text("")),
            ],
            
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Text("")),
              SizedBox(width: 410, child: TextField(
                decoration: InputDecoration(
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                    ),
                    filled: true,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: 
                      IconButton(onPressed: (){
                        setState(() {
                          _hidingCPW = !_hidingCPW;
                          if(_hidingCPW){
                            _activeCPW = Icon(Icons.visibility);
                          }
                          else{
                            _activeCPW = Icon(Icons.visibility_off);
                          }
                        });
                        }, icon: _activeCPW)
                  ),
                  obscureText: _hidingCPW, 
                ),
              ),
              Expanded(child: Text("")),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Text("")),
              Container(
                width: 410,
                height: 45,
                child: 
                  TextButton(onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage())
                      );
                  },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.grey)
                  ),
                ), 
                  child: Text("Register",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,)),
              ),
              ),
              Expanded(child: Text("")),
            ],
          ),
          // SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Text("")),
              Text("By signing up, you agree to the Terms of Service and Privacy Policy",
                style: TextStyle(
                  fontSize: 13,)
                  ),
              Expanded(child: Text("")),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Text("")),
              Text("Have an account already?",
                style: TextStyle(
                  fontSize: 17,)
                  ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage())
                  );
                },
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: const Text(
                  "Login?",
                  style: TextStyle(fontSize: 17,
                  color: Colors.blueGrey,), 
                ),
              ),
              Expanded(child: Text("")),
            ],
          ),
          
        ],
        ),
      ),
    );
  }
}