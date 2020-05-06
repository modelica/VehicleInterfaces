within VehicleInterfaces.Controllers;
class Tutorial "Controllers Tutorial"
  extends Modelica.Icons.Information;

  annotation (DocumentationClass=true,Documentation(info="<html>
<h4>Tutorial - Defining a new controller model</h4>
<p>
The following process will demonstrate how to create a&nbsp;new controller
model using these interface definitions. This tutorial will guide you
through building a&nbsp;simple idle speed controller for an engine.
</p>
<ol>
  <li>Create a&nbsp;new model that extends
      <strong>VehicleInterfaces.Controllers.Interfaces.Base</strong>,
      it should look like this:
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/Controllers/buildNewController1.png\">
      <br><br></li>
  <li>You can now define your controller model as required</li>
</ol>

<h4>Creating a simple idle speed controller example</h4>
<p>
The following steps demonstrate how to create a&nbsp;simple idle speed
controller model. The controller model will sense the engine speed, coolant
temperature and accelerator pedal position and adjust the throttle signal to
the engine to attempt to maintain the correct idle speed.
</p>
<p>
Starting from step&nbsp;2 above.
</p>
<ol>
  <li>Add the following blocks and connections to the diagram.
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/Controllers/buildNewController2.png\">
      <br><br></li>
  <li>The controller model is built on the assumption that a&nbsp;corresponding
      engine model will be developed that outputs the required signals to the
      control signal bus. We need to add connections to the control signal bus
      and will assume the following names for the additional signals required that
      are not part of the minimal set defined as part of the VehicleInterfaces:
      <ul>
        <li>engineBus.coolantTemperature</li>
        <li>engineBus.acceleratorPedalPosition</li>
        <li>engineControlBus.throttlePosition</li>
      </ul>
      </li>
  <li>To add these control signals we first need to add the
      <strong>engineBus</strong> and <strong>engineControlBus</strong> connectors
      and connect them to the <strong>controlBus</strong>. These connectors
      are <strong>VehicleInterfaces.Interfaces.EngineBus</strong> and
      <strong>VehicleInterfaces.Interfaces.EngineControlBus</strong>.
      When connecting these to the controlBus the following dialog will be
      produced and should be completed as following substituting
      <strong>engineControlBus</strong> for <strong>engineBus</strong>
      as appropriate.
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/Controllers/buildNewController4.png\">
      <br><br></li>
  <li>We can then complete the model by connecting the blocks to the control
      bus connectors and using the appropriate signal names.
      The finished model should look like:
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/Controllers/buildNewController3.png\">
      <br><br></li>
  <li>The model is now complete and should check successfully and can be used
      in any model compatible with the VehicleInterfaces library assuming the
      selected engine model puts the required signals on to the control
      signal bus</li>
</ol>
</html>"));
end Tutorial;
