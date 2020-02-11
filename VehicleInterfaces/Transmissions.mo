within VehicleInterfaces;
package Transmissions "Collection of transmission subsystem definitions"
  extends Modelica.Icons.VariantsPackage;

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
<li>This dialog allows you to enable/disable the optional connections by setting <b>includeClutchPedal</b>, <b>includeManualShiftConnector</b> and <b>includeMount</b> as required for your new transmission model.  The <b>engineFlange</b> and <b>drivelineFlange</b> connectors are of the type <a href=\"modelica://Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing\">Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing</a>, the parameters <b>includeTransmissionBearing</b> and <b>includeDrivelineBearing</b> controls whether the bearing connectors within these connections are enabled or not.</li>
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

  package Interfaces "Collection of interface definitions for transmission"
    extends Modelica.Icons.InterfacesPackage;

    partial model Base "Basic interface definition for a transmission"
      parameter Boolean usingMultiBodyEngine=false
        "=true if using MultiBody engine with a 1D transmission"
        annotation (Dialog(tab="Advanced"));
      parameter Boolean usingMultiBodyDriveline=false
        "=true if using a MultiBody driveline with a 1D transmission"
        annotation (Dialog(tab="Advanced"));

      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing engineFlange(
          final includeBearingConnector=includeTransmissionBearing or
            usingMultiBodyEngine) "Connection to the engine"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing drivelineFlange(
          final includeBearingConnector=includeDrivelineBearing or
            usingMultiBodyDriveline) "Connection to the driveline"
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      VehicleInterfaces.Interfaces.ControlBus controlBus "Control signal bus"
        annotation (Placement(transformation(
            origin={-100,60},
            extent={{-20,-20},{20,20}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a transmissionMount if
        includeMount "Transmission mount connection (optional)"
        annotation (Placement(transformation(
            origin={0,-100},
            extent={{-16,-16},{16,16}},
            rotation=90)));
      Mechanics.MultiBody.MultiBodyEnd end_2(final includeBearingConnector=
            includeDrivelineBearing or usingMultiBodyDriveline)
        annotation (Placement(transformation(
            origin={100,22},
            extent={{-8,-6},{8,6}},
            rotation=270)));
      Mechanics.MultiBody.MultiBodyEnd end_1(final includeBearingConnector=
            includeTransmissionBearing or usingMultiBodyEngine)
        annotation (Placement(transformation(
            origin={-100,22},
            extent={{-8,-6},{8,6}},
            rotation=270)));
    protected
      parameter Boolean includeMount=false
        "Include the transmission mount connection";
      parameter Boolean includeDrivelineBearing=false
        "Include the driveline bearing";
      parameter Boolean includeTransmissionBearing=false
        "Include the engine bearing";

    equation
      connect(end_1.flange, engineFlange) annotation (Line(
          points={{-100,19.3333},{-100,0}},
          color={135,135,135},
          thickness=0.5));
      connect(end_2.flange, drivelineFlange) annotation (Line(
          points={{100,19.3333},{100,0}},
          color={135,135,135},
          thickness=0.5));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-10,-86},{14,-110}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{92,28},{108,16}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{-108,28},{-92,16}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot)}),
        Documentation(info="<html>
<p>This partial model defines the common interfaces required for a transmission subsystem.
See the <a href=\"modelica://VehicleInterfaces.Transmissions\">documentation</a> and <a href=\"modelica://VehicleInterfaces.Transmissions.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end Base;

    partial model BaseAutomaticTransmission
      "Interface definition for an automatic transmission"
      extends Base;
      annotation (Documentation(info="<html>
<p>This partial model defines the interfaces required for an automatic transmission model within the VehicleInterfaces package.
See the <a href=\"modelica://VehicleInterfaces.Transmissions\">documentation</a> and <a href=\"modelica://VehicleInterfaces.Transmissions.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end BaseAutomaticTransmission;

    partial model BaseManualTransmission
      "Interface definition for a manual transmission"
      extends Base;
    protected
      parameter Boolean includeManualShiftConnector=false
        "Include the manual shift connection";
      parameter Boolean includeClutchPedal=false
        "Include the clutch pedal connection";
    public
      Modelica.Mechanics.Translational.Interfaces.Flange_b clutchPedal if
        includeClutchPedal "Clutch pedal connection (optional)"
        annotation (Placement(transformation(extent={{-70,90},{-50,110}})));
      VehicleInterfaces.Interfaces.ShiftConnector shiftConnector if
        includeManualShiftConnector
        "Manual shift selector connection (optional)"
        annotation (Placement(transformation(extent={{-10,90},{10,110}})));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-12,112},{12,86}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot), Rectangle(
              extent={{-68,112},{-44,88}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot)}),
        Documentation(info="<html>
<p>This partial model defines the interfaces required for a manual transmission model within the VehicleInterfaces package.
See the <a href=\"modelica://VehicleInterfaces.Transmissions\">documentation</a> and <a href=\"modelica://VehicleInterfaces.Transmissions.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end BaseManualTransmission;

    model BaseTwoInputTransmission
      "Interface definition for a transmission with two input shafts"
      extends Base;

      parameter Boolean usingMultiBodyMotor=false
        "=true if using MultiBody motor with a 1D transmission"
        annotation (Dialog(tab="Advanced"));

      Mechanics.MultiBody.MultiBodyEnd end_3(final includeBearingConnector=
            includeMotorBearing or usingMultiBodyMotor)
        annotation (Placement(transformation(
            origin={-100,-82},
            extent={{-8,-6},{8,6}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing motorFlange(
          final includeBearingConnector=includeMotorBearing or
            usingMultiBodyMotor) "Connection to the motor"
        annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
    protected
      parameter Boolean includeMotorBearing=false
        "Include the motor bearing connection";
    equation
      connect(end_3.flange, motorFlange) annotation (Line(
          points={{-100,-79.3333},{-100,-60}},
          color={135,135,135},
          thickness=0.5));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-108,-76},{-92,-88}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot)}),
        Documentation(info="<html>
<p>This partial model defines the interfaces required for a transmission model that has two input shafts (such as a power-split device)
within the VehicleInterfaces package.  See the <a href=\"modelica://VehicleInterfaces.Transmissions\">documentation</a> and <a
href=\"modelica://VehicleInterfaces.Transmissions.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end BaseTwoInputTransmission;

    expandable connector StandardBus
      "Bus of VehicleInterfaces.Transmission: StandardBus of signals generated by the Transmission model"
      extends .VehicleInterfaces.Interfaces.TransmissionBus;
      extends .VehicleInterfaces.Icons.SignalSubBusWithExplicitSignals;
      extends Modelica.Icons.ObsoleteModel;

      .Modelica.SIunits.AngularVelocity outputSpeed "Output shaft speed" annotation (Dialog);
      Boolean clutchLocked "Clutch state (true if locked)" annotation (Dialog);

      annotation (
        obsolete = "Obsolete model - use VehicleInterfaces.Interfaces.TransmissionBus instead",
        defaultComponentPrefixes="protected",
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={Rectangle(
              extent={{-20,2},{20,-2}},
              lineColor={255,204,51},
              lineThickness=0.5)}),
        Documentation(info="<html>
<p>Bus with a set of standard signals generated by the transmission subsystem. </p>
</html>"),
        Diagram(graphics={
            Rectangle(
              extent={{-102,82},{102,-52}},
              lineColor={255,0,0},
              pattern=LinePattern.Dash,
              lineThickness=0.5)}));
    end StandardBus;

    expandable connector StandardControlBus
      "Bus of VehicleInterfaces.Transmission: StandardControlBus of signals generated by the Transmission Controller model"
      extends .VehicleInterfaces.Interfaces.TransmissionControlBus;
      extends .VehicleInterfaces.Icons.SignalSubBusWithExplicitSignals;
      extends Modelica.Icons.ObsoleteModel;
      annotation (
        obsolete = "Obsolete model - use VehicleInterfaces.Interfaces.TransmissionControlBus instead",
        Documentation(info="<html>
<p>Bus with a set of standard signals generated by the controller for a transmission subsystem. </p>
</html>"),
        Diagram(graphics={
            Rectangle(
              extent={{-102,82},{102,-52}},
              lineColor={255,0,0},
              pattern=LinePattern.Dash,
              lineThickness=0.5)}));
    end StandardControlBus;

    annotation (Documentation(info="<html>
<p>
A collection of partial base classes which define interfaces for transmission models.
</p>
</html>"));
  end Interfaces;

  model NoTransmissions "Empty transmission"
    extends VehicleInterfaces.Icons.Transmission;
    extends VehicleInterfaces.Icons.Empty;
    extends Interfaces.Base;
  equation
    connect(engineFlange, drivelineFlange)
      annotation (Line(points={{-100,0},{100,0}}));
    annotation (      Documentation(info="<html>
<p>
Empty transmission model (just rigid connection between engine and driveline flange). Using this empty model in overall vehicle architecture the functionality of transmission can be eliminated.
</p>
</html>"));
  end NoTransmissions;

  model SingleGearAutomaticTransmission
    "Simple fixed gear ratio, automatic transmission, no torque converter"
    extends VehicleInterfaces.Icons.Transmission;
    extends Interfaces.BaseAutomaticTransmission(includeMount=world.driveTrainMechanics3D);

    parameter Real gearRatio=4 "Gear ratio";
    Modelica.Mechanics.Rotational.Components.IdealGear gear(
      ratio=gearRatio,
      useSupport=true)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    Modelica.Mechanics.MultiBody.Parts.Mounting1D mounting1D
      annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
    Modelica.Mechanics.Rotational.Sensors.SpeedSensor outputSpeed
      annotation (Placement(transformation(
          origin={70,60},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica.Blocks.Sources.IntegerConstant currentGear(k=1)
      annotation (Placement(transformation(extent={{40,80},{20,100}})));
  protected
    VehicleInterfaces.Interfaces.TransmissionBus transmissionBus
      annotation (Placement(transformation(extent={{-30,50},{-10,70}})));
    VehicleInterfaces.Interfaces.TransmissionControlBus transmissionControlBus
      annotation (Placement(transformation(extent={{-30,80},{-10,100}})));
    outer Modelica.Mechanics.MultiBody.World world;
  equation
    connect(mounting1D.flange_b,gear.support)
      annotation (Line(points={{0,-50},{0,-10}}));
    connect(mounting1D.frame_a, transmissionMount) annotation (Line(
        points={{-10,-60},{-10,-80},{0,-80},{0,-100}},
        color={95,95,95},
        thickness=0.5));
    connect(gear.flange_b,outputSpeed.flange) annotation (Line(points={{10,0},
            {80,0},{80,60}}));
    connect(controlBus.transmissionBus, transmissionBus) annotation (Line(
        points={{-100.1,60.1},{-60,60.1},{-60,60},{-20,60}},
        color={255,204,51},
        thickness=0.5));
    connect(transmissionControlBus, controlBus.transmissionControlBus)
      annotation (Line(
        points={{-20,90},{-20,90},{-20,60.1},{-100.1,60.1}},
        color={255,204,51},
        thickness=0.5));
    connect(currentGear.y, transmissionControlBus.currentGear) annotation (Line(
          points={{19,90},{-20,90}}, color={255,127,0}));
    connect(gear.flange_a, engineFlange.flange)
      annotation (Line(points={{-10,0},{-54,0},{-54,0.05},{-99.95,0.05}}));
    connect(gear.flange_b, drivelineFlange.flange)
      annotation (Line(points={{10,0},{100,0},{100,0.05},{100.05,0.05}}));
    connect(outputSpeed.w, transmissionBus.outputSpeed) annotation (Line(
        points={{59,60},{20,60},{20,60.05},{-19.95,60.05}},
        color={0,0,127}));
    annotation (
      Documentation(info="<html>
<p>A single gear transmission without a launch device that is based on the automatic transmission model interface definition</p>
</html>"));
  end SingleGearAutomaticTransmission;

  model SingleGearManualTransmission
    "Simple fixed gear ratio, manual transmission, uses physical connectors"
    import VehicleInterfaces;
    extends VehicleInterfaces.Icons.Transmission;
    extends Interfaces.BaseManualTransmission(
      includeMount=world.driveTrainMechanics3D,
      includeManualShiftConnector=true,
      includeClutchPedal=true);

    parameter Real gearRatio=4 "Gear ratio";
    Modelica.Mechanics.Rotational.Components.IdealGear gear(
      ratio=gearRatio,
      useSupport=true)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    Modelica.Mechanics.MultiBody.Parts.Mounting1D mounting1D
      annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
    Modelica.Mechanics.Rotational.Sensors.SpeedSensor outputSpeed
      annotation (Placement(transformation(
          origin={70,40},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    VehicleInterfaces.Interfaces.ShiftOutput shiftOutput
      annotation (Placement(transformation(
          origin={0,76},
          extent={{-6,-6},{6,6}},
          rotation=270)));
    Modelica.Mechanics.Rotational.Components.Clutch clutch(fn_max=1)
      annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
    Modelica.Mechanics.Translational.Components.Fixed fixed
      annotation (Placement(transformation(
          origin={-80,46},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor
      annotation (Placement(transformation(extent={{-80,36},{-60,56}})));
    Modelica.Mechanics.Translational.Components.SpringDamper pedalSpring(c=1, d=1)
      annotation (Placement(transformation(
          origin={-60,76},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica.Blocks.Sources.BooleanExpression clutchLocked(y=clutch.locked)
      annotation (Placement(transformation(extent={{40,10},{20,30}})));
  protected
    VehicleInterfaces.Interfaces.TransmissionBus transmissionBus
      annotation (Placement(transformation(extent={{-30,30},{-10,50}})));
    VehicleInterfaces.Interfaces.TransmissionControlBus transmissionControlBus
      annotation (Placement(transformation(extent={{-30,50},{-10,70}})));
    outer Modelica.Mechanics.MultiBody.World world;
  public
    Modelica.Blocks.Math.Gain normalise(k=1/clutch.fn_max)
      annotation (Placement(transformation(
          origin={-70,23},
          extent={{-5,-4},{5,4}},
          rotation=270)));
  equation
    connect(mounting1D.flange_b,gear.support)
      annotation (Line(points={{0,-50},{0,-10}}));
    connect(mounting1D.frame_a, transmissionMount) annotation (Line(
        points={{-10,-60},{-10,-80},{0,-80},{0,-100}},
        color={95,95,95},
        thickness=0.5));
    connect(gear.flange_b,outputSpeed.flange)    annotation (Line(points={{10,0},
            {80,0},{80,40}}));
    connect(shiftConnector, shiftOutput.shiftConnector) annotation (Line(points={{0,100},
            {0,82},{1.10218e-015,82}}));
    connect(clutch.flange_b, gear.flange_a)
      annotation (Line(points={{-60,0},{-10,0}}));
    connect(forceSensor.flange_a,fixed.flange)    annotation (Line(points={{-80,
            46},{-80,46}}, color={0,127,0}));
    connect(clutchPedal, pedalSpring.flange_b) annotation (Line(points={{-60,
            100},{-60,86}}, color={0,127,0}));
    connect(pedalSpring.flange_a, forceSensor.flange_b) annotation (Line(points=
           {{-60,66},{-60,46}}, color={0,127,0}));
    connect(clutchLocked.y, transmissionBus.clutchLocked) annotation (Line(
          points={{19,20},{0,20},{0,38},{-19.95,38},{-19.95,40.05}},
                                               color={255,0,255}));
    connect(controlBus.transmissionBus, transmissionBus) annotation (Line(
        points={{-100.1,60.1},{-20,60.1},{-20,40}},
        color={255,204,51},
        thickness=0.5));
    connect(clutch.flange_a, engineFlange.flange)
      annotation (Line(points={{-80,0},{-90,0},{-90,0.05},{-99.95,0.05}}));
    connect(gear.flange_b, drivelineFlange.flange)
      annotation (Line(points={{10,0},{100,0},{100,0.05},{100.05,0.05}}));
    connect(transmissionControlBus, controlBus.transmissionControlBus)
      annotation (Line(
        points={{-20,60},{-20,60.1},{-100.1,60.1}},
        color={255,204,51},
        thickness=0.5));
    connect(shiftOutput.gear, transmissionControlBus.currentGear) annotation (Line(
          points={{-1.2124e-015,69.4},{-1.2124e-015,60},{-20,60}},   color={255,
            127,0}));
    connect(forceSensor.f, normalise.u) annotation (Line(
        points={{-78,35},{-78,32},{-70,32},{-70,29}},
        color={0,0,127}));
    connect(normalise.y, clutch.f_normalized) annotation (Line(
        points={{-70,17.5},{-70,11}},
        color={0,0,127}));

    connect(outputSpeed.w, transmissionBus.outputSpeed) annotation (Line(
        points={{59,40},{20,40},{20,40.05},{-19.95,40.05}},
        color={0,0,127}));
    annotation (
      Documentation(info="<html>
<p>A single gear transmission based on the manual transmission model interface definition.  Includes a clutch model and uses
physical connections between the driver and transmission system for the clutch position and current gear number (although the
gear number is ignored in this model.</p>
</html>"));
  end SingleGearManualTransmission;

  model PowerSplitDevice
    "Simple power split device based on an ideal epicyclic gear"
    extends Interfaces.BaseTwoInputTransmission;

    parameter Real ratio=100/50 "Number of ring_teeth/sun_teeth (e.g. ratio=100/50)";

    Modelica.Mechanics.Rotational.Sensors.SpeedSensor outputSpeed
      annotation (Placement(transformation(
          origin={60,60},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica.Mechanics.Rotational.Components.IdealPlanetary idealPlanetary(
      ratio=ratio)
      annotation (Placement(transformation(extent={{-10,10},{10,-10}})));
    Modelica.Blocks.Sources.IntegerConstant currentGear(k=1)
      annotation (Placement(transformation(extent={{30,80},{10,100}})));
  protected
    VehicleInterfaces.Interfaces.TransmissionBus transmissionBus
      annotation (Placement(transformation(extent={{-30,50},{-10,70}})));
    VehicleInterfaces.Interfaces.TransmissionControlBus transmissionControlBus
      annotation (Placement(transformation(extent={{-30,80},{-10,100}})));
    outer Modelica.Mechanics.MultiBody.World world;
  equation
    connect(outputSpeed.flange, drivelineFlange.flange) annotation (Line(
        points={{70,60},{80,60},{80,0.05},{100.05,0.05}}));
    connect(controlBus.transmissionBus, transmissionBus) annotation (Line(
        points={{-100.1,60.1},{-100,60.1},{-100,60},{-20,60}},
        color={255,204,51},
        thickness=0.5));
    connect(idealPlanetary.ring, drivelineFlange.flange) annotation (Line(
        points={{10,0},{56,0},{56,0.05},{100.05,0.05}}));
    connect(idealPlanetary.sun, engineFlange.flange) annotation (Line(
        points={{-10,0},{-54,0},{-54,0.05},{-99.95,0.05}}));
    connect(idealPlanetary.carrier, motorFlange.flange) annotation (Line(
        points={{-10,-4},{-40,-4},{-40,-59.95},{-99.95,-59.95}}));
    connect(controlBus.transmissionControlBus, transmissionControlBus)
      annotation (Line(
        points={{-100.1,60.1},{-100,60.1},{-100,60},{-40,60},{-40,90},{-20,90}},
        color={255,204,51},
        thickness=0.5));
    connect(currentGear.y, transmissionControlBus.currentGear) annotation (Line(
          points={{9,90},{-20,90}}, color={255,127,0}));
    connect(outputSpeed.w, transmissionBus.outputSpeed) annotation (Line(
        points={{49,60},{14,60},{14,60.05},{-19.95,60.05}},
        color={0,0,127}));
    annotation (
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{60,94},{20,-92}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={192,192,192}),
          Rectangle(
            extent={{0,-80},{-40,-40}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={192,192,192}),
          Rectangle(
            extent={{0,30},{-40,-30}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={192,192,192}),
          Rectangle(
            extent={{-40,10},{-90,-10}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={192,192,192}),
          Rectangle(
            extent={{110,10},{60,-10}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={192,192,192}),
          Rectangle(
            extent={{60,90},{-40,95}},
            lineColor={160,160,164},
            fillColor={160,160,164},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-70,-54},{-40,-66}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={192,192,192}),
          Line(points={{-100,-50},{-100,-38},{-60,-38}}),
          Line(points={{-70,-48},{-50,-48}}),
          Line(points={{-60,-38},{-60,-48}}),
          Line(points={{-70,-74},{-49,-74}}),
          Line(points={{-60,-74},{-60,-84}}),
          Text(
            extent={{-150,140},{150,100}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid,
            textString="%name")}),
      Documentation(info="<html>
<p>Simple power-split device based on an ideal epicyclic gear. No losses are included in this model</p>
</html>"));
  end PowerSplitDevice;

  package Internal "Collection of internal material involving transmission"
    extends Modelica.Icons.InternalPackage;

    expandable connector StandardBus
      "Do not use - Expandable connector defining signals for transmission bus"
      extends VehicleInterfaces.Interfaces.TransmissionBus;

      SI.AngularVelocity outputSpeed "Output shaft speed" annotation (Dialog);
      Boolean clutchLocked "Clutch state (true if locked)" annotation (Dialog);
      annotation (Documentation(info="<html>
<p>
An expandable connector that defines the minimum set of signals required on the <b>transmissionBus</b>.
This connector shall <b>not</b> be used in models and is included here to enable
connection dialog (i.e. the GUI) for signal buses.
</p>
</html>"), Diagram(graphics={
                          Text(
              extent={{-100,-40},{100,-80}},
              lineColor={255,0,0},
              textString="Do not use!")}));
    end StandardBus;

    expandable connector StandardControlBus
      "Do not use - Expandable connector defining signals for transmission control bus"
      extends VehicleInterfaces.Interfaces.TransmissionControlBus;

      Integer currentGear "Currently selected gear" annotation (Dialog);
      annotation (Documentation(info="<html>
<p>
An expandable connector that defines the minimum set of signals required on the <b>transmissionControlBus</b>.
This connector shall <b>not</b> be used in models and is included here to enable
connection dialog (i.e. the GUI) for signal buses.
</p>
</html>"), Diagram(graphics={
                          Text(
              extent={{-100,-40},{100,-80}},
              lineColor={255,0,0},
              textString="Do not use!")}));
    end StandardControlBus;

    annotation (Documentation(info="<html>
<p>
A collection of internal material for transmission models. Control bus definitions are mainly included.
</p>
</html>"));
  end Internal;

  annotation (Documentation(info="<html>
<p>The transmission subsystem interfaces are defined in this sub-package of the VehicleInterfaces library.  The transmission subsystem has the following connectors some of which are optional (see below for more information):</p>
<ul>
<li><b>engineFlange</b> - 1D rotational connection to the engine subsystem (or other systems connected to the transmission input)</li>
<li><b>drivelineFlange</b> - 1D rotational connection to the driveline subsystem (or other systems connected to the transmission output)</li>
<li><b>controlBus</b> - control signal bus connection</li>
<li><b>clutchPedal</b> - 1D translational connection for the clutch pedal connection to the driverEnvironment (optional, for manual gearboxes only)</li>
<li><b>shiftConnector</b> - shift connection to the driverEnvironment (optional, for manual gearboxes only)</li>
<li><b>transmissionMount</b> - MultiBody connection to transmit the transmission mount reactions (optional)</li>
</ul>
<p>The optional connectors are, by default, disabled and can be ignored if not required.  They can be enabled by setting the appropriate parameter to be true.  This is only possible at design time, i.e. when you are building the subsystem model.</p>
<h4>Effects to be modelled in this subsystem</h4>
<p>Within the VehicleIntefaces package the transmission subsystem is used to model the transmission of torque from the input shaft to the output shaft.  The connections to the engine and driveline subsystems are via 1D rotational connectors.  The torque reaction in to the transmission housing and the housing itself are also to be modelled in this subsystem if required.  The torque reactions, if included, should all be referred back to a single reference frame for the transmission housing (the transmissionMount connector).</p>
</html>"));
end Transmissions;
