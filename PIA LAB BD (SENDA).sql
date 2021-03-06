/*****************************************************************
Intgerantes del Equipo:
Alondra Sarahí Rivas Mora			1793964
Yaritza Abigail Arauza García		1794051
Bryan Ulises Alcocer Navarro		1751214
Angel David Almaraz Castillo		1799939
Cesar Alejandro Saucedo Coronado	1722705
****************************************************************/
/***************************************************************
Este es nuestra Base de Datos de Senda, por alguna razon los Triggers no aparecen
del lado del Explorador pero si estan integrados.
Aqui dejamos pruebas de ejecucion de los mismos:

-------------1--------------
update Empleado set Puesto = 1
from Empleado
where iIdEmpleado = 3
------------2--------------
insert into Venta
 values (17,3,2,1,300,(Select CONVERT(date,GETDATE())),(Select CONVERT(time,GETDATE())))
-----------3---------------
Delete from Venta
*****************************************************************/



Create database SendaPIA
GO
USE [SendaPIA]
GO
/****** Object:  Trigger [Trigger_Insert]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Trigger_Insert]'))
DROP TRIGGER [dbo].[Trigger_Insert]
GO
/****** Object:  Trigger [Trigger_Delete]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Trigger_Delete]'))
DROP TRIGGER [dbo].[Trigger_Delete]
GO
/****** Object:  Trigger [tr_updatePuesto]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tr_updatePuesto]'))
DROP TRIGGER [dbo].[tr_updatePuesto]
GO
/****** Object:  Trigger [Trigger_Insertar]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Trigger_Insertar]'))
DROP TRIGGER [dbo].[Trigger_Insertar]
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] DROP CONSTRAINT [CK_Empleado]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Viaje_Ruta]') AND parent_object_id = OBJECT_ID(N'[dbo].[Viaje]'))
ALTER TABLE [dbo].[Viaje] DROP CONSTRAINT [FK_Viaje_Ruta]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Viaje_EstadoViaje]') AND parent_object_id = OBJECT_ID(N'[dbo].[Viaje]'))
ALTER TABLE [dbo].[Viaje] DROP CONSTRAINT [FK_Viaje_EstadoViaje]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Viaje_ChoferAutobus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Viaje]'))
ALTER TABLE [dbo].[Viaje] DROP CONSTRAINT [FK_Viaje_ChoferAutobus]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_TPago]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta] DROP CONSTRAINT [FK_Venta_TPago]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Precio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta] DROP CONSTRAINT [FK_Venta_Precio]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta] DROP CONSTRAINT [FK_Venta_Empleado]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuarios_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuarios]'))
ALTER TABLE [dbo].[Usuarios] DROP CONSTRAINT [FK_Usuarios_Empleado]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ruta_Ciudad1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ruta]'))
ALTER TABLE [dbo].[Ruta] DROP CONSTRAINT [FK_Ruta_Ciudad1]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ruta_Ciudad]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ruta]'))
ALTER TABLE [dbo].[Ruta] DROP CONSTRAINT [FK_Ruta_Ciudad]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PasajeroBoleto_Pasajero]') AND parent_object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]'))
ALTER TABLE [dbo].[PasajeroBoleto] DROP CONSTRAINT [FK_PasajeroBoleto_Pasajero]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PasajeroBoleto_Boleto]') AND parent_object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]'))
ALTER TABLE [dbo].[PasajeroBoleto] DROP CONSTRAINT [FK_PasajeroBoleto_Boleto]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pasajero_Venta]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pasajero]'))
ALTER TABLE [dbo].[Pasajero] DROP CONSTRAINT [FK_Pasajero_Venta]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pasajero_TipoPasajero]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pasajero]'))
ALTER TABLE [dbo].[Pasajero] DROP CONSTRAINT [FK_Pasajero_TipoPasajero]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Empleado_Puesto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] DROP CONSTRAINT [FK_Empleado_Puesto]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ChoferAutobus_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChoferAutobus]'))
ALTER TABLE [dbo].[ChoferAutobus] DROP CONSTRAINT [FK_ChoferAutobus_Empleado]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ChoferAutobus_Autobus]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChoferAutobus]'))
ALTER TABLE [dbo].[ChoferAutobus] DROP CONSTRAINT [FK_ChoferAutobus_Autobus]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Boleto_Viaje]') AND parent_object_id = OBJECT_ID(N'[dbo].[Boleto]'))
ALTER TABLE [dbo].[Boleto] DROP CONSTRAINT [FK_Boleto_Viaje]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Boleto_Precio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Boleto]'))
ALTER TABLE [dbo].[Boleto] DROP CONSTRAINT [FK_Boleto_Precio]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Boleto_Asiento]') AND parent_object_id = OBJECT_ID(N'[dbo].[Boleto]'))
ALTER TABLE [dbo].[Boleto] DROP CONSTRAINT [FK_Boleto_Asiento]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Asiento_SituacionA]') AND parent_object_id = OBJECT_ID(N'[dbo].[Asiento]'))
ALTER TABLE [dbo].[Asiento] DROP CONSTRAINT [FK_Asiento_SituacionA]
GO
/****** Object:  View [dbo].[Vista_Viaje]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Vista_Viaje]'))
DROP VIEW [dbo].[Vista_Viaje]
GO
/****** Object:  View [dbo].[Vista_Asiento]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Vista_Asiento]'))
DROP VIEW [dbo].[Vista_Asiento]
GO
/****** Object:  View [dbo].[Origen]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Origen]'))
DROP VIEW [dbo].[Origen]
GO
/****** Object:  View [dbo].[EmpleadoVenta]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[EmpleadoVenta]'))
DROP VIEW [dbo].[EmpleadoVenta]
GO
/****** Object:  View [dbo].[Destino]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Destino]'))
DROP VIEW [dbo].[Destino]
GO
/****** Object:  View [dbo].[AutobusChofer]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AutobusChofer]'))
DROP VIEW [dbo].[AutobusChofer]
GO
/****** Object:  Table [dbo].[Viaje]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Viaje]') AND type in (N'U'))
DROP TABLE [dbo].[Viaje]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Venta]') AND type in (N'U'))
DROP TABLE [dbo].[Venta]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]') AND type in (N'U'))
DROP TABLE [dbo].[Usuarios]
GO
/****** Object:  Table [dbo].[TPago]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TPago]') AND type in (N'U'))
DROP TABLE [dbo].[TPago]
GO
/****** Object:  Table [dbo].[TipoPasajero]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoPasajero]') AND type in (N'U'))
DROP TABLE [dbo].[TipoPasajero]
GO
/****** Object:  Table [dbo].[SituacionA]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SituacionA]') AND type in (N'U'))
DROP TABLE [dbo].[SituacionA]
GO
/****** Object:  Table [dbo].[Ruta]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ruta]') AND type in (N'U'))
DROP TABLE [dbo].[Ruta]
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Puesto]') AND type in (N'U'))
DROP TABLE [dbo].[Puesto]
GO
/****** Object:  Table [dbo].[Precio]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Precio]') AND type in (N'U'))
DROP TABLE [dbo].[Precio]
GO
/****** Object:  Table [dbo].[PasajeroBoleto]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]') AND type in (N'U'))
DROP TABLE [dbo].[PasajeroBoleto]
GO
/****** Object:  Table [dbo].[Pasajero]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pasajero]') AND type in (N'U'))
DROP TABLE [dbo].[Pasajero]
GO
/****** Object:  Table [dbo].[EstadoViaje]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EstadoViaje]') AND type in (N'U'))
DROP TABLE [dbo].[EstadoViaje]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empleado]') AND type in (N'U'))
DROP TABLE [dbo].[Empleado]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ciudad]') AND type in (N'U'))
DROP TABLE [dbo].[Ciudad]
GO
/****** Object:  Table [dbo].[ChoferAutobus]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChoferAutobus]') AND type in (N'U'))
DROP TABLE [dbo].[ChoferAutobus]
GO
/****** Object:  Table [dbo].[Boleto]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Boleto]') AND type in (N'U'))
DROP TABLE [dbo].[Boleto]
GO
/****** Object:  Table [dbo].[Autobus]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Autobus]') AND type in (N'U'))
DROP TABLE [dbo].[Autobus]
GO
/****** Object:  Table [dbo].[Asiento]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Asiento]') AND type in (N'U'))
DROP TABLE [dbo].[Asiento]
GO
/****** Object:  UserDefinedFunction [dbo].[ValidarUsuario]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ValidarUsuario]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ValidarUsuario]
GO
/****** Object:  UserDefinedFunction [dbo].[TotalDeEmpleados]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TotalDeEmpleados]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[TotalDeEmpleados]
GO
/****** Object:  UserDefinedFunction [dbo].[SituacionViaje]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SituacionViaje]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[SituacionViaje]
GO
/****** Object:  UserDefinedFunction [dbo].[PrecioTotal]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PrecioTotal]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[PrecioTotal]
GO
/****** Object:  UserDefinedFunction [dbo].[ElegirRuta]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ElegirRuta]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ElegirRuta]
GO
/****** Object:  StoredProcedure [dbo].[TipoEmpleado]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoEmpleado]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[TipoEmpleado]
GO
/****** Object:  StoredProcedure [dbo].[TipoDePago]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoDePago]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[TipoDePago]
GO
/****** Object:  StoredProcedure [dbo].[NuevoPasajero]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NuevoPasajero]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[NuevoPasajero]
GO
/****** Object:  StoredProcedure [dbo].[ContarTPasajero]    Script Date: 27/10/2018 04:28:21 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContarTPasajero]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ContarTPasajero]
GO
/****** Object:  StoredProcedure [dbo].[ContarTPasajero]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContarTPasajero]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[ContarTPasajero](
	@idTipoP int
)
as 
begin
	select COUNT(e.iIdPasajero) as ''Pasajeros'', d.vTipoP
	FROM Pasajero as e
	inner join TipoPasajero as d on d.iIdTipoPasajero = e.iTipoP
	where  d.iIdTipoPasajero = @idTipoP
	group by d.vTipoP
end' 
END
GO
/****** Object:  StoredProcedure [dbo].[NuevoPasajero]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NuevoPasajero]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[NuevoPasajero](
	@vNombresP varchar(50),
	@vApetPatP varchar(50),
	@vApeMatP varchar(50),
	@tEdadP int,
	@iIdTipo int,
	@iIdventa int
)
as 
begin
	insert into Pasajero(vNomP,vApeP,vApeM,iEdad, iTipoP,iIdVenta)
	values (@vNombresP ,	@vApetPatP ,@vApeMatP ,@tEdadP, @iIdTipo,@iIdventa)
end' 
END
GO
/****** Object:  StoredProcedure [dbo].[TipoDePago]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoDePago]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[TipoDePago](
	@iIdTPago int
)
as 
begin
	select COUNT(e.iIdVenta) as ''Ventas'', d.vTipoP
	FROM Venta as e
	inner join TPago as d on d.iIdTPago = e.iIdTPago
	where  d.iIdTPago = @iIdTPago
	group by d.vTipoP
end' 
END
GO
/****** Object:  StoredProcedure [dbo].[TipoEmpleado]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoEmpleado]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[TipoEmpleado](
	@iIdPuesto int
)
as 
begin
	select (e.vNomEmpleado + '' '' + e.vApePatEm+ '' '' +e.vApeMatEm) as NombreCompleto,
		 d.vPuesto
	 from Empleado as e
	left join Puesto as d on d.iIdPuesto = e.Puesto
	 where d.iIdPuesto = @iIdPuesto
end' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[ElegirRuta]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ElegirRuta]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
create function [dbo].[ElegirRuta](
	@origen varchar(50), 
	@destino varchar(50))

returns int
as
begin

	declare @ruta int;

	set @ruta=(
		Select r.iIdRuta from Ruta as r 
		where 
		r.iIdOrigen=(select c.iIdCiudad from Ciudad as c 
			where 
			c.vNombreC=@origen)
			and
		r.iIdDestino=(select c.iIdCiudad from Ciudad as c 
			where 
			c.vNombreC=@destino))


	return @ruta
end
' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[PrecioTotal]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PrecioTotal]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[PrecioTotal](@cantAsientos int, @costoBoleto money)
returns money
as
begin
		declare @total money;

		set @total=(Select @cantAsientos * @costoBoleto)

		return @total
end
' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[SituacionViaje]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SituacionViaje]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[SituacionViaje](@viaje int)
returns varchar(50)
as
begin
	
	declare @sit int;
	declare @resp varchar(50);

	set @sit= (Select v.tEstadoViaje from Viaje as v where v.iIdViaje=@viaje);

	if(@sit=1)
		begin
			 set @resp=''Iniciado'';
		end
	else if(@sit=2)
		begin
			 set @resp=''En Curso'';
		end
	else if(@sit=3)
		begin
			 set @resp=''Acabado'';
		end

	RETURN @resp

end
' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[TotalDeEmpleados]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TotalDeEmpleados]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[TotalDeEmpleados](
) returns int
as begin
	declare @totalE int = (select count(e.iIdEmpleado) as TotalE from Empleado as e)
	return @totalE
end
' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[ValidarUsuario]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ValidarUsuario]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[ValidarUsuario](@nom varchar(50), @contra varchar(50))
returns int
as
begin
		declare @valor int;
		declare @vartot int;

		set @valor=(Select iIdUsuario from Usuarios as u where u.vNombre=@nom and u.vContra=@contra)

		if(@valor>0)
			begin 
				set @vartot=1;
			end
		else 
			begin
				set @vartot=0;
			end

			return @vartot
end
' 
END

GO
/****** Object:  Table [dbo].[Asiento]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Asiento]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Asiento](
	[tIdAsiento] [tinyint] NOT NULL,
	[iIdSituacionA] [int] NOT NULL,
 CONSTRAINT [PK_Asiento] PRIMARY KEY CLUSTERED 
(
	[tIdAsiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Autobus]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Autobus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Autobus](
	[iIdAutobus] [int] NOT NULL,
	[vMarca] [varchar](50) NOT NULL,
	[iModelo] [int] NOT NULL,
	[tCantPasajeros] [tinyint] NOT NULL,
	[vPlacas] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Autobus] PRIMARY KEY CLUSTERED 
(
	[iIdAutobus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Boleto]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Boleto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Boleto](
	[iIdBoleto] [int] NOT NULL,
	[iIdViaje] [int] NOT NULL,
	[iIdAsiento] [tinyint] NOT NULL,
	[iIdPrecio] [int] NOT NULL,
 CONSTRAINT [PK_Boleto] PRIMARY KEY CLUSTERED 
(
	[iIdBoleto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ChoferAutobus]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChoferAutobus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChoferAutobus](
	[iIdChoferAutobus] [int] NOT NULL,
	[iIdAutobus] [int] NOT NULL,
	[iIdEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_ChoferAutobus] PRIMARY KEY CLUSTERED 
(
	[iIdChoferAutobus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ciudad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ciudad](
	[iIdCiudad] [int] NOT NULL,
	[vNombreC] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Ciudad] PRIMARY KEY CLUSTERED 
(
	[iIdCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empleado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Empleado](
	[iIdEmpleado] [int] NOT NULL,
	[vNomEmpleado] [varchar](50) NOT NULL,
	[vApePatEm] [varchar](50) NOT NULL,
	[vApeMatEm] [varchar](50) NOT NULL,
	[tEdadEmpleado] [tinyint] NOT NULL,
	[Puesto] [tinyint] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[iIdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstadoViaje]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EstadoViaje]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EstadoViaje](
	[tIdEstadoViaje] [tinyint] NOT NULL,
	[vEstadoViaje] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EstadoViaje] PRIMARY KEY CLUSTERED 
(
	[tIdEstadoViaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pasajero]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pasajero]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Pasajero](
	[iIdPasajero] [int] IDENTITY(1,1) NOT NULL,
	[vNomP] [varchar](50) NOT NULL,
	[vApeP] [varchar](50) NOT NULL,
	[vApeM] [varchar](50) NOT NULL,
	[iEdad] [int] NOT NULL,
	[iTipoP] [int] NOT NULL,
	[iIdVenta] [int] NOT NULL,
 CONSTRAINT [PK_Pasajero] PRIMARY KEY CLUSTERED 
(
	[iIdPasajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PasajeroBoleto]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PasajeroBoleto](
	[iIdPasajeroBoleto] [int] NOT NULL,
	[iIdPasajero] [int] NOT NULL,
	[iIdBoleto] [int] NOT NULL,
 CONSTRAINT [PK_PasajeroBoleto] PRIMARY KEY CLUSTERED 
(
	[iIdPasajeroBoleto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Precio]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Precio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Precio](
	[iIdPrecio] [int] NOT NULL,
	[mCosto] [money] NOT NULL,
 CONSTRAINT [PK_Precio] PRIMARY KEY CLUSTERED 
(
	[iIdPrecio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Puesto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Puesto](
	[iIdPuesto] [tinyint] NOT NULL,
	[vPuesto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Puesto] PRIMARY KEY CLUSTERED 
(
	[iIdPuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ruta]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ruta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ruta](
	[iIdRuta] [int] NOT NULL,
	[iIdOrigen] [int] NOT NULL,
	[iIdDestino] [int] NOT NULL,
	[tTiempoEstimado] [time](4) NOT NULL,
 CONSTRAINT [PK_Ruta] PRIMARY KEY CLUSTERED 
(
	[iIdRuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SituacionA]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SituacionA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SituacionA](
	[iIdSituacionA] [int] NOT NULL,
	[vSituacionA] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SituacionA] PRIMARY KEY CLUSTERED 
(
	[iIdSituacionA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoPasajero]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoPasajero]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TipoPasajero](
	[iIdTipoPasajero] [int] NOT NULL,
	[vTipoP] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoPasajero] PRIMARY KEY CLUSTERED 
(
	[iIdTipoPasajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TPago]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TPago]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TPago](
	[iIdTPago] [int] NOT NULL,
	[vTipoP] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TPago] PRIMARY KEY CLUSTERED 
(
	[iIdTPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuarios]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Usuarios](
	[iIdUsuario] [int] NOT NULL,
	[vNombre] [varchar](50) NOT NULL,
	[vContra] [varchar](50) NOT NULL,
	[iIdEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[iIdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Venta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Venta](
	[iIdVenta] [int] NOT NULL,
	[iIdEmpleado] [int] NOT NULL,
	[iIdTPago] [int] NOT NULL,
	[iIdPrecio] [int] NOT NULL,
	[mTotal] [money] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[iIdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Viaje]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Viaje]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Viaje](
	[iIdViaje] [int] NOT NULL,
	[iIdRuta] [int] NOT NULL,
	[iIdChoferAutobus] [int] NOT NULL,
	[FechaS] [date] NOT NULL,
	[HoraS] [time](4) NOT NULL,
	[tEstadoViaje] [tinyint] NOT NULL,
 CONSTRAINT [PK_Viaje] PRIMARY KEY CLUSTERED 
(
	[iIdViaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[AutobusChofer]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AutobusChofer]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[AutobusChofer]
as
(select e.iIdChoferAutobus as [Chofer Autobus], 
		Count(v.iIdAutobus) as [Autobus]
	from Autobus as v
	LEFT JOIN ChoferAutobus e on v.iIdAutobus = e.iIdChoferAutobus
	where v.iIdAutobus= e.iIdChoferAutobus
	group by e.iIdChoferAutobus)' 
GO
/****** Object:  View [dbo].[Destino]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Destino]'))
EXEC dbo.sp_executesql @statement = N'
create view [dbo].[Destino] 
as
(select e.iIdCiudad as [Ciudad], 
		Count(v.iIdDestino) as [Destino]
	from Ruta as v
	LEFT JOIN  Ciudad e on v.iIdDestino = e.iIdCiudad
	where v.iIdDestino = e.iIdCiudad
	group by e.iIdCiudad)' 
GO
/****** Object:  View [dbo].[EmpleadoVenta]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[EmpleadoVenta]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[EmpleadoVenta] 
as
(select e.vNomEmpleado + '' '' + e.vApePatEm + '' '' + e.vApeMatEm as [Nombre], 
		Count(v.iIdVenta) as [Total de Venta]
	from Venta as v
	LEFT JOIN Empleado e on v.iIdEmpleado = e.iIdEmpleado
	where MONTH(v.Fecha) = MONTH(GETDATE())
	group by e.vNomEmpleado + '' '' + e.vApePatEm + '' '' + e.vApeMatEm
)' 
GO
/****** Object:  View [dbo].[Origen]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Origen]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[Origen] 
as
(select e.iIdCiudad as [Ciudad], 
		Count(v.iIdOrigen) as [Salida]
	from Ruta as v
	LEFT JOIN  Ciudad e on v.iIdOrigen = e.iIdCiudad
	where v.iIdOrigen = e.iIdCiudad
	group by e.iIdCiudad)' 
GO
/****** Object:  View [dbo].[Vista_Asiento]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Vista_Asiento]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[Vista_Asiento]
as
	(select b.iIdViaje as Viaje,
	a.tIdAsiento as Asiento
	from Boleto as b 
	left JOIN Asiento as a 
	on b.iIdAsiento=a.tIdAsiento)' 
GO
/****** Object:  View [dbo].[Vista_Viaje]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Vista_Viaje]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[Vista_Viaje]
as
(select e.iIdRuta as [Ruta], 
		Count(v.iIdViaje) as [Viaje]
	from Viaje as v
	LEFT JOIN Ruta e on v.iIdViaje = e.iIdRuta
	where v.iIdViaje = e.iIdRuta
	group by e.iIdRuta)' 
GO
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (1, 2)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (2, 1)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (3, 1)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (4, 2)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (5, 2)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (6, 2)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (7, 2)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (8, 2)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (9, 2)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (10, 1)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (11, 1)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (12, 1)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (13, 2)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (14, 2)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (15, 2)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (16, 1)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (17, 2)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (18, 2)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (19, 1)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (20, 2)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (21, 2)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (22, 2)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (23, 2)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (24, 1)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (25, 1)
INSERT [dbo].[Asiento] ([tIdAsiento], [iIdSituacionA]) VALUES (26, 2)
INSERT [dbo].[Autobus] ([iIdAutobus], [vMarca], [iModelo], [tCantPasajeros], [vPlacas]) VALUES (1, N'Mercedes benz', 2014, 50, N'SD-G32-234')
INSERT [dbo].[Autobus] ([iIdAutobus], [vMarca], [iModelo], [tCantPasajeros], [vPlacas]) VALUES (2, N'Internacional', 2015, 60, N'GH-F34-678')
INSERT [dbo].[Autobus] ([iIdAutobus], [vMarca], [iModelo], [tCantPasajeros], [vPlacas]) VALUES (3, N'Volvo', 2016, 50, N'AD-B33-112')
INSERT [dbo].[Autobus] ([iIdAutobus], [vMarca], [iModelo], [tCantPasajeros], [vPlacas]) VALUES (4, N'setra', 2017, 55, N'HD-5B12-234')
INSERT [dbo].[Autobus] ([iIdAutobus], [vMarca], [iModelo], [tCantPasajeros], [vPlacas]) VALUES (5, N'Sunsundeguir', 2010, 40, N'TR-1GR-3S')
INSERT [dbo].[Autobus] ([iIdAutobus], [vMarca], [iModelo], [tCantPasajeros], [vPlacas]) VALUES (6, N'Mercedes benz', 2013, 50, N'GF-G82-934')
INSERT [dbo].[Autobus] ([iIdAutobus], [vMarca], [iModelo], [tCantPasajeros], [vPlacas]) VALUES (7, N'Internacional', 2012, 60, N'BNM-L82-764')
INSERT [dbo].[Autobus] ([iIdAutobus], [vMarca], [iModelo], [tCantPasajeros], [vPlacas]) VALUES (8, N'Mercedes benz', 2018, 50, N'LJK-I52-586')
INSERT [dbo].[Autobus] ([iIdAutobus], [vMarca], [iModelo], [tCantPasajeros], [vPlacas]) VALUES (9, N'Volvo', 2011, 30, N'BV-I62-2N4')
INSERT [dbo].[Autobus] ([iIdAutobus], [vMarca], [iModelo], [tCantPasajeros], [vPlacas]) VALUES (10, N'Sunsundeguir', 2009, 40, N'FH-K62-208')
INSERT [dbo].[Autobus] ([iIdAutobus], [vMarca], [iModelo], [tCantPasajeros], [vPlacas]) VALUES (11, N'Mercedes benz', 2008, 30, N'FD-G52-341')
INSERT [dbo].[Autobus] ([iIdAutobus], [vMarca], [iModelo], [tCantPasajeros], [vPlacas]) VALUES (12, N'Internacional', 2014, 45, N'TW-R42-278')
INSERT [dbo].[Autobus] ([iIdAutobus], [vMarca], [iModelo], [tCantPasajeros], [vPlacas]) VALUES (13, N'Mercedes benz', 2015, 50, N'QW-Y43-294')
INSERT [dbo].[Autobus] ([iIdAutobus], [vMarca], [iModelo], [tCantPasajeros], [vPlacas]) VALUES (14, N'Internacional', 2017, 55, N'JD-G33-333')
INSERT [dbo].[Autobus] ([iIdAutobus], [vMarca], [iModelo], [tCantPasajeros], [vPlacas]) VALUES (15, N'Volvo', 2018, 50, N'DD-J32-634')
INSERT [dbo].[Boleto] ([iIdBoleto], [iIdViaje], [iIdAsiento], [iIdPrecio]) VALUES (1, 1, 1, 1)
INSERT [dbo].[Boleto] ([iIdBoleto], [iIdViaje], [iIdAsiento], [iIdPrecio]) VALUES (2, 2, 2, 2)
INSERT [dbo].[Boleto] ([iIdBoleto], [iIdViaje], [iIdAsiento], [iIdPrecio]) VALUES (3, 3, 3, 3)
INSERT [dbo].[Boleto] ([iIdBoleto], [iIdViaje], [iIdAsiento], [iIdPrecio]) VALUES (4, 4, 4, 4)
INSERT [dbo].[Boleto] ([iIdBoleto], [iIdViaje], [iIdAsiento], [iIdPrecio]) VALUES (5, 5, 5, 4)
INSERT [dbo].[Boleto] ([iIdBoleto], [iIdViaje], [iIdAsiento], [iIdPrecio]) VALUES (6, 6, 6, 3)
INSERT [dbo].[Boleto] ([iIdBoleto], [iIdViaje], [iIdAsiento], [iIdPrecio]) VALUES (7, 7, 7, 2)
INSERT [dbo].[Boleto] ([iIdBoleto], [iIdViaje], [iIdAsiento], [iIdPrecio]) VALUES (8, 8, 8, 1)
INSERT [dbo].[Boleto] ([iIdBoleto], [iIdViaje], [iIdAsiento], [iIdPrecio]) VALUES (9, 9, 9, 1)
INSERT [dbo].[Boleto] ([iIdBoleto], [iIdViaje], [iIdAsiento], [iIdPrecio]) VALUES (10, 10, 10, 4)
INSERT [dbo].[Boleto] ([iIdBoleto], [iIdViaje], [iIdAsiento], [iIdPrecio]) VALUES (11, 11, 11, 2)
INSERT [dbo].[Boleto] ([iIdBoleto], [iIdViaje], [iIdAsiento], [iIdPrecio]) VALUES (12, 12, 12, 3)
INSERT [dbo].[Boleto] ([iIdBoleto], [iIdViaje], [iIdAsiento], [iIdPrecio]) VALUES (13, 13, 13, 2)
INSERT [dbo].[Boleto] ([iIdBoleto], [iIdViaje], [iIdAsiento], [iIdPrecio]) VALUES (14, 14, 14, 1)
INSERT [dbo].[ChoferAutobus] ([iIdChoferAutobus], [iIdAutobus], [iIdEmpleado]) VALUES (1, 1, 1)
INSERT [dbo].[ChoferAutobus] ([iIdChoferAutobus], [iIdAutobus], [iIdEmpleado]) VALUES (2, 3, 5)
INSERT [dbo].[ChoferAutobus] ([iIdChoferAutobus], [iIdAutobus], [iIdEmpleado]) VALUES (3, 12, 4)
INSERT [dbo].[ChoferAutobus] ([iIdChoferAutobus], [iIdAutobus], [iIdEmpleado]) VALUES (4, 2, 8)
INSERT [dbo].[ChoferAutobus] ([iIdChoferAutobus], [iIdAutobus], [iIdEmpleado]) VALUES (5, 5, 7)
INSERT [dbo].[ChoferAutobus] ([iIdChoferAutobus], [iIdAutobus], [iIdEmpleado]) VALUES (6, 2, 15)
INSERT [dbo].[ChoferAutobus] ([iIdChoferAutobus], [iIdAutobus], [iIdEmpleado]) VALUES (7, 14, 10)
INSERT [dbo].[ChoferAutobus] ([iIdChoferAutobus], [iIdAutobus], [iIdEmpleado]) VALUES (8, 8, 8)
INSERT [dbo].[ChoferAutobus] ([iIdChoferAutobus], [iIdAutobus], [iIdEmpleado]) VALUES (9, 10, 11)
INSERT [dbo].[ChoferAutobus] ([iIdChoferAutobus], [iIdAutobus], [iIdEmpleado]) VALUES (10, 15, 3)
INSERT [dbo].[ChoferAutobus] ([iIdChoferAutobus], [iIdAutobus], [iIdEmpleado]) VALUES (11, 2, 1)
INSERT [dbo].[ChoferAutobus] ([iIdChoferAutobus], [iIdAutobus], [iIdEmpleado]) VALUES (12, 15, 6)
INSERT [dbo].[ChoferAutobus] ([iIdChoferAutobus], [iIdAutobus], [iIdEmpleado]) VALUES (13, 6, 11)
INSERT [dbo].[ChoferAutobus] ([iIdChoferAutobus], [iIdAutobus], [iIdEmpleado]) VALUES (14, 7, 2)
INSERT [dbo].[ChoferAutobus] ([iIdChoferAutobus], [iIdAutobus], [iIdEmpleado]) VALUES (15, 10, 3)
INSERT [dbo].[Ciudad] ([iIdCiudad], [vNombreC]) VALUES (1, N'Monterrey')
INSERT [dbo].[Ciudad] ([iIdCiudad], [vNombreC]) VALUES (2, N'Ciudad victoria')
INSERT [dbo].[Ciudad] ([iIdCiudad], [vNombreC]) VALUES (3, N'San Luis Potosí')
INSERT [dbo].[Ciudad] ([iIdCiudad], [vNombreC]) VALUES (4, N'Saltillo')
INSERT [dbo].[Ciudad] ([iIdCiudad], [vNombreC]) VALUES (5, N'Zacatecas')
INSERT [dbo].[Ciudad] ([iIdCiudad], [vNombreC]) VALUES (6, N'Durango')
INSERT [dbo].[Ciudad] ([iIdCiudad], [vNombreC]) VALUES (7, N'Chihuahua')
INSERT [dbo].[Ciudad] ([iIdCiudad], [vNombreC]) VALUES (8, N'Guadalajara')
INSERT [dbo].[Ciudad] ([iIdCiudad], [vNombreC]) VALUES (9, N'Jalapa')
INSERT [dbo].[Ciudad] ([iIdCiudad], [vNombreC]) VALUES (10, N'Oaxaca')
INSERT [dbo].[Ciudad] ([iIdCiudad], [vNombreC]) VALUES (11, N'Ciudad de México')
INSERT [dbo].[Ciudad] ([iIdCiudad], [vNombreC]) VALUES (12, N'Tuxtla Gutierrez')
INSERT [dbo].[Ciudad] ([iIdCiudad], [vNombreC]) VALUES (13, N'Tepic')
INSERT [dbo].[Ciudad] ([iIdCiudad], [vNombreC]) VALUES (14, N'Culiacan')
INSERT [dbo].[Ciudad] ([iIdCiudad], [vNombreC]) VALUES (15, N'Hermosillo')
INSERT [dbo].[Empleado] ([iIdEmpleado], [vNomEmpleado], [vApePatEm], [vApeMatEm], [tEdadEmpleado], [Puesto]) VALUES (1, N'Juan', N'Perez', N'Martinez', 32, 1)
INSERT [dbo].[Empleado] ([iIdEmpleado], [vNomEmpleado], [vApePatEm], [vApeMatEm], [tEdadEmpleado], [Puesto]) VALUES (2, N'JESUS', N'MULA', N' ORDOÑEZ', 24, 2)
INSERT [dbo].[Empleado] ([iIdEmpleado], [vNomEmpleado], [vApePatEm], [vApeMatEm], [tEdadEmpleado], [Puesto]) VALUES (3, N'SEBASTIAN', N'PIRES', N'PEÑARANDA', 32, 2)
INSERT [dbo].[Empleado] ([iIdEmpleado], [vNomEmpleado], [vApePatEm], [vApeMatEm], [tEdadEmpleado], [Puesto]) VALUES (4, N'PEDRO', N'REIG', N'JORGE', 28, 2)
INSERT [dbo].[Empleado] ([iIdEmpleado], [vNomEmpleado], [vApePatEm], [vApeMatEm], [tEdadEmpleado], [Puesto]) VALUES (5, N'EMILIO', N'RUS', N'GRANDA', 33, 1)
INSERT [dbo].[Empleado] ([iIdEmpleado], [vNomEmpleado], [vApePatEm], [vApeMatEm], [tEdadEmpleado], [Puesto]) VALUES (6, N'RAMON', N'ALARCON', N'LERMA', 43, 1)
INSERT [dbo].[Empleado] ([iIdEmpleado], [vNomEmpleado], [vApePatEm], [vApeMatEm], [tEdadEmpleado], [Puesto]) VALUES (7, N'ESTEBAN', N'PERAL', N'AMOROS', 37, 2)
INSERT [dbo].[Empleado] ([iIdEmpleado], [vNomEmpleado], [vApePatEm], [vApeMatEm], [tEdadEmpleado], [Puesto]) VALUES (8, N'PEDRO', N'PLATA', N'PIEDRA', 38, 1)
INSERT [dbo].[Empleado] ([iIdEmpleado], [vNomEmpleado], [vApePatEm], [vApeMatEm], [tEdadEmpleado], [Puesto]) VALUES (9, N'MOHAMED', N'LASO', N'BOU', 34, 2)
INSERT [dbo].[Empleado] ([iIdEmpleado], [vNomEmpleado], [vApePatEm], [vApeMatEm], [tEdadEmpleado], [Puesto]) VALUES (10, N'JUAN JOSE', N'MANSILLA', N'MELGAR', 28, 2)
INSERT [dbo].[Empleado] ([iIdEmpleado], [vNomEmpleado], [vApePatEm], [vApeMatEm], [tEdadEmpleado], [Puesto]) VALUES (11, N'JESUS', N'MATEI', N'ROSSELLO', 30, 1)
INSERT [dbo].[Empleado] ([iIdEmpleado], [vNomEmpleado], [vApePatEm], [vApeMatEm], [tEdadEmpleado], [Puesto]) VALUES (12, N'ALFONSO', N'MONTILLA', N'TABOADA', 53, 1)
INSERT [dbo].[Empleado] ([iIdEmpleado], [vNomEmpleado], [vApePatEm], [vApeMatEm], [tEdadEmpleado], [Puesto]) VALUES (13, N'CRISTOBAL', N'GASCO', N'SOLIS', 31, 2)
INSERT [dbo].[Empleado] ([iIdEmpleado], [vNomEmpleado], [vApePatEm], [vApeMatEm], [tEdadEmpleado], [Puesto]) VALUES (14, N'RAMON', N'CACERES', N'GALEANO', 34, 1)
INSERT [dbo].[Empleado] ([iIdEmpleado], [vNomEmpleado], [vApePatEm], [vApeMatEm], [tEdadEmpleado], [Puesto]) VALUES (15, N'LUIS', N'VILLAR', N'BARREDA', 27, 1)
INSERT [dbo].[EstadoViaje] ([tIdEstadoViaje], [vEstadoViaje]) VALUES (1, N'Disponible')
INSERT [dbo].[EstadoViaje] ([tIdEstadoViaje], [vEstadoViaje]) VALUES (2, N'En Progreso')
INSERT [dbo].[EstadoViaje] ([tIdEstadoViaje], [vEstadoViaje]) VALUES (3, N'No Disponible')
SET IDENTITY_INSERT [dbo].[Pasajero] ON 

INSERT [dbo].[Pasajero] ([iIdPasajero], [vNomP], [vApeP], [vApeM], [iEdad], [iTipoP], [iIdVenta]) VALUES (32, N'JUAN LUIS', N'OLIVERAS', N'VAQUERO', 32, 3, 1)
INSERT [dbo].[Pasajero] ([iIdPasajero], [vNomP], [vApeP], [vApeM], [iEdad], [iTipoP], [iIdVenta]) VALUES (33, N'MARIA JOSEFA', N'TOLEDANO', N'BARBERO', 42, 3, 2)
INSERT [dbo].[Pasajero] ([iIdPasajero], [vNomP], [vApeP], [vApeM], [iEdad], [iTipoP], [iIdVenta]) VALUES (34, N'PEDRO', N'FEIJOO', N'GALLARDO', 21, 3, 3)
INSERT [dbo].[Pasajero] ([iIdPasajero], [vNomP], [vApeP], [vApeM], [iEdad], [iTipoP], [iIdVenta]) VALUES (35, N'MARIA JESUS', N'VILAS', N'LARRAÑAGA', 38, 3, 4)
INSERT [dbo].[Pasajero] ([iIdPasajero], [vNomP], [vApeP], [vApeM], [iEdad], [iTipoP], [iIdVenta]) VALUES (36, N'PEDRO', N'BARBER', N'GORDILLO', 43, 3, 5)
INSERT [dbo].[Pasajero] ([iIdPasajero], [vNomP], [vApeP], [vApeM], [iEdad], [iTipoP], [iIdVenta]) VALUES (37, N'ROSARIO', N'BRU', N' MELERO', 25, 2, 6)
INSERT [dbo].[Pasajero] ([iIdPasajero], [vNomP], [vApeP], [vApeM], [iEdad], [iTipoP], [iIdVenta]) VALUES (38, N'AITOR', N'DE LEON', N'ARNAIZ', 30, 3, 7)
INSERT [dbo].[Pasajero] ([iIdPasajero], [vNomP], [vApeP], [vApeM], [iEdad], [iTipoP], [iIdVenta]) VALUES (39, N'MARIA MAR', N'SEGUI', N'CERVANTES', 44, 3, 8)
INSERT [dbo].[Pasajero] ([iIdPasajero], [vNomP], [vApeP], [vApeM], [iEdad], [iTipoP], [iIdVenta]) VALUES (40, N'MERCEDES', N'VILLA', N'BERNARDEZ', 33, 3, 9)
INSERT [dbo].[Pasajero] ([iIdPasajero], [vNomP], [vApeP], [vApeM], [iEdad], [iTipoP], [iIdVenta]) VALUES (41, N'JOSE MIGUEL', N'QUESADA', N'LOBO', 22, 2, 10)
INSERT [dbo].[Pasajero] ([iIdPasajero], [vNomP], [vApeP], [vApeM], [iEdad], [iTipoP], [iIdVenta]) VALUES (42, N'LORENA', N'PORCEL', N'ARTIGAS', 32, 3, 11)
INSERT [dbo].[Pasajero] ([iIdPasajero], [vNomP], [vApeP], [vApeM], [iEdad], [iTipoP], [iIdVenta]) VALUES (43, N'NURIA', N'LIGERO', N'PALAU', 28, 3, 12)
INSERT [dbo].[Pasajero] ([iIdPasajero], [vNomP], [vApeP], [vApeM], [iEdad], [iTipoP], [iIdVenta]) VALUES (44, N'ALBERTO', N'BELLVER', N'GAMARRA', 27, 3, 13)
INSERT [dbo].[Pasajero] ([iIdPasajero], [vNomP], [vApeP], [vApeM], [iEdad], [iTipoP], [iIdVenta]) VALUES (45, N'MIGUEL', N'PORCEL', N'AZCONA', 26, 3, 14)
INSERT [dbo].[Pasajero] ([iIdPasajero], [vNomP], [vApeP], [vApeM], [iEdad], [iTipoP], [iIdVenta]) VALUES (46, N'MARIA ANTONIA', N'HINOJOSA', N'GRAS', 25, 3, 15)
SET IDENTITY_INSERT [dbo].[Pasajero] OFF
INSERT [dbo].[PasajeroBoleto] ([iIdPasajeroBoleto], [iIdPasajero], [iIdBoleto]) VALUES (1, 32, 1)
INSERT [dbo].[PasajeroBoleto] ([iIdPasajeroBoleto], [iIdPasajero], [iIdBoleto]) VALUES (2, 33, 2)
INSERT [dbo].[PasajeroBoleto] ([iIdPasajeroBoleto], [iIdPasajero], [iIdBoleto]) VALUES (3, 34, 3)
INSERT [dbo].[PasajeroBoleto] ([iIdPasajeroBoleto], [iIdPasajero], [iIdBoleto]) VALUES (4, 35, 4)
INSERT [dbo].[PasajeroBoleto] ([iIdPasajeroBoleto], [iIdPasajero], [iIdBoleto]) VALUES (5, 36, 5)
INSERT [dbo].[PasajeroBoleto] ([iIdPasajeroBoleto], [iIdPasajero], [iIdBoleto]) VALUES (6, 37, 6)
INSERT [dbo].[PasajeroBoleto] ([iIdPasajeroBoleto], [iIdPasajero], [iIdBoleto]) VALUES (7, 38, 7)
INSERT [dbo].[PasajeroBoleto] ([iIdPasajeroBoleto], [iIdPasajero], [iIdBoleto]) VALUES (8, 39, 8)
INSERT [dbo].[PasajeroBoleto] ([iIdPasajeroBoleto], [iIdPasajero], [iIdBoleto]) VALUES (9, 40, 9)
INSERT [dbo].[PasajeroBoleto] ([iIdPasajeroBoleto], [iIdPasajero], [iIdBoleto]) VALUES (10, 41, 10)
INSERT [dbo].[PasajeroBoleto] ([iIdPasajeroBoleto], [iIdPasajero], [iIdBoleto]) VALUES (11, 42, 11)
INSERT [dbo].[PasajeroBoleto] ([iIdPasajeroBoleto], [iIdPasajero], [iIdBoleto]) VALUES (12, 43, 12)
INSERT [dbo].[PasajeroBoleto] ([iIdPasajeroBoleto], [iIdPasajero], [iIdBoleto]) VALUES (13, 44, 13)
INSERT [dbo].[PasajeroBoleto] ([iIdPasajeroBoleto], [iIdPasajero], [iIdBoleto]) VALUES (14, 45, 14)
INSERT [dbo].[Precio] ([iIdPrecio], [mCosto]) VALUES (1, 180.0000)
INSERT [dbo].[Precio] ([iIdPrecio], [mCosto]) VALUES (2, 300.0000)
INSERT [dbo].[Precio] ([iIdPrecio], [mCosto]) VALUES (3, 200.0000)
INSERT [dbo].[Precio] ([iIdPrecio], [mCosto]) VALUES (4, 180.0000)
INSERT [dbo].[Puesto] ([iIdPuesto], [vPuesto]) VALUES (1, N'Chofer')
INSERT [dbo].[Puesto] ([iIdPuesto], [vPuesto]) VALUES (2, N'Ventas')
INSERT [dbo].[Ruta] ([iIdRuta], [iIdOrigen], [iIdDestino], [tTiempoEstimado]) VALUES (1, 1, 2, CAST(0x0400F36F06000000 AS Time))
INSERT [dbo].[Ruta] ([iIdRuta], [iIdOrigen], [iIdDestino], [tTiempoEstimado]) VALUES (2, 1, 3, CAST(0x0440D1B20E000000 AS Time))
INSERT [dbo].[Ruta] ([iIdRuta], [iIdOrigen], [iIdDestino], [tTiempoEstimado]) VALUES (3, 1, 4, CAST(0x0400CDB702000000 AS Time))
INSERT [dbo].[Ruta] ([iIdRuta], [iIdOrigen], [iIdDestino], [tTiempoEstimado]) VALUES (4, 1, 5, CAST(0x04008DDF0B000000 AS Time))
INSERT [dbo].[Ruta] ([iIdRuta], [iIdOrigen], [iIdDestino], [tTiempoEstimado]) VALUES (5, 1, 6, CAST(0x040037050F000000 AS Time))
INSERT [dbo].[Ruta] ([iIdRuta], [iIdOrigen], [iIdDestino], [tTiempoEstimado]) VALUES (6, 1, 7, CAST(0x04C0BA3414000000 AS Time))
INSERT [dbo].[Ruta] ([iIdRuta], [iIdOrigen], [iIdDestino], [tTiempoEstimado]) VALUES (7, 1, 8, CAST(0x0400AEE214000000 AS Time))
INSERT [dbo].[Ruta] ([iIdRuta], [iIdOrigen], [iIdDestino], [tTiempoEstimado]) VALUES (8, 1, 9, CAST(0x04801EF81D000000 AS Time))
INSERT [dbo].[Ruta] ([iIdRuta], [iIdOrigen], [iIdDestino], [tTiempoEstimado]) VALUES (9, 1, 10, CAST(0x04C0905E23000000 AS Time))
INSERT [dbo].[Ruta] ([iIdRuta], [iIdOrigen], [iIdDestino], [tTiempoEstimado]) VALUES (10, 1, 11, CAST(0x04C0B57F19000000 AS Time))
INSERT [dbo].[Ruta] ([iIdRuta], [iIdOrigen], [iIdDestino], [tTiempoEstimado]) VALUES (11, 1, 12, CAST(0x040054EA2A000000 AS Time))
INSERT [dbo].[Ruta] ([iIdRuta], [iIdOrigen], [iIdDestino], [tTiempoEstimado]) VALUES (12, 1, 13, CAST(0x040048521A000000 AS Time))
INSERT [dbo].[Ruta] ([iIdRuta], [iIdOrigen], [iIdDestino], [tTiempoEstimado]) VALUES (13, 1, 14, CAST(0x048074D21A000000 AS Time))
INSERT [dbo].[Ruta] ([iIdRuta], [iIdOrigen], [iIdDestino], [tTiempoEstimado]) VALUES (14, 1, 15, CAST(0x040003C528000000 AS Time))
INSERT [dbo].[SituacionA] ([iIdSituacionA], [vSituacionA]) VALUES (1, N'Disponible')
INSERT [dbo].[SituacionA] ([iIdSituacionA], [vSituacionA]) VALUES (2, N'Ocupado')
INSERT [dbo].[TipoPasajero] ([iIdTipoPasajero], [vTipoP]) VALUES (1, N'Niño')
INSERT [dbo].[TipoPasajero] ([iIdTipoPasajero], [vTipoP]) VALUES (2, N'Estudiante o Adulto mayor')
INSERT [dbo].[TipoPasajero] ([iIdTipoPasajero], [vTipoP]) VALUES (3, N'Adulto')
INSERT [dbo].[TPago] ([iIdTPago], [vTipoP]) VALUES (1, N'Efectivo')
INSERT [dbo].[TPago] ([iIdTPago], [vTipoP]) VALUES (2, N'Tarjeta')
INSERT [dbo].[Usuarios] ([iIdUsuario], [vNombre], [vContra], [iIdEmpleado]) VALUES (1, N'EnriqueMartinez', N'Martinez90cc', 2)
INSERT [dbo].[Usuarios] ([iIdUsuario], [vNombre], [vContra], [iIdEmpleado]) VALUES (2, N'OsvaldoGarcia', N'OG993', 5)
INSERT [dbo].[Usuarios] ([iIdUsuario], [vNombre], [vContra], [iIdEmpleado]) VALUES (3, N'CarminaGonzalez', N'GG39NS', 3)
INSERT [dbo].[Usuarios] ([iIdUsuario], [vNombre], [vContra], [iIdEmpleado]) VALUES (4, N'BrianContreras', N'Contreras21sadf', 8)
INSERT [dbo].[Usuarios] ([iIdUsuario], [vNombre], [vContra], [iIdEmpleado]) VALUES (5, N'GaelQuiroz', N'Qquiroz93', 10)
INSERT [dbo].[Usuarios] ([iIdUsuario], [vNombre], [vContra], [iIdEmpleado]) VALUES (6, N'LeylaHernandez', N'LH2714S', 4)
INSERT [dbo].[Usuarios] ([iIdUsuario], [vNombre], [vContra], [iIdEmpleado]) VALUES (7, N'LeslyLimones', N'Limones47', 1)
INSERT [dbo].[Usuarios] ([iIdUsuario], [vNombre], [vContra], [iIdEmpleado]) VALUES (8, N'RobertoGomez', N'GomezGomez33', 12)
INSERT [dbo].[Usuarios] ([iIdUsuario], [vNombre], [vContra], [iIdEmpleado]) VALUES (9, N'KarenCisneros', N'CIS17K', 15)
INSERT [dbo].[Usuarios] ([iIdUsuario], [vNombre], [vContra], [iIdEmpleado]) VALUES (10, N'JessicaTorres', N'Torres23', 2)
INSERT [dbo].[Usuarios] ([iIdUsuario], [vNombre], [vContra], [iIdEmpleado]) VALUES (11, N'DanielCastillo', N'Contraseña8', 13)
INSERT [dbo].[Usuarios] ([iIdUsuario], [vNombre], [vContra], [iIdEmpleado]) VALUES (12, N'CiscoSamorra', N'CiscoVid77', 11)
INSERT [dbo].[Usuarios] ([iIdUsuario], [vNombre], [vContra], [iIdEmpleado]) VALUES (13, N'VeronicaGonzalez', N'Vero223f', 2)
INSERT [dbo].[Usuarios] ([iIdUsuario], [vNombre], [vContra], [iIdEmpleado]) VALUES (14, N'KarlaEscamilla', N'KarlaEscamilla5500', 6)
INSERT [dbo].[Usuarios] ([iIdUsuario], [vNombre], [vContra], [iIdEmpleado]) VALUES (15, N'SilvesterDuran', N'SilveDu0010', 7)
INSERT [dbo].[Venta] ([iIdVenta], [iIdEmpleado], [iIdTPago], [iIdPrecio], [mTotal], [Fecha], [Hora]) VALUES (1, 2, 1, 1, 200.0000, CAST(0xE13E0B00 AS Date), CAST(0x07707AC5CB150000 AS Time))
INSERT [dbo].[Venta] ([iIdVenta], [iIdEmpleado], [iIdTPago], [iIdPrecio], [mTotal], [Fecha], [Hora]) VALUES (2, 4, 2, 1, 180.0000, CAST(0xE13E0B00 AS Date), CAST(0x07B016C6CB150000 AS Time))
INSERT [dbo].[Venta] ([iIdVenta], [iIdEmpleado], [iIdTPago], [iIdPrecio], [mTotal], [Fecha], [Hora]) VALUES (3, 6, 2, 1, 300.0000, CAST(0xE13E0B00 AS Date), CAST(0x07B016C6CB150000 AS Time))
INSERT [dbo].[Venta] ([iIdVenta], [iIdEmpleado], [iIdTPago], [iIdPrecio], [mTotal], [Fecha], [Hora]) VALUES (4, 8, 1, 2, 200.0000, CAST(0xE13E0B00 AS Date), CAST(0x07B016C6CB150000 AS Time))
INSERT [dbo].[Venta] ([iIdVenta], [iIdEmpleado], [iIdTPago], [iIdPrecio], [mTotal], [Fecha], [Hora]) VALUES (5, 11, 2, 1, 180.0000, CAST(0xE13E0B00 AS Date), CAST(0x07E08BC6CB150000 AS Time))
INSERT [dbo].[Venta] ([iIdVenta], [iIdEmpleado], [iIdTPago], [iIdPrecio], [mTotal], [Fecha], [Hora]) VALUES (6, 5, 1, 2, 180.0000, CAST(0xE13E0B00 AS Date), CAST(0x07E08BC6CB150000 AS Time))
INSERT [dbo].[Venta] ([iIdVenta], [iIdEmpleado], [iIdTPago], [iIdPrecio], [mTotal], [Fecha], [Hora]) VALUES (7, 1, 2, 2, 300.0000, CAST(0xE13E0B00 AS Date), CAST(0x07E08BC6CB150000 AS Time))
INSERT [dbo].[Venta] ([iIdVenta], [iIdEmpleado], [iIdTPago], [iIdPrecio], [mTotal], [Fecha], [Hora]) VALUES (8, 5, 1, 2, 180.0000, CAST(0xE13E0B00 AS Date), CAST(0x07E08BC6CB150000 AS Time))
INSERT [dbo].[Venta] ([iIdVenta], [iIdEmpleado], [iIdTPago], [iIdPrecio], [mTotal], [Fecha], [Hora]) VALUES (9, 12, 1, 1, 180.0000, CAST(0xE13E0B00 AS Date), CAST(0x07E08BC6CB150000 AS Time))
INSERT [dbo].[Venta] ([iIdVenta], [iIdEmpleado], [iIdTPago], [iIdPrecio], [mTotal], [Fecha], [Hora]) VALUES (10, 15, 1, 2, 180.0000, CAST(0xE13E0B00 AS Date), CAST(0x07E08BC6CB150000 AS Time))
INSERT [dbo].[Venta] ([iIdVenta], [iIdEmpleado], [iIdTPago], [iIdPrecio], [mTotal], [Fecha], [Hora]) VALUES (11, 8, 1, 2, 200.0000, CAST(0xE13E0B00 AS Date), CAST(0x07E08BC6CB150000 AS Time))
INSERT [dbo].[Venta] ([iIdVenta], [iIdEmpleado], [iIdTPago], [iIdPrecio], [mTotal], [Fecha], [Hora]) VALUES (12, 9, 2, 1, 300.0000, CAST(0xE13E0B00 AS Date), CAST(0x07E08BC6CB150000 AS Time))
INSERT [dbo].[Venta] ([iIdVenta], [iIdEmpleado], [iIdTPago], [iIdPrecio], [mTotal], [Fecha], [Hora]) VALUES (13, 3, 1, 2, 180.0000, CAST(0xE13E0B00 AS Date), CAST(0x071001C7CB150000 AS Time))
INSERT [dbo].[Venta] ([iIdVenta], [iIdEmpleado], [iIdTPago], [iIdPrecio], [mTotal], [Fecha], [Hora]) VALUES (14, 13, 2, 2, 180.0000, CAST(0xE13E0B00 AS Date), CAST(0x071001C7CB150000 AS Time))
INSERT [dbo].[Venta] ([iIdVenta], [iIdEmpleado], [iIdTPago], [iIdPrecio], [mTotal], [Fecha], [Hora]) VALUES (15, 5, 1, 1, 200.0000, CAST(0xE13E0B00 AS Date), CAST(0x071001C7CB150000 AS Time))
INSERT [dbo].[Venta] ([iIdVenta], [iIdEmpleado], [iIdTPago], [iIdPrecio], [mTotal], [Fecha], [Hora]) VALUES (16, 3, 2, 1, 300.0000, CAST(0xE13E0B00 AS Date), CAST(0x0710DD1DD91B0000 AS Time))
INSERT [dbo].[Viaje] ([iIdViaje], [iIdRuta], [iIdChoferAutobus], [FechaS], [HoraS], [tEstadoViaje]) VALUES (1, 1, 1, CAST(0xE63E0B00 AS Date), CAST(0x0400E6DF0C000000 AS Time), 1)
INSERT [dbo].[Viaje] ([iIdViaje], [iIdRuta], [iIdChoferAutobus], [FechaS], [HoraS], [tEstadoViaje]) VALUES (2, 2, 2, CAST(0xE73E0B00 AS Date), CAST(0x04808EF20D000000 AS Time), 1)
INSERT [dbo].[Viaje] ([iIdViaje], [iIdRuta], [iIdChoferAutobus], [FechaS], [HoraS], [tEstadoViaje]) VALUES (3, 3, 3, CAST(0xE83E0B00 AS Date), CAST(0x0400882A11000000 AS Time), 1)
INSERT [dbo].[Viaje] ([iIdViaje], [iIdRuta], [iIdChoferAutobus], [FechaS], [HoraS], [tEstadoViaje]) VALUES (4, 4, 4, CAST(0xE93E0B00 AS Date), CAST(0x0480303D12000000 AS Time), 1)
INSERT [dbo].[Viaje] ([iIdViaje], [iIdRuta], [iIdChoferAutobus], [FechaS], [HoraS], [tEstadoViaje]) VALUES (5, 5, 5, CAST(0xEA3E0B00 AS Date), CAST(0x04002A7515000000 AS Time), 1)
INSERT [dbo].[Viaje] ([iIdViaje], [iIdRuta], [iIdChoferAutobus], [FechaS], [HoraS], [tEstadoViaje]) VALUES (6, 6, 6, CAST(0xEB3E0B00 AS Date), CAST(0x0400CCBF19000000 AS Time), 2)
INSERT [dbo].[Viaje] ([iIdViaje], [iIdRuta], [iIdChoferAutobus], [FechaS], [HoraS], [tEstadoViaje]) VALUES (7, 7, 7, CAST(0xEC3E0B00 AS Date), CAST(0x048074D21A000000 AS Time), 2)
INSERT [dbo].[Viaje] ([iIdViaje], [iIdRuta], [iIdChoferAutobus], [FechaS], [HoraS], [tEstadoViaje]) VALUES (8, 8, 8, CAST(0xED3E0B00 AS Date), CAST(0x04001DE51B000000 AS Time), 2)
INSERT [dbo].[Viaje] ([iIdViaje], [iIdRuta], [iIdChoferAutobus], [FechaS], [HoraS], [tEstadoViaje]) VALUES (9, 9, 9, CAST(0xEE3E0B00 AS Date), CAST(0x0480C5F71C000000 AS Time), 2)
INSERT [dbo].[Viaje] ([iIdViaje], [iIdRuta], [iIdChoferAutobus], [FechaS], [HoraS], [tEstadoViaje]) VALUES (10, 10, 10, CAST(0xEF3E0B00 AS Date), CAST(0x0400BF2F20000000 AS Time), 2)
INSERT [dbo].[Viaje] ([iIdViaje], [iIdRuta], [iIdChoferAutobus], [FechaS], [HoraS], [tEstadoViaje]) VALUES (11, 11, 11, CAST(0xF03E0B00 AS Date), CAST(0x0480674221000000 AS Time), 3)
INSERT [dbo].[Viaje] ([iIdViaje], [iIdRuta], [iIdChoferAutobus], [FechaS], [HoraS], [tEstadoViaje]) VALUES (12, 12, 12, CAST(0xF13E0B00 AS Date), CAST(0x0400B29F26000000 AS Time), 3)
INSERT [dbo].[Viaje] ([iIdViaje], [iIdRuta], [iIdChoferAutobus], [FechaS], [HoraS], [tEstadoViaje]) VALUES (13, 13, 13, CAST(0xF23E0B00 AS Date), CAST(0x04805AB227000000 AS Time), 3)
INSERT [dbo].[Viaje] ([iIdViaje], [iIdRuta], [iIdChoferAutobus], [FechaS], [HoraS], [tEstadoViaje]) VALUES (14, 14, 14, CAST(0xF33E0B00 AS Date), CAST(0x0400F6342F000000 AS Time), 3)
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Asiento_SituacionA]') AND parent_object_id = OBJECT_ID(N'[dbo].[Asiento]'))
ALTER TABLE [dbo].[Asiento]  WITH CHECK ADD  CONSTRAINT [FK_Asiento_SituacionA] FOREIGN KEY([iIdSituacionA])
REFERENCES [dbo].[SituacionA] ([iIdSituacionA])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Asiento_SituacionA]') AND parent_object_id = OBJECT_ID(N'[dbo].[Asiento]'))
ALTER TABLE [dbo].[Asiento] CHECK CONSTRAINT [FK_Asiento_SituacionA]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Boleto_Asiento]') AND parent_object_id = OBJECT_ID(N'[dbo].[Boleto]'))
ALTER TABLE [dbo].[Boleto]  WITH CHECK ADD  CONSTRAINT [FK_Boleto_Asiento] FOREIGN KEY([iIdAsiento])
REFERENCES [dbo].[Asiento] ([tIdAsiento])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Boleto_Asiento]') AND parent_object_id = OBJECT_ID(N'[dbo].[Boleto]'))
ALTER TABLE [dbo].[Boleto] CHECK CONSTRAINT [FK_Boleto_Asiento]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Boleto_Precio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Boleto]'))
ALTER TABLE [dbo].[Boleto]  WITH CHECK ADD  CONSTRAINT [FK_Boleto_Precio] FOREIGN KEY([iIdPrecio])
REFERENCES [dbo].[Precio] ([iIdPrecio])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Boleto_Precio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Boleto]'))
ALTER TABLE [dbo].[Boleto] CHECK CONSTRAINT [FK_Boleto_Precio]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Boleto_Viaje]') AND parent_object_id = OBJECT_ID(N'[dbo].[Boleto]'))
ALTER TABLE [dbo].[Boleto]  WITH CHECK ADD  CONSTRAINT [FK_Boleto_Viaje] FOREIGN KEY([iIdViaje])
REFERENCES [dbo].[Viaje] ([iIdViaje])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Boleto_Viaje]') AND parent_object_id = OBJECT_ID(N'[dbo].[Boleto]'))
ALTER TABLE [dbo].[Boleto] CHECK CONSTRAINT [FK_Boleto_Viaje]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ChoferAutobus_Autobus]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChoferAutobus]'))
ALTER TABLE [dbo].[ChoferAutobus]  WITH CHECK ADD  CONSTRAINT [FK_ChoferAutobus_Autobus] FOREIGN KEY([iIdAutobus])
REFERENCES [dbo].[Autobus] ([iIdAutobus])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ChoferAutobus_Autobus]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChoferAutobus]'))
ALTER TABLE [dbo].[ChoferAutobus] CHECK CONSTRAINT [FK_ChoferAutobus_Autobus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ChoferAutobus_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChoferAutobus]'))
ALTER TABLE [dbo].[ChoferAutobus]  WITH CHECK ADD  CONSTRAINT [FK_ChoferAutobus_Empleado] FOREIGN KEY([iIdEmpleado])
REFERENCES [dbo].[Empleado] ([iIdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ChoferAutobus_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChoferAutobus]'))
ALTER TABLE [dbo].[ChoferAutobus] CHECK CONSTRAINT [FK_ChoferAutobus_Empleado]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Empleado_Puesto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Puesto] FOREIGN KEY([Puesto])
REFERENCES [dbo].[Puesto] ([iIdPuesto])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Empleado_Puesto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Puesto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pasajero_TipoPasajero]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pasajero]'))
ALTER TABLE [dbo].[Pasajero]  WITH CHECK ADD  CONSTRAINT [FK_Pasajero_TipoPasajero] FOREIGN KEY([iTipoP])
REFERENCES [dbo].[TipoPasajero] ([iIdTipoPasajero])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pasajero_TipoPasajero]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pasajero]'))
ALTER TABLE [dbo].[Pasajero] CHECK CONSTRAINT [FK_Pasajero_TipoPasajero]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pasajero_Venta]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pasajero]'))
ALTER TABLE [dbo].[Pasajero]  WITH CHECK ADD  CONSTRAINT [FK_Pasajero_Venta] FOREIGN KEY([iIdVenta])
REFERENCES [dbo].[Venta] ([iIdVenta])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pasajero_Venta]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pasajero]'))
ALTER TABLE [dbo].[Pasajero] CHECK CONSTRAINT [FK_Pasajero_Venta]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PasajeroBoleto_Boleto]') AND parent_object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]'))
ALTER TABLE [dbo].[PasajeroBoleto]  WITH CHECK ADD  CONSTRAINT [FK_PasajeroBoleto_Boleto] FOREIGN KEY([iIdBoleto])
REFERENCES [dbo].[Boleto] ([iIdBoleto])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PasajeroBoleto_Boleto]') AND parent_object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]'))
ALTER TABLE [dbo].[PasajeroBoleto] CHECK CONSTRAINT [FK_PasajeroBoleto_Boleto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PasajeroBoleto_Pasajero]') AND parent_object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]'))
ALTER TABLE [dbo].[PasajeroBoleto]  WITH CHECK ADD  CONSTRAINT [FK_PasajeroBoleto_Pasajero] FOREIGN KEY([iIdPasajero])
REFERENCES [dbo].[Pasajero] ([iIdPasajero])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PasajeroBoleto_Pasajero]') AND parent_object_id = OBJECT_ID(N'[dbo].[PasajeroBoleto]'))
ALTER TABLE [dbo].[PasajeroBoleto] CHECK CONSTRAINT [FK_PasajeroBoleto_Pasajero]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ruta_Ciudad]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ruta]'))
ALTER TABLE [dbo].[Ruta]  WITH CHECK ADD  CONSTRAINT [FK_Ruta_Ciudad] FOREIGN KEY([iIdOrigen])
REFERENCES [dbo].[Ciudad] ([iIdCiudad])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ruta_Ciudad]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ruta]'))
ALTER TABLE [dbo].[Ruta] CHECK CONSTRAINT [FK_Ruta_Ciudad]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ruta_Ciudad1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ruta]'))
ALTER TABLE [dbo].[Ruta]  WITH CHECK ADD  CONSTRAINT [FK_Ruta_Ciudad1] FOREIGN KEY([iIdDestino])
REFERENCES [dbo].[Ciudad] ([iIdCiudad])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Ruta_Ciudad1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Ruta]'))
ALTER TABLE [dbo].[Ruta] CHECK CONSTRAINT [FK_Ruta_Ciudad1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuarios_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuarios]'))
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Empleado] FOREIGN KEY([iIdEmpleado])
REFERENCES [dbo].[Empleado] ([iIdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Usuarios_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuarios]'))
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Empleado]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Empleado] FOREIGN KEY([iIdEmpleado])
REFERENCES [dbo].[Empleado] ([iIdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Empleado]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Precio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Precio] FOREIGN KEY([iIdPrecio])
REFERENCES [dbo].[Precio] ([iIdPrecio])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_Precio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Precio]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_TPago]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_TPago] FOREIGN KEY([iIdTPago])
REFERENCES [dbo].[TPago] ([iIdTPago])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Venta_TPago]') AND parent_object_id = OBJECT_ID(N'[dbo].[Venta]'))
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_TPago]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Viaje_ChoferAutobus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Viaje]'))
ALTER TABLE [dbo].[Viaje]  WITH CHECK ADD  CONSTRAINT [FK_Viaje_ChoferAutobus] FOREIGN KEY([iIdChoferAutobus])
REFERENCES [dbo].[ChoferAutobus] ([iIdChoferAutobus])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Viaje_ChoferAutobus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Viaje]'))
ALTER TABLE [dbo].[Viaje] CHECK CONSTRAINT [FK_Viaje_ChoferAutobus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Viaje_EstadoViaje]') AND parent_object_id = OBJECT_ID(N'[dbo].[Viaje]'))
ALTER TABLE [dbo].[Viaje]  WITH CHECK ADD  CONSTRAINT [FK_Viaje_EstadoViaje] FOREIGN KEY([tEstadoViaje])
REFERENCES [dbo].[EstadoViaje] ([tIdEstadoViaje])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Viaje_EstadoViaje]') AND parent_object_id = OBJECT_ID(N'[dbo].[Viaje]'))
ALTER TABLE [dbo].[Viaje] CHECK CONSTRAINT [FK_Viaje_EstadoViaje]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Viaje_Ruta]') AND parent_object_id = OBJECT_ID(N'[dbo].[Viaje]'))
ALTER TABLE [dbo].[Viaje]  WITH CHECK ADD  CONSTRAINT [FK_Viaje_Ruta] FOREIGN KEY([iIdRuta])
REFERENCES [dbo].[Ruta] ([iIdRuta])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Viaje_Ruta]') AND parent_object_id = OBJECT_ID(N'[dbo].[Viaje]'))
ALTER TABLE [dbo].[Viaje] CHECK CONSTRAINT [FK_Viaje_Ruta]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [CK_Empleado] CHECK  (([tEdadEmpleado]>=(18)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [CK_Empleado]
GO
/****** Object:  Trigger [dbo].[Trigger_Insertar]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Trigger_Insertar]'))
EXEC dbo.sp_executesql @statement = N'create trigger [dbo].[Trigger_Insertar]
on [dbo].[Ciudad]
after insert
as
begin
	Select * from inserted
	Select * from deleted
end' 
GO
/****** Object:  Trigger [dbo].[tr_updatePuesto]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tr_updatePuesto]'))
EXEC dbo.sp_executesql @statement = N'---------------------Trigger Update------------------
create trigger [dbo].[tr_updatePuesto]
on [dbo].[Empleado]
after update
as
begin
	select *
	from INSERTED
	select*
	from DELETED
	--update
END
update Empleado set Puesto = 2
from Empleado
where iIdEmpleado = 3' 
GO
/****** Object:  Trigger [dbo].[Trigger_Delete]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Trigger_Delete]'))
EXEC dbo.sp_executesql @statement = N'create trigger [dbo].[Trigger_Delete]
on [dbo].[Venta]
instead of  delete
as
begin
	Print (''NO ELIMINAR TABLA DE VENTA!!!'')
end' 
GO
/****** Object:  Trigger [dbo].[Trigger_Insert]    Script Date: 27/10/2018 04:28:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Trigger_Insert]'))
EXEC dbo.sp_executesql @statement = N'create trigger [dbo].[Trigger_Insert]
on [dbo].[Venta]
after insert
as
begin
	Select count(mTotal) as VentasTotal from Venta
end' 
GO
