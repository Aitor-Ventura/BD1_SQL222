--.2.2.1) 'Obtener los nombres de las partes vendidas por proveedores de Telde' con 3 niveles                      
create view ej2221 as
select pnombre
from p
where pn in(select pn
            from sp
            where sn in( select sn
                        from s
                        where ciudad = 'Telde'));

--2.2.2.2) Idem enunciado con 2 niveles y 1 tabla en el nivel exterior y 2 tablas en el nivel interior
create view ej2222 as
select pnombre
from p
where pn in (select pn
            from s,sp
            where ciudad = 'Telde'
            and sp.sn=s.sn);

--2.2.2.3) Idem enunciado con 2 niveles y 2 tablas en el nivel exterior y 1 tablas en el nivel interior            
create view ej2223 as 
select distinct pnombre
from p,sp
where sn in (select sn
            from s
            where ciudad ='Telde')
and sp.pn = p.pn;
                     
--2.2.2.4) Idem enunciado sin subconsultas
create view ej2224 as  
select distinct pnombre 
from p,s,sp
where s.ciudad='Telde'
and sp.sn=s.sn
and sp.pn = p.pn;



