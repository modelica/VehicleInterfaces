within VehicleInterfaces.Examples;
model SeriesHybrid "Series hybrid vehicle model"
  extends VehicleInterfaces.Examples.PartialVehicle(
    redeclare DriverEnvironments.DriveByWireAutomatic driverEnvironment(
      initialAccelRequest=0,
      finalAccelRequest=0.9,
      accelTime=2),
    chassis(
      body(v(fixed=true))));
  replaceable Engines.MinimalEngine engine(
    flywheel(phi(fixed=true)))
    constrainedby VehicleInterfaces.Engines.Interfaces.Base "Engine model"
    annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-98,50},{-68,80}})));
  replaceable Accessories.MinimalAccessories accessories
    constrainedby VehicleInterfaces.Accessories.Interfaces.Base
    "Accessories model"
    annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-138,55},{-118,75}})));
  replaceable VehicleInterfaces.ElectricDrives.SimpleMotorDC generator(
    inductor(i(start=0, fixed=true)))
    constrainedby ElectricDrives.Interfaces.BaseDCMachine
    "Generator subsystem"
    annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-20,80},{-50,50}})));
  replaceable VehicleInterfaces.ElectricDrives.SimpleMotorDC driveMotor(
    inductor(i(start=0, fixed=true)))
    constrainedby ElectricDrives.Interfaces.BaseDCMachine
    "Traction motor subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-70,-40},{-40,-10}})));
  replaceable EnergyStorage.Battery battery(V=1)
    constrainedby EnergyStorage.Interfaces.Base
    "Energy storage subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-130,-6},{-100,24}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-100,-24},{-80,-4}})));
equation
  connect(controlBus, engine.controlBus) annotation (Line(
      points={{-150,30},{-109,30},{-109,74},{-98,74}},
      color={255,204,51},
      thickness=0.5));
  connect(accessories.controlBus, controlBus) annotation (Line(
      points={{-138,71},{-150,71},{-150,30}},
      color={255,204,51},
      thickness=0.5));
  connect(driverEnvironment.acceleratorPedal, engine.acceleratorPedal)
    annotation (Line(points={{23,50},{23,44},{0,44},{0,90},{-83,90},{-83,80}},
        color={0,127,0}));
  connect(driveMotor.shaft_b, driveline.transmissionFlange) annotation (Line(
      points={{-40,-25},{-6,-25}},
      color={135,135,135},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(generator.controlBus, controlBus) annotation (Line(
      points={{-20,74},{-12,74},{-12,30},{-150,30}},
      color={255,204,51},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(driveMotor.controlBus, controlBus) annotation (Line(
      points={{-70,-34},{-150,-34},{-150,30}},
      color={255,204,51},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(generator.shaft_b, engine.transmissionFlange) annotation (Line(
      points={{-50,65},{-68,65}},
      color={135,135,135},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(battery.pin_p, generator.pin_p) annotation (Line(
      points={{-100,18},{-44,18},{-44,50}},
      color={0,0,255}));
  connect(battery.pin_p, driveMotor.pin_p) annotation (Line(
      points={{-100,18},{-46,18},{-46,-10}},
      color={0,0,255}));
  connect(battery.pin_n, driveMotor.pin_n) annotation (Line(
      points={{-100,0},{-64,0},{-64,-10}},
      color={0,0,255}));
  connect(battery.pin_n, generator.pin_n) annotation (Line(
      points={{-100,0},{-26,0},{-26,50}},
      color={0,0,255}));
  connect(battery.pin_n, ground.p) annotation (Line(
      points={{-100,0},{-90,0},{-90,-4}},
      color={0,0,255}));
  connect(battery.controlBus, controlBus.batteryBus) annotation (Line(
      points={{-130,0},{-150,0},{-150,30}},
      color={255,204,51},
      thickness=0.5));
  connect(accessories.engineFlange, engine.accessoryFlange) annotation (Line(
      points={{-118,65},{-98,65}},
      color={135,135,135},
      thickness=0.5));
  connect(engine.engineMount, chassis.chassisFrame) annotation (Line(
      points={{-83,50},{-83,40},{27,40},{27,-44},{44,-44}},
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
Example model architecture of a passenger car with a&nbsp;series hybrid
powertrain. In this architecture variant the PowerTrain systems are
rigidly mounted to the chassis when MultiBody effects are included.
</p>
</html>"));
end SeriesHybrid;
