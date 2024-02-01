// clase cuenta


/**
 * Clase Cuenta.
 * 
 * esta se encarga de gestionarnos un molde  para una cuenta bancaria, con sus atributos y métodos correspondientes.
 * 
 * @author Davison Vanegs (davidsonvanegas@gamil.com)
 * 
 * ------------------------------------------
 * 
 * @params {int} documento - Numero del documento.
 * 
 * @params {int} numCuenta - Numero de la cuenta.
 * 
 * @params {String} nombre - Nombre del titular de la cuenta.
 * 
 * @params {String} apellido - Apellido del titular de la cuenta.
 * 
 * @params {int} edad - Edad del titular de la cuenta.
 * 
 * @params {double} saldo - Saldo para crear la cuenta(minimo 50.000).
 * 
 * @params {String} ubicacion - Ubicacion en donde se encuentra la sucursal.
 */
class Cuenta {
  /**
   * atributos privados
   * 
   * estos atributos se declaran privados para su proteccion
   * esto implica que no se pueden  acceder directamente a ellos desde fuera de la clase,
   * solo mediante metodos publicos. 
   * 
   */
  int? _documento;
  int? _numCuenta;
  String? _nombre;
  String? _apellido;
  int? _edad;
  double _saldo = 0.0;
  String? _ubicacion;
  double _ahorros = 0.0;
  Map<String, Map> _moviminetos = {};
  int _cont = 0;

  //construct
  /**
   * este metodo se encarga de inicializar los valores de la clase para su creacion 
   */
  Cuenta(this._documento, this._numCuenta, this._nombre, this._apellido,
      this._edad, this._saldo, String ubicacion) {
    this._ubicacion = ubicacion.toUpperCase();
  }

  //getters
  /**
   * estos metodos se encargan de mostrar el valor
   * de los diferentes atributos privados en la clase
   */
  
  /**
   * getDocumento
   * 
   * --------------
   * 
   * EJM:  int documento = Cuenta.getDocumento() -> devuelve el documento
   * 
   * ---------------
   * 
   * @params  {} - No recibe parametros.
   * 
   * @return - Devuelve un dato del atributo privado.
   */
  int? get getDocumento => this._documento;


    /**
   * getNumCuenta
   * 
   * --------------
   * 
   * EJM:  int numCuenta = Cuenta.getNumCuenta() -> devuelve el numero de cuenta
   * 
   * ---------------
   * 
   * @params  {} - No recibe parametros.
   * 
   * @return - Devuelve un dato del atributo privado.
   */
  int? get getNumCuenta => this._numCuenta;


  /**
   * getNombre
   * 
   * --------------
   * 
   * EJM:  String nombre = Cuenta.getNombre() -> devuelve el nombre
   * 
   * ---------------
   * 
   * @params  {} - No recibe parametros.
   * 
   * @return - Devuelve un dato del atributo privado.
   */
  String? get getNombre => this._nombre;

  
  /**
   * getApellido
   * 
   * --------------
   * 
   * EJM:  String apellido = Cuenta.getApellido() -> devuelve el apellido
   * 
   * ---------------
   * 
   * @params  {} - No recibe parametros.
   * 
   * @return - Devuelve un dato del atributo privado.
   */
  String? get getApellido => this._apellido;


  /**
   * getEdad
   * 
   * --------------
   * 
   * EJM:  int edad = Cuenta.getEdad() -> devuelve la edad
   * 
   * ---------------
   * 
   * @params  {} - No recibe parametros.
   * 
   * @return - Devuelve un dato del atributo privado.
   */
  int? get getEdad => this._edad;


    /**
   * getSaldo
   * 
   * --------------
   * 
   * EJM:  double saldo = Cuenta.getSaldo() -> devuelve el saldo principal
   * 
   * ---------------
   * 
   * @params  {} - No recibe parametros.
   * 
   * @return - Devuelve un dato del atributo privado.
   */
  double? get getSaldo => this._saldo;


    /**
   * getAhorros
   * 
   * --------------
   * 
   * EJM:  double ahorros = Cuenta.getAhorros() -> devuelve el saldo en ahorros
   * 
   * ---------------
   * 
   * @params  {} - No recibe parametros.
   * 
   * @return - Devuelve un dato del atributo privado.
   */
  double? get getAhorros => this._ahorros;


    /**
   * getUbicacion
   * 
   * --------------
   * 
   * EJM:  String ubicacion = Cuenta.getUbicacion() -> devuelve la ubicacion
   * 
   * ---------------
   * 
   * @params  {} - No recibe parametros.
   * 
   * @return - Devuelve un dato del atributo privado.
   */
  String? get getUbicacion => this._ubicacion;


    /**
   * getMovimientos
   * 
   * @params  {} - No recibe parametros.
   * 
   * --------------
   * 
   * EJM:  Map movimiento = Cuenta.getMovimientos() -> devuelve los movimientos
   * 
   * ---------------
   * 
   * 
   * @return - Devuelve un dato del atributo privado.
   */
  Map? get getMovimientos => this._moviminetos;


  // setters

  /**
   * estos medotos se encargan de modificar el valor
   * de los atributos privados,  ademas de validarlos antes de asignarselos.
   * esto lo hace con el tipado fuerte 
   * 
   * @return - No devuelve nada, solo modifica el atributo.
   */

  /**
   * setNombre
   * 
   * @params  {String} nombre;
   * 
   * -------------
   * 
   * EJM:  Cuenta.setNombre = "davidson" -> Asigna "davidson" al nombre
   *
   * -------------
   * 
   * @return - No devuelve nada, solo valida y asigna.
   */
  void set setNombre(String nombre) => this._nombre = nombre;


  /**
   * setApellido
   * 
   * @params  {String} apellido;
   * 
   * -------------
   * 
   * EJM:  Cuenta.setApellido = "vanegas" -> Asigna "vanegas" al apellido
   *
   * -------------
   * 
   * @return - No devuelve nada, solo valida y asigna.
   */
  void set setApellido(String apellido) => this._apellido = apellido;


  /**
   * setEdad
   * 
   * @params  {int} edad;
   * 
   * -------------
   * 
   * EJM:  Cuenta.setEdad = 21 -> Asigna "21" al edad
   *
   * -------------
   * 
   * @return - No devuelve nada, solo valida y asigna.
   */
  void set setEdad(int edad) => this._edad = edad;


  /**
   * setSaldo
   * 
   * @params  {double} saldo;
   * 
   * -------------
   * 
   * EJM:  Cuenta.setSaldo = 2000 -> Asigna "2000" al saldo
   *
   * -------------
   * 
   * @return - No devuelve nada, solo valida y asigna.
   */
  void set setSaldo(double saldo) => this._saldo = saldo;


  /**
   * setUbicacion
   * 
   * @params  {String} ubicacion;
   * 
   * -------------
   * 
   * EJM:  Cuenta.setUbicacion = "Medellin" -> Asigna "Medellin" al ubicacion
   *
   * -------------
   * 
   * @return - No devuelve nada, solo valida y asigna.
   */
  void set setUbicacion(String ubicacion) => this._ubicacion = ubicacion;


  /**
   * setAhorros
   * 
   * @params  {double} ahorros;
   * 
   * -------------
   * 
   * EJM:  Cuenta.setAhorros = 25000 -> Asigna "25000" al ahorros
   *
   * -------------
   * 
   * @return - No devuelve nada, solo valida y asigna.
   */
  void set setAhorros(double ahorros) => this._ahorros = ahorros;


  /**
   * setMovimientos
   * 
   * @params  {Map} movimientos;
   * 
   * -------------
   * 
   * EJM:  Cuenta.setMovimientos = {} -> Asigna "{}" a movimientos
   *
   * -------------
   * 
   * @return - No devuelve nada, solo valida y asigna.
   */
  void set setMovimientos(Map movimiento) =>
      this._moviminetos["Movimiento: ${++this._cont}"] = movimiento;


  //method str
  /**
   * este metodo nos permite enviar un mensaje cada vez que se crea una cuenta
   * 
   * @params null
   * 
   * @return  {String} - Mensaje de bienvenida con el nombre de la cuenta
   */
  void str() => print(
      "${this._nombre} BancaDart te agradece por confiar en nosotros. 💖");


  // datos cuenta
  /**
   * este metodo nos permite obtener los datos de la cuenta en una cadena de texto
   * 
   * @params  null
   * 
   * @return {String} - datos de cuenta
  */
  String description() {
    return ''' 
  --- DATOS DE CUENTA N°: ${this._numCuenta} ---
------------------------------------------------
| Documento: ${this._documento}
| Nombre: ${this._nombre} ${this._apellido}
| Edad: ${this._edad}
| Saldo: ${this._saldo}
| Ubicación: ${this._ubicacion}
| Ahorros: ${this._ahorros}
| Movimientos ${this._moviminetos}
    ''';
  }
}
