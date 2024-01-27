// metodos clase

import './class.dart';


void main(){

  //diccionario para guardar las cuentas bancarias key:cuenta | values....
  Map<String,Cuenta> cuentas = {};

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

  };

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
  };

  //enviar a saldo
  void sentSaldo(Cuenta persona, double envio){
    double ahorro = persona.getAhorros!;
    if(envio <= ahorro){
      persona.setSaldo = persona.getSaldo! + envio; 
      persona.setAhorros = persona.getAhorros! - envio;
      return;
    }
    print("lo sentimos el envio no se pudo hacer ahorro insuficiente");
  };


  //ver datos
  void verDatos(Cuenta persona) {
    print(persona.description());
  };





  // se ejecutan... crea/rechaza
  void guardar(Cuenta persona){

    bool ubi = ubiValida(persona.getUbicacion);
    bool usuExist = exits(persona.getDocumento,persona.getNumCuenta);
    bool edad = edadValida(persona.getEdad);
    bool saldo = saldoValido(persona.getSaldo);

    bool crear = true;
    String msg = "${persona.getNombre} todo salio con exito.";

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
      return;
    }

    print(msg);
    
  }





  guardar(davidson);
  guardar(isabel);

  // print(isabel.description());
  // sentAhorros(isabel, 25000);
  // sentSaldo(isabel, 10000);
  // print(isabel.description());

  // sentAhorros(davidson, 35100);
  // sentSaldo(davidson, 3200);

}



//implementar metodos

//crear cuenta/validar datos
Cuenta davidson = Cuenta(100101499, 1234, "davinson", "vanegas", 21, 60000, "itagui");
Cuenta isabel = Cuenta(1001014899, 888, "isabel", "vanegas", 21, 50000, "sabaneta");
  //guardar en el diccionario

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