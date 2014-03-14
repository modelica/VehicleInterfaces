within VehicleInterfaces;
package Engines "Collection of combustion engine subsystem definitions"
  extends VehicleInterfaces.Icons.VariantLibrary;
  class Tutorial "Engines Tutorial"
    extends Modelica.Icons.Information;

    annotation (DocumentationClass=true,Documentation(info="<html>
<p><b>Tutorial - Defining a new engine model</b></p>
<p>The following process will demonstrate how to create a new engine model using this interface definition.</p>
<ol>
<li>Create a new model that extends <b>VehicleInterfaces.Engines.Interfaces.Base</b>, it should look like this:</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewEngine1.png\"><br><br>
<li>In the component browser, right click on <b>Base</b> and select <b>Parameters</b> from the context menu to produce the following parameter dialog</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewEngine2.png\"><br><br>
<li>This dialog allows you to enable/disable the optional connections by setting <b>includeAcceleratorPedal</b> and <b>includeMount</b> as required for your new engine model.  The <b>accessoriesFlange</b> and <b>transmissionFlange</b> are of the type <a href=\"Modelica://VehicleInterfaces.Interfaces.FlangeWithBearing\">VehicleInterfaces.Interfaces.FlangeWithBearing</a>, the parameters <b>includeTransmissionBearing</b> and <b>includeAccessoriesBearing</b> controls whether the bearing connectors within these connections are enabled or not.</li>
<li>You can now define your engine model as required</li>
</ol>
<h4>Creating the MinimalEngine example</h4>
<p>The following steps demonstrate how to create a simple engine model.  The engine model will apply torque at the flywheel inertia based on a simple gain from the driver's accelerator pedal.  No torque reaction in to the engine block will be modelled.</p>
<p>Starting from step 3 above.</p>
<ol>
<li>First, decide which of the optional connectors are required to model.  For this example we need the accelerator pedal connection but not the engine mount connection</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewEngine3.png\"><br><br>
<li>Add the following blocks and connections to the diagram</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewEngine4.png\"><br><br>
<li>Next, we need to check to see if any connections to the control signal bus are required for the engine, see <a href=\"Modelica://VehicleInterfaces.UsersGuide.SignalBus\">here</a> for a complete list of the minimum connections required.  In this case we need to add the engine speed to the control signal bus and this can be done by connecting a speed sensor to the flywheel and then connecting this to the signal bus.  As the engine speed signal is added to the engineBus we first need to add this connector.  The engineBus connector is <b>VehicleInterfaces.Interfaces.EngineBus</b>.  This should be connected to the <b>controlBus</b>, when this connection is made the following dialog is produced and should be completed as shown.</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewController4.png\"><br><br>
<li>We shouldn't connect the speed sensor directly to the engineBus connector though because the units for the speed signal would be incorrect.  The definition of the speed signal on the control bus also states that this should be in <b>rpm</b> but the speed sensor measures speed in <b>rad/s</b>.  We can convert the units using the conversion blocks that can be found in <b>Modelica.Blocks.Math.UnitConversions</b>.Add a conversion block to convert the output of the speed sensor to rpm and connect this to the engineBus.  When this connection is made the following dialog will be produced and should be complete as shown.</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewEngine6.png\"><br><br>
<li>The model is now complete and should check successfully and can be used in any model compatible with the VehicleInterfaces library assuming the selected Driver model also uses the accelerator pedal connection</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewEngine5.png\"><br><br>
</ol>
</html>"));
  end Tutorial;

  package Interfaces "Collection of interface definitions for engine"
    extends Modelica.Icons.InterfacesPackage;

    partial model Base "Basic interface definition for an engine"
      parameter Boolean usingMultiBodyAccessories=false
        "=true if using MultiBody accessories with a 1D engine"
        annotation (Dialog(tab="Advanced"));
      parameter Boolean usingMultiBodyTransmission=false
        "=true if using a MultiBody transmission with a 1D engine"
        annotation (Dialog(tab="Advanced"));

      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing accessoryFlange(
          final includeBearingConnector=includeAccessoriesBearing or
            usingMultiBodyAccessories) "Connection for the engine accessories"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
              rotation=0)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing
        transmissionFlange(final includeBearingConnector=
            includeTransmissionBearing or usingMultiBodyTransmission)
        "Connection to the transmission" annotation (Placement(transformation(
              extent={{90,-10},{110,10}}, rotation=0)));
      VehicleInterfaces.Interfaces.ControlBus controlBus "Control signal bus"
        annotation (Placement(transformation(
            origin={-100,60},
            extent={{-20,-20},{20,20}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a engineMount if
        includeMount "Engine mount connection (optional)"
        annotation (Placement(transformation(
            origin={0,-100},
            extent={{-16,-16},{16,16}},
            rotation=90)));
      Modelica.Mechanics.Translational.Interfaces.Flange_a acceleratorPedal if
        includeAcceleratorPedal "Accelerator pedal connection (optional)"
        annotation (Placement(transformation(extent={{-10,110},{10,90}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_2(final includeBearingConnector=
            includeTransmissionBearing or usingMultiBodyTransmission)
        annotation (Placement(transformation(
            origin={100,22},
            extent={{-8,-6},{8,6}},
            rotation=270)));
      Mechanics.MultiBody.MultiBodyEnd end_1(final includeBearingConnector=
            includeAccessoriesBearing or usingMultiBodyAccessories)
        annotation (Placement(transformation(
            origin={-100,22},
            extent={{-8,-6},{8,6}},
            rotation=270)));
    protected
      parameter Boolean includeAcceleratorPedal=false
        "Include the accelerator pedal connection";
      parameter Boolean includeMount=false
        "Include the engine mount connection";
      parameter Boolean includeTransmissionBearing=false
        "Include the transmission bearing";
      parameter Boolean includeAccessoriesBearing=false
        "Include the accessories bearing";
    equation
      connect(end_2.flange, transmissionFlange) annotation (Line(
          points={{100,19.3333},{100,0}},
          color={135,135,135},
          thickness=0.5));
      connect(end_1.flange, accessoryFlange) annotation (Line(
          points={{-100,19.3333},{-100,0}},
          color={135,135,135},
          thickness=0.5));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={
            Rectangle(
              extent={{-12,-88},{12,-112}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{-18,112},{6,88}},
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
<p>This partial model defines the interfaces required for an engine subsystem. This class should be extended to form a particular engine model. See the <a href=\"Modelica://VehicleInterfaces.Engines\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.Engines.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end Base;

    expandable connector StandardBus
      "Bus of VehicleInterfaces.Engines: StandardBus of signals generated by the Engine"
      extends .VehicleInterfaces.Interfaces.EngineBus;
      extends .VehicleInterfaces.Icons.SignalSubBusWithExplicitSignals;

      .Modelica.SIunits.AngularVelocity speed "Speed of engine" annotation (Dialog);

      annotation (
        defaultComponentPrefixes="protected",
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={Rectangle(
              extent={{-20,2},{20,-2}},
              lineColor={255,204,51},
              lineThickness=0.5)}),
        Documentation(info="<html>
<p>Sub-bus with a set of standard signals generated by the engine subsystem. </p>
</html>"));
    end StandardBus;

    annotation (Documentation(info="<html>
<p>
A collection of partial base classes which define interfaces for engine models.
</p>
</html>"));
  end Interfaces;

  model NullEngine "Empty engine"
    extends VehicleInterfaces.Icons.Engine;
    extends VehicleInterfaces.Icons.Empty;
    extends Interfaces.Base;
  equation
    connect(accessoryFlange, transmissionFlange)
      annotation (Line(points={{-100,0},{100,0}}, color={0,0,0}));

    annotation (
      Documentation(info="<html>
<p>
Empty engine model (just rigid connection between accessory and transmission flange). Using this empty model in overall vehicle architecture the functionality of engine can be eliminated.
</p>
</html>"));
  end NullEngine;

  model MinimalEngine
    "Simple engine model with torque proportional to accelerator pedal position"

    extends VehicleInterfaces.Icons.Engine;
    extends Interfaces.Base(includeMount=world.driveTrainMechanics3D,
        includeAccessoriesBearing=world.driveTrainMechanics3D);

    parameter Modelica.SIunits.AngularVelocity engineSpeed_start(displayUnit="r/min") = 104.7197551196598
      "Initial engine speed";
    parameter Modelica.SIunits.Torque requestedTorque=50
      "Engine torque = requested_torque*accelerator_pedal_position";
    parameter Modelica.SIunits.Inertia flywheelInertia=0.08 "Flywheel inertia";
    parameter Modelica.Mechanics.MultiBody.Types.Axis axisOfRotation={1,0,0}
      "Axis of rotation of engine resolved in engineMount";

    Modelica.Mechanics.MultiBody.Parts.Rotor1D flywheel(
      J=flywheelInertia,
      n=axisOfRotation,
      a(fixed=false),
      phi(fixed=false),
      w(fixed=true,
        start=engineSpeed_start))
                               annotation (Placement(transformation(extent={{
              -10,-10},{10,10}}, rotation=0)));
    Modelica.Mechanics.Rotational.Sources.Torque engine(useSupport=true)
      annotation (Placement(transformation(extent={{-40,-30},{-20,-10}},
                                                                       rotation=
             0)));
    Modelica.Mechanics.Rotational.Sensors.SpeedSensor engineSpeed
      annotation (Placement(transformation(
          origin={10,60},
          extent={{-10,10},{10,-10}},
          rotation=180)));
    Modelica.Mechanics.Rotational.Sensors.TorqueSensor engineTorque
      annotation (Placement(transformation(extent={{30,-10},{50,10}}, rotation=
              0)));
    Modelica.Mechanics.Rotational.Sensors.PowerSensor enginePower
      annotation (Placement(transformation(extent={{60,-10},{80,10}}, rotation=
              0)));
    Modelica.Blocks.Math.Gain gain(k=requestedTorque)
      annotation (Placement(transformation(extent={{-66,-26},{-54,-14}},
                                                                       rotation=
             0)));
    Modelica.Mechanics.MultiBody.Parts.Mounting1D mounting1D(n=axisOfRotation)
      annotation (Placement(transformation(extent={{-50,-50},{-30,-30}},
            rotation=0)));
  protected
    replaceable VehicleInterfaces.Engines.Interfaces.StandardBus
                                           engineBus constrainedby
      VehicleInterfaces.Interfaces.EngineBus
      annotation (Placement(transformation(extent={{-70,50},{-50,70}}, rotation=
             0)));
    replaceable VehicleInterfaces.DriverEnvironments.Interfaces.MinimalBus
                                           driverBus constrainedby
      VehicleInterfaces.Interfaces.DriverBus
      annotation (Placement(transformation(extent={{-90,30},{-70,50}}, rotation=
             0)));
    outer Modelica.Mechanics.MultiBody.World world;
  equation
    connect(engine.flange,   flywheel.flange_a)
      annotation (Line(points={{-20,-20},{-20,0},{-10,0}},color={0,0,0}));
    connect(flywheel.flange_b,engineSpeed.flange)    annotation (Line(points={{
            10,0},{20,0},{20,60}}, color={0,0,0}));
    connect(flywheel.flange_b, engineTorque.flange_a) annotation (Line(points={
            {10,0},{30,0}}, color={0,0,0}));
    connect(engineTorque.flange_b, enginePower.flange_a) annotation (Line(
          points={{50,0},{60,0}}, color={0,0,0}));
    connect(controlBus.engineBus, engineBus) annotation (Line(
        points={{-100,60},{-60,60}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus.driverBus, driverBus) annotation (Line(
        points={{-100,60},{-80,60},{-80,40}},
        color={255,204,51},
        thickness=0.5));
    connect(gain.y, engine.tau) annotation (Line(points={{-53.4,-20},{-42,-20}},
          color={0,0,127}));
    connect(flywheel.frame_a, engineMount) annotation (Line(
        points={{0,-10},{0,-100}},
        color={95,95,95},
        thickness=0.5));
    connect(mounting1D.flange_b,engine.support)  annotation (Line(points={{-30,-40},
            {-30,-40},{-30,-30}},                                       color={
            0,0,0}));
    connect(mounting1D.frame_a, engineMount) annotation (Line(
        points={{-40,-50},{-40,-60},{0,-60},{0,-100}},
        color={95,95,95},
        thickness=0.5));
    connect(gain.u, driverBus.acceleratorPedalPosition) annotation (Line(points={{-67.2,
            -20},{-80,-20},{-80,40}},    color={0,0,127}));
    connect(enginePower.flange_b, transmissionFlange.flange)
      annotation (Line(points={{80,0},{100,0}},color={0,0,0}));
    connect(flywheel.flange_a, accessoryFlange.flange)
      annotation (Line(points={{-10,0},{-100,0}}, color={0,0,0}));
    connect(accessoryFlange.bearingFrame, mounting1D.frame_a) annotation (Line(
        points={{-100,0},{-100,-60},{-40,-60},{-40,-50}},
        color={95,95,95},
        thickness=0.5));

    connect(engineSpeed.w, engineBus.speed) annotation (Line(
        points={{-1,60},{-60,60}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (      Documentation(info="<html>
 <p>A simple engine model with flywheel and where the torque output is proportional to the accelerator pedal position.
This engine model uses a drive-by-wire accelerator, i.e. the accelerator pedal position is read from the control bus.</p>
</html>"));
  end MinimalEngine;

  model MinimalEngineUsingPedal
    "Simple engine model with torque proportional to accelerator pedal position, uses accelerator pedal connection"

    extends VehicleInterfaces.Icons.Engine;
    extends Interfaces.Base(
      includeMount=world.driveTrainMechanics3D,
      includeAcceleratorPedal=true,
      includeAccessoriesBearing=world.driveTrainMechanics3D);

    parameter Modelica.SIunits.AngularVelocity engineSpeed_start(displayUnit="r/min") = 104.7197551196598
      "Initial engine speed";
    parameter Modelica.SIunits.Force pedalPositionToTorque = 50
      "Engine torque = pedalPositionToTorque*accelerator_pedal_position";
    parameter Modelica.SIunits.Inertia flywheelInertia=0.08 "Flywheel inertia";
    parameter Modelica.Mechanics.MultiBody.Types.Axis axisOfRotation={1,0,0}
      "Axis of rotation resolved in engineMount";

    Modelica.Mechanics.MultiBody.Parts.Rotor1D flywheel(
      J=flywheelInertia,
      n=axisOfRotation,
      a(fixed=false),
      phi(fixed=false),
      w(fixed=true, start=engineSpeed_start))
      annotation (Placement(transformation(extent={{
              -10,-10},{10,10}}, rotation=0)));
    Modelica.Mechanics.Rotational.Sources.Torque engine(useSupport=true)
      annotation (Placement(transformation(extent={{-40,-30},{-20,-10}},
                                                                       rotation=
             0)));
    Modelica.Mechanics.Rotational.Sensors.SpeedSensor engineSpeed
      annotation (Placement(transformation(
          origin={10,60},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica.Mechanics.Rotational.Sensors.TorqueSensor engineTorque
      annotation (Placement(transformation(extent={{30,-10},{50,10}}, rotation=
              0)));
    Modelica.Mechanics.Rotational.Sensors.PowerSensor enginePower
      annotation (Placement(transformation(extent={{60,-10},{80,10}}, rotation=
              0)));
    Modelica.Blocks.Math.Gain gain(k(unit="N")=pedalPositionToTorque)
      annotation (Placement(transformation(extent={{-66,-26},{-54,-14}},
                                                                       rotation=
             0)));
    Modelica.Mechanics.MultiBody.Parts.Mounting1D mounting1D(n=axisOfRotation)
      annotation (Placement(transformation(extent={{-50,-50},{-30,-30}},
            rotation=0)));
    Modelica.Mechanics.Translational.Sensors.PositionSensor
      acceleratorPedalPosition
      annotation (Placement(transformation(
          origin={-50,90},
          extent={{-10,-10},{10,10}},
          rotation=180)));
  protected
    replaceable VehicleInterfaces.Engines.Interfaces.StandardBus engineBus constrainedby
      VehicleInterfaces.Interfaces.EngineBus
      annotation (Placement(transformation(extent={{-70,50},{-50,70}}, rotation=
             0)));
    outer Modelica.Mechanics.MultiBody.World world;
  equation
    connect(engine.flange,   flywheel.flange_a)
      annotation (Line(points={{-20,-20},{-20,0},{-10,0}},color={0,0,0}));
    connect(flywheel.flange_b,engineSpeed.flange)    annotation (Line(points={{
            10,0},{20,0},{20,60}}, color={0,0,0}));
    connect(flywheel.flange_b, engineTorque.flange_a) annotation (Line(points={
            {10,0},{30,0}}, color={0,0,0}));
    connect(engineTorque.flange_b, enginePower.flange_a) annotation (Line(
          points={{50,0},{60,0}}, color={0,0,0}));
    connect(gain.y, engine.tau) annotation (Line(points={{-53.4,-20},{-53.4,-20},
            {-42,-20}},
          color={0,0,127}));
    connect(flywheel.frame_a, engineMount) annotation (Line(
        points={{0,-10},{0,-100}},
        color={0,0,0},
        thickness=0.5));
    connect(mounting1D.flange_b,engine.support)  annotation (Line(points={{-30,-40},
            {-30,-40},{-30,-30}},                                       color={
            0,0,0}));
    connect(mounting1D.frame_a, engineMount) annotation (Line(
        points={{-40,-50},{-40,-60},{0,-60},{0,-100}},
        color={0,0,0},
        thickness=0.5));
    connect(acceleratorPedalPosition.flange,   acceleratorPedal) annotation (Line(
          points={{-40,90},{0,90},{0,100}}, color={0,127,0}));
    connect(acceleratorPedalPosition.s, gain.u) annotation (Line(points={{-61,90},
            {-80,90},{-80,-20},{-67.2,-20}}, color={0,0,127}));
    connect(controlBus.engineBus, engineBus) annotation (Line(
        points={{-100,60},{-60,60}},
        color={255,204,51},
        thickness=0.5));
    connect(flywheel.flange_a, accessoryFlange.flange)
      annotation (Line(points={{-10,0},{-100,0}}, color={0,0,0}));
    connect(enginePower.flange_b, transmissionFlange.flange)
      annotation (Line(points={{80,0},{100,0}},color={0,0,0}));
    connect(accessoryFlange.bearingFrame, mounting1D.frame_a) annotation (Line(
        points={{-100,0},{-100,-60},{-40,-60},{-40,-50}},
        color={0,0,0},
        thickness=0.5));

    connect(engineSpeed.w, engineBus.speed) annotation (Line(
        points={{-1,60},{-60,60}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (                         Documentation(info="<html>
<p>A simple engine model with flywheel and where the torque output is proportional to the accelerator pedal position.
This engine model uses the physical connection between the driver and the engine for the accelerator pedal.</p>
</html>"));
  end MinimalEngineUsingPedal;

  package Internal "Collection of internal material involving engine"
    extends Modelica.Icons.InternalPackage;

    expandable connector StandardBus
      "Obsolete bus: Do not use (provided for backwards compatibility)"
      extends VehicleInterfaces.Interfaces.EngineBus;

      SI.AngularVelocity speed "Speed of engine" annotation (Dialog);

      annotation (Documentation(info="<html>
<p>An expandable connector that defines the minimum set of signals required on the <b>engineBus</b>.  This connector should <b>NOT</b> be used in models and is included to enable Dymola to generate appropriate connection dialogs for signal buses.</p>
</html>"), Diagram(graphics={
                          Text(
              extent={{-100,-40},{100,-80}},
              lineColor={255,0,0},
              textString="Do not use!")}));
    end StandardBus;

    annotation (Documentation(info="<html>
<p>
A collection of internal material for engine models. Control bus definitions are mainly included.
</p>
</html>"));
  end Internal;

  annotation (Documentation(info="<html>
<p>The engine subsystem interfaces are defined in this sub-package of the VehicleInterfaces library.  The engine subsystem has the following connectors some of which are optional (see below for more information):</p>
<ul>
<li><b>accessoryFlange</b> - 1D rotational connection to the accessories subsystem (or other components driven by the engine)</li>
<li><b>transmissionFlange</b> - 1D rotational connection to the transmission subsystem</li>
<li><b>controlBus</b> - control signal bus connection</li>
<li><b>acceleratorPedal</b> - 1D translational connection for the accelerator pedal connection to the driverEnvironment (optional)</li>
<li><b>engineMount</b> - MultiBody connection to transmit the engine mount reactions (optional)</li>
</ul>
<p>The optional connectors are, by default, disabled and can be ignored if not required.  They can be enabled by setting the appropriate parameter to be true.  This is only possible at design time, i.e. when you are building the subsystem model.</p>
<h4>Effects to be modelled in this subsystem</h4>
<p>Within the VehicleIntefaces package the engine subsystem is used to model the generation of torque and the application of this torque to the transmission and accessories flange.  The connections to the transmission and accessories subsystems are via 1D rotational connectors.  The torque reaction in to the engine block and the block itself are also to be modelled in this subsystem if required.  The torque reactions, if included, should all be referred back to a single reference frame for the engine block (the engineMount connector).</p>
</html>"));
end Engines;
