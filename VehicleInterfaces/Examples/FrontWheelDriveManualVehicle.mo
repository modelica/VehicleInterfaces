within VehicleInterfaces.Examples;
model FrontWheelDriveManualVehicle
  "A conventional front-wheel drive manual transmission vehicle including the powertrain mounting systems"
  extends Modelica.Icons.Example;

  replaceable Engines.MinimalEngineUsingPedal engine
    constrainedby VehicleInterfaces.Engines.Interfaces.Base
    "Engine subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-110,-20},{-80,10}})));
  replaceable Transmissions.SingleGearManualTransmission transmission(
    clutch(
      phi_rel(fixed=true)))
    constrainedby VehicleInterfaces.Transmissions.Interfaces.BaseManualTransmission
    "Transmission subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="PlantModels"),
      Placement(transformation(extent={{-60,-20},{-30,10}})));
  replaceable Chassis.MinimalChassis3 chassis(
    constraint(v(fixed=true)))
    constrainedby VehicleInterfaces.Chassis.Interfaces.TwoAxleBase
    "Chassis subsystem"
    annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{40,-30},{100,10}})));
  replaceable Drivelines.MinimalDriveline driveline(
    usingMultiBodyChassis=true)
    constrainedby VehicleInterfaces.Drivelines.Interfaces.TwoAxleBase
    "Driveline subsystem"
    annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-10,-20},{20,10}})));
  replaceable Brakes.MinimalBrakesUsingPedal brakes(
    usingMultiBodyChassis=true)
    constrainedby VehicleInterfaces.Brakes.Interfaces.TwoAxleBase
    "Brakes subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{120,-20},{150,10}})));
  replaceable Accessories.MinimalAccessories accessories
    constrainedby VehicleInterfaces.Accessories.Interfaces.Base
    "Accessories subsystem"
    annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-144,-15},{-124,5}})));
  replaceable DriverEnvironments.ConventionalManual driverEnvironment(
    acceleratorPosition(v(fixed=true)),
    clutchPosition(v(fixed=true)),
    brakePosition(v(fixed=true)))
    constrainedby VehicleInterfaces.DriverEnvironments.Interfaces.BaseManualTransmission
    "Driver environment" annotation (
      choicesAllMatching=true,
      Dialog(group="Driver Models"),
      Placement(transformation(extent={{0,60},{30,90}})));
  replaceable PowertrainMounts.ThreeSystemRigidMount powertrainMounts
    constrainedby PowertrainMounts.Interfaces.TripleSystemMount
    "Powertrain mounting system" annotation (
    choicesAllMatching=true,
    Dialog(group="Plant Models"),
    Placement(transformation(extent={{-60,-55},{-30,-40}})));
  inner replaceable Roads.FlatRoad road
    constrainedby VehicleInterfaces.Roads.Interfaces.Base
    "Road models" annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-120,-100},{-80,-80}})));
  inner replaceable Atmospheres.ConstantAtmosphere atmosphere
    constrainedby VehicleInterfaces.Atmospheres.Interfaces.Base
    "Atmospheric model"
    annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-70,-100},{-30,-80}})));
  inner replaceable Modelica.Mechanics.MultiBody.World world(
    enableAnimation=false,
    n={0,0,-1},
    driveTrainMechanics3D=true)
    constrainedby Modelica.Mechanics.MultiBody.World
    "Global co-ordinate system" annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-150,-100},{-130,-80}})));
protected
  Interfaces.ControlBus controlBus "Control bus connector"
    annotation (Placement(transformation(
        origin={-150,30},
        extent={{-20,-20},{20,20}},
        rotation=90), iconTransformation(
        extent={{0,0},{0,0}},
        rotation=90,
        origin={-100,60})));
equation
  connect(accessories.engineFlange, engine.accessoryFlange) annotation (Line(
        points={{-124,-5},{-110,-5}}));
  connect(engine.transmissionFlange, transmission.engineFlange)
    annotation (Line(points={{-80,-5},{-60,-5}}));
  connect(transmission.drivelineFlange, driveline.transmissionFlange)
    annotation (Line(points={{-30,-5},{-10,-5}}));
  connect(chassis.wheelHub_2, driveline.wheelHub_2) annotation (Line(
      points={{53.125,10},{53.125,25},{-4,25},{-4,10}},
      color={135,135,135},
      thickness=0.5));
  connect(driveline.wheelHub_4, chassis.wheelHub_4) annotation (Line(
      points={{14,10},{14,20},{86.875,20},{86.875,10}},
      color={135,135,135},
      thickness=0.5));
  connect(chassis.wheelHub_4, brakes.wheelHub_4) annotation (Line(
      points={{86.875,10},{86.875,20},{144,20},{144,10}},
      color={135,135,135},
      thickness=0.5));
  connect(brakes.wheelHub_2, chassis.wheelHub_2) annotation (Line(
      points={{126,10},{126,25},{53.125,25},{53.125,10}},
      color={135,135,135},
      thickness=0.5));
  connect(driveline.wheelHub_3, chassis.wheelHub_3) annotation (Line(
      points={{14,-20},{14,-40},{86.875,-40},{86.875,-30}},
      color={135,135,135},
      thickness=0.5));
  connect(chassis.wheelHub_1, driveline.wheelHub_1) annotation (Line(
      points={{53.125,-30},{53.125,-45},{-4,-45},{-4,-20}},
      color={135,135,135},
      thickness=0.5));
  connect(chassis.wheelHub_3, brakes.wheelHub_3) annotation (Line(
      points={{86.875,-30},{86.875,-40},{144,-40},{144,-20}},
      color={135,135,135},
      thickness=0.5));
  connect(chassis.wheelHub_1, brakes.wheelHub_1) annotation (Line(
      points={{53.125,-30},{53.125,-45},{126,-45},{126,-20}},
      color={135,135,135},
      thickness=0.5));
  connect(controlBus, engine.controlBus) annotation (Line(
      points={{-150,30},{-120,30},{-120,4},{-110,4}},
      color={255,204,51},
      thickness=0.5));
  connect(controlBus, transmission.controlBus) annotation (Line(
      points={{-150,30},{-70,30},{-70,4},{-60,4}},
      color={255,204,51},
      thickness=0.5));
  connect(controlBus, driveline.controlBus) annotation (Line(
      points={{-150,30},{-20,30},{-20,4},{-10,4}},
      color={255,204,51},
      thickness=0.5));
  connect(controlBus, chassis.controlBus) annotation (Line(
      points={{-150,30},{34,30},{34,2},{40.375,2}},
      color={255,204,51},
      thickness=0.5));
  connect(controlBus, brakes.controlBus) annotation (Line(
      points={{-150,30},{110,30},{110,4},{120,4}},
      color={255,204,51},
      thickness=0.5));
  connect(accessories.controlBus, controlBus) annotation (Line(
      points={{-144,1},{-150,1},{-150,30}},
      color={255,204,51},
      thickness=0.5));
  connect(controlBus, driverEnvironment.controlBus) annotation (Line(
      points={{-150,30},{80,30},{80,84},{30,84}},
      color={255,204,51},
      thickness=0.5));
  connect(driverEnvironment.acceleratorPedal, engine.acceleratorPedal)
    annotation (Line(points={{3,60},{3,50},{-95,50},{-95,10}}, color={0,127,0}));
  connect(driverEnvironment.clutchPedal, transmission.clutchPedal)
    annotation (Line(points={{9,60},{9,47},{-54,47},{-54,10}}, color={0,127,0}));
  connect(driverEnvironment.shiftConnector, transmission.shiftConnector)
    annotation (Line(points={{15,60},{15,44},{-45,44},{-45,10}}));
  connect(driverEnvironment.brakePedal, brakes.brakePedal) annotation (Line(
        points={{21,60},{21,50},{135,50},{135,10}}, color={0,127,0}));
  connect(driverEnvironment.steeringWheel, chassis.steeringWheel) annotation (Line(
        points={{30,75},{70,75},{70,10}}));
  connect(driverEnvironment.chassisFrame, chassis.chassisFrame) annotation (Line(
      points={{27,60},{27,-24},{40,-24}},
      color={95,95,95},
      thickness=0.5));
  connect(powertrainMounts.chassisFrame, chassis.chassisFrame) annotation (Line(
      points={{-45,-55},{-45,-60},{27,-60},{27,-24},{40,-24}},
      color={95,95,95},
      thickness=0.5));
  connect(engine.engineMount, powertrainMounts.mount_1) annotation (Line(
      points={{-95,-20},{-95,-30},{-54,-30},{-54,-40}},
      color={95,95,95},
      thickness=0.5));
  connect(transmission.transmissionMount, powertrainMounts.mount_2)
    annotation (Line(
      points={{-45,-20},{-45,-40}},
      color={95,95,95},
      thickness=0.5));
  connect(driveline.drivelineMount, powertrainMounts.mount_3) annotation (Line(
      points={{5,-20},{5,-30},{-36,-30},{-36,-40}},
      color={95,95,95},
      thickness=0.5));

  annotation (
    experiment(StopTime=10),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-150,-100},{170,100}},
        grid={1,1})),
    Documentation(info="<html>
<p>
Example model architecture of a&nbsp;front wheel drive passenger car with
an automatic transmission. In this architecture variant the PowerTrain
systems can be elastically mounted in the chassis when MultiBody effects
are included.
</p>
</html>"));
end FrontWheelDriveManualVehicle;
