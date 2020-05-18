within VehicleInterfaces.Examples;
model RearWheelDriveAutomaticVehicle
  "A conventional front-wheel drive automatic transmission vehicle with separate powertrain mounting system for the front axle and engine-transmission systems"
  extends Modelica.Icons.Example;

  replaceable Engines.MinimalEngine engine
    constrainedby VehicleInterfaces.Engines.Interfaces.Base
    "Engine subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-110,-20},{-80,10}})));
  replaceable Transmissions.SingleGearAutomaticTransmission transmission
    constrainedby VehicleInterfaces.Transmissions.Interfaces.BaseAutomaticTransmission
    "Transmission subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-60,-20},{-30,10}})));
  replaceable Chassis.MinimalChassis3 chassis
    constrainedby VehicleInterfaces.Chassis.Interfaces.TwoAxleBase
    "Chassis subsystem"
    annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{40,-30},{100,10}})));
  replaceable Drivelines.MinimalDriveline driveline(
    usingMultiBodyChassis=true)
    constrainedby VehicleInterfaces.Drivelines.Interfaces.TwoAxleBase
    "Driveline subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-10,-20},{20,10}})));
  replaceable Brakes.MinimalBrakes brakes(usingMultiBodyChassis=true)
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
      Placement(transformation(extent={{-150,-15},{-130,5}})));
  replaceable DriverEnvironments.DriveByWireAutomaticExternalDriver driverEnvironment
    constrainedby VehicleInterfaces.DriverEnvironments.Interfaces.BaseAutomaticTransmissionExternalDriver
    "Driver environment" annotation (
      choicesAllMatching=true,
      Dialog(group="Driver Models"),
      Placement(transformation(extent={{0,60},{30,90}})));
  replaceable PowertrainMounts.TwoSystemRigidMount engineTransmissionMount
    constrainedby PowertrainMounts.Interfaces.DualSystemMount
    "Engine and Transmission mounting system" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-100,-55},{-40,-40}})));
  replaceable PowertrainMounts.SingleSystemRigidMount diffMount
    constrainedby PowertrainMounts.Interfaces.SingleSystemMount
    "Differential mounting system" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{0,-54},{10,-40}})));
  replaceable Drivers.MinimalDriver driver
    constrainedby Drivers.Interfaces.Base
    "Driver model"
    annotation (
      choicesAllMatching=true,
      Dialog(group="Driver Models"),
      Placement(transformation(extent={{-70,60},{-40,90}})));
  inner replaceable Roads.FlatRoad road
    constrainedby VehicleInterfaces.Roads.Interfaces.Base
    "Road model" annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-120,-100},{-80,-80}})));
  inner replaceable Atmospheres.ConstantAtmosphere atmosphere
    constrainedby VehicleInterfaces.Atmospheres.Interfaces.Base
    "Atmospheric model"
    annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-60,-100},{-20,-80}})));
  inner replaceable Modelica.Mechanics.MultiBody.World world(
    enableAnimation=false,
    n={0,0,-1},
    driveTrainMechanics3D=false)
    constrainedby Modelica.Mechanics.MultiBody.World
    "Global co-ordinate system" annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-150,-100},{-130,-80}})));
protected
  Interfaces.ControlBus controlBus "Control bus connector"
    annotation (Placement(transformation(
        origin={-160,40},
        extent={{-20,-20},{20,20}},
        rotation=90), iconTransformation(
        extent={{0,0},{0,0}},
        rotation=90,
        origin={-100,60})));
equation
  connect(accessories.engineFlange, engine.accessoryFlange) annotation (Line(
        points={{-130,-5},{-110,-5}}));
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
      points={{14,-20},{14,-45},{86.875,-45},{86.875,-30}},
      color={135,135,135},
      thickness=0.5));
  connect(chassis.wheelHub_1, driveline.wheelHub_1) annotation (Line(
      points={{53.125,-30},{53.125,-70},{-4,-70},{-4,-20}},
      color={135,135,135},
      thickness=0.5));
  connect(chassis.wheelHub_3, brakes.wheelHub_3) annotation (Line(
      points={{86.875,-30},{86.875,-45},{144,-45},{144,-20}},
      color={135,135,135},
      thickness=0.5));
  connect(chassis.wheelHub_1, brakes.wheelHub_1) annotation (Line(
      points={{53.125,-30},{53.125,-70},{126,-70},{126,-20}},
      color={135,135,135},
      thickness=0.5));
  connect(controlBus, engine.controlBus) annotation (Line(
      points={{-160,40},{-120,40},{-120,4},{-110,4}},
      color={255,204,51},
      thickness=0.5));
  connect(controlBus, transmission.controlBus) annotation (Line(
      points={{-160,40},{-67,40},{-67,4},{-60,4}},
      color={255,204,51},
      thickness=0.5));
  connect(controlBus, driveline.controlBus) annotation (Line(
      points={{-160,40},{-20,40},{-20,4},{-10,4}},
      color={255,204,51},
      thickness=0.5));
  connect(controlBus, chassis.controlBus) annotation (Line(
      points={{-160,40},{34,40},{34,2},{40.375,2}},
      color={255,204,51},
      thickness=0.5));
  connect(controlBus, brakes.controlBus) annotation (Line(
      points={{-160,40},{110,40},{110,4},{120,4}},
      color={255,204,51},
      thickness=0.5));
  connect(accessories.controlBus, controlBus) annotation (Line(
      points={{-150,1},{-160,1},{-160,40}},
      color={255,204,51},
      thickness=0.5));
  connect(controlBus, driverEnvironment.controlBus) annotation (Line(
      points={{-160,40},{80,40},{80,84},{30,84}},
      color={255,204,51},
      thickness=0.5));
  connect(driverEnvironment.acceleratorPedal, engine.acceleratorPedal)
    annotation (Line(points={{3,60},{3,50},{-95,50},{-95,10}}, color={0,127,0}));
  connect(driverEnvironment.brakePedal, brakes.brakePedal) annotation (Line(
        points={{21,60},{21,50},{135,50},{135,10}}, color={0,127,0}));
  connect(driverEnvironment.steeringWheel, chassis.steeringWheel) annotation (Line(
        points={{30,75},{70,75},{70,10}}));
  connect(driverEnvironment.chassisFrame, chassis.chassisFrame) annotation (Line(
      points={{27,60},{27,-24},{40,-24}},
      color={95,95,95},
      thickness=0.5));
  connect(engineTransmissionMount.chassisFrame, chassis.chassisFrame)
    annotation (Line(
      points={{-70,-55},{-70,-65},{27,-65},{27,-24},{40,-24}},
      color={95,95,95},
      thickness=0.5));
  connect(diffMount.chassisFrame, chassis.chassisFrame) annotation (Line(
      points={{5,-54},{5,-65},{27,-65},{27,-24},{40,-24}},
      color={95,95,95},
      thickness=0.5));
  connect(engineTransmissionMount.mount_2, transmission.transmissionMount)
    annotation (Line(
      points={{-50,-40},{-50,-30},{-45,-30},{-45,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(engineTransmissionMount.mount_1, engine.engineMount) annotation (Line(
      points={{-90,-40},{-90,-30},{-95,-30},{-95,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(diffMount.mount_1, driveline.drivelineMount) annotation (Line(
      points={{5,-40},{5,-20}},
      color={95,95,95},
      thickness=0.5));

  connect(driverEnvironment.driverInterface, driver.driverInterface)
    annotation (Line(
      points={{0,75},{-20,75},{-20,75},{-40,75}},
      color={85,85,255},
      thickness=0.5));
  annotation (
    experiment(StopTime=10),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-160,-100},{160,100}},
        grid={1,1})),
    Documentation(info="<html>
<p>
Example model architecture of a&nbsp;rear wheel drive passenger car with
an automatic transmission. In this architecture variant the PowerTrain
systems can be elastically mounted in the chassis when MultiBody effects
are included.
</p>
</html>"));
end RearWheelDriveAutomaticVehicle;
