within VehicleInterfaces;
package Brakes "Collection of brakes subsystem definitions"
  extends VehicleInterfaces.Icons.VariantLibrary;

  class Tutorial "Brakes Tutorial"
    extends Modelica.Icons.Information;

    annotation (DocumentationClass=true, Documentation(info="<html>
<h4>Tutorial - Defining a new brakes model</h4>
<p>
The following process will demonstrate how to create a new brakes model using these
interface definitions.  This tutorial will guide you through building a braking system
for a passenger car, i.e. a vehicle with 4 wheels.
</p>
<ol>
<li>Create a new model that extends <b>VehicleInterfaces.Brakes.Interfaces.TwoAxleBase</b>,
it should look like this:
<br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewBrakes1.png\"><br>&nbsp;</li>
<li>In the component browser, right click on <b>TwoAxleBase</b> and select <b>Parameters</b>
from the context menu to produce the following parameter dialog
<br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewBrakes2.png\"><br>&nbsp;</li>
<li>This dialog allows you to enable/disable the optional connections by setting
<b>includeWheelBearings</b> and <b>includeBrakePedal</b> as required for your new brakes model.
The wheelHub connectors are of the type
<a href=\"Modelica://VehicleInterfaces.Interfaces.FlangeWithBearing\">VehicleInterfaces.Interfaces.FlangeWithBearing</a>,
the parameter <b>includeWheelBearings</b> controls whether the bearing connectors within
the wheelHubs is enabled or not.</li>
<li>You can now define your brakes model as required.</li>
</ol>

<h4>Creating a simple braking system example</h4>
<p>
The following steps demonstrate how to create a simple braking system model.
The brakes will be modelled using the standard brakes component from the Modelica standard library.
A position sensor will measure the brake pedal position and a 1D table block will be used
to convert this to a force that will be applied to each wheel brake.
The reactions in to the wheel carriers will not be modelled.
</p>
<p>
Starting from step 3 above.
</p>
<ol>
<li>First, decide which of the optional connectors are required in the model.
For this example we need the brake pedal connection but not the wheel bearing connector
<br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewBrakes3.png\"><br>&nbsp;</li>
<li>Add the following blocks and connections to the diagram.  When you draw the connections
from the brake components to the wheelHub connectors the dialog box shown below will appear
asking which connector within the wheelHub connector you would like to make the connection to.
As we are modelling the brakes as a 1D system you should select <b>flange</b> from the list
of options which is the 1D connector within the wheelHub connector.
<br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewBrakes4.png\">
<br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewBrakes5.png\"><br>&nbsp;</li>
<li>Next, we need to check to see if any connections to the control signal bus are required for
the brakes, see
<a href=\"Modelica://VehicleInterfaces.UsersGuide.SignalBus\">a complete list of the minimum connections</a>
required.  In this case we need to add the four individual wheel speeds to the control signal
bus and this can be done by connecting speed sensors to each wheel and then connecting these
to the signal bus.  As the wheel speed signals are added to the brakesBus we first need to add
this connector.
The brakesBus connector is <b>VehicleInterfaces.Brakes.Interfaces.StandardBus</b>.
This should be connected to the <b>controlBus</b>; when this connection is made the following
dialog is produced and should be completed as shown.
<br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewBrakes6.png\"><br>&nbsp;</li>
<li>When the connections between the sensors and the brakesBus connector are added the dialog
below appears and should be completed with the correct index for all four wheel speeds being measured.
<br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewBrakes7.png\"><br>&nbsp;</li>
<li>The model is now complete and should check successfully and can be used in any model
compatible with the VehicleInterfaces library assuming the selected Driver model also uses
the brake pedal connection.</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewBrakes8.png\">
</ol>
</html>"));
  end Tutorial;

  package Interfaces "Collection of interface definitions for brakes"
    extends Modelica.Icons.InterfacesPackage;

    partial model Base "Base interface definition for a brakes"

    public
      VehicleInterfaces.Interfaces.ControlBus controlBus "Control signal bus"
        annotation (Placement(transformation(
            origin={-100,60},
            extent={{-20,-20},{20,20}},
            rotation=90)));
      Modelica.Mechanics.Translational.Interfaces.Flange_a brakePedal if
        includeBrakePedal "Brake pedal connection (optional)"
        annotation (Placement(transformation(extent={{-10,110},{10,90}},
              rotation=0)));
      parameter Boolean usingMultiBodyChassis=false
        "=true if using a MultiBody chassis with a 1D driveline"
        annotation (Dialog(tab="Advanced"));
    protected
      parameter Boolean includeBrakePedal=false
        "Include the brake pedal connection";
      parameter Boolean includeWheelBearings=false
        "Include the wheel bearing connectors";

      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Rectangle(
              extent={{-18,112},{6,88}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot)}),
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}})),
        Documentation(info="<html>
<p>This partial model defines the basic interfaces required for any brakes subsystem.  This class should be extended to form a brakes interface definition with the correct number of wheelHub connectors for the type of vehicle being modelled. See the <a href=\"Modelica://VehicleInterfaces.Brakes\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.Brakes.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end Base;

    partial model TwoAxleBase
      "Interface definition for the brakes on a 4 wheeled vehicle"
      extends Base;

      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_1(
          final includeBearingConnector=includeWheelBearings or
            usingMultiBodyChassis) "Front left wheel"
        annotation (Placement(transformation(
            origin={-60,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_2(
          final includeBearingConnector=includeWheelBearings or
            usingMultiBodyChassis) "Front right wheel"
        annotation (Placement(transformation(
            origin={-60,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_3(
          final includeBearingConnector=includeWheelBearings or
            usingMultiBodyChassis) "Rear left wheel"
        annotation (Placement(transformation(
            origin={60,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_4(
          final includeBearingConnector=includeWheelBearings or
            usingMultiBodyChassis) "Rear right wheel"
        annotation (Placement(transformation(
            origin={60,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Mechanics.MultiBody.MultiBodyEnd end_2(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{-88,92},{-76,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_4(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{32,92},{44,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_3(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{32,-108},{44,-92}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_1(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{-88,-108},{-76,-92}},
              rotation=0)));
    equation
      connect(end_2.flange, wheelHub_2) annotation (Line(
          points={{-80,100},{-60,100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_4.flange, wheelHub_4) annotation (Line(
          points={{40,100},{60,100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_3.flange, wheelHub_3) annotation (Line(
          points={{40,-100},{60,-100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_1.flange, wheelHub_1) annotation (Line(
          points={{-80,-100},{-60,-100}},
          color={135,135,135},
          thickness=0.5));
      annotation (Documentation(info="<html>
<p>This partial model defines the interfaces required for the brakes subsystem of a two axled vehicle within the VehicleInterfaces package.  See the <a href=\"Modelica://VehicleInterfaces.Brakes\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.Brakes.Tutorial\">tutorial</a> for more information.</p>
</html>"), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-89,108},{-75,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{31,108},{45,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{31,-92},{45,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{-89,-92},{-75,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot)}));
    end TwoAxleBase;

    partial model ThreeAxleBase
      "Interface definition for the brakes on a 6 wheeled vehicle"
      extends Base;

      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_1(
          final includeBearingConnector=includeWheelBearings)
        "Front left wheel"
        annotation (Placement(transformation(
            origin={-60,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_2(
          final includeBearingConnector=includeWheelBearings)
        "Front right wheel" annotation (Placement(transformation(
            origin={-60,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_3(
          final includeBearingConnector=includeWheelBearings) "Rear left wheel"
        annotation (Placement(transformation(
            origin={60,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_4(
          final includeBearingConnector=includeWheelBearings)
        "Rear right wheel" annotation (Placement(transformation(
            origin={60,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_5(
          final includeBearingConnector=includeWheelBearings) "Rear left wheel"
        annotation (Placement(transformation(
            origin={160,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_6(
          final includeBearingConnector=includeWheelBearings)
        "Rear right wheel" annotation (Placement(transformation(
            origin={160,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Mechanics.MultiBody.MultiBodyEnd end_2(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{-88,92},{-76,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_4(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{32,92},{44,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_6(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{132,92},{144,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_5(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{132,-108},{144,-92}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_3(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{32,-108},{44,-92}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_1(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{-88,-108},{-76,-92}},
              rotation=0)));
    equation
      connect(end_2.flange, wheelHub_2) annotation (Line(
          points={{-80,100},{-60,100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_4.flange, wheelHub_4) annotation (Line(
          points={{40,100},{60,100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_6.flange, wheelHub_6) annotation (Line(
          points={{140,100},{160,100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_5.flange, wheelHub_5) annotation (Line(
          points={{140,-100},{160,-100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_3.flange, wheelHub_3) annotation (Line(
          points={{40,-100},{60,-100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_1.flange, wheelHub_1) annotation (Line(
          points={{-80,-100},{-60,-100}},
          color={135,135,135},
          thickness=0.5));
      annotation (
        Documentation(info="<html>
<p>This partial model defines the interfaces required for the brakes subsystem of a three axled vehicle within the VehicleInterfaces package. See the <a href=\"Modelica://VehicleInterfaces.Brakes\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.Brakes.Tutorial\">tutorial</a> for more information.</p>
</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {200,100}}), graphics={
            Rectangle(
              extent={{-89,108},{-75,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{31,107},{45,91}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{131,108},{145,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{131,-92},{145,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{31,-92},{45,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{-89,-92},{-75,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot)}));
    end ThreeAxleBase;

    partial model FourAxleBase
      "Interface definition for the brakes on a 8 wheeled vehicle"
      extends Base;

      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_1(
          final includeBearingConnector=includeWheelBearings)
        "Front left wheel"
        annotation (Placement(transformation(
            origin={-60,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_2(
          final includeBearingConnector=includeWheelBearings)
        "Front right wheel" annotation (Placement(transformation(
            origin={-60,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_3(
          final includeBearingConnector=includeWheelBearings) "Rear left wheel"
        annotation (Placement(transformation(
            origin={60,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_4(
          final includeBearingConnector=includeWheelBearings)
        "Rear right wheel" annotation (Placement(transformation(
            origin={60,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_5(
          final includeBearingConnector=includeWheelBearings) "Rear left wheel"
        annotation (Placement(transformation(
            origin={160,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_6(
          final includeBearingConnector=includeWheelBearings)
        "Rear right wheel" annotation (Placement(transformation(
            origin={160,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_7(
          final includeBearingConnector=includeWheelBearings) "Rear left wheel"
        annotation (Placement(transformation(
            origin={260,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_8(
          final includeBearingConnector=includeWheelBearings)
        "Rear right wheel" annotation (Placement(transformation(
            origin={260,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Mechanics.MultiBody.MultiBodyEnd end_2(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{-88,92},{-76,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_4(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{32,92},{44,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_6(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{132,92},{144,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_8(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{232,92},{244,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_7(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{232,-108},{244,-92}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_5(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{132,-108},{144,-92}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_3(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{32,-108},{44,-92}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_1(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{-88,-108},{-76,-92}},
              rotation=0)));
    equation
      connect(end_2.flange, wheelHub_2) annotation (Line(
          points={{-80,100},{-60,100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_4.flange, wheelHub_4) annotation (Line(
          points={{40,100},{60,100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_6.flange, wheelHub_6) annotation (Line(
          points={{140,100},{160,100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_8.flange, wheelHub_8) annotation (Line(
          points={{240,100},{260,100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_7.flange, wheelHub_7) annotation (Line(
          points={{240,-100},{260,-100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_5.flange, wheelHub_5) annotation (Line(
          points={{140,-100},{160,-100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_3.flange, wheelHub_3) annotation (Line(
          points={{40,-100},{60,-100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_1.flange, wheelHub_1) annotation (Line(
          points={{-80,-100},{-60,-100}},
          color={135,135,135},
          thickness=0.5));
      annotation (
        Documentation(info="<html>
<p>This partial model defines the interfaces required for the brakes subsystem of a four axled vehicle within the VehicleInterfaces package. See the <a href=\"Modelica://VehicleInterfaces.Brakes\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.Brakes.Tutorial\">tutorial</a> for more information.</p>
</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {300,100}}), graphics={
            Rectangle(
              extent={{-89,108},{-75,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{31,108},{45,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{131,108},{145,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{231,108},{245,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{231,-92},{245,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{131,-92},{145,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{31,-92},{45,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{-89,-92},{-75,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot)}));
    end FourAxleBase;

    expandable connector StandardBus
      "Bus of VehicleInterfaces.Brakes: StandardBus of signals generated by the brakes"
       extends VehicleInterfaces.Interfaces.BrakesBus;
       extends VehicleInterfaces.Icons.SignalSubBusWithExplicitSignals;

      .Modelica.SIunits.AngularVelocity wheelSpeed_1
        "Individual wheel speed (wheel 1 = front left wheel)"
        annotation (Dialog);
      .Modelica.SIunits.AngularVelocity wheelSpeed_2
        "Individual wheel speed (wheel 2 = front right wheel)"
        annotation (Dialog);
      .Modelica.SIunits.AngularVelocity wheelSpeed_3
        "Individual wheel speed (wheel 3 = rear left wheel)" annotation (Dialog);
      .Modelica.SIunits.AngularVelocity wheelSpeed_4
        "Individual wheel speed (wheel 4 = rear right wheel)"
        annotation (Dialog);
      annotation (
        defaultComponentPrefixes="protected",
        defaultComponentName="brakesBus",
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={Rectangle(
              extent={{-20,2},{20,-2}},
              lineColor={255,204,51},
              lineThickness=0.5)}),
        Documentation(info="<html>
<p>
Bus with a set of standard signals generated by the brakes subsystem. 
</p>
</html>"));
    end StandardBus;
    annotation (Documentation(info="<html>
<p>
A collection of partial base classes which define interfaces for brakes models. 
</p>
</html>"));
  end Interfaces;

  model NoBrakes "Empty brakes model for 4 wheeled vehicles"
    extends VehicleInterfaces.Icons.Brakes;
    extends VehicleInterfaces.Icons.Empty;
    extends VehicleInterfaces.Brakes.Interfaces.TwoAxleBase(
        includeWheelBearings=world.driveTrainMechanics3D);
  protected
    outer Modelica.Mechanics.MultiBody.World world;

    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})),
      Documentation(info="<html>
<p>Zero torque is applied to all the wheelhubs and the reaction paths in to the wheel hubs included if the <b>driveTrainMechanics3D</b> flag in the world object is true.</p>
<p>
Using this empty model in overall vehicle architecture the functionality of brakes can be eliminated. 
</p>
</html>"));
  end NoBrakes;

  model MinimalBrakes
    "Simple proportional (constant gain) braking model for 4 wheeled vehicles"
    extends VehicleInterfaces.Icons.Brakes;
    extends VehicleInterfaces.Brakes.Interfaces.TwoAxleBase(
        includeWheelBearings=world.driveTrainMechanics3D);

    parameter Modelica.SIunits.Torque maxTorque=1000
      "Maximum combined brake torque (for all brakes together)";

    Modelica.Blocks.Math.Gain computeTorque(k=maxTorque/4.0)
      annotation (Placement(transformation(
          origin={-30,-10},
          extent={{10,-10},{-10,10}},
          rotation=180)));
    Modelica.Mechanics.Rotational.Components.Brake brake_1(
                                                mue_pos=[0, 1], useSupport=true,
      fn_max=1)
      annotation (Placement(transformation(
          origin={-60,-60},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Mechanics.Rotational.Components.Brake brake_2(
                                                mue_pos=[0, 1], useSupport=true,
      fn_max=1)
      annotation (Placement(transformation(
          origin={-60,60},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Mechanics.Rotational.Components.Brake brake_3(
                                                mue_pos=[0, 1], useSupport=true,
      fn_max=1)
      annotation (Placement(transformation(
          origin={60,-60},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica.Mechanics.Rotational.Components.Brake brake_4(
                                                mue_pos=[0, 1], useSupport=true,
      fn_max=1)
      annotation (Placement(transformation(
          origin={60,60},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica.Mechanics.Rotational.Sensors.SpeedSensor wheelSpeed_1
      annotation (Placement(transformation(
          origin={-60,-45},
          extent={{-5,-5},{5,5}},
          rotation=90)));
    Modelica.Mechanics.Rotational.Sensors.SpeedSensor wheelSpeed_2
      annotation (Placement(transformation(
          origin={-60,45},
          extent={{-5,-5},{5,5}},
          rotation=270)));
    Modelica.Mechanics.Rotational.Sensors.SpeedSensor wheelSpeed_3
      annotation (Placement(transformation(
          origin={60,-45},
          extent={{-5,-5},{5,5}},
          rotation=90)));
    Modelica.Mechanics.Rotational.Sensors.SpeedSensor wheelSpeed_4
      annotation (Placement(transformation(
          origin={60,45},
          extent={{-5,-5},{5,5}},
          rotation=270)));
    Modelica.Mechanics.MultiBody.Parts.Mounting1D torqueReaction_2(n={0,1,0})
      annotation (Placement(transformation(
          origin={-80,80},
          extent={{-5,5},{5,-5}},
          rotation=270)));
    Modelica.Mechanics.MultiBody.Parts.Mounting1D torqueReaction_4(n={0,1,0})
      annotation (Placement(transformation(
          origin={80,80},
          extent={{-5,-5},{5,5}},
          rotation=270)));
    Modelica.Mechanics.MultiBody.Parts.Mounting1D torqueReaction_3(n={0,1,0})
      annotation (Placement(transformation(
          origin={80,-80},
          extent={{5,-5},{-5,5}},
          rotation=270)));
    Modelica.Mechanics.MultiBody.Parts.Mounting1D torqueReaction_1(n={0,1,0})
      annotation (Placement(transformation(
          origin={-80,-80},
          extent={{5,5},{-5,-5}},
          rotation=270)));
  protected
    outer Modelica.Mechanics.MultiBody.World world;
    replaceable VehicleInterfaces.Brakes.Interfaces.StandardBus
                                           brakesBus constrainedby
      VehicleInterfaces.Interfaces.BrakesBus
      annotation (Placement(transformation(extent={{-70,10},{-50,30}}, rotation=
             0)));
    replaceable VehicleInterfaces.DriverEnvironments.Interfaces.MinimalBus
                                           driverBus constrainedby
      VehicleInterfaces.Interfaces.DriverBus
      annotation (Placement(transformation(extent={{-90,-20},{-70,0}}, rotation=
             0)));
  equation
    connect(computeTorque.y, brake_1.f_normalized) annotation (Line(points={{-19,-10},
            {0,-10},{0,-60},{-49,-60}},          color={0,0,127}));
    connect(computeTorque.y, brake_2.f_normalized) annotation (Line(points={{-19,-10},
            {0,-10},{0,60},{-49,60}},
          color={0,0,127}));
    connect(computeTorque.y, brake_3.f_normalized) annotation (Line(points={{-19,-10},
            {0,-10},{0,-60},{49,-60}},          color={0,0,127}));
    connect(computeTorque.y, brake_4.f_normalized) annotation (Line(points={{-19,-10},
            {0,-10},{0,60},{49,60}},                                      color=
           {0,0,127}));
    connect(brake_1.flange_b, wheelHub_1.flange) annotation (Line(points={{-60,
            -70},{-60,-100}}, color={0,0,0}));
    connect(brake_2.flange_a, wheelHub_2.flange) annotation (Line(points={{-60,
            70},{-60,100}}, color={0,0,0}));
    connect(brake_3.flange_a, wheelHub_3.flange) annotation (Line(points={{60,
            -70},{60,-100}}, color={0,0,0}));
    connect(brake_4.flange_b, wheelHub_4.flange) annotation (Line(points={{60,
            70},{60,100}}, color={0,0,0}));
    connect(wheelSpeed_1.flange,   brake_1.flange_a) annotation (Line(points={{
            -60,-50},{-60,-50}}, color={0,0,0}));
    connect(brake_2.flange_b,wheelSpeed_2.flange)
      annotation (Line(points={{-60,50},{-60,50}}, color={0,0,0}));
    connect(wheelSpeed_3.flange,   brake_3.flange_b)
      annotation (Line(points={{60,-50},{60,-50}}, color={0,0,0}));
    connect(brake_4.flange_a,wheelSpeed_4.flange)
      annotation (Line(points={{60,50},{60,50}}, color={0,0,0}));
    connect(controlBus.driverBus, driverBus) annotation (Line(
        points={{-100,60},{-90,60},{-90,-10},{-80,-10}},
        color={255,204,51},
        thickness=0.5));
    connect(computeTorque.u, driverBus.brakePedalPosition) annotation (Line(
          points={{-42,-10},{-61,-10},{-80,-10}},
          color={0,0,127}));
    connect(wheelSpeed_1.w, brakesBus.wheelSpeed_1) annotation (Line(points={{
            -60,-39.5},{-60,20}}, color={0,0,127}));
    connect(wheelSpeed_2.w, brakesBus.wheelSpeed_2) annotation (Line(points={{
            -60,39.5},{-60,20}}, color={0,0,127}));
    connect(wheelSpeed_3.w, brakesBus.wheelSpeed_3) annotation (Line(points={{
            60,-39.5},{60,19},{-60,19},{-60,20}}, color={0,0,127}));
    connect(wheelSpeed_4.w, brakesBus.wheelSpeed_4) annotation (Line(points={{
            60,39.5},{60,21},{-60,21},{-60,20}}, color={0,0,127}));
    connect(controlBus.brakesBus, brakesBus) annotation (Line(
        points={{-100,60},{-90,60},{-90,20},{-60,20}},
        color={255,204,51},
        thickness=0.5));
    connect(brake_2.support, torqueReaction_2.flange_b) annotation (Line(points=
           {{-70,60},{-80,60},{-80,75}}, color={0,0,0}));
    connect(torqueReaction_2.frame_a, wheelHub_2.bearingFrame) annotation (Line(
        points={{-75,80},{-70,80},{-70,100},{-60,100}},
        color={135,135,135},
        thickness=0.5));
    connect(torqueReaction_4.frame_a, wheelHub_4.bearingFrame) annotation (Line(
        points={{75,80},{70,80},{70,100},{60,100}},
        color={135,135,135},
        thickness=0.5));
    connect(torqueReaction_4.flange_b,brake_4.support)  annotation (Line(points={{80,75},
            {80,60},{70,60}},         color={0,0,0}));
    connect(torqueReaction_3.flange_b,brake_3.support)  annotation (Line(points={{80,-75},
            {80,-60},{70,-60}},          color={0,0,0}));
    connect(torqueReaction_3.frame_a, wheelHub_3.bearingFrame) annotation (Line(
        points={{75,-80},{70,-80},{70,-100},{60,-100}},
        color={135,135,135},
        thickness=0.5));
    connect(torqueReaction_1.frame_a, wheelHub_1.bearingFrame) annotation (Line(
        points={{-75,-80},{-70,-80},{-70,-100},{-60,-100}},
        color={135,135,135},
        thickness=0.5));
    connect(torqueReaction_1.flange_b,brake_1.support)  annotation (Line(points=
           {{-80,-75},{-80,-60},{-70,-60}}, color={0,0,0}));

    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={1,1})),
      Documentation(info="<html>
<p>Brakes subsystem model that uses the driver <b>brakePedalPosition</b> signal to determine the brake torque demand being requested by the driver.</p>
</html>"));
  end MinimalBrakes;

  model MinimalBrakesUsingPedal
    "Simple proportional (constant gain) braking model for 4 wheeled vehicles, uses the brake pedal connection"
    extends VehicleInterfaces.Icons.Brakes;
    extends VehicleInterfaces.Brakes.Interfaces.TwoAxleBase(includeBrakePedal=
          true,includeWheelBearings=world.driveTrainMechanics3D);

    parameter Modelica.SIunits.Torque maxTorque=1000
      "Maximum combined brake torque";

    Modelica.Blocks.Math.Gain computeTorque(k=maxTorque/4.0)
      annotation (Placement(transformation(
          origin={8.88178e-016,55},
          extent={{-5,5},{5,-5}},
          rotation=270)));
    Modelica.Mechanics.Rotational.Components.Brake brake_1(
                                                mue_pos=[0, 1], useSupport=true,
      fn_max=1)
      annotation (Placement(transformation(
          origin={-60,-60},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Mechanics.Rotational.Components.Brake brake_2(
                                                mue_pos=[0, 1], useSupport=true,
      fn_max=1)
      annotation (Placement(transformation(
          origin={-60,60},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Mechanics.Rotational.Components.Brake brake_3(
                                                mue_pos=[0, 1], useSupport=true,
      fn_max=1)
      annotation (Placement(transformation(
          origin={60,-60},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica.Mechanics.Rotational.Components.Brake brake_4(
                                                mue_pos=[0, 1], useSupport=true,
      fn_max=1)
      annotation (Placement(transformation(
          origin={60,60},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor
      annotation (Placement(transformation(
          origin={0,75},
          extent={{-5,-5},{5,5}},
          rotation=270)));
    Modelica.Mechanics.Rotational.Sensors.SpeedSensor wheelSpeed_1
      annotation (Placement(transformation(
          origin={-60,-45},
          extent={{-5,-5},{5,5}},
          rotation=90)));
    Modelica.Mechanics.Rotational.Sensors.SpeedSensor wheelSpeed_2
      annotation (Placement(transformation(
          origin={-60,45},
          extent={{-5,-5},{5,5}},
          rotation=270)));
    Modelica.Mechanics.Rotational.Sensors.SpeedSensor wheelSpeed_3
      annotation (Placement(transformation(
          origin={60,-45},
          extent={{-5,-5},{5,5}},
          rotation=90)));
    Modelica.Mechanics.Rotational.Sensors.SpeedSensor wheelSpeed_4
      annotation (Placement(transformation(
          origin={60,45},
          extent={{-5,-5},{5,5}},
          rotation=270)));
    Modelica.Mechanics.MultiBody.Parts.Mounting1D torqueReaction_2(n={0,1,0})
      annotation (Placement(transformation(
          origin={-80,80},
          extent={{-5,5},{5,-5}},
          rotation=270)));
    Modelica.Mechanics.MultiBody.Parts.Mounting1D torqueReaction_4(n={0,1,0})
      annotation (Placement(transformation(
          origin={80,80},
          extent={{-5,-5},{5,5}},
          rotation=270)));
    Modelica.Mechanics.MultiBody.Parts.Mounting1D torqueReaction_3(n={0,1,0})
      annotation (Placement(transformation(
          origin={80,-80},
          extent={{5,-5},{-5,5}},
          rotation=270)));
    Modelica.Mechanics.MultiBody.Parts.Mounting1D torqueReaction_1(n={0,1,0})
      annotation (Placement(transformation(
          origin={-80,-80},
          extent={{5,5},{-5,-5}},
          rotation=270)));
  protected
    outer Modelica.Mechanics.MultiBody.World world;
    replaceable Interfaces.StandardBus     brakesBus constrainedby
      VehicleInterfaces.Interfaces.BrakesBus
      annotation (Placement(transformation(extent={{-70,10},{-50,30}}, rotation=
             0)));
  equation
    connect(computeTorque.y, brake_4.f_normalized) annotation (Line(points={{
            -1.22155e-016,49.5},{0,40},{24,40},{24,60},{49,60}},color={0,0,127}));
    connect(computeTorque.y, brake_3.f_normalized) annotation (Line(points={{
            -1.22155e-016,49.5},{-1.22155e-016,-60},{49,-60}},
          color={0,0,127}));
    connect(computeTorque.y, brake_2.f_normalized) annotation (Line(points={{
            -1.22155e-016,49.5},{0,40},{-25,40},{-25,60},{-49,60}},color={0,0,
            127}));
    connect(computeTorque.y, brake_1.f_normalized) annotation (Line(points={{
            -1.22155e-016,49.5},{-1.22155e-016,-60},{-49,-60}},
                   color={0,0,127}));
    connect(brake_1.flange_b, wheelHub_1.flange) annotation (Line(points={{-60,
            -70},{-60,-100}}, color={0,0,0}));
    connect(brake_2.flange_a, wheelHub_2.flange) annotation (Line(points={{-60,
            70},{-60,100}}, color={0,0,0}));
    connect(brake_3.flange_a, wheelHub_3.flange) annotation (Line(points={{60,-70},
            {60,-85},{60,-100}},
                             color={0,0,0}));
    connect(brake_4.flange_b, wheelHub_4.flange) annotation (Line(points={{60,
            70},{60,100}}, color={0,0,0}));
    connect(positionSensor.flange,   brakePedal) annotation (Line(points={{
            9.18485e-016,80},{0,80},{0,100}}, color={0,127,0}));
    connect(positionSensor.s, computeTorque.u) annotation (Line(points={{
            -1.01033e-015,69.5},{1.99036e-015,69.5},{1.99036e-015,61}},   color=
           {0,0,127}));
    connect(wheelSpeed_1.flange,   brake_1.flange_a) annotation (Line(points={{
            -60,-50},{-60,-50}}, color={0,0,0}));
    connect(wheelSpeed_2.flange,   brake_2.flange_b) annotation (Line(points={{
            -60,50},{-60,50}}, color={0,0,0}));
    connect(wheelSpeed_3.flange,   brake_3.flange_b) annotation (Line(points={{60,-50},
            {60,-50}},         color={0,0,0}));
    connect(wheelSpeed_4.flange,   brake_4.flange_a) annotation (Line(points={{
            60,50},{60,50}}, color={0,0,0}));

    connect(controlBus.brakesBus, brakesBus) annotation (Line(
        points={{-100,60},{-90,60},{-90,20},{-60,20}},
        color={255,204,51},
        thickness=0.5));
    connect(wheelSpeed_1.w, brakesBus.wheelSpeed_1) annotation (Line(points={{
            -60,-39.5},{-60,20}}, color={0,0,127}));
    connect(wheelSpeed_2.w, brakesBus.wheelSpeed_2) annotation (Line(points={{
            -60,39.5},{-60,20}}, color={0,0,127}));
    connect(wheelSpeed_3.w, brakesBus.wheelSpeed_3) annotation (Line(points={{
            60,-39.5},{60,19},{-60,19},{-60,20}}, color={0,0,127}));
    connect(wheelSpeed_4.w, brakesBus.wheelSpeed_4) annotation (Line(points={{
            60,39.5},{60,21},{-60,21},{-60,20}}, color={0,0,127}));
    connect(torqueReaction_2.frame_a, wheelHub_2.bearingFrame) annotation (Line(
        points={{-75,80},{-70,80},{-70,100},{-60,100}},
        color={135,135,135},
        thickness=0.5));
    connect(brake_2.support, torqueReaction_2.flange_b) annotation (Line(points=
           {{-70,60},{-80,60},{-80,75}}, color={0,0,0}));
    connect(torqueReaction_4.frame_a, wheelHub_4.bearingFrame) annotation (Line(
        points={{75,80},{70,80},{70,100},{60,100}},
        color={135,135,135},
        thickness=0.5));
    connect(torqueReaction_4.flange_b,brake_4.support)  annotation (Line(points={{80,75},
            {80,60},{70,60}},             color={0,0,0}));
    connect(torqueReaction_3.frame_a, wheelHub_3.bearingFrame) annotation (Line(
        points={{75,-80},{70,-80},{70,-100},{60,-100}},
        color={135,135,135},
        thickness=0.5));
    connect(torqueReaction_3.flange_b,brake_3.support)  annotation (Line(points={{80,-75},
            {80,-60},{70,-60}},          color={0,0,0}));
    connect(torqueReaction_1.frame_a, wheelHub_1.bearingFrame) annotation (Line(
        points={{-75,-80},{-70,-80},{-70,-100},{-60,-100}},
        color={135,135,135},
        thickness=0.5));
    connect(torqueReaction_1.flange_b,brake_1.support)  annotation (Line(points=
           {{-80,-75},{-80,-60},{-70,-60}}, color={0,0,0}));
    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={1,1})),
      Documentation(info="<html>
<p>Brakes subsystem model that uses the physical pedal connection to determine the brake torque demand being requested by the driver.</p>
</html>"));
  end MinimalBrakesUsingPedal;

  package Internal "Collection of internal material involving brakes"
    extends Modelica.Icons.InternalPackage;

    expandable connector StandardBus
      "Obsolete bus: Do not use (provided for backwards compatibility)"

      extends VehicleInterfaces.Interfaces.BrakesBus;

      SI.AngularVelocity wheelSpeed_1
        "Individual wheel speed (wheel 1 = front left wheel)"
        annotation (Dialog);
      SI.AngularVelocity wheelSpeed_2
        "Individual wheel speed (wheel 2 = front right wheel)"
        annotation (Dialog);
      SI.AngularVelocity wheelSpeed_3
        "Individual wheel speed (wheel 3 = rear left wheel)" annotation (Dialog);
      SI.AngularVelocity wheelSpeed_4
        "Individual wheel speed (wheel 4 = rear right wheel)"
        annotation (Dialog);

      annotation (Documentation(info="<html>
<p>An expandable connector that defines the minimum set of signals required on the <b>brakesBus</b>.  This connector should <b>NOT</b> be used in models and is included to enable Dymola to generate appropriate connection dialogs for signal buses.</p>
</html>"), Diagram(graphics={
                          Text(
              extent={{-100,-40},{100,-80}},
              lineColor={255,0,0},
              textString="Do not use!")}));
    end StandardBus;

    annotation (Documentation(info="<html>
<p>
A collection of internal material for brakes models. Control bus definitions are mainly included.
</p>
</html>"));
  end Internal;
  annotation (Documentation(info="<html>
<p>The brakes subsystem interfaces are defined in this sub-package of the VehicleInterfaces library.  The brakes subsystem has the following connectors some of which are optional (see below for more information):</p>
<ul>
<li><b>controlBus</b> - control signal bus connection</li>
<li><b>wheelHub_n</b> - wheelHub connectors that consist of a 1D rotational connector and a MultiBody frame connector (see <a href=\"Modelica://VehicleInterfaces.Iterfaces.FlangeWithBearing\">here</a>.  The number of these varies depending on how many wheels the vehicle has.</li>
<li><b>brakePedal</b> - 1D translational connection for the brake pedal connection to the driverEnvironment (optional)</li>
</ul>
<p>The optional connectors are, by default, disabled and can be ignored if not required.  They can be enabled by setting the appropriate parameter to be true.  This is only possible at design time, i.e. when you are building the subsystem model.</p>
<h4>Effects to be modelled in this subsystem</h4>
<p>Within the VehicleIntefaces package the brakes subsystem is used to model the entire braking system from the brake pedal position through to the torque applied at the wheel hubs to decelerate the vehicle and the reactions in to the wheel carrier.  Different interface definitions are provided for vehicles with different numbers of wheels, a FlangeWithBearing connector is added for each wheel.</p>
</html>"));
end Brakes;
