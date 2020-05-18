within VehicleInterfaces.Atmospheres;
model ConstantAtmosphere "Atmospheres with constant conditions"
  extends VehicleInterfaces.Icons.Atmosphere;
  extends VehicleInterfaces.Atmospheres.Interfaces.Base(
    redeclare final function windVelocity = constantWindVelocity (windVelocity=v),
    redeclare final function density = constantDensity (density=rho),
    redeclare final function temperature = constantTemperature (T0=T),
    redeclare final function humidity = constantHumidity (h0=h));

  parameter SI.Velocity[3] v=zeros(3) "Wind velocity";
  parameter SI.AbsolutePressure ambientPressure=101300
    "Air pressure";
  parameter SI.Temperature T=293.15 "Air temperature";
  parameter Real h=0.5 "Air humidity (0-1)";
  constant Real R=287.0512249529787 "Gas constant for air";

protected
  parameter SI.Density rho=ambientPressure/(R*T);

  function constantWindVelocity
    extends VehicleInterfaces.Atmospheres.Interfaces.windVelocityBase;
    input SI.Velocity[3] windVelocity={0,0,0};
  algorithm
    v := windVelocity;
  end constantWindVelocity;

  function constantDensity "Determine density"
    extends VehicleInterfaces.Atmospheres.Interfaces.densityBase;
    input SI.Density density=1.18 "Density";
  algorithm
    rho := density;
  end constantDensity;

  function constantTemperature "Determine temperature"
    extends VehicleInterfaces.Atmospheres.Interfaces.temperatureBase;
    input SI.Temperature T0=293 "Constant temperature";
  algorithm
    T := T0;
  end constantTemperature;

  function constantHumidity "Determine humidity"
    extends VehicleInterfaces.Atmospheres.Interfaces.humidityBase;
    input Real h0=0.5 "Constant humidity";
  algorithm
    h := h0;
  end constantHumidity;

  annotation (
    defaultComponentName="atmosphere",
    defaultComponentPrefixes="inner",
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-100},{200,100}},
        grid={2,2})),
    Documentation(info="<html>
<p>
This is the simplest atmosphere model with constant characteristics.
</p>
</html>"));
end ConstantAtmosphere;
