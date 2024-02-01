// metodos clase
import './class.dart';

//diccionario para guardar las cuentas bancarias key:cuenta | values....
Map<String, Cuenta> _cuentas = {};

// se ejecutan... crea/rechaza
bool _guardar(Cuenta persona) {

  Map user = validacionUser(persona);

  if (user["success"] == true) {
    _cuentas[persona.getNumCuenta.toString()] = persona;
    persona.str();
    return true;
  } else {
    print(user["message"]); //muestra mensaje de error
    return false;
  }
}


//validaciones usuario
Map validacionUser(Cuenta persona){

    bool ubi = _ubiValida(persona.getUbicacion);
    bool usuExist = _exits(persona.getDocumento, persona.getNumCuenta);
    bool edad = _edadValida(persona.getEdad);
    bool saldo = _saldoValido(persona.getSaldo);

    bool crear = true;
    String? msg;

    if (usuExist) {
    crear = false;
    msg = "${persona.getNombre} lo sentimos el documento o cuenta ya existen";
  }

  if (!ubi) {
    crear = false;
    msg = "${persona.getNombre} La ubicacion no es valida";
  }

  if (!edad) {
    crear = false;
    msg = "${persona.getNombre} La edad no es permitida";
  }

  if (!saldo) {
    crear = false;
    msg = "${persona.getNombre} el saldo no es permitido";
  }

  return {
    "success" : crear,
    "message" : msg
    };

}

//validar ubicacion
bool _ubiValida(String? ubi) {
  List<String> locations = ["MEDELLIN", "BELLO", "SABANETA", "ITAGUI"];
  bool res = false;

  for (final locat in locations) {
    if (ubi == locat) {
      res = true;
      break;
    }
  }

  return res;
}

//validar cuentas
bool _exits(int? documento, int? cuenta) {
  bool res = false;

  for (var cuenta in _cuentas.values) {
    if (cuenta.getNumCuenta == cuenta || cuenta.getDocumento == documento) {
      res = true;
      break;
    }
  }

  return res;
}

//validar edad
bool _edadValida(int? edad) {
  bool res = false;
  int eda = edad!;

  if (eda >= 18) {
    res = true;
  }

  return res;
}

//validacion saldo
bool _saldoValido(double? saldo) {
  bool res = false;

  double cash = saldo!;

  if (cash >= 50000) {
    res = true;
  }

  return res;
}

// enviar a ahorros
void sentAhorros(Cuenta persona, double envio) {
  double saldo = persona.getSaldo!;
  if (envio <= saldo) {
    persona.setAhorros = persona.getAhorros! + envio;
    persona.setSaldo = persona.getSaldo! - envio;

    persona.setMovimientos = {
      "Hora movimineto" : DateTime.now(),
      "Tipo movimiento": "Dinero depositado en cuenta de ahorros",
      "Cantidad" : envio,
      "Saldo ahorro" : persona.getAhorros,
      "Saldo principal" : persona.getSaldo
    };
    return;
  }
  print("lo sentimos el envio no se pudo hacer saldo insuficiente");
}

//enviar a saldo
void sentSaldo(Cuenta persona, double envio) {
  double ahorro = persona.getAhorros!;
  if (envio <= ahorro) {
    persona.setSaldo = persona.getSaldo! + envio;
    persona.setAhorros = persona.getAhorros! - envio;

    persona.setMovimientos = {
      "Hora movimineto" : DateTime.now(),
      "Tipo movimiento": "Dinero depositado en cuenta de principal",
      "Cantidad" : envio,
      "Saldo ahorro" : persona.getAhorros,
      "Saldo principal" : persona.getSaldo
    };
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
dynamic crearCuenta(Map persona) {
  Cuenta data = Cuenta(
      persona["documento"],
      persona["cuenta"],
      persona["nombre"],
      persona["apellido"],
      persona["edad"],
      persona["saldo"],
      persona["ubicacion"]);

  if (_guardar(data)) {
    return data;
  }

  return null;
}


//enviar dinero 
  //validar saldo/usuario existente/0.5%/
    //crear movimiento/validar datos movimientos
void enviarDinero(Cuenta envia , Cuenta recibe, double valor){

  double saldoBruto = envia.getSaldo !- (valor * 0.05);

  if(valor > saldoBruto){
    print('No tiene suficiente saldo');
    return;
  }

  if(valor == 0.0){
    print('Monto no valido');
    return;
  }

  envia.setMovimientos = {
    "Hora envio" : DateTime.now(),
    "Cuenta destino": recibe.getNumCuenta,
    "Tipo movimiento" : "Consignacion",
    "Nombre destinatario": recibe.getNombre,
    "Ubicacion" : recibe.getUbicacion,
    "Valor inpuesto" : valor * 0.05,
    "Valor Envio" : valor,
    "Saldo restante" : envia.getSaldo !- valor - (valor * 0.05)
  };

  recibe.setMovimientos = {
    "Hora recepcion" : DateTime.now() ,
    "Cuenta emisor" : envia.getNumCuenta,
    "Tipo movimiento" : "Consignacion",
    "Nombre emisor" : envia.getNombre,
    "Ubicacion" : envia.getUbicacion,
    "Valor Recibo" : valor,
    "Saldo restante" : recibe.getSaldo !+ valor
  };

  envia.setSaldo = envia.getSaldo !- valor - (valor * 0.05);
  recibe.setSaldo = recibe.getSaldo !+ valor;

  print("Envio realizado con exito");

}

//retirar dinero
  //validar saldo/usuario existente/0.5%/
    //crear movimiento/validar datos movimientos

void retirarDinero(Cuenta persona,valor){

  double saldoBruto = persona.getSaldo !- (valor * 0.05);

  if(valor  <= 0){
    print("Monto no valido");
    return;
  }

  if(valor > saldoBruto){
    print("No tiene suficiente saldo");
    return;
  }

  persona.setSaldo = persona.getSaldo !- valor - (valor * 0.05);

  persona.setMovimientos = {
    "Hora retiro" : DateTime.now(),
    "Cuenta emisor" : persona.getNumCuenta,
    "Tipo movimiento" : "Retiro",
    "Valor inpuesto" : valor * 0.05,
    "Valor Retiro" : valor,
    "Saldo restante" : persona.getSaldo

  };

  print("Retiro realizado con exito");

}
