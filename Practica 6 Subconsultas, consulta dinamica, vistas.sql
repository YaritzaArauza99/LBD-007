use CentralYAAG



SELECT * FROM CostoBoleto 
WHERE  iCostoBoleto =(
	SELECT iIdVenta
	FROM BoletoAutobus
	WHERE iIdVenta = 1


SELECT * 
FROM 
(SELECT iIdEmpleado, (
				SELECT COUNT(iIdEmpleado)
				from Empleado as e
				where e.iIdEmpleado > 0
				)as 'Empleados'
from Empleado) as E
where E.iIdEmpleado > 0



select  (
		select count (iIdVenta) as NumeroBoletos
		from BoletoAutobus
		)as Total
from BoletoAutobus



SELECT * 
FROM 
(SELECT iCostoBoleto, (
				SELECT COUNT(iIdVenta)
				from BoletoAutobus as ba
				where ba.iIdVenta = ba.iIdVenta
				)as 'Boletos'
from CostoBoleto) as cb
where cb.Boletos > 0


create view 1 as
select v.vRuta, v.iIdEmpleado from Viajes as v inner join BoletoAutobus as ba on ba.iIdVenta = ba.iIdVenta

create view 2 as
select e.iIdEmpleado + ' ' + e.vNombre + ' ' + e.vApellido as Datos, te.iIdEmpleado as TipoEmpleado  
from Empleado as e inner join TipoEmpleado as te on te.iIdEmpleado = 1

create view 3 as
select ba.iIdVenta as Boletos, v.vRuta as Ruta
from BoletoAutobus as ba left join Viajes as v
on ba.dFecha = 'Proximo'
where ba.tAsiento > 0  
group by ba.iIdVenta ,v.vRuta

create view 4 as
select e.vNombre as NombreEmpleado, e.vApellido as ApellidoEmpleado from Empleado as e  join BoletoAutobus as ba  
on e.iIdEmpleado = 1 
join BoletoAutobus as boau 
on ba.iIdVenta = ba.iCostoBoleto

create view 5 as 
select ba.iIdVenta as VentaBoleto, ba.iCostoBoleto as Costo from BoletoAutobus as ba left join CostoBoleto as cb 
on ba.iCostoBoleto= ba.iCostoBoleto
where ba.iCostoBoleto > 100
group by ba.iIdVenta, ba.iCostoBoleto



declare @query nvarchar (MAX)
set @query =  'select * from BoletoAutobus'
exec (@query)

declare @query nvarchar (MAX)
declare @nomcolm nvarchar (MAX)= 'iIdEmpleado'
set @query =  'Select '+  @nomcolm +' from Empleado'
exec (@query)
