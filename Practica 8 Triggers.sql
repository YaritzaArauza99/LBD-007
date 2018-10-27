use CentralYAAG

GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Boletos]
on BoletoAutobus
instead of update -- delete/*instead*/
as
begin
	select *
	from INSERTED
	select *
	from deleted
END

insert into BoletoAutobus values (1016,'2018-11-20', 1, 16, 550, 202)

GO
create trigger [dbo].[Empleados]
on TipoEmpleado
instead of update -- delete/*instead*/
as
begin
	select *
	from INSERTED
	select *
	from deleted
END

insert into TipoEmpleado values (202, '0', '0', 'Ma', '0', '0') 

GO
create trigger [dbo].[Costos]
on CostoBoleto
instead of delete
as
begin
	select 'No Eliminar Ningun Costo'
end

delete from CostoBoleto

