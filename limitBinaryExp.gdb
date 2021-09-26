
# con esta sentencia se indica el archivo de salida 
# para poder ver los resultados
set logging file outputLimitBinaryExp.txt

# para que las salidas de print se vean bien
set print pretty on

# para que las salidas de los comandos se registren
set logging on

# para evitar que gdb haga preguntas y\n
set pagination off

# para indicar el archivo que se va a depurar
file limitBinaryExp

# para fijar un breakpoint en asmlimitBinaryExp
b asmlimitBinaryExp

# para fijar un breakpoint en la linea calculo
b calculo

# para fijar un breakpoint en la linea no_impar
b no_impar

# hook previo para echo
define hook-echo
echo <<<---
end

# hook posterior para echo
define hookpost-echo
echo --->>>\n
end

define log
	printf "el valor de N es %d\n", $arg0
end

# aqui empieza el programa
echo INICIO

# para empezar a correr el programa
r

# para ver cual es el valor que se tiene dentro de la exponente
echo VALOR DENTRO LA EXPONENTE
p $xmm5
# aqui empieza el bucle

echo BUCLE1
while($rdi != 0)
    log $rdi
    c
    p $xmm4
    c
end
# aqui termina
echo FIN 


# gracias