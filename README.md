# CPractico_SQL_Diplomado
Repositorio nuevo para entrega del domingo 4 de agosto del 2024, referente al caso práctico realizado en PostgresSQL
## Decribiendo los resultados de mi análisis de consultas


## Tabla Menu_items

● Encontrar el número de artículos en el menú.
32 PRODUCTOS EN EL MENÚ

● ¿Cuál es el artículo menos caro y el más caro en el menú?
edamame es el platillo más barato

shrimp scampi el platillo más caro

● ¿Cuántos platos americanos hay en el menú?
6 platos americanos

● ¿Cuál es el precio promedio de los platos?
13.28$

## Tabla order_details

¿Cuántos pedidos únicos se realizaron en total?
5730 pedidos únicos

¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?


![5+VENDIDOS](https://github.com/user-attachments/assets/dbdb26c7-9c35-4219-a99d-13356c1dedea)


● ¿Cuándo se realizó el primer pedido y el último pedido?
primer pedido "2023-01-01"
ultimo pedido"2023-03-31"

● ¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?
702 pedidos

d) Usar ambas tablas para conocer la reacción de los clientes respecto al menú.
1.- Realizar un left join entre entre order_details y menu_items con el identificador item_id(tabla order_details) 
y menu_item_id(tabla menu_items).

![jointelft](https://github.com/user-attachments/assets/844a8dd2-7b6b-441e-81d0-75466e89bbfd)

e) Una vez que hayas explorado los datos en las tablas correspondientes y respondido las
preguntas planteadas, realiza un análisis adicional utilizando este join entre las tablas. El
objetivo es identificar 5 puntos clave que puedan ser de utilidad para los dueños del
restaurante en el lanzamiento de su nuevo menú. Para ello, crea tus propias consultas y
utiliza los resultados obtenidos para llegar a estas conclusiones.

1- Categoría de comida más vendida: Comida asiática 

2- Platillo mas vendido:  Hamburguesa

3-Platillo menos vendido: Chicken tacos

4- categoría menos vendida: Comida americana

5- CONCLUSIONES FINALES:  Aun que el platillo más vendido es la hamburguesa, en general la comida americana no
es la más vendida, lo es la asiática, siguiendole la italiana y mexicana, mientras que el platillo menos vendido son los chickentacos. 
El menú es demasiado amplio y el promedio de precios es muy aceptable, tal vez quitar del menú platillos de las categorías
menos vendidas sería buena idea, se podría invertir en crear variantes de los platillos más vendidos, como hamburguesas gourmet,
korean beef bowl con extras atractivos o en su defecto promociones para promover el consumo de platillos no tan vendidos como los tacos
de pollo y res,y poststickers. 

