within VehicleInterfaces.EnergyStorage;
class Tutorial "Energy Storage Device Tutorial"
  extends Modelica.Icons.Information;

  annotation (DocumentationClass=true, Documentation(info="<html>
<h4>Tutorial - Defining a new energy storage device model</h4>
<p>
The following process will demonstrate how to create a&nbsp;new energy
storage device model using these interface definitions. This tutorial
will guide you through building a&nbsp;simple battery.
</p>
<ol>
  <li>Create a&nbsp;new model that extends
      <strong>VehicleInterfaces.EnergyStorage.Interfaces.Base</strong>,
      it should look like this:
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/EnergyStorage/buildNewEnergyStorage1.png\">
      <br><br></li>
  <li>Unlike most of the other systems in the VehicleInterfaces package,
      the energy storage device interface definition does not contain any
      optional connectors.</li>
  <li>You can now define your energy storage device model as required</li>
</ol>

<h4>Creating a simple battery example</h4>
<p>
The following steps demonstrate how to create a&nbsp;simple battery model.
The battery model will have a&nbsp;constant voltage and an internal resistance.
</p>
<p>
Starting from step&nbsp;2 above.
</p>
<ol>
  <li>Add the following blocks and connections to the diagram.
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/EnergyStorage/buildNewEnergyStorage2.png\">
      <br><br></li>
</ol>
</html>"));
end Tutorial;
