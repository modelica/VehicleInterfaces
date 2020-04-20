within VehicleInterfaces.Transmissions;
class Tutorial "Transmissions Tutorial"
  extends Modelica.Icons.Information;

  annotation (DocumentationClass=true, Documentation(info="<html>
<p><b>Tutorial - Defining a new manual transmission model</b></p>
<p>The following process will demonstrate how to create a new manual transmission model using this interface definition.</p>
<ol>
<li>Create a new model that extends <b>VehicleInterfaces.Transmissions.Interfaces.BaseManualTransmission</b>, it should look like this:
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/Transmissions/buildNewTransmission1.png\"><br><br></li>
<li>In the component browser, right click on <b>Base</b> and select <b>Parameters</b> from the context menu to produce the following parameter dialog
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/Transmissions/buildNewTransmission2.png\"><br><br></li>
<li>This dialog allows you to enable/disable the optional connections by setting <b>includeClutchPedal</b>, <b>includeManualShiftConnector</b> and <b>includeMount</b> as required for your new transmission model.  The <b>engineFlange</b> and <b>drivelineFlange</b> connectors are of the type <a href=\"modelica://Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing\">Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing</a>, the parameters <b>includeEngineBearing</b> and <b>includeDrivelineBearing</b> controls whether the bearing connectors within these connections are enabled or not.</li>
<li>You can now define your transmission model as required</li>
</ol>
<h4>Creating the MinimalTransmission example</h4>
<p>The following steps demonstrate how to create a basic transmission model.  The transmission model will consist of a fixed single ratio between the input and output shafts.  No torque reaction in to the transmission housing will be modelled.</p>
<p>Starting from step 3 above.</p>
<ol>
<li>First, decide which of the optional connectors are required to model.  For this example we don't need any of the optional connections</li>
<li>Add the following blocks and connections to the diagram
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/Transmissions/buildNewTransmission3.png\"><br><br></li>
<li>Next, we need to add the required connections to the control signal bus for the transmission, see <a href=\"Modelica://VehicleInterfaces.UsersGuide.SignalBus\">here</a> for a complete list of the minimum connections required.  As we are creating a manual transmission model we need to add three signals to the transmissionBus which is part of the controlBus.  We need to put the transmission output speed, current gear and the clutch state on to the transmissionBus.  As this is a simple single gear transmission the current gear and clutch state can be set as constants.  Start by adding the transmissionBus connector which can be found at <b>VehicleInterfaces.Interfaces.TransmissionBus</b> and connect this to the controlBus.  When this connection is made the following dialog will be produced and should be completed as shown.
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/Transmissions/buildNewTransmission4.png\"><br><br></li>
<li>We can now connect the constants for clutch state and current gear to the transmissionBus.  The transmission output speed needs to be in the correct units, in this case r/min (or rpm).  Add a rotational speed sensor and a unit conversion block from <b>Modelica.Blocks.Math.UnitConversions</b>, set the conversion block to convert to rpm.  When you create the connection between the transmissionBus and one of these blocks a dialog like the one below will be produced.  You will need to complete the dialog using one of the following names:
<ul>
<li>gear</li>
<li>clutchLocked</li>
<li>outputSpeed</li>
</ul>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/Transmissions/buildNewTransmission5.png\"><br><br></li>
<li>The model is now complete and should check successfully and can be used in any model compatible with the VehicleInterfaces library
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/Transmissions/buildNewTransmission6.png\"><br><br></li>
</ol>
</html>"));
end Tutorial;
