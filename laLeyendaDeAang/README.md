# La Leyenda De Aang
### [Parcial Lógico (8/8/2022)](https://docs.google.com/document/d/1JnUK5gOi2uG9iiSYCxelWy_ARHnOpy8UbtDP2o9gNvI/edit)

![La Leyenda De Aang](https://images.squarespace-cdn.com/content/v1/5bdb6f2d55b02c19d5ca0d38/1585329289640-G7Z2NOT3VDJDJDY4OZHS/avatar-the-last-airbender-last-air-bender-wallpaper.jpg?format=1000w)

>"Agua, tierra, fuego, aire. Hace muchos años, las cuatro naciones vivían en armonía, pero todo cambió cuando la Nación del Fuego atacó. Solo el Avatar, maestro de los cuatro elementos, podía detenerlos. Pero cuando el mundo más lo necesitaba, desapareció. Después de cien años, mi hermano y yo encontramos al nuevo Avatar, un maestro aire llamado Aang. Aunque sus habilidades para controlar el aire eran grandiosas, tenía mucho que aprender antes de poder salvar al mundo. Y yo creo que Aang podrá salvarnos..."

Si te suenan estas palabras es porque probablemente hayas visto "Avatar: la Leyenda de Aang", pero si nunca viste este programa ¡no hay problema! Toda la información que necesites va a estar en el enunciado. Nos llamaron para programar un videojuego sobre esta popular serie y para ello contamos con una base de conocimiento de la cual hicimos una reducción:

>Si tenés que agregar nuevas cláusulas para probar tu código podés hacerlo. Estos hechos están seleccionados a modo demostrativo.

'''
% esPersonaje/1 nos permite saber qué personajes tendrá el juego

esPersonaje(aang).
esPersonaje(katara).
esPersonaje(zoka).
esPersonaje(appa).
esPersonaje(momo).
esPersonaje(toph).
esPersonaje(tayLee).
esPersonaje(zuko).
esPersonaje(azula).
esPersonaje(iroh).

% esElementoBasico/1 nos permite conocer los elementos básicos que pueden controlar algunos personajes

esElementoBasico(fuego).
esElementoBasico(agua).
esElementoBasico(tierra).
esElementoBasico(aire).

% elementoAvanzadoDe/2 relaciona un elemento básico con otro avanzado asociado

elementoAvanzadoDe(fuego, rayo).
elementoAvanzadoDe(agua, sangre).
elementoAvanzadoDe(tierra, metal).

% controla/2 relaciona un personaje con un elemento que controla

controla(zuko, rayo).
controla(toph, metal).
controla(katara, sangre).
controla(aang, aire).
controla(aang, agua).
controla(aang, tierra).
controla(aang, fuego).
controla(azula, rayo).
controla(iroh, rayo).

% visito/2 relaciona un personaje con un lugar que visitó. Los lugares son functores que tienen la siguiente forma:
% reinoTierra(nombreDelLugar, estructura)
% nacionDelFuego(nombreDelLugar, soldadosQueLoDefienden)
% tribuAgua(puntoCardinalDondeSeUbica)
% temploAire(puntoCardinalDondeSeUbica)

visito(aang, reinoTierra(baSingSe, [muro, zonaAgraria, sectorBajo, sectorMedio])).
visito(iroh, reinoTierra(baSingSe, [muro, zonaAgraria, sectorBajo, sectorMedio])).
visito(zuko, reinoTierra(baSingSe, [muro, zonaAgraria, sectorBajo, sectorMedio])).
visito(toph, reinoTierra(fortalezaDeGralFong, [cuartel, dormitorios, enfermeria, salaDeGuerra, templo, zonaDeRecreo])).
visito(aang, nacionDelFuego(palacioReal, 1000)).
visito(katara, tribuAgua(norte)).
visito(katara, tribuAgua(sur)).
visito(aang, temploAire(norte)).
visito(aang, temploAire(oeste)).
visito(aang, temploAire(este)).
visito(aang, temploAire(sur)).
'''

A partir de estos hechos, nos pidieron lo siguiente:

1. Saber qué personaje ***esElAvatar***. El avatar es aquel personaje que controla todos los elementos básicos.
   
2. Clasificar a los personajes en 3 grupos:
    - un personaje ***noEsMaestro*** si no controla ningún elemento, ni básico ni avanzado;
    - un personaje ***esMaestroPrincipiante*** si controla algún elemento básico pero ninguno avanzado;
    - un personaje ***esMaestroAvanzado*** si controla algún elemento avanzado. Es importante destacar que el avatar también es un maestro avanzado.

3. Saber si un personaje ***sigueA otro***. Diremos que esto sucede si el segundo visitó todos los lugares que visitó el primero. También sabemos que zuko sigue a aang.
   
4. Conocer si un lugar ***esDignoDeConocer***, para lo que sabemos que:
    - todos los templos aire son dignos de conocer;
    - la tribu agua del norte es digna de conocer;
    - ningún lugar de la nación del fuego es digno de ser conocido;
    - un lugar del reino tierra es digno de conocer si no tiene muros en su estructura. 

5. Definir si un lugar ***esPopular***, lo cual sucede cuando fue visitado por más de 4 personajes. 
   
6. Por último nos pidieron modelar la siguiente información en nuestra base de conocimientos sobre algunos personajes desbloqueables en el juego:
    - bumi es un personaje que controla el elemento tierra y visitó Ba Sing Se en el reino Tierra;
    - suki es un personaje que no controla ningún elemento y que visitó una prisión de máxima seguridad en la nación del fuego protegida por 200 soldados. 

 Recordá que los predicados deben ser **totalmente inversibles**.

