within VehicleInterfaces.Controllers;
class Tutorial "Controllers Tutorial"
  extends Modelica.Icons.Information;

  annotation (DocumentationClass=true,Documentation(info="<html>
<p><b>Tutorial - Defining a new controller model</b></p>
<p>The following process will demonstrate how to create a new controller model using these interface definitions.  This tutorial will guide you through building a simple idle speed controller for an engine.</p>
<ol>
<li>Create a new model that extends <b>VehicleInterfaces.Controllers.Interfaces.Base</b>, it should look like this:
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/Controllers/buildNewController1.png\"><br><br></li>
<li>You can now define your controller model as required</li>
</ol>
<h4>Creating a simple idle speed controller example</h4>
<p>The following steps demonstrate how to create a simple idle speed controller model.  The controller model will sense the engine speed, coolant temperature and accelerator pedal position and adjust the throttle signal to the engine to attempt to maintain the correct idle speed.</p>
<p>Starting from step 2 above.</p>
<ol>
<li>Add the following blocks and connections to the diagram.
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/Controllers/buildNewController2.png\"><br><br></li>
<li>The controller model is built on the assumption that a corresponding engine model will be developed that outputs the required signals to the control signal bus.  We need to add connections to the control signal bus and will assume the following names for the additional signals required that are not part of the minimal set defined as part of the VehicleInterfaces:
<ul>
<li>engineBus.coolantTemperature</li>
<li>engineBus.acceleratorPedalPosition</li>
<li>engineControlBus.throttlePosition</li>
</ul>
<li>To add these control signals we first need to add the <b>engineBus</b> and <b>engineControlBus</b> connectors and connect them to the <b>controlBus</b>.  These connectors are <b>VehicleInterfaces.Interfaces.EngineBus</b> and <b>VehicleInterfaces.Interfaces.EngineControlBus</b>.  When connecting these to the controlBus the following dialog will be produced and should be completed as following substituting <b>engineControlBus</b> for <b>engineBus</b> as appropriate.
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/Controllers/buildNewController4.png\"><br><br></li>
<li>We can then complete the model by connecting the blocks to the control bus connectors and using the appropriate signal names.  The finished model should look like:
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/Controllers/buildNewController3.png\"><br><br></li>
<li>The model is now complete and should check successfully and can be used in any model compatible with the VehicleInterfaces library assuming the selected engine model puts the required signals on to the control signal bus</li>
</ol>
</html>"));
end Tutorial;
