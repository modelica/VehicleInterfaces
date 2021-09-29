within VehicleInterfaces.Engines;
model MinimalEngineUsingPedal
  "Simple engine model with torque proportional to accelerator pedal position, uses accelerator pedal connection"

  extends VehicleInterfaces.Icons.Engine;
  extends Interfaces.Base(
    includeMount=world.driveTrainMechanics3D,
    includeAcceleratorPedal=true,
    includeAccessoriesBearing=world.driveTrainMechanics3D);

  parameter SI.AngularVelocity engineSpeed_start(displayUnit="rev/min") = 104.7197551196598
    "Initial engine speed";
  parameter SI.Force pedalPositionToTorque = 50
    "Engine torque = pedalPositionToTorque*accelerator_pedal_position";
  parameter SI.Inertia flywheelInertia = 0.08 "Flywheel inertia";
  parameter Modelica.Mechanics.MultiBody.Types.Axis axisOfRotation = {1,0,0}
    "Axis of rotation resolved in engineMount";

  Modelica.Mechanics.MultiBody.Parts.Rotor1D flywheel(
    J=flywheelInertia,
    n=axisOfRotation,
    a(fixed=false),
    phi(fixed=false),
    w(fixed=true, start=engineSpeed_start))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Sources.Torque engine(useSupport=true)
    annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor engineSpeed
    annotation (Placement(transformation(
        origin={10,60},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor engineTorque
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor enginePower
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Math.Gain gain(k(unit="N")=pedalPositionToTorque)
    annotation (Placement(transformation(extent={{-66,-26},{-54,-14}})));
  Modelica.Mechanics.MultiBody.Parts.Mounting1D mounting1D(n=axisOfRotation)
    annotation (Placement(transformation(extent={{-50,-50},{-30,-30}})));
  Modelica.Mechanics.Translational.Sensors.PositionSensor
    acceleratorPedalPosition
    annotation (Placement(transformation(
        origin={-50,90},
        extent={{-10,-10},{10,10}},
        rotation=180)));
protected
  VehicleInterfaces.Interfaces.EngineBus engineBus
    annotation (Placement(transformation(extent={{-70,50},{-50,70}})));
  outer Modelica.Mechanics.MultiBody.World world;
equation
  connect(engine.flange, flywheel.flange_a)
    annotation (Line(points={{-20,-20},{-20,0},{-10,0}}));
  connect(flywheel.flange_b, engineSpeed.flange) annotation (Line(points={{
          10,0},{20,0},{20,60}}));
  connect(flywheel.flange_b, engineTorque.flange_a) annotation (Line(points={
          {10,0},{30,0}}));
  connect(engineTorque.flange_b, enginePower.flange_a) annotation (Line(
        points={{50,0},{60,0}}));
  connect(gain.y, engine.tau) annotation (Line(points={{-53.4,-20},{-53.4,-20},
          {-42,-20}},
        color={0,0,127}));
  connect(flywheel.frame_a, engineMount) annotation (Line(
      points={{0,-10},{0,-100}},
      thickness=0.5));
  connect(mounting1D.flange_b, engine.support) annotation (Line(points={{-30,-40},
          {-30,-40},{-30,-30}}, color={
          0,0,0}));
  connect(mounting1D.frame_a, engineMount) annotation (Line(
      points={{-40,-50},{-40,-60},{0,-60},{0,-100}},
      thickness=0.5));
  connect(acceleratorPedalPosition.flange, acceleratorPedal) annotation (Line(
        points={{-40,90},{0,90},{0,100}}, color={0,127,0}));
  connect(acceleratorPedalPosition.s, gain.u) annotation (Line(points={{-61,90},
          {-80,90},{-80,-20},{-67.2,-20}}, color={0,0,127}));
  connect(controlBus.engineBus, engineBus) annotation (Line(
      points={{-100,60},{-60,60}},
      color={255,204,51},
      thickness=0.5));
  connect(flywheel.flange_a, accessoryFlange.flange)
    annotation (Line(points={{-10,0},{-100,0}}));
  connect(enginePower.flange_b, transmissionFlange.flange)
    annotation (Line(points={{80,0},{100,0}}));
  connect(accessoryFlange.bearingFrame, mounting1D.frame_a) annotation (Line(
      points={{-100,0},{-100,-60},{-40,-60},{-40,-50}},
      thickness=0.5));
  connect(engineSpeed.w, engineBus.speed) annotation (Line(
      points={{-1,60},{-60,60}},
      color={0,0,127}));
  annotation (
    Documentation(info="<html>
<p>
A&nbsp;simple engine model with flywheel and where the torque output
is proportional to the accelerator pedal position. This engine model
uses the physical connection between the driver and the engine for
the accelerator pedal.
</p>
</html>"));
end MinimalEngineUsingPedal;
