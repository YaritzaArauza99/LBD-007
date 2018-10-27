use CentralYAAG

select  vNombre,vApellido, cTipoEmpleado from Empleado as e, TipoEmpleado as te where te.iIdEmpleado > 0
select iIdVenta, dFecha, iIdViaje, tAsiento, iIdEmpleado from BoletoAutobus as ba, CostoBoleto as cb where ba.iCostoBoleto > 0
select  vNombre,vApellido, cTipoEmpleado from Empleado as e, BoletoAutobus as ba where ba.iIdViaje > 0
select iIdVenta, dFecha, iIdViaje, tAsiento, iIdEmpleado from BoletoAutobus as ba, TipoBoleto as tb where tb.iCostoBoleto > 0
select  vNombre,vApellido, cTipoEmpleado from Empleado as e, BoletoAutobus as ba where ba.iIdEmpleado > 0

select * from BoletoAutobus
left JOIN CostoBoleto on BoletoAutobus.iCostoBoleto = CostoBoleto.iCostoBoleto
select * from BoletoAutobus
right JOIN CostoBoleto on BoletoAutobus.iCostoBoleto = CostoBoleto.iCostoBoleto
select * from BoletoAutobus
inner JOIN CostoBoleto on BoletoAutobus.iCostoBoleto = CostoBoleto.iCostoBoleto
select * from BoletoAutobus
cross JOIN CostoBoleto--BoletoAutobus.iCostoBoleto = CostoBoleto.iCostoBoleto

Select count(iIdEmpleado) as 'Apellidos' from Empleado having count(iIdEmpleado)>1
Select Min(iIdEmpleado) as 'MinimoEmpleados' from Empleado
Select Max(iIdEmpleado) as  'MaximoEmpleados' from Empleado group by vNombre
Select AVG(iIdEmpleado) 'PromedioEmpleados' from Empleado group by vNombre
Select SUM(iIdEmpleado) 'Empleados' from Empleado group by iIdEmpleado

Select (vNombre + '		'+ vApellido + '		') as 'Datos del Chofer', iIdEmpleado + 1 as 'Choferes', SUBSTRING(vNombre,0,0) as 'Alias' from Chofer as ch
Select TOP 2 (tTipoPago + '		'+ iIdEmpleado + '		'+ tAsiento) as 'Datos de Venta', SUBSTRING(iIdVenta,1,0) as 'Alias' from VentaBoleto as vb
Select TOP 5 (vNombre_Sucursal + '		'+ vDomicilio_Sucursal + '		'+ vCiudad_Sucursal) as 'Datos de la Sucursal',  SUBSTRING(vNombre_Sucursal,0,3) as 'Alias de la Scurusal' from Sucursal as	suc 
Select (iIdEmpleado + '		'+ vRuta) as 'Viaje',  SUBSTRING (iIdEmpleado, 1,0) as 'Viaje' from BoletoAutobus as ba


select iIdEmpleado, e.vNombre, e.vApellido, e.cTipoEmpleado count(iIdEmpleado) as 'Empleados' from Empleado e cross Join  TipoEmpleado te where e.iIdEmpleado > 1 group by e.iIdEmpleado
select iIdEmpleado, e.vNombre, e.vApellido, e.cTipoEmpleado count(iIdEmpleado) as 'Choferes' from Empleado e cross Join  Chofer c where e.iIdEmpleado > 1 group by c.iIdEmpleado

select*
into #empleado
from Empleado

drop table Empleado