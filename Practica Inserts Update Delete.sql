use CentralYAAG

select * from Empleado

insert into Empleado 
(iIdEmpleado, vNombre, vApellido, cTipoEmpleado) values (100, 'Omar', 'Molina', 'Chofer') 
insert into Empleado 
(iIdEmpleado, vNombre, vApellido, cTipoEmpleado) values (200, 'Adriana', 'Hernandez', 'Vendedor') 
insert into Empleado 
(iIdEmpleado, vNombre, vApellido, cTipoEmpleado) values (101, 'David', 'Perez', 'Chofer') 
insert into Empleado 
(iIdEmpleado, vNombre, vApellido, cTipoEmpleado) values (201, 'Getsy', 'Garcia', 'Vendedor') 
insert into Empleado 
(iIdEmpleado, vNombre, vApellido, cTipoEmpleado) values (102, 'Viridiana', 'Aldana', 'Chofer') 
insert into Empleado 
(iIdEmpleado, vNombre, vApellido, cTipoEmpleado) values (300, 'Carlos', 'Salinas', 'Mant') 
insert into Empleado 
(iIdEmpleado, vNombre, vApellido, cTipoEmpleado) values (301, 'Rodolfo', 'Fernandez', 'Chofer') 
insert into Empleado 
(iIdEmpleado, vNombre, vApellido, cTipoEmpleado) values (103, 'Pablo', 'Salazar', 'Mant') 
insert into Empleado 
(iIdEmpleado, vNombre, vApellido, cTipoEmpleado) values (202, 'Jocelyne', 'Sanchez', 'Vendedor') 
insert into Empleado 
(iIdEmpleado, vNombre, vApellido, cTipoEmpleado) values (203, 'Osiris', 'Diaz de Leon', 'Chofer') 
insert into Empleado 
(iIdEmpleado, vNombre, vApellido, cTipoEmpleado) values (302, 'Tadeo', 'Dimas', 'Mec') 
insert into Empleado 
(iIdEmpleado, vNombre, vApellido, cTipoEmpleado) values (303, 'Alan', 'Villanueva', 'Chofer') 
insert into Empleado 
(iIdEmpleado, vNombre, vApellido, cTipoEmpleado) values (104, 'Jenifer', 'Carreon', 'Limpieza') 
insert into Empleado 
(iIdEmpleado, vNombre, vApellido, cTipoEmpleado) values (204, 'Mariana', 'Cortez','Vendedor') 
insert into Empleado 
(iIdEmpleado, vNombre, vApellido, cTipoEmpleado) values (304, 'Victor', 'Ponce', 'Chofer') 

select * from TipoEmpleado

insert into TipoEmpleado
(iIdEmpleado, cChofer, cVendedorMostrador, cMantenimiento, cMecanico, cLimpieza) values (100, 'C', '0', '0', '0', '0')
insert into TipoEmpleado
(iIdEmpleado, cChofer, cVendedorMostrador, cMantenimiento, cMecanico, cLimpieza) values (200, '0', 'V','0' , '0', '0')
insert into TipoEmpleado
(iIdEmpleado, cChofer, cVendedorMostrador, cMantenimiento, cMecanico, cLimpieza) values (101, 'C', '0', '0', '0', '0')
insert into TipoEmpleado
(iIdEmpleado, cChofer, cVendedorMostrador, cMantenimiento, cMecanico, cLimpieza) values (201, '0', 'V', '0', '0', '0')
insert into TipoEmpleado
(iIdEmpleado, cChofer, cVendedorMostrador, cMantenimiento, cMecanico, cLimpieza) values (102, 'C', '0', '0', '0', '0')
insert into TipoEmpleado
(iIdEmpleado, cChofer, cVendedorMostrador, cMantenimiento, cMecanico, cLimpieza) values (300, '0', '0', 'Ma', '0', '0')
insert into TipoEmpleado
(iIdEmpleado, cChofer, cVendedorMostrador, cMantenimiento, cMecanico, cLimpieza) values (301, 'C', '0', '0', '0', '0')
insert into TipoEmpleado
(iIdEmpleado, cChofer, cVendedorMostrador, cMantenimiento, cMecanico, cLimpieza) values (103, '0', '0', 'Ma', '0', '0')
insert into TipoEmpleado
(iIdEmpleado, cChofer, cVendedorMostrador, cMantenimiento, cMecanico, cLimpieza) values (202, '0', 'V', '0', '0', '0')
insert into TipoEmpleado
(iIdEmpleado, cChofer, cVendedorMostrador, cMantenimiento, cMecanico, cLimpieza) values (203, 'C', '0', '0', '0', '0')
insert into TipoEmpleado
(iIdEmpleado, cChofer, cVendedorMostrador, cMantenimiento, cMecanico, cLimpieza) values (302, '0', '0', '0', 'Me', '0')
insert into TipoEmpleado
(iIdEmpleado, cChofer, cVendedorMostrador, cMantenimiento, cMecanico, cLimpieza) values (303, 'C', '0', '0', '0', '0')
insert into TipoEmpleado
(iIdEmpleado, cChofer, cVendedorMostrador, cMantenimiento, cMecanico, cLimpieza) values (104, '0', '0', '0', '0', 'L')
insert into TipoEmpleado
(iIdEmpleado, cChofer, cVendedorMostrador, cMantenimiento, cMecanico, cLimpieza) values (204, '0', 'V', '0', '0', '0')
insert into TipoEmpleado
(iIdEmpleado, cChofer, cVendedorMostrador, cMantenimiento, cMecanico, cLimpieza) values (304, 'C', '0', '0', '0', '0')

select * from BoletoAutobus

insert into BoletoAutobus
(iIdVenta, dFecha, iIdViaje, tAsiento, iCostoBoleto, iIdEmpleado) values (1000, '2018-06-01', 12, 2, 500, 200)
insert into BoletoAutobus
(iIdVenta, dFecha, iIdViaje, tAsiento, iCostoBoleto, iIdEmpleado) values (1000, '2018-06-01', 12, 3, 1000, 204)
insert into BoletoAutobus
(iIdVenta, dFecha, iIdViaje, tAsiento, iCostoBoleto, iIdEmpleado) values (1000, '2018-06-01', 12, 2, 1500, 204)
insert into BoletoAutobus
(iIdVenta, dFecha, iIdViaje, tAsiento, iCostoBoleto, iIdEmpleado) values (1000, '2018-06-01', 12, 2, 700, 204)
insert into BoletoAutobus
(iIdVenta, dFecha, iIdViaje, tAsiento, iCostoBoleto, iIdEmpleado) values (1000, '2018-06-02', 12, 2, 550, 200)
insert into BoletoAutobus
(iIdVenta, dFecha, iIdViaje, tAsiento, iCostoBoleto, iIdEmpleado) values (1000, '2018-06-04', 12, 2, 560, 200)
insert into BoletoAutobus
(iIdVenta, dFecha, iIdViaje, tAsiento, iCostoBoleto, iIdEmpleado) values (1000, '2018-06-04', 12, 2, 1200, 202)
insert into BoletoAutobus
(iIdVenta, dFecha, iIdViaje, tAsiento, iCostoBoleto, iIdEmpleado) values (1000, '2018-06-04', 12, 2, 2000, 201)
insert into BoletoAutobus
(iIdVenta, dFecha, iIdViaje, tAsiento, iCostoBoleto, iIdEmpleado) values (1000, '2018-06-04', 12, 2, 800, 204)
insert into BoletoAutobus
(iIdVenta, dFecha, iIdViaje, tAsiento, iCostoBoleto, iIdEmpleado) values (1000, '2018-06-06', 12, 2, 850, 200)
insert into BoletoAutobus
(iIdVenta, dFecha, iIdViaje, tAsiento, iCostoBoleto, iIdEmpleado) values (1000, '2018-06-06', 12, 2, 900, 201)
insert into BoletoAutobus
(iIdVenta, dFecha, iIdViaje, tAsiento, iCostoBoleto, iIdEmpleado) values (1000, '2018-06-06', 12, 2, 950, 204)
insert into BoletoAutobus
(iIdVenta, dFecha, iIdViaje, tAsiento, iCostoBoleto, iIdEmpleado) values (1000, '2018-06-10', 12, 2, 1350, 202)
insert into BoletoAutobus
(iIdVenta, dFecha, iIdViaje, tAsiento, iCostoBoleto, iIdEmpleado) values (1000, '2018-06-10', 12, 2, 1250, 202)
insert into BoletoAutobus
(iIdVenta, dFecha, iIdViaje, tAsiento, iCostoBoleto, iIdEmpleado) values (1000, '2018-06-10', 12, 2, 750, 201)

select * from TipoBoleto

insert into TipoBoleto
(iCostoBoleto, cBoletoNiño, cBoletoEstudiante, cBoletoAdulto, cBoletoAdultoMayor) values (500, 'N', '0', '0', '0')
insert into TipoBoleto
(iCostoBoleto, cBoletoNiño, cBoletoEstudiante, cBoletoAdulto, cBoletoAdultoMayor) values (1000, '0', '0', 'A', '0')
insert into TipoBoleto
(iCostoBoleto, cBoletoNiño, cBoletoEstudiante, cBoletoAdulto, cBoletoAdultoMayor) values (1500, '0', '0', 'A', '0')
insert into TipoBoleto
(iCostoBoleto, cBoletoNiño, cBoletoEstudiante, cBoletoAdulto, cBoletoAdultoMayor) values (700, 'N', '0', '0', 'AM')
insert into TipoBoleto
(iCostoBoleto, cBoletoNiño, cBoletoEstudiante, cBoletoAdulto, cBoletoAdultoMayor) values (550, 'N', '0', '0', '0')
insert into TipoBoleto
(iCostoBoleto, cBoletoNiño, cBoletoEstudiante, cBoletoAdulto, cBoletoAdultoMayor) values (560, 'N', '0', '0', '0')
insert into TipoBoleto
(iCostoBoleto, cBoletoNiño, cBoletoEstudiante, cBoletoAdulto, cBoletoAdultoMayor) values (1200, '0', '0', 'A', '0')
insert into TipoBoleto
(iCostoBoleto, cBoletoNiño, cBoletoEstudiante, cBoletoAdulto, cBoletoAdultoMayor) values (2000, 'N', '0', 'A', '0')
insert into TipoBoleto
(iCostoBoleto, cBoletoNiño, cBoletoEstudiante, cBoletoAdulto, cBoletoAdultoMayor) values (800, '0', 'E', '0', '0')
insert into TipoBoleto
(iCostoBoleto, cBoletoNiño, cBoletoEstudiante, cBoletoAdulto, cBoletoAdultoMayor) values (850, '0', 'E', '0', '0')
insert into TipoBoleto
(iCostoBoleto, cBoletoNiño, cBoletoEstudiante, cBoletoAdulto, cBoletoAdultoMayor) values (900, '0', 'E', '0', '0')
insert into TipoBoleto
(iCostoBoleto, cBoletoNiño, cBoletoEstudiante, cBoletoAdulto, cBoletoAdultoMayor) values (950, '0', '0', 'A', '0')
insert into TipoBoleto
(iCostoBoleto, cBoletoNiño, cBoletoEstudiante, cBoletoAdulto, cBoletoAdultoMayor) values (1350, '0', '0', 'A', '0')
insert into TipoBoleto
(iCostoBoleto, cBoletoNiño, cBoletoEstudiante, cBoletoAdulto, cBoletoAdultoMayor) values (1250, '0', '0', 'A', '0')
insert into TipoBoleto
(iCostoBoleto, cBoletoNiño, cBoletoEstudiante, cBoletoAdulto, cBoletoAdultoMayor) values (750, '0', '0', '0', 'AM')

select * from CostoBoleto

insert into CostoBoleto
(iCostoBoleto, tTipoBoleto) values (500, 1) 
insert into CostoBoleto
(iCostoBoleto, tTipoBoleto) values (1000, 3) 
insert into CostoBoleto
(iCostoBoleto, tTipoBoleto) values (1500, 3) 
insert into CostoBoleto
(iCostoBoleto, tTipoBoleto) values (700, 4) 
insert into CostoBoleto
(iCostoBoleto, tTipoBoleto) values (550, 1) 
insert into CostoBoleto
(iCostoBoleto, tTipoBoleto) values (560, 1) 
insert into CostoBoleto
(iCostoBoleto, tTipoBoleto) values (1200, 3) 
insert into CostoBoleto
(iCostoBoleto, tTipoBoleto) values (2000, 3) 
insert into CostoBoleto
(iCostoBoleto, tTipoBoleto) values (800, 2) 
insert into CostoBoleto
(iCostoBoleto, tTipoBoleto) values (850, 2) 
insert into CostoBoleto
(iCostoBoleto, tTipoBoleto) values (900, 2) 
insert into CostoBoleto
(iCostoBoleto, tTipoBoleto) values (950, 3) 
insert into CostoBoleto
(iCostoBoleto, tTipoBoleto) values (1350, 3) 
insert into CostoBoleto
(iCostoBoleto, tTipoBoleto) values (1250, 3) 
insert into CostoBoleto
(iCostoBoleto, tTipoBoleto) values (750, 4) 

Update BoletoAutobus set tAsiento = 16 where iCostoBoleto = 2000
Update BoletoAutobus set tAsiento = 2 where iCostoBoleto = 500
Update Empleado set cTipoEmpleado = 'Vendedor' where vNombre = 'Omar'
Update CostoBoleto set tTipoBoleto = 1 where tTipoBoleto = 2
Update CostoBoleto set tTipoBoleto = 2 where iCostoBoleto = 800


Delete from TipoEmpleado where iIdEmpleado = 100
Delete from CostoBoleto where iCostoBoleto = 1200
Delete from TipoEmpleado where iIdEmpleado = 303
Delete from CostoBoleto where iCostoBoleto = 1500
Delete from TipoEmpleado where iIdEmpleado = 203

