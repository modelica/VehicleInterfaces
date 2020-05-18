within VehicleInterfaces.Examples;
partial model PartialVehicle
  "Basic model for a four wheeled vehicle, requires powertrain components"
  extends Modelica.Icons.Example;

  replaceable Chassis.MinimalChassis chassis
    constrainedby VehicleInterfaces.Chassis.Interfaces.TwoAxleBase
    "Chassis subsystem"
    annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{44,-50},{104,-10}})));
  replaceable Drivelines.MinimalDriveline driveline
    constrainedby VehicleInterfaces.Drivelines.Interfaces.TwoAxleBase
    "Driveline subsystem"
    annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-6,-40},{24,-10}})));
  replaceable Brakes.MinimalBrakes brakes
    constrainedby VehicleInterfaces.Brakes.Interfaces.TwoAxleBase
    "Brakes subsystem"
    annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{120,-40},{150,-10}})));
  replaceable DriverEnvironments.DriveByWireAutomatic driverEnvironment
    constrainedby VehicleInterfaces.DriverEnvironments.Interfaces.BaseAutomaticTransmission
    "Driver environment" annotation (
      choicesAllMatching=true,
      Dialog(group="Driver Models"),
      Placement(transformation(extent={{20,50},{50,80}})));
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
      Placement(transformation(extent={{-70,-100},{-30,-80}})));
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
        origin={-150,30},
        extent={{-20,-20},{20,20}},
        rotation=90), iconTransformation(
        extent={{0,0},{0,0}},
        rotation=90,
        origin={-100,60})));
equation
  connect(chassis.wheelHub_2, driveline.wheelHub_2) annotation (Line(
      points={{57.125,-10},{57.125,5},{0,5},{0,-10}},
      color={135,135,135},
      thickness=0.5));
  connect(driveline.wheelHub_4, chassis.wheelHub_4) annotation (Line(
      points={{18,-10},{18,0},{90.875,0},{90.875,-10}},
      color={135,135,135},
      thickness=0.5));
  connect(chassis.wheelHub_4, brakes.wheelHub_4) annotation (Line(
      points={{90.875,-10},{90.875,0},{144,0},{144,-10}},
      color={135,135,135},
      thickness=0.5));
  connect(brakes.wheelHub_2, chassis.wheelHub_2) annotation (Line(
      points={{126,-10},{126,5},{57.125,5},{57.125,-10}},
      color={135,135,135},
      thickness=0.5));
  connect(driveline.wheelHub_3, chassis.wheelHub_3) annotation (Line(
      points={{18,-40},{18,-60},{90.875,-60},{90.875,-50}},
      color={135,135,135},
      thickness=0.5));
  connect(chassis.wheelHub_1, driveline.wheelHub_1) annotation (Line(
      points={{57.125,-50},{57.125,-65},{0,-65},{0,-40}},
      color={135,135,135},
      thickness=0.5));
  connect(chassis.wheelHub_3, brakes.wheelHub_3) annotation (Line(
      points={{90.875,-50},{90.875,-60},{144,-60},{144,-40}},
      color={135,135,135},
      thickness=0.5));
  connect(chassis.wheelHub_1, brakes.wheelHub_1) annotation (Line(
      points={{57.125,-50},{57.125,-65},{126,-65},{126,-40}},
      color={135,135,135},
      thickness=0.5));
  connect(controlBus, driveline.controlBus) annotation (Line(
      points={{-150,30},{-10,30},{-10,-16},{-6,-16}},
      color={255,204,51},
      thickness=0.5));
  connect(controlBus, chassis.controlBus) annotation (Line(
      points={{-150,30},{40,30},{40,-18},{44.375,-18}},
      color={255,204,51},
      thickness=0.5));
  connect(controlBus, brakes.controlBus) annotation (Line(
      points={{-150,30},{115,30},{115,-16},{120,-16}},
      color={255,204,51},
      thickness=0.5));
  connect(controlBus, driverEnvironment.controlBus) annotation (Line(
      points={{-150,30},{80,30},{80,74},{50,74}},
      color={255,204,51},
      thickness=0.5));
  connect(driveline.drivelineMount, chassis.chassisFrame) annotation (Line(
      points={{9,-40},{9,-47},{31,-47},{31,-44},{44,-44}},
      color={95,95,95},
      thickness=0.5));
  connect(driverEnvironment.brakePedal, brakes.brakePedal) annotation (Line(
        points={{41,50},{41,44},{135,44},{135,-10}},color={0,127,0}));
  connect(driverEnvironment.steeringWheel, chassis.steeringWheel) annotation (Line(
        points={{50,65},{74,65},{74,-10}}));
  connect(driverEnvironment.chassisFrame, chassis.chassisFrame) annotation (Line(
      points={{47,50},{47,40},{31,40},{31,-44},{44,-44}},
      color={95,95,95},
      thickness=0.5));

  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-160,-100},{160,100}},
        grid={1,1})),
    Documentation(info="<html>
<p>
Base model architecture of a&nbsp;passenger car that can be extended to
add any type of powertrain. In this architecture variant the Driveline
subsystem is rigidly mounted to the chassis when MultiBody effects are
included.
</p>
</html>"));
end PartialVehicle;
