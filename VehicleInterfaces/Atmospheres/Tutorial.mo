within VehicleInterfaces.Atmospheres;
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
