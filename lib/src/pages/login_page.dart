import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loginForm(context),
    );
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(child: Container(height: size.height/8)),
          Center(
            child: Container(
              width: size.width * 0.85,
              margin: EdgeInsets.symmetric(vertical: 20.0),
              padding: EdgeInsets.symmetric(vertical: 50.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 3.0
                  )
                ]
              ),
              child: Column(
                children: [
                  Text('Ingreso', style: TextStyle(fontSize: 20.0)),
                  SizedBox(height: 60.0),
                  _crearEmail(),
                  SizedBox(
                    height: 30.0,
                  ),
                  _crearPassword(),
                  SizedBox(height: 30.0),
                  _crearBoton(context)
                ],
              ),
            ),
          ),
          //TextButton(onPressed: () => Navigator.pushReplacementNamed(context, 'splash'), child: Text('Crear una nueva cuenta')),
          SizedBox(height: 100.0)
        ],
      ),
    );
  }

  Widget _crearEmail() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
          hintText: 'ejemplo@correo.com',
          labelText: 'Correo Electrónico',
          counterText: "Prueba"
        ),
        //onChanged: bloc.changeEmail,
      ),
    );
  }

  Widget _crearPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock_outline, color: Colors.deepPurple),
          labelText: 'Contraseña',
          counterText: "Prueba",
        ),
        //onChanged: bloc.changePassword,
      ),
    );
  }

  Widget _crearBoton(BuildContext context) {
    return ElevatedButton(
      child: Container(
        child: Text('Ingresar'),
      ),
      onPressed: () => {
        Navigator.pushReplacementNamed(context, 'news')
      },
    );
  }
}