within VehicleInterfaces.ElectricDrives;
class Tutorial "Electric Drives Tutorial"
  extends Modelica.Icons.Information;

  annotation (DocumentationClass=true, Documentation(info="<html>
<h4>Tutorial - Defining a new electric motor model</h4>
<p>
The following process will demonstrate how to create a&nbsp;new electric
motor model using these interface definitions. This tutorial will guide
you through building a&nbsp;simple DC electric motor.
</p>
<ol>
  <li>Create a&nbsp;new model that extends
      <strong>VehicleInterfaces.ElectricDrives.Interfaces.BaseDCMachine</strong>,
      it should look like this:
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/ElectricDrives/buildNewElectricDrive1.png\">
      <br><br></li>
  <li>In the component browser, right click on <strong>BaseDCMachine</strong>
      and select <strong>Parameters</strong> from the context menu to produce
      the following parameter dialog
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/ElectricDrives/buildNewElectricDrive2.png\">
      <br><br></li>
  <li>This dialog allows you to enable/disable the optional connections by
      setting <strong>includeBearing</strong> as required for your new motor
      model. The shaft_b connector is of the type
      <a href=\"modelica://Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing\">Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing</a>,
      the parameter <strong>includeBearing</strong> controls whether
      the bearing connector within the shaft_b connector is enabled or not.</li>
  <li>You can now define your driveline model as required</li>
</ol>

<h4>Creating a simple electric motor example</h4>
<p>
The following steps demonstrate how to create a&nbsp;simple rear-wheel
drive driveline model. The driveline model will transmit the torque from
the transmission to the rear wheels via a&nbsp;propshaft, differential with
final drive and then two halfshafts. No torque reaction in to the
transmission housings will be modelled.
</p>
<p>
Starting from step&nbsp;3 above.
</p>
<ol>
  <li>First, decide if the bearing connector is required in the model
      and set the internal parameter appropriately.</li>
  <li>Add the following blocks and connections to the diagram.
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/ElectricDrives/buildNewElectricDrive3.png\">
      <br><br></li>
</ol>
</html>"));
end Tutorial;
