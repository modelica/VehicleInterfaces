within VehicleInterfaces.Drivers;
class Tutorial "Drivers Tutorial"
  extends Modelica.Icons.Information;

  annotation (DocumentationClass=true, Documentation(info="<html>
<h4>Tutorial - Defining a new driver model</h4>
<p>
The following process will demonstrate how to create a&nbsp;new driver model
using these interface definitions. This tutorial will guide you through
building a&nbsp;driver for a&nbsp;conventional automatic transmission
passenger car.
</p>
<ol>
  <li>Create a&nbsp;new model that extends
      <strong>VehicleInterfaces.Drivers.Interfaces.Base</strong>,
      it should look like this:
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/Drivers/buildNewDriver1.png\">
      <br><br></li>
  <li>Unlike the other interface definitions in the VehicleInterfaces package
      the Driver model doesn&apos;t include optional connections. It simply uses
      an expandable connector to exchange information with the
      DriverEnvironment subsystem. The required signals are defined in the
      <a href=\"modelica://VehicleInterfaces.UsersGuide.DriverInteractionBus\">Driver interaction bus</a>
      section of the Users Guide. Normalised mechanical sensors and actuators
      are provided in the
      <a href=\"modelica://VehicleInterfaces.Mechanics\">VehicleInterfaces.Mechanics</a>
      package.</li>
</ol>
</html>"));
end Tutorial;
