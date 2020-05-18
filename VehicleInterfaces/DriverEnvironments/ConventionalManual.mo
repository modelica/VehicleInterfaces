within VehicleInterfaces.DriverEnvironments;
model ConventionalManual
  "Minimal Driver-Vehicle Interface, manual transmission, uses physical pedal connections"
  import VehicleInterfaces;
  extends VehicleInterfaces.Icons.DriverEnvironment;
  extends Interfaces.BaseManualTransmission(
    includeManualShiftConnector=true,
    includeAcceleratorPedal=true,
    includeBrakePedal=true,
    includeClutchPedal=true);

public
  parameter Real initialAccelRequest(min=0, max=1) = 1 "Initial accelerator pedal position";
  parameter Real initialBrakeRequest(min=0, max=1) = 0 "Initial brake pedal position";
  parameter Real finalAccelRequest(min=0, max=1) = 1 "Final accelerator pedal position";
  parameter Real finalBrakeRequest(min=0, max=1) = 0 "Final brake pedal position";
  parameter SI.Time accelTime=10 "Time of accel apply";
  parameter SI.Time brakeTime=10 "Time of brake apply";
  parameter VehicleInterfaces.Types.Gear selectedGear=2
    "Requested gear in manual mode";
  parameter Real clutchRequest=0
    "Clutch position (constant during simulation)";

  Modelica.Blocks.Sources.Step brakeDemand(
    height=finalBrakeRequest,
    offset=initialBrakeRequest,
    startTime=brakeTime) annotation (Placement(transformation(
        origin={40,-20},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Blocks.Sources.Step acceleratorDemand(
    height=finalAccelRequest,
    offset=initialAccelRequest,
    startTime=accelTime)
    annotation (Placement(transformation(
        origin={-80,-20},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Blocks.Sources.IntegerConstant gear(k=selectedGear)
    annotation (Placement(transformation(
        origin={0,-20},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Blocks.Sources.Constant clutchDemand(k=clutchRequest)
    annotation (Placement(transformation(
        origin={-40,-20},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  VehicleInterfaces.Interfaces.ShiftInput shiftInput
    annotation (Placement(transformation(
        origin={0,-60},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.Translational.Sources.Position acceleratorPosition
    annotation (Placement(transformation(
        origin={-80,-60},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Mechanics.Translational.Sources.Position clutchPosition
    annotation (Placement(transformation(
        origin={-40,-60},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Mechanics.Translational.Sources.Position brakePosition
    annotation (Placement(transformation(
        origin={40,-60},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Blocks.Sources.IntegerStep ignition(
    height=-1,
    startTime=0.5,
    offset=VehicleInterfaces.Types.IgnitionSetting.Start)
    annotation (Placement(transformation(extent={{0,50},{20,70}})));
protected
  VehicleInterfaces.Interfaces.DriverBus driverBus
    annotation (Placement(transformation(extent={{50,50},{70,70}})));
equation
  connect(acceleratorDemand.y, acceleratorPosition.s_ref) annotation (Line(
        points={{-80,-31},{-80,-48}}, color={0,0,127}));
  connect(acceleratorPosition.flange,   acceleratorPedal) annotation (Line(
        points={{-80,-70},{-80,-100}}, color={0,127,0}));
  connect(brakeDemand.y, brakePosition.s_ref) annotation (Line(points={{40,
          -31},{40,-48}}, color={0,0,127}));
  connect(brakePosition.flange,   brakePedal) annotation (Line(points={{40,
          -70},{40,-100}}, color={0,127,0}));
  connect(clutchDemand.y, clutchPosition.s_ref) annotation (Line(points={{-40,
          -31},{-40,-48}}, color={0,0,127}));
  connect(clutchPosition.flange,   clutchPedal) annotation (Line(points={{-40,
          -70},{-40,-100}}, color={0,127,0}));
  connect(shiftInput.shiftConnector, shiftConnector) annotation (Line(points={{
          -6.12323e-016,-70},{0,-70},{0,-100}}));
  connect(gear.y, shiftInput.gear) annotation (Line(points={{-2.02067e-015,
          -31},{7.34788e-016,-31},{7.34788e-016,-48}}, color={255,127,0}));
  connect(controlBus.driverBus, driverBus) annotation (Line(
      points={{100.1,59.9},{80,59.9},{80,60},{60,60}},
      color={255,204,51},
      thickness=0.5));

  connect(ignition.y, driverBus.ignition) annotation (Line(points={{21,60},{21,60.05},{60.05,60.05}},
                   color={255,127,0}));

  annotation (
    Documentation(info="<html>
<p>
Constant acceleration driver with the capabilitiy to step between two
constant throttle values. Fixed gear and constant clutch position.
</p>
</html>"));
end ConventionalManual;
