within VehicleInterfaces.Engines;
model MinimalEngine
  "Simple engine model with torque proportional to accelerator pedal position"

  extends VehicleInterfaces.Icons.Engine;
  extends Interfaces.Base(
    includeMount=world.driveTrainMechanics3D,
    includeAccessoriesBearing=world.driveTrainMechanics3D);

  parameter SI.AngularVelocity engineSpeed_start(displayUnit="rev/min") = 104.7197551196598
    "Initial engine speed";
  parameter SI.Torque requestedTorque=50
    "Engine torque = requested_torque*accelerator_pedal_position";
  parameter SI.Inertia flywheelInertia=0.08
    "Flywheel inertia";
  parameter Modelica.Mechanics.MultiBody.Types.Axis axisOfRotation={1,0,0}
    "Axis of rotation of engine resolved in engineMount";

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
        extent={{-10,10},{10,-10}},
        rotation=180)));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor engineTorque
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor enginePower
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Math.Gain gain(k=requestedTorque)
    annotation (Placement(transformation(extent={{-66,-26},{-54,-14}})));
  Modelica.Mechanics.MultiBody.Parts.Mounting1D mounting1D(n=axisOfRotation)
    annotation (Placement(transformation(extent={{-50,-50},{-30,-30}})));
protected
  VehicleInterfaces.Interfaces.EngineBus engineBus
    annotation (Placement(transformation(extent={{-70,50},{-50,70}})));
  VehicleInterfaces.Interfaces.DriverBus driverBus
    annotation (Placement(transformation(extent={{-90,30},{-70,50}})));
  outer Modelica.Mechanics.MultiBody.World world;
equation
  connect(engine.flange,   flywheel.flange_a)
    annotation (Line(points={{-20,-20},{-20,0},{-10,0}}));
  connect(flywheel.flange_b,engineSpeed.flange) annotation (Line(points={{
          10,0},{20,0},{20,60}}));
  connect(flywheel.flange_b, engineTorque.flange_a) annotation (Line(points={
          {10,0},{30,0}}));
  connect(engineTorque.flange_b, enginePower.flange_a) annotation (Line(
        points={{50,0},{60,0}}));
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
  connect(mounting1D.flange_b,engine.support) annotation (Line(points={{-30,-40},
          {-30,-40},{-30,-30}}, color={
          0,0,0}));
  connect(mounting1D.frame_a, engineMount) annotation (Line(
      points={{-40,-50},{-40,-60},{0,-60},{0,-100}},
      color={95,95,95},
      thickness=0.5));
  connect(gain.u, driverBus.acceleratorPedalPosition) annotation (Line(points={{-67.2,
          -20},{-80,-20},{-80,40}}, color={0,0,127}));
  connect(enginePower.flange_b, transmissionFlange.flange)
    annotation (Line(points={{80,0},{100,0}}));
  connect(flywheel.flange_a, accessoryFlange.flange)
    annotation (Line(points={{-10,0},{-100,0}}));
  connect(accessoryFlange.bearingFrame, mounting1D.frame_a) annotation (Line(
      points={{-100,0},{-100,-60},{-40,-60},{-40,-50}},
      color={95,95,95},
      thickness=0.5));
  connect(engineSpeed.w, engineBus.speed) annotation (Line(
      points={{-1,60},{-60,60}},
      color={0,0,127}));
  annotation (
    Documentation(info="<html>
<p>
A simple engine model with flywheel and where the torque output is
proportional to the accelerator pedal position. This engine model uses
a&nbsp;drive-by-wire accelerator, i.e. the accelerator pedal position
is read from the control bus.
</p>
</html>"));
end MinimalEngine;
