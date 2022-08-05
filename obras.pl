% Tarea (13/06/22):

% BASE DE CONOCIMIENTOS

%escribio(Autor, Obra) -> hecho (hay 24 claúsulas)
escribio(elsaBornemann, socorro). % Relaciones (aridad = 2) entre Autor y Obra
escribio(neilGaiman, sandman).
escribio(alanMoore, watchmen).
escribio(brianAzarello, cienBalas).
escribio(warrenEllis, planetary).
escribio(frankMiller, elCaballeroOscuroRegresa).
escribio(frankMiller, batmanAnioUno).
escribio(neilGaiman, americanGods).
escribio(neilGaiman, buenosPresagios).
escribio(terryPratchett, buenosPresagios).
escribio(isaacAsimov, fundacion).
escribio(isaacAsimov, yoRobot).
escribio(isaacAsimov, elFinDeLaEternidad).
escribio(isaacAsimov, laBusquedaDeLosElementos).
escribio(joseHernandez, martinFierro).
escribio(stephenKing, it).
escribio(stephenKing, misery).
escribio(stephenKing, carrie).
escribio(stephenKing, elJuegoDeGerald).
escribio(julioCortazar, rayuela).
escribio(jorgeLuisBorges, ficciones).
escribio(jorgeLuisBorges, elAleph).
escribio(horacioQuiroga, cuentosDeLaSelva).
escribio(horacioQuiroga, cuentosDeLocuraAmorYMuerte).

% Agregamos qué obras son cómics.
% esComic(Obra).
esComic(sandman). % propiedad (aridad = 1)
esComic(cienBalas).
esComic(watchmen).
esComic(planetary).
esComic(elCaballeroOscuroRegresa).
esComic(batmanAnioUno).

/* Queremos saber si alguien es artista del noveno arte (comics).
Lo resolvemos por comprensión.
esArtistaDelNovenoArte(Artista) predicado con dos claúsulas (una regla y un hecho).
*/

esArtistaDelNovenoArte(Artista) :- % Regla (por comprension)
    escribio(Artista, Obra),
    esComic(Obra).

% Y si también queremos aclarar que Art Spiegelman es un artista del noveno arte, hacemos:

esArtistaDelNovenoArte(artSpiegelman). % hecho

% copiasVendidas(Obra,Cantidad).
copiasVendidas(socorro, 10000).
copiasVendidas(sandman, 20000).
copiasVendidas(watchmen, 30000).
copiasVendidas(cienBalas, 40000).
copiasVendidas(planetary, 50000).
copiasVendidas(elCaballeroOscuroRegresa, 60000).
copiasVendidas(batmanAnioUno, 70000).
copiasVendidas(americanGods, 80000).
copiasVendidas(buenosPresagios, 90000).
copiasVendidas(buenosPresagios, 10000).
copiasVendidas(fundacion, 20000).
copiasVendidas(yoRobot, 30000).
copiasVendidas(elFinDeLaEternidad, 30000).
copiasVendidas(laBusquedaDeLosElementos, 40000).
copiasVendidas(martinFierro, 50000).
copiasVendidas(it, 60000).
copiasVendidas(it, 70000).
copiasVendidas(misery, 70000).
copiasVendidas(carrie, 80000).
copiasVendidas(elJuegoDeGerald, 90000).
copiasVendidas(rayuela, 10000).
copiasVendidas(ficciones, 20000).
copiasVendidas(elAleph, 30000).
copiasVendidas(cuentosDeLaSelva, 40000).
copiasVendidas(cuentosDeLocuraAmorYMuerte, 50000).


% Una obra es un bestseller si vendió más de 50mil copias.

esBestSeller(Obra) :-
    copiasVendidas(Obra, Cantidad),
    Cantidad > 50000.               % Condición

% Un artista es reincidente si escribió al menos 2 obras.

esReincidente(Artista):-
    escribio(Artista, Obra1),
    escribio(Artista, Obra2),
    Obra1 \= Obra2. % Para que cuente dos Obras distintas

% Una obra es un libro cuando NO es un comic.

esLibro(Obra):-
    esObra(Obra), % generador para que esLibro sea inversible
    not(esComic(Obra)). % negación

esObra(Obra):- % es una Obra si fué escrita por alguien (_)
    escribio(_, Obra).

/*¡not no es inversible! No puede ligar las variables dentro de su predicado.
% Si a esLibro no le agregamos el generador, no sería un predicado inversible porque el not no es inversible.
% El generador nos "achica" el universo de opciones. */

% Tarea: Una obra le gusta a Gus si es Sandman o la escribió Isaac Asimov. Tiene que ser inversible.
% Tarea: Conviene contratar un artista si escribió un bestseller o es reincidente. Tiene que ser inversible.
% Tarea: Queremos saber si una obra es rioplatense, que es cuando la nacionalidad de su artista es platense (Uruguay o Argentina). ¡Ojo con repetir lógica! 
    