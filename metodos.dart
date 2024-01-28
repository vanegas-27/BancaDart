// metodos clase

import './class.dart';


//diccionario para guardar las cuentas bancarias key:cuenta | values....
Map<String,Cuenta> cuentas = {};

// se ejecutan... crea/rechaza
bool guardar(Cuenta persona){

  bool ubi = ubiValida(persona.getUbicacion);
  bool usuExist = exits(persona.getDocumento,persona.getNumCuenta);
  bool edad = edadValida(persona.getEdad);
  bool saldo = saldoValido(persona.getSaldo);

  bool crear = true;
  String? msg;

  if(usuExist){
    crear = false;
    msg = "${persona.getNombre} lo sentimos el documento o cuenta ya existen";
  }

  if(!ubi){
    crear = false;
    msg = "${persona.getNombre} La ubicacion no es valida";
  }

  if(!edad){
    crear = false;
    msg = "${persona.getNombre} La edad no es permitida";
  }

  if(!saldo){
    crear = false;
    msg = "${persona.getNombre} el saldo no es permitido";
  }


  if(crear){
    cuentas[persona.getNumCuenta.toString()] = persona;
    persona.str();
    return true;
  }else{
    print(msg); //muestra mensaje de error
    return false;
  }
  
}


//validar ubicacion
bool ubiValida(String? ubi){

List<String> locations = ["MEDELLIN","BELLO","SABANETA","ITAGUI"];
bool res = false;

for(final locat in locations ){
  
  if(ubi == locat){
    res = true;
    break;
  }

}

return res;

}

//validar cuentas
bool exits(int? documento,int? cuenta){

  bool res = false;

  for(var cuenta in cuentas.values){

    if(cuenta.getNumCuenta == cuenta || cuenta.getDocumento == documento){
      res = true;
      break;
    }

  }

  return res;

}

//validar edad
bool edadValida(int? edad){
  
  bool res = false;
  int eda = edad!;

  if(eda >= 18 ){
    res = true;
  }
  
  return res;

}

//validacion saldo
bool saldoValido(double? saldo){

  bool res = false;

  double cash = saldo!;

  if( cash >= 50000){
    res = true;
  }

  return res;
}

  

// enviar a ahorros
void sentAhorros(Cuenta persona, double envio){
  double saldo = persona.getSaldo!;
  if(envio <= saldo){
    persona.setAhorros = persona.getAhorros! + envio;
    persona.setSaldo = persona.getSaldo! - envio;
    return;
  }
  print("lo sentimos el envio no se pudo hacer saldo insuficiente");
}

//enviar a saldo
void sentSaldo(Cuenta persona, double envio){
  double ahorro = persona.getAhorros!;
  if(envio <= ahorro){
    persona.setSaldo = persona.getSaldo! + envio; 
    persona.setAhorros = persona.getAhorros! - envio;
    return;
  }
  print("lo sentimos el envio no se pudo hacer ahorro insuficiente");
}

//ver datos
void verDatos(Cuenta persona) {
  print(persona.description());
}


//crear cuenta/validar datos
  //guardar en el diccionario
dynamic crearCuenta(Map persona){

  Cuenta data = Cuenta(
    persona["documento"],
    persona["cuenta"],
    persona["nombre"], 
    persona["apellido"], 
    persona["edad"], 
    persona["saldo"], 
    persona["ubicacion"]
  );

  if(guardar(data)){
    return data;
  }

}



//enviar dinero 
  //validar saldo/usuario existente/0.5%/
    //crear movimiento/validar datos movimientos

//retirar dinero
  //validar saldo/usuario existente/0.5%/
    //crear movimiento/validar datos movimientos

//consultar datos

//mover dinero a ahorros
  //crear movimiento/validar datos movimientos

//ver movimientos