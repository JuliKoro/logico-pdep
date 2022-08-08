% Parcial Lógico (8/8/2022): "La Leyenda De Aang"

% BASE DE CONOCIMIENTOS:

% esPersonaje(Nombre).
esPersonaje(aang).
esPersonaje(katara).
esPersonaje(sokka).
esPersonaje(appa).
esPersonaje(momo).
esPersonaje(toph).
esPersonaje(tayLee).
esPersonaje(zuko).
esPersonaje(azula).
esPersonaje(iroh).
esPersonaje(tenzin).

% esElementoBasico(Elemento).
esElementoBasico(fuego).
esElementoBasico(agua).
esElementoBasico(tierra).
esElementoBasico(aire).

% elementoAvanzadoDe(Elemento, Extra).
elementoAvanzadoDe(fuego, rayo).
elementoAvanzadoDe(agua, sangre).
elementoAvanzadoDe(tierra, metal).

% controla(Personaje, Elemento/Avanzado).
controla(zuko, rayo).
controla(toph, metal).
controla(katara, sangre).
controla(aang, aire).
controla(aang, agua).
controla(aang, tierra).
controla(aang, fuego).
controla(azula, rayo).
controla(iroh, rayo).
controla(tenzin, aire).

/* visito(Personaje, functorLugar()).
Lugares:
    reinoTierra(nombreDelLugar, estructura).
    nacionDelFuego(nombreDelLugar, soldadosQueLoDefienden).
    tribuAgua(puntoCardinalDondeSeUbica).
    temploAire(puntoCardinalDondeSeUbica).
*/

visito(aang, reinoTierra(baSingSe, [muro, zonaAgraria, sectorBajo, sectorMedio])).
visito(iroh, reinoTierra(baSingSe, [muro, zonaAgraria, sectorBajo, sectorMedio])).
visito(zuko, reinoTierra(baSingSe, [muro, zonaAgraria, sectorBajo, sectorMedio])).
visito(toph, reinoTierra(baSingSe, [muro, zonaAgraria, sectorBajo, sectorMedio])).
visito(toph, reinoTierra(fortalezaDeGralFong, [cuartel, dormitorios, enfermeria, salaDeGuerra, templo, zonaDeRecreo])).
visito(aang, nacionDelFuego(palacioReal, 1000)).
visito(katara, tribuAgua(norte)).
visito(katara, tribuAgua(sur)).
visito(aang, temploAire(norte)).
visito(aang, temploAire(oeste)).
visito(aang, temploAire(este)).
visito(aang, temploAire(sur)).

% PUNTO 1

esElAvatar(Personaje):-
    esPersonaje(Personaje),
    forall(esElementoBasico(Elemento), controla(Personaje, Elemento)).

% PUNTO 2

noEsMaestro(Personaje):-
    esPersonaje(Personaje),
    not(controla(Personaje, _)).

esMaestroPrincipiante(Personaje):-
    esPersonaje(Personaje),
    not(esElAvatar(Personaje)),
    esElementoBasico(Elemento),
    elementoAvanzadoDe(_, Avanzado),
    controla(Personaje, Elemento),
    not(controla(Personaje, Avanzado)).

esMaestroAvanzado(Personaje):-
    esElAvatar(Personaje).

esMaestroAvanzado(Personaje):-
    esPersonaje(Personaje),
    elementoAvanzadoDe(_, Avanzado),
    controla(Personaje, Avanzado).

% PUNTO 3

sigueA(zuko, aang).

sigueA(UnPersonaje, OtroPersonaje):-
    esPersonaje(UnPersonaje),
    esPersonaje(OtroPersonaje),
    visito(UnPersonaje, _),
    visito(OtroPersonaje, _),
    forall(visito(UnPersonaje, UnLugar), visito(OtroPersonaje, UnLugar)),
    UnPersonaje \= OtroPersonaje.

% Punto 4

esDignoDeConocer(temploAire(_)).

esDignoDeConocer(tribuAgua(norte)).

esDignoDeConocer(not(nacionDelFuego(_, _))).

esDignoDeConocer(Lugar):-
    visito(_, reinoTierra(Lugar, Estructura)),
    not(member(muro, Estructura)).

% PUNTO 5

esPopular(Lugar):-
    visito(_, Lugar),
    cantidadDeVisitantesEn(Lugar, Cantidad),
    Cantidad > 4.

vistantesDe(Lugar, Visitantes):-
    visito(_, Lugar),
    findall(Personaje, visito(Personaje, Lugar), Visitantes).

cantidadDeVisitantesEn(Lugar, Cantidad):-
    visito(_, Lugar),
    vistantesDe(Lugar, Visitantes),
    length(Visitantes, Cantidad).

% PUNTO 6 

% BASE DE CONOCIMIENTOS (DLC):

esPersonaje(bumi).
esPersonaje(suki).

controla(bumi, tierra).

visito(bumi, reinoTierra(baSingSe, [muro, zonaAgraria, sectorBajo, sectorMedio])).
visito(suki, nacionDelFuego(prisonDeMaximaSeguridad, 200)).