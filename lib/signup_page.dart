import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';
1

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  String email="";
  String password="";
  TextEditingController emailController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();
  TextEditingController confirmpassController=new TextEditingController();
  final key=GlobalKey<FormState>();
  void _handleSignUp()async{
    try{
      UserCredential userCredential=await _auth.createUserWithEmailAndPassword(email:email,password:password);
      print("user registered");
    }catch(e){
      print("Error durin registration:$e");
    }
  }
  // Future signup(String Email,String Password,)
  // async{
  //   final FirebaseAuth auth=await FirebaseAuth.instance;
  //   try {
  //     await auth.signInWithEmailAndPassword(email: Email, password: Password)
  //         .then((value){
  //           print("Logged in $Email");
  //           Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginpage()));
  //     });
  //   }catch(e){
  //     throw Exception(e);
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Form(key: key,
      child: SingleChildScrollView(scrollDirection: Axis.vertical,
      child: Center(
        child: Container(height: 650,width: 370,
        child: Card(color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)
        ),
        child: Column(children: [
          Text("SignUp",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,
              color: Colors.redAccent
          ),
          ),
          SizedBox(height: 30,),
          Text("Enter Email",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20
          ),
          ),
          Container(height: 70,width: 300,
          child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Icons.email),
            hintText: "Email",
            labelText:"Enter Email",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          ),
            validator: (val)=> val!.length==0? "Enter Email":null,
            controller: emailController,
            onChanged: (val){
            setState(() {
              email=val;
            });
            },
          ),
          ),
          Text("Enter Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20
          ),
          ),
          Container(height: 70,width: 300,
            child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Icons.email),
              hintText: "Password",
              labelText:"Enter Password",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            ),
              validator: (val)=> val!.length==0? "Enter Password":null,
              controller: passwordController,
            ),
          ),
          Text("Confirm Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20
          ),
          ),
          Container(height: 70,width: 300,
            child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Icons.email),
              hintText: "Confirm Password",
              labelText:"Enter Email",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            ),
              validator: (val)=> val!.length==0? "Enter Password":null,
              controller: confirmpassController,
              onChanged: (val){
                setState(() {
                  password=val;
                });
              },
            ),
          ),
          Container(height: 20,),
          Container(height: 60,width: 160,
          child: Card(color: Colors.tealAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
          ),
          child: TextButton(onPressed: (){
    if (key.currentState!.validate()){
      _handleSignUp();
    // Future<void> createuser() async{
    // await FirebaseAuth.instance.createUserWithEmailAndPassword(
    // email: emailController.text.trim(),
    // password: passwordController.text.trim());

    }
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginpage()));
    // createuser();
    // emailController.clear();
    // passwordController.clear();
    // confirmpassController.clear();
    } ,child: Text("Sign Up"),),),
          )
        ],),),
        ),
      ),),
    ),
    );
  }
}
