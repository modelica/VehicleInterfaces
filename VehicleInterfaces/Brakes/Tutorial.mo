within VehicleInterfaces.Brakes;
class Tutorial "Brakes Tutorial"
  extends Modelica.Icons.Information;

  annotation (DocumentationClass=true, Documentation(info="<html>
<h4>Tutorial - Defining a new brakes model</h4>
<p>
The following process will demonstrate how to create a&nbsp;new brakes model
using these interface definitions. This tutorial will guide you through
building a&nbsp;braking system for a&nbsp;passenger car, i.e. a&nbsp;vehicle
with 4&nbsp;wheels.
</p>

<ol>
  <li>Create a&nbsp;new model that extends
      <strong>VehicleInterfaces.Brakes.Interfaces.TwoAxleBase</strong>,
      it should look like this:
      <br><img src=\"modelica://VehicleInterfaces/Resources/Images/Brakes/buildNewBrakes1.png\">
      <br>&nbsp;</li>
  <li>In the component browser, right click on <strong>TwoAxleBase</strong>
      and select <strong>Parameters</strong> from the context menu to produce
      the following parameter dialog
      <br><img src=\"modelica://VehicleInterfaces/Resources/Images/Brakes/buildNewBrakes2.png\">
      <br>&nbsp;</li>
  <li>This dialog allows you to enable/disable the optional connections by setting
      <strong>includeWheelBearings</strong> and <strong>includeBrakePedal</strong>
      as required for your new brakes model. The wheelHub connectors are of the type
      <a href=\"modelica://Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing\">Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing</a>,
      the parameter <strong>includeWheelBearings</strong> controls whether the
      bearing connectors within the wheelHubs is enabled or not.</li>
  <li>You can now define your brakes model as required.</li>
</ol>

<h4>Creating a simple braking system example</h4>
<p>
The following steps demonstrate how to create anbsp;simple braking system model.
The brakes will be modelled using the standard brakes component from the
Modelica standard library. A&nbsp;position sensor will measure the brake pedal
position and a&nbsp;1D table block will be used to convert this to
a&nbsp;force that will be applied to each wheel brake. The reactions in to
the wheel carriers will not be modelled.
</p>
<p>
Starting from step&nbsp;3 above.
</p>

<ol>
  <li>First, decide which of the optional connectors are required in the model.
      For this example we need the brake pedal connection but not the wheel
      bearing connector
      <br><img src=\"modelica://VehicleInterfaces/Resources/Images/Brakes/buildNewBrakes3.png\">
      <br>&nbsp;</li>
  <li>Add the following blocks and connections to the diagram.  When you draw the
      connections from the brake components to the wheelHub connectors the dialog
      box shown below will appear asking which connector within the wheelHub
      connector you would like to make the connection to.
      As we are modelling the brakes as a&nbsp;1D system you should select
      <strong>flange</strong> from the list of options which is the 1D connector
      within the wheelHub connector.
      <br><img src=\"modelica://VehicleInterfaces/Resources/Images/Brakes/buildNewBrakes4.png\">
      <br><img src=\"modelica://VehicleInterfaces/Resources/Images/Brakes/buildNewBrakes5.png\">
      <br>&nbsp;</li>
  <li>Next, we need to check to see if any connections to the control signal bus
      are required for the brakes, see
      <a href=\"modelica://VehicleInterfaces.UsersGuide.SignalBus\">a complete list of the minimum connections</a>
      required. In this case we need to add the four individual wheel speeds to
      the control signal bus and this can be done by connecting speed sensors
      to each wheel and then connecting these to the signal bus. As the wheel
      speed signals are added to the brakesBus we first need to add this connector.
      The brakesBus connector is <strong>VehicleInterfaces.Interfaces.BrakesBus</strong>.
      This should be connected to the <strong>controlBus</strong>; when this
      connection is made the following dialog is produced and should be
      completed as shown.
      <br><img src=\"modelica://VehicleInterfaces/Resources/Images/Brakes/buildNewBrakes6.png\">
      <br>&nbsp;</li>
  <li>When the connections between the sensors and the brakesBus connector are
      added the dialog below appears and should be completed with the correct
      index for all four wheel speeds being measured.
      <br><img src=\"modelica://VehicleInterfaces/Resources/Images/Brakes/buildNewBrakes7.png\">
      <br>&nbsp;</li>
  <li>The model is now complete and should check successfully and can be used
      in any model compatible with the VehicleInterfaces library assuming the
      selected Driver model also uses the brake pedal connection.
      <br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/Brakes/buildNewBrakes8.png\">
      </li>
</ol>
</html>"));
end Tutorial;
