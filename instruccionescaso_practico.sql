--a) Crear la base de datos con el archivo create_restaurant_db.sql
--b) Explorar la tabla “menu_items” para conocer los productos del menú.}

--1.- Realizar consultas para contestar las siguientes preguntas:
--● Encontrar el número de artículos en el menú.
SELECT  COUNT(menu_item_id) AS cantidad_artículos
	FROM menu_items;
	--32 PRODUCTOS EN EL MENÚ
--● ¿Cuál es el artículo menos caro y el más caro en el menú?
SELECT * FROM menu_items 
ORDER BY price ASC
LIMIT 1;
--edamame +barato
SELECT * FROM menu_items 
ORDER BY price DESC
LIMIT 1;
--shrimp scampi +caro

--● ¿Cuántos platos americanos hay en el menú?
SELECT COUNT(category) AS Platos_Americanos
FROM menu_items
WHERE category = 'American';
--6 platos americanos

--● ¿Cuál es el precio promedio de los platos?
SELECT AVG(price) AS prom_precios
FROM menu_items;
--13.28


--c) Explorar la tabla “order_details” para conocer los datos que han sido recolectados.
SELECT * FROM order_details;
--1.- Realizar consultas para contestar las siguientes preguntas:
--● ¿Cuántos pedidos únicos se realizaron en total?
SELECT COUNT(DISTINCT order_id) AS unique_ids_count
FROM order_details;
--5730

--● ¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?
SELECT order_id, item_id
FROM order_details
WHERE item_id IS NOT NULL
ORDER BY item_id DESC
LIMIT 5;
--132 

--● ¿Cuándo se realizó el primer pedido y el último pedido?
SELECT 
    MAX(order_date) AS last_order,
    MIN(order_date) AS first_order
FROM 
    order_details;
-- primer pedido "2023-01-01"
--ultimo pedido"2023-03-31"

--● ¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?
SELECT COUNT(order_id) AS total_orders
FROM order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-01-05';
--702

--d) Usar ambas tablas para conocer la reacción de los clientes respecto al menú.
/*1.- Realizar un left join entre entre order_details y menu_items con el identificador item_id(tabla order_details) 
y menu_item_id(tabla menu_items).*/

SELECT 
    od.*, 
    mi.*
FROM 
    order_details AS od
LEFT JOIN 
    menu_items AS mi
ON 
    od.item_id = mi.menu_item_id;


/*e) Una vez que hayas explorado los datos en las tablas correspondientes y respondido las
preguntas planteadas, realiza un análisis adicional utilizando este join entre las tablas. El
objetivo es identificar 5 puntos clave que puedan ser de utilidad para los dueños del
restaurante en el lanzamiento de su nuevo menú. Para ello, crea tus propias consultas y
utiliza los resultados obtenidos para llegar a estas conclusiones.*/
--1 Categoría de comida más vendida
SELECT 
    mi.category,
    SUM(od.order_id) AS total_sales
FROM 
    order_details AS od
LEFT JOIN 
    menu_items AS mi
ON 
    od.item_id = mi.menu_item_id
GROUP BY 
    mi.category
ORDER BY 
    total_sales DESC
LIMIT 1;
--Comida asiática 

--2 Platillo mas vendido
SELECT 
    mi.item_name,
    SUM(od.order_id) AS total_sales
FROM 
    order_details AS od
LEFT JOIN 
    menu_items AS mi
ON 
    od.item_id = mi.menu_item_id
WHERE 
    mi.item_name IS NOT NULL
GROUP BY 
    mi.item_name
ORDER BY 
    total_sales DESC
LIMIT 1;
-- Hamburguesa

--3 Platillo menos vendido
SELECT 
    mi.item_name,
    SUM(od.order_id) AS total_sales
FROM 
    order_details AS od
LEFT JOIN 
    menu_items AS mi
ON 
    od.item_id = mi.menu_item_id
WHERE 
    mi.item_name IS NOT NULL
GROUP BY 
    mi.item_name
ORDER BY 
    total_sales ASC
LIMIT 1;
--Chicken tacos
--4 categoría menos vendida
SELECT 
    mi.category,
    SUM(od.order_id) AS total_sales
FROM 
    order_details AS od
LEFT JOIN 
    menu_items AS mi
ON 
    od.item_id = mi.menu_item_id
WHERE 
    mi.category IS NOT NULL
GROUP BY 
    mi.category
ORDER BY 
    total_sales ASC
LIMIT 1;
--Comida americana
/*5 Aun que el platillo más vendido es la hamburguesa, en general la comida americana no
es la más vendida, lo es la asiática, siguiendole la italiana y mexicana, mientras que el platillo menos vendido son los chickentacos. 
El menú es demasiado amplio y el promedio de precios es muy aceptable, tal vez quitar del menú platillos de las categorías
menos vendidas sería buena idea, se podría invertir en crear variantes de los platillos más vendidos, como hamburguesas gourmet,
korean beef bowl con extras atractivos o en su defecto promociones para promover el consumo de platillos no tan vendidos como los tacos
de pollo y res,y poststickers. 
*/
