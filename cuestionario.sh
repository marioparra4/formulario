#!/bin/bash
clear
############################# Funcion de mayusculas
function mayus() {
	DATO=$(echo $* | awk '{print toupper($0)}')
	echo $DATO
}

############################# Funcion de minusculas
function minus() {
        DATO=$(echo $* | awk '{print tolower($0)}')
        echo $DATO
}

echo "########################### Formulario de cliente ##################"
echo
#************************NOMBRE
echo -n "Ingrese su nombre: "
read nombre
until [[ $nombre =~ ^[a-zA-Zá-úÁ-ÚÑñ]{2,10}( {1}[a-zA-Zá-úÁ-ÚÑñ]{2,10})+$ ]]
do
	echo "!! Recuerda no ingresar mas de un espacio entre nombres y apellidos, no ingresar números.";echo "Al menos debe de tener 6 caracteres tu nombre !!";sleep 5
	echo -n "Vuelva a ingresar su nombre completo: "
	read nombre
done
sleep 3
echo

#*************************DOMICILIO
echo "Ingrese su Domicilio"
echo
#########################Calle
echo -n "Calle: "
read calle
until [[ $calle =~ ^[a-zA-Zá-úÁ-ÚÑñ]( ?[a-zA-Zá-úÁ-ÚÑñ0-9,\-\.]){2,149}$ ]]
do
        echo "!! Recuerda ingresar una calle minima de 3 caracteres de longitud.";echo "Solo se acepta espacios, comas, puntos y guiones medios !!";sleep 3
        echo -n "Vuelva a ingresar la calle: "
        read calle
done
sleep 2
echo

###############################Numero exterior
echo -n "Numero exterior/Manzana (en caso de no tener ingrese SN): "
read numext
until [[ $numext =~ ^[0-9]{1,5}(\-[A-Za-zÑñ])?$ ]] || [[ $numext = "SN" ]]
do
        echo -n "Vuelva a ingresar el numero exterior/manzana: "
        read numext
done
if [[ $numext = "SN" ]];then
	exterior=""
else 
	exterior="$numext"
fi
sleep 2
echo

##############################Numero interior
echo -n "Numero interior/Lote (en caso de no tener ingrese SN): "
read numint
until [[ $numint =~ ^[0-9]{1,3}(\-[A-Za-zÑñ])?$ ]] || [[ $numint = "SN" ]]
do
        echo -n "Vuelva a ingresar el numero interior/lote: "
        read numint
done
if [[ $numint = "SN" ]];then
        interior=""
else
        interior="$numext"
fi
sleep 2
echo

############################Colonia
echo -n "Colonia/Asentamiento/Región: "
read colonia
until [[ $colonia =~ ^[a-zA-Zá-úÁ-ÚÑñ]( ?[a-zA-Zá-úÁ-ÚÑñ]){2,49}$ ]]
do
        echo "!! Recuerda no ingresar mas de un espacio entre cada palabra, no ingresar números ni tabulaciones."
	echo -n "Vuelva a ingresar la colonia/asentamiento/región: "
        read colonia
done
sleep 2
echo

###########################Alcaldia
echo -n "Alcaldía/Municipio: "
read alcaldia
until [[ $alcaldia =~ ^[a-zA-Zá-úÁ-ÚÑñ]( ?[a-zA-Zá-úÁ-ÚÑñ]){2,49}$ ]]
do
        echo "!! Recuerda no ingresar mas de un espacio entre cada palabra, no ingresar números ni tabulaciones."
        echo -n "Vuelva a ingresar alcaldía/municipio: "
        read alcaldia
done
sleep 2
echo

##########################Ciudad
echo -n "Ciudad/Estado: "
read estado
until [[ $estado =~ ^[a-zA-Zá-úÁ-ÚÑñ]( ?[a-zA-Zá-úÁ-ÚÑñ]){2,49}$ ]]
do
        echo "!! Recuerda no ingresar mas de un espacio entre cada palabra, no ingresar números ni tabulaciones."
        echo -n "Vuelva a ingresar estado/ciudad: "
        read estado
done
sleep 2
echo

##########################Pais
echo -n "País: "
read pais
until [[ $pais =~ ^[a-zA-Zá-úÁ-ÚÑñ]( ?[a-zA-Zá-úÁ-ÚÑñ]){2,49}$ ]]
do
        echo "!! Recuerda no ingresar mas de un espacio entre cada palabra, no ingresar números ni tabulaciones."
        echo -n "Vuelva a ingresar pais: "
        read pais
done
sleep 2
echo

########################CP
echo -n "Código Postal: "
read cp
until [[ $cp =~ ^[0-9]{4,5}$ ]]
do
        echo "!! Recuerda no ingresar letras o espacios, el código postal tiene de 4 a 5 números"
        echo -n "Vuelva a ingresar el código postal: "
        read cp
done
if [[ $cp =~ ^[0-9]{4}$ ]];then
	codigo="0$cp"
else
	codigo="$cp"
fi
sleep 2
echo

#**************************Correo y Verificacion
echo -n "Ingrese su correo electrónico: "
read correo
until [[ $correo =~ ^[a-zA-Zá-úÁ-ÚÑñ0-9][a-zA-Zá-úÁ-ÚÑñ0-9,\_\.\-]{0,18}[a-zA-Zá-úÁ-ÚÑñ0-9]@[a-zA-Zá-úÁ-ÚÑñ0-9]{1,20}(\.[a-zA-Zá-úÁ-ÚÑñ0-9]{1,10})?(\.[a-zA-Zá-úÁ-ÚÑñ]{2,3})$ ]]
do
       	echo "!! Recuerda no ingresar espacios, ni tabulaciones, se permiten -, ., _ y ,"
       	echo -n "Ingresar el correo: "
       	read correo
done
echo -n "Confirmación de correo, ingrese su correo: "
read vcorreo
until [[ $correo = $vcorreo ]]
do
	echo "!!Recuerda que el correo y la confirmación de correo deben ser iguales"
	echo -n "Ingrese la confirmación de nuevo: "
	read vcorreo
done
sleep 2
echo

#**************************Telefono
echo -n "Ingrese su número de teléfono: "
read  telefono
until [[ $telefono =~ ^[0-9]{10}$ ]]
do
        echo "La longitud del numero es de 10 digitos, sin espacios, letras o tabulaciones"
	echo -n "Vuelva a ingresar el número de teléfono: "
        read telefono
done
sleep 2
echo

#************************Usuario
echo -n "Ingrese el nombre de usuario(se permiten letras, numeros, puntos y guion): "
read usuario
until [[ $usuario =~ ^[a-zA-Zá-úÁ-Ú0-9Ññ\.\-]{5,20}$ ]]
do
        echo "!! Recuerda ingresar un nombre de usuario minimo de 5 caracteres de longitud y máximo de 20."
	echo "Solo se permiten letras, numeros, puntos y guiones"
	echo -n "Vuelva a ingresar el usuario: "
        read usuario
done
sleep 2
echo

#*********************Contraseña
echo -n "Ingrese su contraseña(se permiten letras, numeros,guiones,puntos,#,$,&,%,*,@): "
read pass
until [[ $pass =~ ^[a-zA-Zá-úÁ-ÚÑñ0-9@\#\$\&\*\%\_\.\-]{8,40}$ ]]
do
        echo "!! Recuerda la contraseña minima es 8 y maxima de 40 caracteres"
        echo -n "Ingresar la contraseña: "
        read pass
done
echo -n "Confirmación de contraseña, ingrese su contraseña: "
read vpass
until [[ $pass = $vpass ]]
do
        echo "!! Ambas contraseñas deben ser igual"
        echo -n "Ingrese la confirmación de contraseña: "
        read vpass
done
sleep 2
echo
echo "Cargando los datos ...."
sleep 4
clear
###############Impresion de datos
echo -n "Nombre: ";mayus $nombre
echo -n "Calle: ";mayus $calle
echo -n "Número exterior: ";mayus $exterior
echo -n "Número interior: ";mayus $interior
echo -n "Colonia: ";mayus $colonia
echo -n "Alcadía/Municipio: ";mayus $alcaldia
echo -n "Estado: ";mayus $estado
echo -n "País: ";mayus $pais
echo -n "Código: ";echo $codigo
echo -n "Correo: ";mayus $correo
echo -n "Teléfono: ";echo $telefono
echo -n "Usuario: ";minus $usuario
echo -n "Contraseña: ";echo $pass
