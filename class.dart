// clase cuenta

class Cuenta {
  //params private
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
  Cuenta(this._documento, this._numCuenta, this._nombre, this._apellido,
      this._edad, this._saldo, String ubicacion) {
    this._ubicacion = ubicacion.toUpperCase();
  }

  //getters
  int? get getDocumento => this._documento;
  int? get getNumCuenta => this._numCuenta;
  String? get getNombre => this._nombre;
  String? get getApellido => this._apellido;
  int? get getEdad => this._edad;
  double? get getSaldo => this._saldo;
  double? get getAhorros => this._ahorros;
  String? get getUbicacion => this._ubicacion;
  Map? get getMovimientos => this._moviminetos;

  // setters
  void set setNombre(String nombre) => this._nombre = nombre;
  void set setApellido(String apellido) => this._apellido = apellido;
  void set setEdad(int edad) => this._edad = edad;
  void set setSaldo(double saldo) => this._saldo = saldo;
  void set setUbicacion(String ubicacion) => this._ubicacion = ubicacion;
  void set setAhorros(double ahorros) => this._ahorros = ahorros;
  void set setMovimientos(Map movimiento) =>
      this._moviminetos["N°${++this._cont}"] = movimiento;

  //method str
  void str() => print(
      "${this._nombre} BancaDart te agradece por confiar en nosotros. 💖");

  // datos cuenta
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
