within VehicleInterfaces.Drivers;
class Tutorial "Drivers Tutorial"
  extends Modelica.Icons.Information;

  annotation (DocumentationClass=true, Documentation(info="<html>
<p><strong>Tutorial - Defining a new driver model</strong></p>
<p>The following process will demonstrate how to create a new driver model using these interface definitions.  This tutorial will guide you through building a driver for a conventional automatic transmission passenger car.</p>
<ol>
<li>Create a new model that extends <strong>VehicleInterfaces.Drivers.Interfaces.Base</strong>, it should look like this:
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/Drivers/buildNewDriver1.png\"><br><br></li>
<li>Unlike the other interface definitions in the VehicleInterfaces package the Driver model doesn't include optional connections.  It simply uses an expandable connector to exchange information with the DriverEnvironment subsystem.  The required signals are defined in the <a href=\"Modelica://VehicleInterfaces.UsersGuide.DriverInteractionBus\">Driver interaction bus</a> section of the Users Guide.  Normalised mechanical sensors and actuators are provided in the <a href=\"Modelica://VehicleInterfaces.Mechanics\">VehicleInterfaces.Mechanics</a> package.</li>
</ol></html>"));
end Tutorial;
