% Tarea (Clases 10 y 11):

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

% Una obra le gusta a Gus si es Sandman o la escribió Isaac Asimov. Tiene que ser inversible.

leGustaAGus(sandman). % pattern matching, le pasamos directamente el átomo

leGustaAGus(Obra):- 
    escribio(isaacAsimov, Obra). 

% Disyunsión lógica (ó): Se hace agregando más cláusulas al mismo predicado.

% Conviene contratar un artista si escribió un bestseller o es reincidente. Tiene que ser inversible.

convieneContarar(Artista):-
    escribio(Artista, Obra),
    esBestSeller(Obra).

convieneContarar(Artista):-
    esReincidente(Artista).

% Queremos saber si una obra es rioplatense, que es cuando la nacionalidad de su artista es platense (Uruguay o Argentina). ¡Ojo con repetir lógica! 

% nacionalidad(Artista, Nacionalidad). -> hecho
nacionalidad(elsaBornemann, argentina). % expandimos nuestra base de conocimiento modelando
nacionalidad(joseHernandez, argentina).
nacionalidad(julioCortazar, argentina).
nacionalidad(jorgeLuisBorges, argentina).
nacionalidad(horacioQuiroga, uruguaya).
nacionalidad(neilGaiman, britanica).
nacionalidad(alanMoore, britanica).
nacionalidad(warrenEllis, britanica).
nacionalidad(terryPratchett, britanica).
nacionalidad(brianAzarello, estadounidense).
nacionalidad(frankMiller, estadounidense).
nacionalidad(stephenKing, estadounidense).
nacionalidad(isaacAsimov, rusa).

esRioplatense(Obra) :-
    escribio(Artista, Obra),
    nacionalidad(Artista, Nacionalidad),
    esNacionalidadPlatense(Nacionalidad).
  
  esNacionalidadPlatense(uruguaya).
  esNacionalidadPlatense(argentina).

% Para todas las obras que escribió un artista, la obra es un comic

soloEscribioComics(Artista) :-
    escribio(Artista, _), % generador para que sea inversible -> Solo ligamos el artista y dejamos libre la obra. Queremos saber para un artista (Artista) sobre todas sus obras (_)
    forall(escribio(Artista, Obra), esComic(Obra)). % Para todo -> Cuantificador Universal

soloEscribioComicsOBestSellers(Artista) :-
  escribio(Artista, _),
  forall(escribio(Artista, Obra), esComicOBestSeller(Obra)).

esComicOBestSeller(Obra) :-
  esComic(Obra).

esComicOBestSeller(Obra) :-
  esBestSeller(Obra).

todasLasObrasSonComics :-
  forall(escribio(_, Obra), esComic(Obra)).

% Functores:

/* En nuestra base de conocimientos teníamos obras, ahora conocemos los tipos de obras, que pueden ser
novela(Genero, CantidadDeCapitulos)
libroDeCuentos(CantidadDeCuentos)
libroCientifico(Disciplina)
bestSeller(Precio, CantidadDePaginas) 
*/

% (ontamos con un predicado que relaciona a cada obras con su tipo:

esDeTipo(it, novela(terror, 11)).
esDeTipo(cuentosDeLaSelva, libroDeCuentos(10)).
esDeTipo(elUniversoEnUnaTabla, cientifico(quimica)).
esDeTipo(elUltimoTeoremaDeFermat, cientifico(matematica)).
esDeTipo(yoRobot, bestSeller(700, 253)).

/*
estaBuena/1 nos dice cuando una obra está buena. Esto sucede cuando:
- Es una novela policial y tiene menos de 12 capítulos.
- Es una novela de terror.
- Los libros con más de 10 cuentos siempre son buenos.
- Es una obra científica de fisicaCuantica.
- Es un best seller y el precio por página es menor a $50.
*/ 

% Polimorfismo

estaBuena(Obra):-
    esDeTipo(Obra, Tipo), % Es polimórfica -> funciona con cualquier Tipo de obra
    cumpleCon(Tipo). % Delegamos la repeticion de lógica

cumpleCon(novela(policial, CantidadDeCapitulos)):- % Es polimorfica -> no le importa el functor que va ligado
    CantidadDeCapitulos >= 12.

cumpleCon(novela(terror, _)).

cumpleCon(libroDeCuentos(CantidadDeCuentos)):-
    CantidadDeCuentos > 10.

cumpleCon(cientifico(fisicaCuantica)).

cumpleCon(bestSeller(Precio, CantidadDePaginas)):-
    Precio / CantidadDePaginas < 50.
