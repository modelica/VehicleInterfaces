within VehicleInterfaces.DataDictionaries;
class Tutorial "Data Dictionary Tutorial"
  extends Modelica.Icons.Information;

  annotation (DocumentationClass=true,Documentation(info="<html>
<h4>Tutorial - Defining a new data dictionary subsystem</h4>
<p>
The following process will demonstrate how to create a&nbsp;new data dictionary
model using these interface definitions.
</p>
<ol>
  <li>Create a&nbsp;new model that extends
      <strong>VehicleInterfaces.DataDictionaries.Interfaces.Base</strong>,
      it should look like this:
      <br>&nbsp;<br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/DataDictionaries/buildNewDataDictionary1.png\">
      <br>&nbsp;</li>
  <li>You can now define your data dictionary model as required</li>
</ol>

<h4>Adding an alias signal to the data dictionary</h4>
<p>
The following steps demonstrate how to add a&nbsp;new alias signal to the
control signal bus. An alias signal for the vehicle longitudinal velocity
in the chassisBus will be added called v_veh.
</p>
<ol>
  <li>Add a&nbsp;block <strong>Modelica.Blocks.Routing.RealPassThrough</strong>
      and give it the name of the alias signal that you would like to create,
      in this case <strong>v_veh</strong>.
      Note, this block passes Real signal through without modification.</li>
  <li>Then add the bus connector for the appropriate sub-bus, in this case
      the chassisBus connector which can be found at
      <strong>VehicleInterfaces.Interfaces.ChassisBus</strong>.</li>
  <li>Then add two connections between the RealSignal connector and the
      chassisBus connector. The first connects to the
      <strong>longitudinalVelocity</strong> signal within the chassisBus,
      the second creates a&nbsp;new signal called <strong>v_veh</strong>.
      <br>&nbsp;<br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/DataDictionaries/buildNewDataDictionary2.png\">
      <br>&nbsp;</li>
</ol>
</html>"));
end Tutorial;
