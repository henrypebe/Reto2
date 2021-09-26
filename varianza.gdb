
# con esta sentencia se indica el archivo de salida 
# para poder ver los resultados
set logging file outputVarianza.txt

# para que las salidas de print se vean bien
set print pretty on

# para que las salidas de los comandos se registren
set logging on

# para evitar que gdb haga preguntas y\n
set pagination off

# para indicar el archivo que se va a depurar
file varianza

# para fijar un breakpoint en asmVarianza
b asmVarianza

# para fijar un breakpoint en la linea promedio
b promedio

# para fijar un breakpoint en la linea next
b next

# para fijar un breakpoint en la linea done
b done

# hook previo para echo
define hook-echo
echo <<<---
end

# hook posterior para echo
define hookpost-echo
echo --->>>\n
end

define log
	printf "counter value is %d\n", $arg0
end

# aqui empieza el programa
echo INICIO

# para empezar a correr el programa
r

# para que continue porque hay breakpoints
c

echo ANTES DE BUCLE1
i r rsi
i r rdx
c
# aqui empieza el bucle
echo BUCLE1
while($r10 >= 0)
    log $r10
    p $xmm0
    p $xmm1
	c
end

echo ANTES DE BUCLE2
i r rsi
i r rdx
c

echo BUCLE2
while($rsi != 0)
    log $rsi
    p $xmm0
    p $xmm2
	c
end

echo RESULTADO
p $xmm2
c
# aqui termina
echo FIN 


# gracias