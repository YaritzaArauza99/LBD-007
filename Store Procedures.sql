
use CentralYAAG

create procedure 1 as
select e.vNombre as 'Nombre', e.cTipoEmpleado as 'TipoEmpleado',
 v.dFecha as 'Fecha', v.vRuta as Ruta from Empleado as e join Viajes as v 
 on e.iIdEmpleado = v.iIdEmpleado


create procedure Vista1 as
Update BoletoAutobus set tAsiento = 1
where tAsiento = 2 


create procedure Vista2 
@vNombre varchar(100),
@TipoEmpleado char (10)
as
Select * from BoletoAutobus where @vNombre= @vNombre and @TipoEmpleado= @TipoEmpleado


Create procedure Vista3
@vOrigen varchar(150)
as
select * from Viajes where vOrigen=@vOrigen


create procedure Vista4
@vNombre varchar(100),
@vTiempoEstimado time output
as
set @vTiempoEstimado= (select vTiempoEstimado from Vista4 where @vNombre= @vNombre)

create procedure Vista5
@iIdViaje int
as
Select iCostoBoleto from Vista5 
where iIdViaje = @iIdviaje



create function Viajes (@viajes int)
returns varchar(50)
as
BEGIN
	declare @sit int;
	declare @resp varchar(50);

	set @sit= (Select v.vTiempoEstimado from Viajes as v where v.vTiempoEstimado = @viajes);

	if(@sit=1)
		BEGIN
			 set @resp='A tiempo';
		END
	else if(@sit=2)
		BEGIN
			 set @resp='Retrasado';
		END
	else if(@sit=3)
		BEGIN
			 set @resp='Ha terminado';
		END

	RETURN @resp

END
GO