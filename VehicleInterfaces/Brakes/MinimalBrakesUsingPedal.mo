within VehicleInterfaces.Brakes;
model MinimalBrakesUsingPedal
  "Simple proportional (constant gain) braking model for 4 wheeled vehicles, uses the brake pedal connection"
  extends VehicleInterfaces.Icons.Brakes;
  extends VehicleInterfaces.Brakes.Interfaces.TwoAxleBase(
    includeBrakePedal=true,
    includeWheelBearings=world.driveTrainMechanics3D);

  parameter SI.Torque maxTorque=1000
    "Maximum combined brake torque";

  Modelica.Blocks.Math.Gain computeTorque(k=maxTorque/4.0)
    annotation (Placement(transformation(
        origin={8.88178e-016,55},
        extent={{-5,5},{5,-5}},
        rotation=270)));
  Modelica.Mechanics.Rotational.Components.Brake brake_1(
    mu_pos=[0,1],
    useSupport=true,
    fn_max=1)
    annotation (Placement(transformation(
        origin={-60,-60},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Mechanics.Rotational.Components.Brake brake_2(
    mu_pos=[0,1],
    useSupport=true,
    fn_max=1)
    annotation (Placement(transformation(
        origin={-60,60},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Mechanics.Rotational.Components.Brake brake_3(
    mu_pos=[0,1],
    useSupport=true,
    fn_max=1)
    annotation (Placement(transformation(
        origin={60,-60},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.Rotational.Components.Brake brake_4(
    mu_pos=[0,1],
    useSupport=true,
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
  VehicleInterfaces.Interfaces.BrakesBus brakesBus
    annotation (Placement(transformation(extent={{-70,10},{-50,30}})));
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
  connect(brake_1.flange_b, wheelHub_1.flange) annotation (Line(points={{-60,-70},{-60,-84},{-60,-99.95},{-60.05,-99.95}}));
  connect(brake_2.flange_a, wheelHub_2.flange) annotation (Line(points={{-60,70},{-60,86},{-60,100.05},{-60.05,100.05}}));
  connect(brake_3.flange_a, wheelHub_3.flange) annotation (Line(points={{60,-70},{60,-99.95},{59.95,-99.95}}));
  connect(brake_4.flange_b, wheelHub_4.flange) annotation (Line(points={{60,70},{60,86},{60,100.05},{59.95,100.05}}));
  connect(positionSensor.flange, brakePedal) annotation (Line(points={{
          9.18485e-016,80},{0,80},{0,100}}, color={0,127,0}));
  connect(positionSensor.s, computeTorque.u) annotation (Line(points={{
          -1.01033e-015,69.5},{1.99036e-015,69.5},{1.99036e-015,61}},   color=
         {0,0,127}));
  connect(wheelSpeed_1.flange, brake_1.flange_a) annotation (Line(points={{
          -60,-50},{-60,-50}}));
  connect(wheelSpeed_2.flange, brake_2.flange_b) annotation (Line(points={{
          -60,50},{-60,50}}));
  connect(wheelSpeed_3.flange, brake_3.flange_b) annotation (Line(points={{60,-50},
          {60,-50}}));
  connect(wheelSpeed_4.flange, brake_4.flange_a) annotation (Line(points={{
          60,50},{60,50}}));
  connect(controlBus.brakesBus, brakesBus) annotation (Line(
      points={{-100.1,60.1},{-90,60.1},{-90,20},{-60,20}},
      color={255,204,51},
      thickness=0.5));
  connect(wheelSpeed_1.w, brakesBus.wheelSpeed_1) annotation (Line(points={{-60,-39.5},{-60,-10},{-60,20.05},{-59.95,20.05}},
        color={0,0,127}));
  connect(wheelSpeed_2.w, brakesBus.wheelSpeed_2) annotation (Line(points={{-60,39.5},{-60,30},{-60,20.05},{-59.95,20.05}},
        color={0,0,127}));
  connect(wheelSpeed_3.w, brakesBus.wheelSpeed_3) annotation (Line(points={{60,-39.5},{60,19},{-59.95,19},{-59.95,20.05}},
        color={0,0,127}));
  connect(wheelSpeed_4.w, brakesBus.wheelSpeed_4) annotation (Line(points={{60,39.5},{60,21},{-59.95,21},{-59.95,20.05}},
        color={0,0,127}));
  connect(torqueReaction_1.frame_a, wheelHub_1.bearingFrame) annotation (Line(
      points={{-75,-80},{-70,-80},{-70,-99.95},{-60.05,-99.95}},
      color={135,135,135},
      thickness=0.5));
  connect(torqueReaction_1.flange_b, brake_1.support) annotation (Line(points=
         {{-80,-75},{-80,-60},{-70,-60}}));
  connect(torqueReaction_2.frame_a, wheelHub_2.bearingFrame) annotation (Line(
      points={{-75,80},{-70,80},{-70,100.05},{-60.05,100.05}},
      color={135,135,135},
      thickness=0.5));
  connect(brake_2.support, torqueReaction_2.flange_b) annotation (Line(points={{-70,60},{-80,60},{-80,75}}));
  connect(torqueReaction_3.frame_a, wheelHub_3.bearingFrame) annotation (Line(
      points={{75,-80},{70,-80},{70,-99.95},{59.95,-99.95}},
      color={135,135,135},
      thickness=0.5));
  connect(torqueReaction_3.flange_b, brake_3.support) annotation (Line(points={{80,-75},
          {80,-60},{70,-60}}));
  connect(torqueReaction_4.frame_a, wheelHub_4.bearingFrame) annotation (Line(
      points={{75,80},{70,80},{70,100.05},{59.95,100.05}},
      color={135,135,135},
      thickness=0.5));
  connect(torqueReaction_4.flange_b, brake_4.support) annotation (Line(points={{80,75},
          {80,60},{70,60}}));
  annotation (
    Documentation(info="<html>
<p>
Brakes subsystem model that uses the physical pedal connection to determine
the brake torque demand being requested by the driver.
</p>
</html>"));
end MinimalBrakesUsingPedal;
