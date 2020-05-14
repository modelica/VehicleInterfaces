within VehicleInterfaces.Atmospheres;
class Tutorial "Atmosphere Tutorial"
  extends Modelica.Icons.Information;

  annotation (DocumentationClass=true,Documentation(info="<html>
<h4>Tutorial - Defining a new atmosphere model</h4>
<p>
This tutorial will guide you through the definition of the
<strong>ConstantAtmosphere</strong> model.
</p>

<ol>
  <li>Start creating a new model by extending the base atmosphere definition
      which can be found at
      <strong>VehicleInterfaces.Atmospheres.Interfaces.Base</strong>.</li>

  <li>This base atmosphere definition includes 4&nbsp;partial function definitions
      that we need to provide complete functions for in our new atmosphere model.
      The following functions need to be defined:
      <ul>
        <li>windVelocity</li>
        <li>density</li>
        <li>temperature</li>
        <li>humidity</li>
      </ul>
      </li>

  <li>Determine the model assumptions to be used. We will create a model with
      constant atmospheric conditions, i.e. fixed pressure, temperature, 
      humidity and a constant wind. Create the following functions within
      the model created in step&nbsp;1.</li>

  <li>Define the windVelocity function. This function is used to define
      the wind velocity based on the position relative to the world axis:

      <blockquote><pre>
<strong>function</strong> constantWindVelocity
  <strong>extends</strong> VehicleInterfaces.Atmospheres.Interfaces.Base.windVelocity;
  <strong>input</strong> Modelica.SIunits.Velocity[3] windVelocity;
<strong>algorithm</strong>
  v := windVelocity;
<strong>end</strong> constantWindVelocity;
      </pre></blockquote>
      </li>

  <li>Define the density function. This function is used to define the density 
      based on the position relative to the world axis:

      <blockquote><pre>
<strong>function</strong> constantDensity \"Determine density\"
  <strong>extends</strong> VehicleInterfaces.Atmospheres.Interfaces.Base.density;
  <strong>input</strong> Modelica.SIunits.Density density \"Density\";
<strong>algorithm</strong>
  rho := density;
<strong>end</strong> constantDensity;
      </pre></blockquote>
      </li>

  <li>Define the temperature function. This function is used to define the
      temperature based on the position relative to the world axis:

      <blockquote><pre>
<strong>function</strong> constantTemperature \"Determine temperature\"
  <strong>extends</strong> VehicleInterfaces.Atmospheres.Interfaces.Base.temperature;
  <strong>input</strong> Modelica.SIunits.Temperature T0 \"Constant temperature\";
<strong>algorithm</strong>
  T := T0;
<strong>end</strong> constantTemperature;
      </pre></blockquote>
      </li>

  <li>Define the humidity function. This function is used to define the humidity
      based on the position relative to the world axis:

      <blockquote><pre>
<strong>function</strong> constantHumidity \"Determine humidity\"
  <strong>extends</strong> VehicleInterfaces.Atmospheres.Interfaces.Base.humidity;
  <strong>input</strong> Real h0 \"Constant humidity\";
<strong>algorithm</strong>
  h := h0;
<strong>end</strong> constantTemperature;
      </pre></blockquote>
      </li>

  <li>We now need to redeclare the functions in the base atmosphere definition
      to be the functions shown above. We do this with the following code
      assuming that the above functions have been defined within the class
      <strong>ConstantAtmosphere</strong>:

      <blockquote><pre>
<strong>model</strong> ConstantAtmosphere \"Atmosphere with constant conditions\"
  <strong>extends</strong> VehicleInterfaces.Atmospheres.Interfaces.Base(
    <strong>redeclare final function</strong> windVelocity = constantWindVelocity (windVelocity=v),
    <strong>redeclare final function</strong> density = constantDensity (density=rho),
    <strong>redeclare final function</strong> temperature = constantTemperature (T0=T),
    <strong>redeclare final function</strong> humidity = constantHumidity(h0=h));

  //Rest of model definition
  ...
<strong>end</strong> ConstantAtmosphere;
      </pre></blockquote>
      </li>

  <li>Adding these redeclares also means we need to add 4&nbsp;parameters to
      the model <strong>v</strong>, <strong>rho</strong>, <strong>h</strong>
      and <strong>T</strong> which are the constant wind velocity, density, 
      humidity and temperature respectively.</li>

  <li>This model is now complete and can be used. The ConstantAtmosphere
      definition included in VehicleInterfaces actually has pressure,
      temperature and wind velocity as it&apos;s parameters and automatically 
      calculates the air density.</li>
</ol>
</html>"));
end Tutorial;
