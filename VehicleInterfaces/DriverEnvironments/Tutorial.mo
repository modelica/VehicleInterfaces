within VehicleInterfaces.DriverEnvironments;
class Tutorial "Driver Environment Tutorial"
  extends Modelica.Icons.Information;

  annotation (
    DocumentationClass=true,
    Documentation(info="<html>
<p><b>Tutorial - Defining a new driver environment model</b></p>
<p>The following process will demonstrate how to create a new driver environment model using these interface definitions.  This tutorial will guide you through building a driver environment for a conventional passenger car with a manual transmission.</p>
<ol>
<li>Create a new model that extends <b>VehicleInterfaces.DriverEnvironments.Interfaces.BaseManualTransmission</b>, it should look like this:
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/DriverEnvironments/buildNewDriverEnvironment1.png\"><br><br></li>
<li>In the component browser, right click on <b>Base</b> and select <b>Parameters</b> from the context menu to produce the following parameter dialog
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/DriverEnvironments/buildNewDriverEnvironment2.png\"><br><br></li>
<li>This dialog allows you to enable/disable the optional connections by setting the various parameters as required for your new driver environment model.</li>
<li>You can now define your driver environment model as required</li>
</ol>
</html>"));
end Tutorial;
