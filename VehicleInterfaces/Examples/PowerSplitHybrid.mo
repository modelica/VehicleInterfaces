within VehicleInterfaces.Examples;
model PowerSplitHybrid "Power-split hybrid vehicle model"
  extends VehicleInterfaces.Examples.PartialVehicle(chassis(body(v(fixed=true))));
  replaceable Engines.MinimalEngine engine(
    flywheel(phi(fixed=true)))
    constrainedby VehicleInterfaces.Engines.Interfaces.Base
    "Engine subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-100,60},{-70,90}})));
  replaceable Accessories.MinimalAccessories accessories
    constrainedby VehicleInterfaces.Accessories.Interfaces.Base
    "Accessories subsystem"
    annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-141,65},{-121,85}})));
  replaceable VehicleInterfaces.ElectricDrives.SimpleMotorDC motor1(
    inductor(
      i(start=0, fixed=true)))
    constrainedby ElectricDrives.Interfaces.BaseDCMachine "Electric Motor 1"
    annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-101,26},{-71,-6}})));
  replaceable VehicleInterfaces.ElectricDrives.SimpleMotorDC motor2(
    inductor(
      i(start=0, fixed=true)))
    constrainedby ElectricDrives.Interfaces.BaseDCMachine "Electric Motor 2"
    annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-101,-67},{-71,-39}})));
  replaceable Transmissions.PowerSplitDevice powerSplitDevice
    constrainedby Transmissions.Interfaces.BaseTwoInputTransmission
    "Power-split device"
    annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-54,-40},{-24,-10}})));
  replaceable EnergyStorage.Battery battery(V=1)
    constrainedby EnergyStorage.Interfaces.Base "Energy storage subsystem"
    annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-141,-36},{-111,-6}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-114,-65},{-94,-45}})));
equation
  connect(accessories.engineFlange, engine.accessoryFlange) annotation (Line(
        points={{-121,75},{-100,75}}, thickness=0.5));
  connect(controlBus, engine.controlBus) annotation (Line(
      points={{-150,30},{-110,30},{-110,84},{-100,84}},
      color={255,204,51},
      thickness=0.5));
  connect(accessories.controlBus, controlBus) annotation (Line(
      points={{-141,81},{-150,81},{-150,30}},
      color={255,204,51},
      thickness=0.5));
  connect(driverEnvironment.acceleratorPedal, engine.acceleratorPedal)
    annotation (Line(points={{23,50},{23,44},{-40,44},{-40,100},{-85,100},{-85,90}},
        color={0,127,0}));
  connect(motor2.shaft_b, driveline.transmissionFlange) annotation (Line(
      points={{-71,-53},{-15,-53},{-15,-25},{-6,-25}},
      color={135,135,135},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(motor1.controlBus, controlBus) annotation (Line(
      points={{-101,19.6},{-110,20},{-110,30},{-150,30}},
      color={255,204,51},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(motor2.controlBus, controlBus) annotation (Line(
      points={{-101,-61.4},{-150,-61.4},{-150,30}},
      color={255,204,51},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(powerSplitDevice.drivelineFlange, driveline.transmissionFlange)
    annotation (Line(
      points={{-24,-25},{-6,-25}},
      color={135,135,135},
      thickness=0.5));
  connect(powerSplitDevice.motorFlange, motor1.shaft_b) annotation (Line(
      points={{-54,-34},{-65,-34},{-65,10},{-71,10}},
      color={0,127,0},
      thickness=0.5));
  connect(powerSplitDevice.engineFlange, engine.transmissionFlange)
    annotation (Line(
      points={{-54,-25},{-62,-25},{-62,75},{-70,75}},
      color={135,135,135},
      thickness=0.5));
  connect(powerSplitDevice.controlBus, controlBus) annotation (Line(
      points={{-54,-16},{-54,30},{-150,30}},
      color={255,204,51},
      thickness=0.5));
  connect(battery.pin_p, motor1.pin_p) annotation (Line(
      points={{-111,-12},{-77,-12},{-77,-6}},
      color={0,0,255}));
  connect(battery.pin_n, motor1.pin_n) annotation (Line(
      points={{-111,-30},{-95,-30},{-95,-6}},
      color={0,0,255}));
  connect(battery.pin_p, motor2.pin_p) annotation (Line(
      points={{-111,-12},{-77,-12},{-77,-39}},
      color={0,0,255}));
  connect(battery.pin_n, motor2.pin_n) annotation (Line(
      points={{-111,-30},{-95,-30},{-95,-39}},
      color={0,0,255}));
  connect(ground.p, battery.pin_n) annotation (Line(
      points={{-104,-45},{-104,-30},{-111,-30}},
      color={0,0,255}));
  connect(battery.controlBus, controlBus.batteryBus) annotation (Line(
      points={{-141,-30},{-150,-30},{-150,30}},
      color={255,204,51},
      thickness=0.5));
  connect(engine.engineMount, chassis.chassisFrame) annotation (Line(
      points={{-85,60},{-85,40},{31,40},{31,-44},{44,-44}},
      color={95,95,95},
      thickness=0.5));
  connect(powerSplitDevice.transmissionMount, chassis.chassisFrame) annotation (Line(
      points={{-39,-40},{-39,-47},{31,-47},{31,-44},{44,-44}},
      color={95,95,95},
      thickness=0.5));

  annotation (
    experiment(StopTime=10),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-160,-100},{160,100}},
        grid={1,1})),
    Documentation(info="<html>
<p>
Example model architecture of a&nbsp;passenger car with a&nbsp;power-split
hybrid powertrain. In this architecture variant the PowerTrain systems are
rigidly mounted to the chassis when MultiBody effects are included.
</p>
</html>"));
end PowerSplitHybrid;
