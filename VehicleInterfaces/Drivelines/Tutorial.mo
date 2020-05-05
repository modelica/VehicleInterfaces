within VehicleInterfaces.Drivelines;
class Tutorial "Driveline Tutorial"
  extends Modelica.Icons.Information;

  annotation (DocumentationClass=true,Documentation(info="<html>
<p><strong>Tutorial - Defining a new driveline model</strong></p>
<p>The following process will demonstrate how to create a new driveline model using these interface definitions.  This tutorial will guide you through building a driveline for a passenger car, i.e. a vehicle with 4 wheels.</p>
<ol>
<li>Create a new model that extends <strong>VehicleInterfaces.Drivelines.Interfaces.TwoAxleBase</strong>, it should look like this:
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/Drivelines/buildNewDriveline1.png\"><br><br></li>
<li>In the component browser, right click on <strong>Base</strong> and select <strong>Parameters</strong> from the context menu to produce the following parameter dialog
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/Drivelines/buildNewDriveline2.png\"><br><br></li>
<li>This dialog allows you to enable/disable the optional connections by setting <strong>includeWheelBearings</strong> and <strong>includeMount</strong> as required for your new driveline model.  The wheelHub connectors are of the type <a href=\"modelica://Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing\">Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing</a>, the parameter <strong>includeWheelBearings</strong> controls whether the bearing connectors within the wheelHubs is enabled or not.</li>
<li>You can now define your driveline model as required</li>
</ol>
<h4>Creating a simple rear-wheel drive example</h4>
<p>The following steps demonstrate how to create a simple rear-wheel drive driveline model.  The driveline model will transmit the torque from the transmission to the rear wheels via a propshaft, differential with final drive and then two halfshafts.  No torque reaction in to the transmission housings will be modelled.</p>
<p>Starting from step 3 above.</p>
<ol>
<li>First, decide which of the optional connectors are required in the model.  For this example we don't need any of the optional connections
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/Drivelines/buildNewDriveline3.png\"><br><br></li>
<li>Add the following blocks and connections to the diagram.  When you draw the connections from the rightHalfShaft and leftHalfShaft components to the wheelHub  connectors the dialog box shown below will appear asking which connector within the wheelHub connector you would like to make the connection to.  As we are modelling the driveline as a 1D system you should select <strong>flange</strong> from the list of options which is the 1D connector within the wheelHub connector.
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/Drivelines/buildNewDriveline4.png\">
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/Drivelines/buildNewDriveline5.png\"><br><br></li>
<li>Next, we need to check to see if any connections to the control signal bus are required for the driveline, see <a href=\"Modelica://VehicleInterfaces.UsersGuide.SignalBus\">here</a> for a complete list of the minimum connections required.  In this case we don't need to add any signals to the control signal bus.</li>
<li>The model is now complete and should check successfully and can be used in any model compatible with the VehicleInterfaces library assuming the selected Driver model also uses the accelerator pedal connection</li>
</ol>
</html>"));
end Tutorial;
