USE CentralAutobus

SELECT * FROM Chofer
SELECT * FROM Autobus
SELECT * FROM Boleto
SELECT * FROM Caja
select * from Cliente

SELECT * FROM Caja 
WHERE iId_Caja > (
	SELECT iId_Caja
	FROM Caja
	WHERE iId_Sucursal = 20
)

SELECT * 
FROM 
(SELECT iEdad_Cliente, (
				SELECT COUNT(iEdad_Cliente)
				from Cliente as C
				where C.iEdad_Cliente = Cliente.iEdad_Cliente
				)as 'Rango'
from Cliente) as E
where E.Rango > 0


With SumaEdades as (
select iEdad_Cliente, count (iEdad_Cliente) as [Rango]
		from Cliente
		group by iEdad_Cliente
		)
select * from
SumaEdades where SumaEdades.Rango > 0

SELECT * 
FROM 
(SELECT mPrecio_Venta, (
				SELECT COUNT(mPrecio_Venta)
				from Venta as V
				where V.mPrecio_Venta = Venta.mPrecio_Venta
				)as 'Precio'
from Venta) as Ve
where Ve.Precio > 0

CREATE VIEW Conductores as (
	SELECT c.vNombre_Chofer + ' ' + c.vApellidoP_Chofer + ' ' + c.vApellidoM_Chofer as[Chofer],
	Count(s.iId_Sucursal) as [Salida]
	FROM Chofer as c
	left join Sucursal s on c.iId_Chofer = s.iId_Sucursal
	WHERE s.vCiudad_Sucursal = c.vCiudad_Chofer
	group by s.vNombre_Sucursal
)
SELECT * FROM Conductores

CREATE VIEW Estados as (
	SELECT vLugarDestino_Viaje + ' ' + v.vLugarOrigen_Viaje + ' ' + v.dtSalida_Viaje as[Viaje],
	Count(c.bEstado_Sucursal) as [Salida]
	FROM Viaje as v
	left join Caja c on v.iId_Viaje = c.iId_Caja
	WHERE c.iId_Sucursal= v.iId_Autobus
	group by c.bEstado_Sucursal
)
SELECT * FROM Conductores

CREATE VIEW Conductores as (
	SELECT c.vNombre_Chofer + ' ' + c.vApellidoP_Chofer + ' ' + c.vApellidoM_Chofer as[Chofer],
	Count(s.iId_Sucursal) as [Salida]
	FROM Chofer as c
	left join Sucursal s on c.iId_Chofer = s.iId_Sucursal
	WHERE s.vCiudad_Sucursal = c.vCiudad_Chofer
	group by s.vNombre_Sucursal
)
SELECT * FROM Conductores

CREATE VIEW Conductores as (
	SELECT c.vNombre_Chofer + ' ' + c.vApellidoP_Chofer + ' ' + c.vApellidoM_Chofer as[Chofer],
	Count(s.iId_Sucursal) as [Salida]
	FROM Chofer as c
	left join Sucursal s on c.iId_Chofer = s.iId_Sucursal
	WHERE s.vCiudad_Sucursal = c.vCiudad_Chofer
	group by s.vNombre_Sucursal
)
SELECT * FROM Conductores

CREATE VIEW Conductores as (
	SELECT c.vNombre_Chofer + ' ' + c.vApellidoP_Chofer + ' ' + c.vApellidoM_Chofer as[Chofer],
	Count(s.iId_Sucursal) as [Salida]
	FROM Chofer as c
	left join Sucursal s on c.iId_Chofer = s.iId_Sucursal
	WHERE s.vCiudad_Sucursal = c.vCiudad_Chofer
	group by s.vNombre_Sucursal
)
SELECT * FROM Conductores

declare @query nvarchar (MAX)
set @query = ' select * from Chofer
exec (@query)


declare @query nvarchar (MAX)
declare @nomcolm nvarchar (MAX)= 'iId_Chofer from Chofer
set @query = ' select * from Chofer' + @nomcolm
exec (@query)
