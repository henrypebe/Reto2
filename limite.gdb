
# con esta sentencia se indica el archivo de salida 
# para poder ver los resultados
set logging file outputLimite.txt

# para que las salidas de print se vean bien
set print pretty on

# para que las salidas de los comandos se registren
set logging on

# para evitar que gdb haga preguntas y\n
set pagination off

# para indicar el archivo que se va a depurar
file limite

# para fijar un breakpoint en asmLimite
b asmLimite

# para fijar un breakpoint en la linea verificacion
b verificacion

# para fijar un breakpoint en la linea bucle
b bucle

# para fijar un breakpoint en la linea solucion
b solucion

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

echo VERIFICACION
i r rdi
ni
c
# aqui empieza el bucle
if($rdi < 100000)
    echo ANTES DE BUCLE1
    p $xmm0
    p $xmm3
    c

    echo BUCLE1
    while($rdi != 0)
        log $rdi
        p $xmm2
        i r rdi
        c
    end

    echo RESULTADO
    p $xmm2
    c
end
echo FIN
# aqui termina
echo FIN 


# gracias