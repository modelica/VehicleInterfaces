within VehicleInterfaces.DriverEnvironments;
model DriveByWireAutomatic "Minimal Drive-by-wire Driver-Vehicle Interface"
  extends .VehicleInterfaces.Icons.DriverEnvironment;
  extends .VehicleInterfaces.DriverEnvironments.Interfaces.BaseAutomaticTransmission;
public
  parameter Real initialAccelRequest(
    min=0,
    max=1) = 1 "Initial accelerator pedal position";
  parameter Real initialBrakeRequest(
    min=0,
    max=1) = 0 "Initial brake pedal position";
  parameter Real finalAccelRequest(
    min=0,
    max=1) = 1 "Final accelerator pedal position";
  parameter Real finalBrakeRequest(
    min=0,
    max=1) = 0 "Final brake pedal position";
  parameter SI.Time accelTime=10 "Time of accel apply";
  parameter SI.Time brakeTime=10 "Time of brake apply";
  parameter VehicleInterfaces.Types.GearMode.Temp selectedGearboxMode=
    VehicleInterfaces.Types.GearMode.Drive "Current gearbox mode";
  parameter VehicleInterfaces.Types.Gear manualGearRequest=0
    "Requested gear in manual mode";

  Modelica.Blocks.Sources.Step brakeDemand(
    height=finalBrakeRequest,
    offset=initialBrakeRequest,
    startTime=brakeTime) annotation (Placement(transformation(extent={{-60,50},
            {-40,70}})));
  Modelica.Blocks.Sources.Step acceleratorDemand(
    height=finalAccelRequest,
    offset=initialAccelRequest,
    startTime=accelTime) annotation (Placement(transformation(extent={{-20,70},
            {0,90}})));

  Modelica.Blocks.Sources.IntegerConstant gearSelect(k=manualGearRequest)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Sources.IntegerConstant gearMode(k=selectedGearboxMode)
    annotation (Placement(transformation(extent={{-60,10},{-40,30}})));
  Modelica.Blocks.Sources.IntegerStep ignition(
    height=-1,
    startTime=0.5,
    offset=VehicleInterfaces.Types.IgnitionSetting.Start)
    annotation (Placement(transformation(extent={{-20,30},{0,50}})));
protected
  VehicleInterfaces.Interfaces.DriverBus driverBus
    annotation (Placement(transformation(extent={{50,50},{70,70}})));
equation
  connect(controlBus.driverBus, driverBus) annotation (Line(
      points={{100.1,59.9},{80,60},{60,60}},
      color={255,204,51},
      thickness=0.5));
  connect(acceleratorDemand.y, driverBus.acceleratorPedalPosition)
    annotation (Line(points={{1,80},{60,80},{60,62},{60,60}},
                                                color={0,0,127}));
  connect(gearSelect.y, driverBus.requestedGear) annotation (Line(points={{1,0},{64,0},{64,60.05},{60.05,60.05}},
                                              color={255,127,0}));
  connect(driverBus.brakePedalPosition, brakeDemand.y) annotation (Line(
        points={{60,60},{-39,60}},                               color={0,0,
          127}));
  connect(gearMode.y, driverBus.gearboxMode) annotation (Line(points={{-39,20},{62,20},{62,60.05},{60.05,60.05}},
                                   color={255,127,0}));
  connect(ignition.y, driverBus.ignition) annotation (Line(points={{1,40},{60,
          40},{60,60}}, color={255,127,0}));

  annotation (
    Documentation(info="<html>
<p>Constant acceleration driver with the capabilitiy to step between two constant throttle values and to step on/off the brakes.</p>
</html>"));
end DriveByWireAutomatic;
