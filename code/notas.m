Notas!!

Z(1,4,8,4) = 20.72 --> Abalalaika,Mvibraphone,Bbass,Ppiano
Z(2,5,3,6) = 56,9124 --> Acitarra,MHarpicordio,Btuba,Porgan

FIGURAS!!!

-Espectro de Fourier: 
	figura cerrada (marco continuo)
	tics de los ejes hacia dentro de la figura (o no ponerlos)
	loables más grandes (los números)
	Poner etiquetas de los ejes con unidades
	
-Señal:
	Poner leyendas y ampliar valores de los ejes
	Arbitrary units = arb. u.   o   arb. un.    o   arb. unit

OJO CON LOS LOGARITMOS, SIN UNIDADES

REVISAR UMBRAL DE AUDICIÓN (I0)

Hacer spline (bicubic spline)

-THRESHOLDS.

Sumar una curva gausiana o lorenziana al quiet threshold, hasta que se parezcan
Usar diferentes colores


(Para la presentación mostrar un vídeo con varias curvas de enmascaramiento?)

esther pascual miralles

DISTANCIA_ENTRE_ARMONICOS: 12 7 5 4 3 3 2
No me fio de Mdulcimer y de Pviolin

%PENDIente:

%Hacer histograma compatibilidad/enmascaramiento vs frecuencia de cada resultado.

%Representación gráfica de los resultados en el tiempo (por cada beat). Así vemos como dependen los resultados de la partitura

%Comparar nuevas partituras, y encontrar buen ejemplo de compatibilidad y malo

%Quitar suma cuadrática y ver la diferencia

POR_COMENTAR :

%Veo que los puntos con menor porcentaje son aquellos con notas de
%paso, es decir, notas que están fuera del acorde.
%Entonces había pensado darle al producto escalar la función de "analizador
%de partituras" con dos factores: uno cuando los dos instrumentos se mueven
%dentro del mismo rango de frecuencias, donde la función nos dice si las
%notas forman parte del acorde. Y el otro que nos dice si tocan en el mismo
%rango de octavas.

PENDIENTE :

--Investigar:

    buscar recorrido de la sensibilidad del oido. y quitar los harmónicos con recorrido más grande
    psicoacustica-> umbral de audición
    
    Apantallamiento

digitalizacion en pantalla


%NO---> Sí
%Seguro que puedo negligir la anchura de los picos? en los graves es
%considerable. 

% - mltiplicar por la width.   Vamos a pasar

%FALTA COMPROBAR QUE TODOS LOS ESPECTROS ESTÁN BIEN!!! -

%Establecer la altura mínima de los picos: calibrar!!!!
%porcentaje de frecuencia

%Qué hacer cuando sale un harmónico repetido    DONE


%mirar compresión mp3 .   DONE

%tener en cuenta el sample rate y bit resolution. Hacer pruebas con diferentes magnitudes.

%Comparar las ondas entre mp3 (con diferentes bit rates) y wav (ampliando la time domain signal)





COMENTADO

%ANTES DE HACER LA CURVA ENMASCARANTE DE UNA FRECUENCIA HAY QUE VER SI YA
%ESTÁ ENMASCARADO

%Ya está hecho el Threshold in quiet. Sí que restamos el threshold al espectro.

%En cuanto al enmascaramiento, creo que lo correcto es ajustar a cada pico que tenga
%una intensidad alta a la "tuning curve" y eliminar los armónicos que estén debajo de %ella. Sin embargo no le restaría nada a los armónicos.

%Esto pienso hacerlo situando la curva (en verdad serán 3 curvas, para frecuencias altas/%medias/bajas) en la posición correspondiente a la frecuencia del tono enmascarante y %ajustándola a su intensidad.

%También importante!! Debo considerar el enmascaramiento entre diferentes instrumentos, no %solamente consigo mismo? Esto me complicaría profundamente el sistema y haría más %complicado la comparación entre instrumentos.

%Lo que tengo pensado hacer es aplicar el enmascaramiento dentro de un mismo instrumento, de forma que obtendré un espectro más claro.

%*Podría ser interesante ver como se enmascaran los instrumentos entre sí. A mayor
%enmascaramiento perdemos más información de los instrumentos, lo cual supongo que los hace
%poco compatibles.

%------------

%suma de cuadrados y raiz cuadrada de la suma --> nuevo promedio (valor cuadrático medio)

%El bajo tenia un promedio de 22%, el harpa de un 17% y 
%el vibrafono de un 12%. En cambio los pitos no pasan del 2% (obvio)

%He cogido más picos y funciona mejor. Pero quizá sería mejor que cogiera
%todo el espectro? NO! porque estas "anchuras" son fruto de la
%transformada, no son verdaderos armónicos del instrumento

%Para analizar 3eros instrumentos pensaba sumar la matriz de espectro de
%los acordes más la de la melodía. O debería hacer la transformada de los
%dos sonidos sonando juntos?.--> Sumar espectros está bien.

%---------

%calibraje del programa.   
%tendré que aplicar un filtro?  
%-necesario filtrar por debajo: Estaría bien que el programa encontrara el pico de la
%fundamental y empezara a analizar a partir de ahí

%Creo que debería hacer una función que detecte la nota fundamental para
%calibrar. Que sirva para cortar las frecuendias bajas y para establecer el
%MinPeakHeight
%Problemas con el peakfinder cuando hay notas de paso!

%----------

%Qué hacer cuando sale un armónico repetido ---> dividir por beats de la
%canción

%--------

%reverb? -no

%---------

% Parece ser que no todos los harmónicos salen exactamente en lo que
% correspondería a una nota. Qué hago si tengo en un instrumento un
% harmonico un Hz por encima que en el otro instrumento?

%Debería agrupar todos los armonicos en las notas posibles? 
%(ejemplo freq 133 --> C3 (131). Esta desviación se debe a que el programa
%simula instrumentos, aunque por lo que tengo entendido también pasa en los
%instrumentos reales, sobretodo con los harmónicos más altos.
%Que el programa agrupe el espectro como en la matriz del enlace aquel y
%trabajar con esto. Creo que será lo mejor

%hay que tener cuidado al hacer esta agrupación, ya que la distancia entre
%harmónicos se hace cada vez mayor para sonidos más agudos.

POSIBILIDADES
%Mi tfg podría ser básicamente una eq de los instrumentos en una pieza

%El programa también podrá ser utilizado para comparar formatos de compresión de audio
