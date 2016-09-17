%% Ejercicios de prolog
%% ∀x ∀y ∀z (padres(x,y,z) → casados(x,y))
%% X y Y son padres de Z
padres(juan, belen, carlos).
padres(juan, belen, elena).

%% Padre y Madre están casados si son padres de _.
%% Nótese la variable anónima.
casados(Padre, Madre) :- padres(Padre, Madre, _).

%% Ejecución
%% ?- casados(juan, Quien).
%% Quien = belen ;
%% Quien = belen.

tieneGarras(aguila_calzada).
vuela(aguila_calzada).
tienePicoFuerte(aguila_calzada).
esUnTipoDe(Animal, Especie) :-
    tieneGarras(Animal),
    vuela(Animal),
    tienePicoFuerte(Animal),
    Especie = rapaz.

%% ?- esUnTipoDe(aguila_calzada, Especie).
%% Especie = rapaz.

%% Cálcula el cuadrado de X dando como resultado Y.
cuadrado(X,Y) :- var(X),nonvar(Y), X is sqrt(Y).
cuadrado(X,Y) :- nonvar(X), Y is X*X.

%% ?- cuadrado(X, 9).
%% X = 3.0 ;
%% false.


%% Ejercicio recursivo
padre(pedro,juan).
padre(juan,inma).
padre(juan,carlos).
padre(carlos,elena).

ascend(Asc,Desc) :- padre(Asc,Desc). /* Caso base */
ascend(Asc,Desc) :- padre(Asc,Hijo),
    ascend(Hijo,Desc). /* Llamada recursiva */

%% ?- ascend(pedro, X).
%% X = juan ;
%% X = inma ;
%% X = carlos ;
%% X = elena ;
%% false.

%% Cálculo de la suma de los primeros N enteros.
%% Además, cuando N sea 0 ó negativo, devolveremos 1.
suma(N,Resultado) :-
    N=<1 , Resultado is 1.

suma(N,Resultado) :-
    N>1 ,
    suma(N-1,ResultAux),
    Resultado is ResultAux+N.

%% ?- suma(100,Resultado).
%% Resultado = 5050 ;
%% false.
