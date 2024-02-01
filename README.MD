# BancaDart #

> En este ejercicio debemos de construir un software que permita gestionar las funciones cotidianas de una cuenta bancaria. tales como...

> - envio y retiro de dinero
> - consultar datos👍
> - poder mover el dinero a dinero de ahorros y viceversa👍
> - ver moviminetos de cuenta👍


## movimientos

## este debe de mostrar informacion tales como...

### retiro

> - hora/fecha en que se realizo
> - numero de cuenta
> - corresponsal/ubicacion
> - valor neto del 0.5%
> - valor de retiro
> - dinero restante

### consignacion

> - hora/fecha en que se realizo
> - persona a quien se envio
> - numero de cuenta de envio
> - corresponsal/ubicacion
> - valor neto del 0.5%
> - valor de consignacion
> - dinero restante

## validaciones persona

> - mayor de 18 años
> - solo se puede abrir cuenta en medellin,bello,sabaneta y itagui
> - saldo minimo para crear cuenta es de 50000 mil pesos
> - verifiar que no haya una cuenta con el mismo cc y n° cuenta

## validaciones cuenta

> esta aplicacion debe de validar multiples aspectos antes de enviar o retirar dinero, tales como...

> - la existencia de un usuario 
> - el saldo disponible para elaborar cualquier movimineto
> - descuento por envio/retiro del 0.5%
> - validar que el monto a enviar/retirar sea menor quel monto en cuenta(incluye el 0.5%)
