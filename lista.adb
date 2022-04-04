with Ada.Text_IO; 
use Ada.Text_IO;

procedure lista is


type Nodo;
type punteroNodo is access all Nodo;

--Definimos el tipo de dato 'Nodo'
type Nodo is 
record
	--Almacenaremos nombres en nuestra lista
	nombre: String(1..5);
	sig: punteroNodo;
end record;

--Variables alvaro
fichero   : FILE_TYPE;
numeros : STRING(1..5); --Funciona para Strings de 10 caracteres, sino colisiona
nombre : STRING(1..5); -- Almacenamos el nombre que vamos leyendo

--Mis variables
actual : punteroNodo;
inicio : punteroNodo;
aux : punteroNodo;
begin	

--[1. COMIENZA LA LECTURA DE FICHEROS]
Open(fichero, In_File, "fichero.txt"); -- Apertura del fichero

loop
exit when End_Of_File(fichero);
Get(fichero, numeros);
nombre := numeros; -- Aquí el nombre está guardado en la variable 'nombre' y se pasa para introducirlo en la lista enlazada
if inicio = null then
inicio := new Nodo'(nombre, null);
else
aux := new Nodo'(nombre, inicio);
inicio := aux;
end if;

end loop;

Reset(fichero);
Close(fichero); -- Se cierra el fichero
-- [2. FINALIZA LA LECTURA DE FICHEROS]

actual := inicio;
--Recorrer la lista
while actual /= null loop
Put_line(actual.nombre);
actual := actual.sig;
end loop;


end lista;
