// metodos clase
import './class.dart';

//diccionario para guardar las cuentas bancarias key:cuenta | Cuenta/persona
Map<String, Cuenta> _cuentas = {};


/**
 * _guardar
 * 
 * este metodo se encarga de guardar la cuenta en el la lista de cuentas
 * pero antes valida que haya pasado todos los filtros, para poder guardar
 * 
 * ------
 * salida: String - bienvenida || rechazo
 * ------
 * 
 * @params  {Cuenta} c - La cuenta a guardar
 * 
 * @return  {bool} - true si pudo ser guardada sin errores, false en caso contrario
 */
bool _guardar(Cuenta persona) {

  Map user = _validacionUser(persona);

  if (user["success"] == true) {

    //guarda cuenta
    _cuentas[persona.getNumCuenta.toString()] = persona;

    //msg bienvenida
    persona.str();

    return true;

  } else {

    //msg rechazo
    print(user["message"]); //muestra mensaje de error

    return false;

  }
}


/**
 * _validacionUser
 * 
 * este metodo se encarga de ejecutar todos los filtros para ver si la persona
 * cumple con los requesitos para crear una cuenta
 * 
 * ------
 * salida: null
 * ------
 * 
 * @params  {Cuenta} c - La cuenta a validar
 * 
 * @return  {Map} - datos final de la validaciones
 * 
 */
Map _validacionUser(Cuenta persona){

  //valida la ubicaion
  bool ubi = _ubiValida(persona.getUbicacion);

  //valida si existe una cuenta similar
  bool usuExist = _exits(persona.getDocumento, persona.getNumCuenta);

  //valida la edad si la permitida
  bool edad = _edadValida(persona.getEdad);

  //valida el saldo requerido para crear
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


/**
 * _ubiValida
 * 
 * este metodo se encarga de validar la ubicacion, en este caso solo hay 4 corresponsales
 * Ciudades : ["MEDELLIN", "BELLO", "SABANETA", "ITAGUI"]
 * 
 * ------
 * salida: null
 * ------
 * 
 * @params  {String} ubicacion - La ubicacion a validar
 * 
 * @return  {bool} - si cumple devuelve un true, de lo contrario un false
 * 
 */
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


/**
 * _exits
 * 
 * este metodo se encarga de validar si existe una cuenta con los datos similares
 * 
 * ------
 * salida: null
 * ------
 * 
 * @params  {int} documento - documento a validar
 * @params {int} cuenta -  numero de cuenta a buscar
 * 
 * @return  {bool} - si cumple devuelve un true, de lo contrario un false
 * 
 */
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


/**
 * _edadValida
 * 
 * este metodo se encarga de validar la edad, que sea la permitida
 * 
 * ------
 * salida: null
 * ------
 * 
 * @params  {int} edad - la edad a validar
 * 
 * @return  {bool} - si cumple devuelve un true, de lo contrario un false
 * 
 */
bool _edadValida(int? edad) {
  bool res = false;
  int eda = edad!;

  if (eda >= 18) {
    res = true;
  }

  return res;
}


/**
 * _saldoValido
 * 
 * este metodo se encarga de validar el saldo, minimo permitido es 50.000
 * 
 * ------
 * salida: null
 * ------
 * 
 * @params  {double} saldo - el saldo a validar
 * 
 * @return  {bool} - si cumple devuelve un true, de lo contrario un false
 * 
 */
bool _saldoValido(double? saldo) {
  bool res = false;

  double cash = saldo!;

  if (cash >= 50000) {
    res = true;
  }

  return res;
}


/**
 * sentAhorros
 * 
 * este metodo se encarga de valdiar y enviar dinero del saldo principal
 * al saldo de ahorros, de igugal manera genera un movimineto
 * 
 * ------
 * salida:  String  - mensaje con la informacion del envio o error
 * ------
 * 
 * @params  {Cuenta} persona - cuenta  que va a realizar la operacion
 * @params {double} envio - dinero a enviar
 * 
 * @return null
 * 
 */
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
    print("envio realizado con exito👍");
    return;
  }
  print("lo sentimos el envio no se pudo hacer saldo insuficiente");
}


/**
 * sentSaldo
 * 
 * este metodo se encarga de valdiar y enviar dinero del saldo de ahorros
 * al saldo principal, de igugal manera genera un movimineto
 * 
 * ------
 * salida:  String  - mensaje con la informacion del envio o error
 * ------
 * 
 * @params  {Cuenta} persona - cuenta  que va a realizar la operacion
 * @params {double} envio - dinero a enviar
 * 
 * @return null
 * 
 */
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
    print("envio realizado con exito👍");
    return;
  }
  print("lo sentimos el envio no se pudo hacer ahorro insuficiente");
}


/**
 * verDatos
 * 
 * este metodo se encarga de mostar  los datos de una cuenta en un 
 * formato ya predefinido por la clase
 * 
 * ------
 * salida: String - datos de la cuenta
 * ------
 * 
 * @params  {Cuenta} persona - la cuenta a conocer
 * 
 * @return null
 * 
 */
void verDatos(Cuenta persona) {
  print(persona.description());
}


/**
 * crearCuenta
 * 
 * este metodo se encarga de crear la cuenta con la clase base, pero cabe decir
 * que esta no lo guarda, la tarea es crear una instancia nada mas, y pasarle esa instancia
 * al metodo _guardar() que en este caso, este se encarga de ejecutar las validaciones
 * anteriormente mencionadas como la edad, la ubicacion etc...
 * 
 * ------
 * salida: null
 * ------
 * 
 * @params  {Map} persona - datos de la cuenta a crear en un objecto
 * 
 * @return  {Cuenta} - si pasa los filtros devuelve el objecto cuenta
 * @return null - si falla en algun filtro
 * 
 */
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


/**
 * enviarDinero
 * 
 * este metodo se encarga de validar y enviar dinero entre cuentas.
 * tambien se encarga de generar los respectivos moviminetos para las cuentas
 * involucradas en el envio
 * 
 * ------
 * salida: {String} - mensaje informativo sea de error o success
 * ------
 * 
 * @params {Cuenta} envia - la persona que realiza el envio
 *  
 * @params {Cuenta} recibe - la persona que recibe el envio
 * 
 * @params {double} valor - el valor del envio
 * 
 * @return null
 * 
 */
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


/**
 * retirarDinero
 * 
 * este metodo se encarga de validar y retirar dinero de la cuenta
 * tambien se encarga de generar los respectivos moviminetos para la cuenta
 * 
 * ------
 * salida: {String} - mensaje informativo sea de error o success
 * ------
 * 
 * @params {Cuenta} retiro - la persona que realiza el retiro
 * 
 * @params {double} valor - el valor del envio
 * 
 * @return null
 * 
 */
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
