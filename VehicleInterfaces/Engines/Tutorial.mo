within VehicleInterfaces.Engines;
class Tutorial "Engines Tutorial"
  extends Modelica.Icons.Information;

  annotation (DocumentationClass=true,Documentation(info="<html>
<h4>Tutorial - Defining a new engine model</h4>
<p>
The following process will demonstrate how to create a&nbsp;new engine
model using this interface definition.
</p>
<ol>
  <li>Create a&nbsp;new model that extends
      <strong>VehicleInterfaces.Engines.Interfaces.Base</strong>,
      it should look like this:
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/Engines/buildNewEngine1.png\">
      <br><br></li>
  <li>In the component browser, right click on <strong>Base</strong> and
      select <strong>Parameters</strong> from the context menu to produce
      the following parameter dialog
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/Engines/buildNewEngine2.png\">
      <br><br></li>
  <li>This dialog allows you to enable/disable the optional connections by
      setting <strong>includeAcceleratorPedal</strong> and
      <strong>includeMount</strong> as required for your new engine model.
      The <strong>accessoriesFlange</strong> and
      <strong>transmissionFlange</strong> are of the type
      <a href=\"modelica://Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing\">Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing</a>,
      the parameters <strong>includeTransmissionBearing</strong> and
      <strong>includeAccessoriesBearing</strong> controls whether the bearing
      connectors within these connections are enabled or not.</li>
  <li>You can now define your engine model as required</li>
</ol>

<h4>Creating the MinimalEngine example</h4>
<p>
The following steps demonstrate how to create a&nbsp;simple engine model.
The engine model will apply torque at the flywheel inertia based on
a&nbsp;simple gain from the driver&apos;s accelerator pedal. No torque reaction
in to the engine block will be modelled.
</p>
<p>
Starting from step&nbsp;3 above.
</p>
<ol>
  <li>First, decide which of the optional connectors are required to model.
      For this example we need the accelerator pedal connection but not
      the engine mount connection
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/Engines/buildNewEngine3.png\">
      <br><br></li>
  <li>Add the following blocks and connections to the diagram
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/Engines/buildNewEngine4.png\">
      <br><br></li>
  <li>Next, we need to check to see if any connections to the control signal
      bus are required for the engine, see
      <a href=\"modelica://VehicleInterfaces.UsersGuide.SignalBus\">here</a> for
      a&nbsp;complete list of the minimum connections required. In this case
      we need to add the engine speed to the control signal bus and this can
      be done by connecting a&nbsp;speed sensor to the flywheel and then
      connecting this to the signal bus. As the engine speed signal is added
      to the engineBus we first need to add this connector. The engineBus
      connector is <strong>VehicleInterfaces.Interfaces.EngineBus</strong>.
      This should be connected to the <strong>controlBus</strong>, when this
      connection is made the following dialog is produced and should be
      completed as shown.
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/Controllers/buildNewController4.png\">
      <br><br></li>
  <li>We shouldn&apos;t connect the speed sensor directly to the engineBus connector
      though because the units for the speed signal would be incorrect.
      The definition of the speed signal on the control bus also states that
      this should be in <strong>rpm</strong> but the speed sensor measures
      speed in <strong>rad/s</strong>. We can convert the units using the
      conversion blocks that can be found in
      <strong>Modelica.Blocks.Math.UnitConversions</strong>.
      Add a&nbsp;conversion block to convert the output of the speed sensor
      to rpm and connect this to the engineBus. When this connection is made
      the following dialog will be produced and should be complete as shown.
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/Engines/buildNewEngine6.png\">
      <br><br></li>
  <li>The model is now complete and should check successfully and can be used
      in any model compatible with the VehicleInterfaces library assuming the
      selected Driver model also uses the accelerator pedal connection
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/Engines/buildNewEngine5.png\">
      </li>
</ol>
</html>"));
end Tutorial;
