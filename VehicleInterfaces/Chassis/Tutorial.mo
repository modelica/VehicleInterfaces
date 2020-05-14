within VehicleInterfaces.Chassis;
class Tutorial "Chassis Tutorial"
  extends Modelica.Icons.Information;

  annotation (DocumentationClass=true,Documentation(info="<html>
<h4>Tutorial - Defining a new chassis model</h4>
<p>
The following process will demonstrate how to create a&nbsp;new chassis model
using these interface definitions. This tutorial will guide you through building
a&nbsp;chassis for a&nbsp;passenger car, i.e., a&nbsp;vehicle with 4&nbsp;wheels.
</p>
<ol>
  <li>Create a&nbsp;new model that extends
      <strong>VehicleInterfaces.Chassis.Interfaces.FourWheelBase</strong>,
      it should look like this:
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/Chassis/buildNewChassis1.png\">
      <br><br></li>
  <li>In the component browser, right click on <strong>FourWheelBase</strong> and select
      <strong>Parameters</strong> from the context menu to produce the following
      parameter dialog
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/Chassis/buildNewChassis2.png\">
      <br><br></li>
  <li>This dialog allows you to enable/disable the optional connections by setting
      <strong>includeWheelBearings</strong>, <strong>includeSteeringWheel</strong>
      and <strong>includeChassisFrame</strong> as required for your new chassis model.
      The wheelHub connectors are of the type
      <a href=\"modelica://Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing\">Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing</a>,
      the parameter <strong>includeWheelBearings</strong> controls whether
      the bearing connectors within the wheelHubs is enabled or not.</li>
  <li>You can now define your chassis model as required</li>
</ol>

<h4>Creating a simple chassis model for longitudinal motion</h4>
<p>
The following steps demonstrate how to create a&nbsp;simple chassis model for
longitudinal motion. The chassis model will transmit the torque from the wheel
hub connections in to a&nbsp;force being applied to the vehicle model.
Only the longitudinal dynamics of the vehicle body will be modelled so
no suspension is required.
</p>
<p>
Starting from step 3&nbsp;above.
</p>
<ol>
  <li>First, decide which of the optional connectors are required in the model.
      For this example we don&apos;t need any of the optional connections
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/Chassis/buildNewChassis3.png\">
      <br><br></li>
  <li>Add the following blocks and connections to the diagram.  When you draw the
      connections to the wheelHub connectors the dialog box shown below will
      appear asking which connector within the wheelHub connector you would
      like to make the connection to.  As we are modelling the wheels as
      a&nbsp;1D system you should select <strong>flange</strong> from the
      list of options which is the 1D connector within the wheelHub connector.
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/Chassis/buildNewChassis4.png\">
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/Drivelines/buildNewDriveline5.png\">
      <br><br></li>
  <li>Next, we need to check to see if any connections to the control signal bus
      are required for the chassis, see
      <a href=\"modelica://VehicleInterfaces.UsersGuide.SignalBus\">here</a> for
      a&nbsp;complete list of the minimum connections required. In this case
      we need to add the vehicle longitudinal velocity to the control signal
      bus and this can be done by connecting a&nbsp;speed sensor to the vehicle
      body and then connecting this to the signal bus. As the longitudinal speed
      signals are added to the chassisBus we first need to add this connector.
      The chassisBus connector is <strong>VehicleInterfaces.Interfaces.ChassisBus</strong>.
      This should be connected to the <strong>controlBus</strong>, when this
      connection is made the following dialog is produced and should be
      completed as shown.
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/UsersGuide/SignalBus/signalNaming2.png\">
      <br><br></li>
  <li>When the connection between the sensor and the chassisBus connector is
      added the dialog below appears and should be completed as shown
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/UsersGuide/SignalBus/signalNaming.png\">
      <br><br></li>
  <li>The model is now complete and should check successfully and can be
      used in any model compatible with the VehicleInterfaces library
      assuming the selected Driver model doesn&apos;t use the steering wheel
      or chassis frame connections
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/Chassis/buildNewChassis5.png\"></li>
</ol>
</html>"));
end Tutorial;
