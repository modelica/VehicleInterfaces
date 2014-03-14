within VehicleInterfaces;
package Drivelines "Collection of drivelines subsystem definitions"
  extends VehicleInterfaces.Icons.VariantLibrary;

  class Tutorial "Driveline Tutorial"
    extends Modelica.Icons.Information;

    annotation (DocumentationClass=true,Documentation(info="<html>
<p><b>Tutorial - Defining a new driveline model</b></p>
<p>The following process will demonstrate how to create a new driveline model using these interface definitions.  This tutorial will guide you through building a driveline for a passenger car, i.e. a vehicle with 4 wheels.</p>
<ol>
<li>Create a new model that extends <b>VehicleInterfaces.Drivelines.Interfaces.TwoAxleBase</b>, it should look like this:</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewDriveline1.png\"><br><br>
<li>In the component browser, right click on <b>Base</b> and select <b>Parameters</b> from the context menu to produce the following parameter dialog</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewDriveline2.png\"><br><br>
<li>This dialog allows you to enable/disable the optional connections by setting <b>includeWheelBearings</b> and <b>includeMount</b> as required for your new driveline model.  The wheelHub connectors are of the type <a href=\"Modelica://VehicleInterfaces.Interfaces.FlangeWithBearing\">VehicleInterfaces.Interfaces.FlangeWithBearing</a>, the parameter <b>includeWheelBearings</b> controls whether the bearing connectors within the wheelHubs is enabled or not.</li>
<li>You can now define your driveline model as required</li>
</ol>
<h4>Creating a simple rear-wheel drive example</h4>
<p>The following steps demonstrate how to create a simple rear-wheel drive driveline model.  The driveline model will transmit the torque from the transmission to the rear wheels via a propshaft, differential with final drive and then two halfshafts.  No torque reaction in to the transmission housings will be modelled.</p>
<p>Starting from step 3 above.</p>
<ol>
<li>First, decide which of the optional connectors are required in the model.  For this example we don't need any of the optional connections</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewDriveline3.png\"><br><br>
<li>Add the following blocks and connections to the diagram.  When you draw the connections from the rightHalfShaft and leftHalfShaft components to the wheelHub  connectors the dialog box shown below will appear asking which connector within the wheelHub connector you would like to make the connection to.  As we are modelling the driveline as a 1D system you should select <b>flange</b> from the list of options which is the 1D connector within the wheelHub connector.</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewDriveline4.png\">
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewDriveline5.png\"><br><br>
<li>Next, we need to check to see if any connections to the control signal bus are required for the driveline, see <a href=\"Modelica://VehicleInterfaces.UsersGuide.SignalBus\">here</a> for a complete list of the minimum connections required.  In this case we don't need to add any signals to the control signal bus.</li>
<li>The model is now complete and should check successfully and can be used in any model compatible with the VehicleInterfaces library assuming the selected Driver model also uses the accelerator pedal connection</li>
</ol>
</html>"));
  end Tutorial;

  package Interfaces "Collection of interface definitions for driveline"
    extends Modelica.Icons.InterfacesPackage;
    partial model Base "Basic interface definition for a driveline"

      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing
        transmissionFlange(final includeBearingConnector=
            includeTransmissionBearing or usingMultiBodyTransmission)
        "Connection to the Transmission output shaft"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
              rotation=0)));
      VehicleInterfaces.Interfaces.ControlBus controlBus "Control signal bus"
        annotation (Placement(transformation(
            origin={-100,60},
            extent={{-20,-20},{20,20}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a drivelineMount if
        includeMount "Driveline mount connection (optional)"
        annotation (Placement(transformation(
            origin={0,-100},
            extent={{-16,-16},{16,16}},
            rotation=90)));
      Mechanics.MultiBody.MultiBodyEnd end_0(final includeBearingConnector=
            includeTransmissionBearing or usingMultiBodyTransmission)
        annotation (Placement(transformation(
            origin={-100,22},
            extent={{-6,-8},{6,8}},
            rotation=270)));
      parameter Boolean usingMultiBodyChassis=false
        "=true if using a MultiBody chassis with a 1D driveline"
        annotation (Dialog(tab="Advanced"));
      parameter Boolean usingMultiBodyTransmission=false
        "=true if using a MultiBody transmission with a 1D driveline"
        annotation (Dialog(tab="Advanced"));
    protected
      parameter Boolean includeWheelBearings=false
        "Include wheel bearing connectors";
      parameter Boolean includeMount=false "Include the driveline mount";
      parameter Boolean includeTransmissionBearing=false
        "Include the transmission bearing";
    equation
      connect(end_0.flange, transmissionFlange) annotation (Line(
          points={{-100,20},{-100,0}},
          color={135,135,135},
          thickness=0.5));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Rectangle(
              extent={{-12,-88},{12,-112}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot), Rectangle(
              extent={{-108,28},{-92,16}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot)}),
        Documentation(info="<html>
<p>This partial model defines the basic interfaces required for any driveline subsystem.  This class should be extended to form a driveline interface definition with the correct number of wheelHub connectors for the type of vehicle being modelled. See the <a href=\"Modelica://VehicleInterfaces.Drivelines\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.Drivelines.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end Base;

    partial model TwoAxleBase
      "Interface definition for a driveline of a 4 wheeled vehicle"
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
      Mechanics.MultiBody.MultiBodyEnd end_1(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{-88,-108},{-76,-92}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_2(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{-88,92},{-76,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_3(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{32,-108},{44,-92}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_4(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{32,92},{44,108}},
              rotation=0)));
    equation
      connect(end_1.flange, wheelHub_1) annotation (Line(
          points={{-80,-100},{-60,-100}},
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
      connect(end_2.flange, wheelHub_2) annotation (Line(
          points={{-80,100},{-60,100}},
          color={135,135,135},
          thickness=0.5));
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={
            Rectangle(
              extent={{-89,108},{-75,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{31,108},{45,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{-89,-92},{-75,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{31,-92},{45,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot)}),
        Documentation(info="<html>
<p>This partial model defines the interfaces required for the driveline subsystem of a two axled vehicle within the VehicleInterfaces package.  See the <a href=\"Modelica://VehicleInterfaces.Drivelines\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.Drivelines.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end TwoAxleBase;

    partial model ThreeAxleBase
      "Interface definition for a driveline of a 6 wheeled vehicle"
      extends VehicleInterfaces.Drivelines.Interfaces.Base;

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
            usingMultiBodyChassis) "Second axle left wheel"
        annotation (Placement(transformation(
            origin={50,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_4(
          final includeBearingConnector=includeWheelBearings or
            usingMultiBodyChassis) "Second axle right wheel"
        annotation (Placement(transformation(
            origin={50,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_5(
          includeBearingConnector=includeWheelBearings or usingMultiBodyChassis)
        "Third axle left wheel"
        annotation (Placement(transformation(
            origin={160,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_6(
          includeBearingConnector=includeWheelBearings or usingMultiBodyChassis)
        "Third axle right wheel"
        annotation (Placement(transformation(
            origin={160,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Mechanics.MultiBody.MultiBodyEnd end_1(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{-88,-108},{-76,-92}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_2(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{-88,92},{-76,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_3(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{22,-108},{34,-92}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_4(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{22,92},{34,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_5(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{132,-108},{144,-92}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_6(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{132,92},{144,108}},
              rotation=0)));
    equation
      connect(end_5.flange, wheelHub_5) annotation (Line(
          points={{140,-100},{160,-100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_6.flange, wheelHub_6) annotation (Line(
          points={{140,100},{160,100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_4.flange, wheelHub_4) annotation (Line(
          points={{30,100},{50,100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_3.flange, wheelHub_3) annotation (Line(
          points={{30,-100},{50,-100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_1.flange, wheelHub_1) annotation (Line(
          points={{-80,-100},{-60,-100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_2.flange, wheelHub_2) annotation (Line(
          points={{-80,100},{-60,100}},
          color={135,135,135},
          thickness=0.5));
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{200,100}},
            grid={1,1}), graphics={
            Rectangle(
              extent={{-89,108},{-75,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{-89,-92},{-75,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{21,-92},{35,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{21,107},{35,91}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{131,-92},{145,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{131,108},{145,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot)}),
        Documentation(info="<html>
<p>This partial model defines the interfaces required for the driveline subsystem of a three axled vehicle within the VehicleInterfaces package.  See the <a href=\"Modelica://VehicleInterfaces.Drivelines\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.Drivelines.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end ThreeAxleBase;

    partial model FourAxleBase
      "Interface definition for a driveline of a 8 wheeled vehicle"
      extends VehicleInterfaces.Drivelines.Interfaces.Base;

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
            usingMultiBodyChassis) "Second axle left wheel"
        annotation (Placement(transformation(
            origin={50,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_4(
          final includeBearingConnector=includeWheelBearings or
            usingMultiBodyChassis) "Second axle right wheel"
        annotation (Placement(transformation(
            origin={50,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_5(
          final includeBearingConnector=includeWheelBearings or
            usingMultiBodyChassis) "Third axle left wheel"
        annotation (Placement(transformation(
            origin={160,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_6(
          final includeBearingConnector=includeWheelBearings or
            usingMultiBodyChassis) "Third axle right wheel"
        annotation (Placement(transformation(
            origin={160,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_7(
          final includeBearingConnector=includeWheelBearings or
            usingMultiBodyChassis) "Fourth axle left wheel"
        annotation (Placement(transformation(
            origin={260,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_8(
          final includeBearingConnector=includeWheelBearings or
            usingMultiBodyChassis) "Fourth axle right wheel"
        annotation (Placement(transformation(
            origin={260,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Mechanics.MultiBody.MultiBodyEnd end_1(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{-88,-108},{-76,-92}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_2(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{-88,92},{-76,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_3(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{22,-108},{34,-92}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_4(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{22,92},{34,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_5(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{132,-108},{144,-92}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_6(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{132,92},{144,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_7(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{232,-108},{244,-92}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_8(final includeBearingConnector=
            includeWheelBearings or usingMultiBodyChassis)
        annotation (Placement(transformation(extent={{232,92},{244,108}},
              rotation=0)));
    equation
      connect(end_7.flange, wheelHub_7) annotation (Line(
          points={{240,-100},{260,-100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_8.flange, wheelHub_8) annotation (Line(
          points={{240,100},{260,100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_5.flange, wheelHub_5) annotation (Line(
          points={{140,-100},{160,-100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_6.flange, wheelHub_6) annotation (Line(
          points={{140,100},{160,100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_4.flange, wheelHub_4) annotation (Line(
          points={{30,100},{50,100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_3.flange, wheelHub_3) annotation (Line(
          points={{30,-100},{50,-100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_1.flange, wheelHub_1) annotation (Line(
          points={{-80,-100},{-60,-100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_2.flange, wheelHub_2) annotation (Line(
          points={{-80,100},{-60,100}},
          color={135,135,135},
          thickness=0.5));
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{300,100}},
            grid={1,1}), graphics={
            Rectangle(
              extent={{-89,108},{-75,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{-89,-92},{-75,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{21,-92},{35,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{21,108},{35,92}},
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
              extent={{231,108},{245,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{231,-92},{245,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot)}),
        Documentation(info="<html>
<p>This partial model defines the interfaces required for the driveline subsystem of a four axled vehicle within the VehicleInterfaces package.  See the <a href=\"Modelica://VehicleInterfaces.Drivelines\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.Drivelines.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end FourAxleBase;

    annotation (Documentation(info="<html>
<p>
A collection of partial base classes which define interfaces for driveline models.
</p>
</html>"));
  end Interfaces;

  model NoDriveline "Empty driveline model for a 4 wheeled vehicle"
    extends VehicleInterfaces.Icons.Driveline;
    extends VehicleInterfaces.Icons.Empty;
    extends VehicleInterfaces.Drivelines.Interfaces.TwoAxleBase(
        includeWheelBearings=world.driveTrainMechanics3D);
  protected
    outer Modelica.Mechanics.MultiBody.World world;
    annotation (
      Documentation(info="<html>
<p>
Zero torque is applied to all the wheelhubs and the reaction paths in to the wheel hubs included if the <b>driveTrainMechanics3D</b> flag in the world object is true.</p>
<p>
Using this empty model in overall vehicle architecture the functionality of driveline can be eliminated.
</p>
</html>"));
  end NoDriveline;

  model MinimalDriveline "Front wheel drive, 4 wheeled vehicle"
    extends VehicleInterfaces.Icons.Driveline;
    extends VehicleInterfaces.Drivelines.Interfaces.TwoAxleBase(includeMount=
          world.driveTrainMechanics3D);

    parameter Modelica.SIunits.Inertia halfshaftInertia=0.1
      "Inertia of each halfshaft";
    parameter Real finalDriveRatio=3 "Final drive ratio";

    Modelica.Mechanics.MultiBody.Parts.Rotor1D rightHalfShaft(J=
          halfshaftInertia) annotation (Placement(transformation(
          origin={-40,50},
          extent={{-10,10},{10,-10}},
          rotation=270)));
    Modelica.Mechanics.MultiBody.Parts.Rotor1D leftHalfShaft(J=halfshaftInertia)
      annotation (Placement(transformation(
          origin={-40,-50},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica.Mechanics.Rotational.Components.IdealPlanetary differential(
                                                              ratio=1)
      annotation (Placement(transformation(
          origin={-40,20},
          extent={{-10,-10},{10,10}},
          rotation=90)));
  protected
    outer Modelica.Mechanics.MultiBody.World world;
  public
    Modelica.Mechanics.Rotational.Components.IdealGear finalDrive(
                                                       ratio=finalDriveRatio,
        useSupport=false)
      annotation (Placement(transformation(extent={{-80,-10},{-60,10}},
            rotation=0)));
  equation
    connect(rightHalfShaft.flange_a, wheelHub_2.flange) annotation (Line(points=
           {{-40,60},{-40,80},{-60,80},{-60,100}}, color={0,0,0}));
    connect(leftHalfShaft.flange_a, wheelHub_1.flange) annotation (Line(points=
            {{-40,-60},{-40,-80},{-60,-80},{-60,-100}}, color={0,0,0}));
    connect(leftHalfShaft.flange_b, differential.sun) annotation (Line(points={
            {-40,-40},{-40,10}}, color={0,0,0}));
    connect(differential.ring, rightHalfShaft.flange_b) annotation (Line(points=
           {{-40,30},{-40,40}}, color={0,0,0}));
    connect(rightHalfShaft.frame_a, drivelineMount) annotation (Line(
        points={{-30,50},{0,50},{0,-100}},
        color={95,95,95},
        thickness=0.5));
    connect(leftHalfShaft.frame_a, drivelineMount) annotation (Line(
        points={{-30,-50},{0,-50},{0,-100}},
        color={95,95,95},
        thickness=0.5));
    connect(finalDrive.flange_b, differential.carrier) annotation (Line(points=
            {{-60,0},{-44,0},{-44,10}}, color={0,0,0}));
    connect(finalDrive.flange_a, transmissionFlange.flange)
      annotation (Line(points={{-80,0},{-100,0}}, color={0,0,0}));
    annotation (
      Documentation(info="<html>
<p>This driveline model is of a front-wheel drive 4-wheeled vehicle.  The front differential is modelled using an ideal gear and planetary gear.  The model does include the 3D mount effects if the <b>driveTrainMechanics3D</b> in the world object is set to true.  To properly include these effects the additional constant and FrameForceAndTorque actuators are required on the front wheel hubs.  A constant zero torque is applied to the rear wheelhubs and the reaction paths in to the wheelhubs are included.</p>
</html>"));
  end MinimalDriveline;

  annotation (Documentation(info="<html>
<p>The driveline subsystem interfaces are defined in this sub-package of the VehicleInterfaces library.  The driveline subsystem has the following connectors some of which are optional (see below for more information):</p>
<ul>
<li><b>transmissionFlange</b> - 1D rotational connection to the transmission subsystem (or other systems connected to the driveline input)</li>
<li><b>controlBus</b> - control signal bus connection</li>
<li><b>wheelHub_n</b> - wheelHub connectors that consist of a 1D rotational connector and a MultiBody frame connector (see <a href=\"Modelica://VehicleInterfaces.Iterfaces.FlangeWithBearing\">here</a>.  The number of these varies depending on how many wheels the vehicle has.</li>
<li><b>drivelineMount</b> - MultiBody connection to transmit the driveline mount reactions (optional)</li>
</ul>
<p>The optional connectors are, by default, disabled and can be ignored if not required.  They can be enabled by setting the appropriate parameter to be true.  This is only possible at design time, i.e. when you are building the subsystem model.</p>
<h4>Effects to be modelled in this subsystem</h4>
<p>Within the VehicleIntefaces package the driveline subsystem is used to model the transmission of torque from the transmission output shaft to the wheel hubs.  The connection to the transmission subsystem is a 1D rotational connectors.  Different interface definitions are provided for vehicles with different numbers of wheels, a FlangeWithBearing connector is added for each wheel.  The torque reaction in to the driveline housings and the housings themselves are also to be modelled in this subsystem if required.  The torque reactions, if included, should all be referred back to a single reference frame (the drivelineMount connector).</p>
</html>"));
end Drivelines;
