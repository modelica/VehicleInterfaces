within VehicleInterfaces;
package Atmospheres "Collection of atmosphere subsystem definitions"
  extends VehicleInterfaces.Icons.VariantLibrary;

  class Tutorial "Atmosphere Tutorial"
    extends Modelica.Icons.Information;

    annotation (DocumentationClass=true,Documentation(info="<html>
<p><b>Tutorial - Defining a new atmosphere model</b></p>
<p>This tutorial will guide you through the definition of the <b>ConstantAtmosphere</b> model.</p>
<ol>
<li>Start creating a new model by extending the base atmosphere definition which can be found at <b>VehicleInterfaces.Atmospheres.Interfaces.Base</b></li>
<li>This base atmosphere definition includes 4 partial function definitions that we need to provide complete functions for in our new atmosphere model.  The following functions need to be defined:
<ul>
<li>windVelocity</li>
<li>density</li>
<li>temperature</li>
<li>humidity</li>
</ul></li>
<li>Determine the model assumptions to be used.  We will create a model with constant atmospheric conditions, i.e. fixed pressure, temperature, humidity and a constant wind.  Create the following functions within the model created in step 1.</li>
<li>Define the windVelocity function.  This function is used to define the wind velocity based on the position relative to the world axis:
<pre>

  function constantWindVelocity
    extends VehicleInterfaces.Atmospheres.Interfaces.Base.windVelocity;
    input Modelica.SIunits.Velocity[3] windVelocity;
  algorithm
    v := windVelocity;
  end constantWindVelocity;

</pre></li>
<li>Define the density function.  This function is used to define the density based on the position relative to the world axis:
<pre>

  function constantDensity \"Determine density\"
    extends VehicleInterfaces.Atmospheres.Interfaces.Base.density;
    input Modelica.SIunits.Density density \"Density\";
  algorithm
    rho := density;
  end constantDensity;

</pre></li>
<li>Define the temperature function.  This function is used to define the temperature based on the position relative to the world axis:
<pre>

  function constantTemperature \"Determine temperature\"
    extends VehicleInterfaces.Atmospheres.Interfaces.Base.temperature;
    input Modelica.SIunits.Temperature T0 \"Constant temperature\";
  algorithm
    T := T0;
  end constantTemperature;

</pre></li>
<li>Define the humidity function.  This function is used to define the humidity based on the position relative to the world axis:
<pre>

  function constantHumidity \"Determine humidity\"
    extends VehicleInterfaces.Atmospheres.Interfaces.Base.humidity;
    input Real h0 \"Constant humidity\";
  algorithm
    h := h0;
  end constantTemperature;

</pre></li>
<li>We now need to redeclare the functions in the base atmosphere definition to be the functions shown above.  We do this with the following code assuming that the above functions have been defined within the class <b>ConstantAtmosphere</b>:
<pre>

  model ConstantAtmosphere \"Atmosphere with constant conditions\"
    extends VehicleInterfaces.Atmospheres.Interfaces.Base(
      redeclare final function windVelocity = constantWindVelocity (windVelocity=v),
      redeclare final function density = constantDensity (density=rho),
      redeclare final function temperature = constantTemperature (T0=T),
      redeclare final function humidity = constantHumidity(h0=h));

    //Rest of model definition
    ...
  end ConstantAtmosphere;

</pre></li>
<li>Adding these redeclares also means we need to add 4 parameters to the model <b>v</b>, <b>rho</b>, <b>h</b> and <b>T</b> which are the constant wind velocity, density, humidity and temperature respectively.</li>
<li>This model is now complete and can be used.  The ConstantAtmosphere definition included in VehicleInterfaces actually has pressure, temperature and wind velocity as it's parameters and automatically calculates the air density.</li>
</ol>
</html>"));
  end Tutorial;

  package Interfaces "Collection of interface definitions for atmosphere"
    extends Modelica.Icons.Package;

    partial function windVelocityBase "Determine wind velocity"
      extends Modelica.Icons.Function;
      input Modelica.SIunits.Position[3] r=zeros(3)
        "Position vector from world frame to point, resolved in world frame";
      output Modelica.SIunits.Velocity[3] v=zeros(3)
        "Wind velocity vector, resolved in world frame";
      annotation (Documentation(info="<html>
<p>
Partial base model for wind velocity. Extend this model appropriately to define final user model.
</p>
</html>"));
    end windVelocityBase;

    partial function densityBase "Determine density"
      extends Modelica.Icons.Function;
      input Modelica.SIunits.Position[3] r=zeros(3)
        "Position vector from world frame to point, resolved in world frame";
      output Modelica.SIunits.Density rho=1.18 "Density";
      annotation (Documentation(info="<html>
<p>
Partial base model for air density. Extend this model appropriately to define final user model.
</p>
</html>"));
    end densityBase;

    partial function temperatureBase "Determine temperature"
      extends Modelica.Icons.Function;
      input Modelica.SIunits.Position[3] r=zeros(3)
        "Position vector from world frame to point, resolved in world frame";
      output Modelica.SIunits.Temperature T=298 "Temperature";
      annotation (Documentation(info="<html>
<p>
Partial base model for air temperature. Extend this model appropriately to define final user model.
</p>
</html>"));
    end temperatureBase;

    partial function humidityBase "Determine humidity"
      extends Modelica.Icons.Function;
      input Modelica.SIunits.Position[3] r=zeros(3)
        "Position vector from world frame to point, resolved in world frame";
      output Real h=0.5 "Humidity";
      annotation (Documentation(info="<html>
<p>
Partial base model for air humidity. Extend this model appropriately to define final user model.
</p>
</html>"));
    end humidityBase;

    partial model Base "Base model for all atmospheres"

      replaceable function windVelocity=windVelocityBase
        "Dummy model for wind velocity" annotation (Documentation(info="<html>
<p>
Dummy model to demonstrate how the wind velocity model should be defined and included in atmosphere model.
</p>
</html>"));

      replaceable function density=densityBase "Dummy model for air density"
        annotation (Documentation(info="<html>
<p>
Dummy model to demonstrate how the air density model should be defined and included in atmosphere model.
</p>
</html>"));

      replaceable function temperature=temperatureBase
        "Dummy model for air temperature" annotation (Documentation(info="<html>
<p>
Dummy model to demonstrate how the air temperature model should be defined and included in atmosphere model.
</p>
</html>"));

      replaceable function humidity=humidityBase "Dummy model for air humidity"
        annotation (Documentation(info="<html>
<p>
Dummy model to demonstrate how the air humidity model should be defined and included in atmosphere model.
</p>
</html>"));

      annotation (
        missingInnerMessage=
            "\"atmosphere\" is not defined, drag any atmosphere model (e.g., VehicleInterfaces.Atmospheres.ConstantAtmosphere) to the top level of your model.",
        defaultComponentName="atmosphere",
        defaultComponentPrefixes="inner",
        Documentation(info="<html>
<p>This partial model defines the interfaces required for an atmosphere subsystem.  See the <a href=\"Modelica://VehicleInterfaces.Atmospheres\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.Atmospheres.Tutorial\">tutorial</a> for more information.</p>
</html>"));

    end Base;
    annotation (Documentation(info="<html>
<p>
A collection of base classes which define interfaces for atmosphere models.
</p>
</html>"));
  end Interfaces;

  model ConstantAtmosphere "Atmospheres with constant conditions"
    extends VehicleInterfaces.Icons.Atmosphere;
    extends VehicleInterfaces.Atmospheres.Interfaces.Base(
      redeclare final function windVelocity = constantWindVelocity (
        windVelocity=v),
      redeclare final function density = constantDensity (
        density=rho),
      redeclare final function temperature = constantTemperature (
        T0=T),
      redeclare final function humidity = constantHumidity(h0=h));

    parameter Modelica.SIunits.Velocity[3] v=zeros(3) "Wind velocity";
    parameter Modelica.SIunits.AbsolutePressure ambientPressure=101300
      "Air pressure";
    parameter Modelica.SIunits.Temperature T=293.15 "Air temperature";
    parameter Real h=0.5 "Air humidity (0-1)";
    constant Real R=287.0512249529787 "Gas constant for air";

  protected
    parameter Modelica.SIunits.Density rho=ambientPressure/(R*T);

    function constantWindVelocity
      extends VehicleInterfaces.Atmospheres.Interfaces.windVelocityBase;
      input Modelica.SIunits.Velocity[3] windVelocity={0,0,0};
    algorithm
      v := windVelocity;
    end constantWindVelocity;

    function constantDensity "Determine density"
      extends VehicleInterfaces.Atmospheres.Interfaces.densityBase;
      input Modelica.SIunits.Density density=1.18 "Density";
    algorithm
      rho := density;
    end constantDensity;

    function constantTemperature "Determine temperature"
      extends VehicleInterfaces.Atmospheres.Interfaces.temperatureBase;
      input Modelica.SIunits.Temperature T0=293 "Constant temperature";
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
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-100},{200,
              100}},
          grid={2,2})),
      Documentation(info="<html>
<p>
This is the simplest atmosphere model with constant characteristics.
</p>
</html>"));
  end ConstantAtmosphere;
  annotation (Documentation(info="<html>
<p>The atmosphere subsystem interfaces are defined in this sub-package of the VehicleInterfaces library.  The atmosphere subsystem has no connectors but contains standard functions that can be redeclared to implement different ambient conditions.  When an atmosphere subsystem is used in a model architecture it should be declared as an <b>inner</b> system so that it's functions can be accessed by other components in the model.</p>
<h4>Effects to be modelled in this subsystem</h4>
<p>Within the VehicleIntefaces package the atmosphere subsystem is used to define the ambient conditions.  These include air temperature, pressure, density, humidity and wind speed.</p>
</html>"));
end Atmospheres;
