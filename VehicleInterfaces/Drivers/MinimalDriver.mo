within VehicleInterfaces.Drivers;
model MinimalDriver "Constant acceleration Driver"
  extends VehicleInterfaces.Icons.Driver;
  extends VehicleInterfaces.Drivers.Interfaces.Base;
  parameter Real initialAccelRequest(min=0, max=1) = 1 "Initial accelerator pedal position";
  parameter Real initialBrakeRequest(min=0, max=1) = 0 "Initial brake pedal position";
  parameter Real finalAccelRequest(min=0, max=1) = 1 "Final accelerator pedal position";
  parameter Real finalBrakeRequest(min=0, max=1) = 0 "Final brake pedal position";
  parameter SI.Time accelTime=10 "Time of accel apply";
  parameter SI.Time brakeTime=10 "Time of brake apply";
  parameter VehicleInterfaces.Types.GearMode.Temp selectedGearboxMode=
      VehicleInterfaces.Types.GearMode.Drive "Current gearbox mode";
  parameter VehicleInterfaces.Types.Gear manualGearRequest=0
    "Requested gear in manual mode";

  Modelica.Blocks.Sources.Step brakeDemand(
    height=finalBrakeRequest,
    offset=initialBrakeRequest,
    startTime=brakeTime) annotation (Placement(transformation(extent={{-40,40},
            {-20,60}})));
  Modelica.Blocks.Sources.Step acceleratorDemand(
    height=finalAccelRequest,
    offset=initialAccelRequest,
    startTime=accelTime) annotation (Placement(transformation(extent={{-40,10},
            {-20,30}})));
  Modelica.Blocks.Sources.Constant steeringAngle(k=0)
    annotation (Placement(transformation(extent={{-40,70},{-20,90}})));
  Modelica.Blocks.Sources.IntegerConstant gearboxMode(k=selectedGearboxMode)
    annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
  Modelica.Blocks.Sources.IntegerConstant requestedGear(k=manualGearRequest)
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Mechanics.NormalisedRotational.Position steeringWheelAngle
    annotation (Placement(transformation(extent={{0,70},{20,90}})));
  Mechanics.NormalisedTranslational.Position brakePosition
    annotation (Placement(transformation(extent={{0,40},{20,60}})));
  Mechanics.NormalisedTranslational.Position acceleratorPosition
    annotation (Placement(transformation(extent={{0,10},{20,30}})));
  Modelica.Blocks.Sources.IntegerStep ignition(
    height=-1,
    startTime=0.5,
    offset=VehicleInterfaces.Types.IgnitionSetting.Start)
    annotation (Placement(transformation(extent={{-40,-90},{-20,-70}})));
equation
  connect(gearboxMode.y, driverInterface.gearboxMode) annotation (
    Line(points={{-19,-20},{98,-20},{98,0},{100,0}}, color={255,127,0}),
    Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(requestedGear.y, driverInterface.requestedGear) annotation (Line(
        points={{-19,-50},{100,-50},{100,0}}, color={255,127,0}),
    Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(ignition.y, driverInterface.ignition) annotation (Line(points={{-19,
          -80},{102,-80},{102,0},{100,0}}, color={255,127,0}),
    Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(steeringAngle.y, steeringWheelAngle.phi_ref) annotation (Line(
        points={{-19,80},{-2,80}}, color={0,0,127}));
  connect(brakeDemand.y, brakePosition.position) annotation (Line(points={{-19,50},
          {-2,50}},         color={0,0,127}));
  connect(acceleratorDemand.y, acceleratorPosition.position) annotation (Line(
        points={{-19,20},{-2,20}}, color={0,0,127}));
  connect(brakePosition.flange_b, driverInterface.brakePedal) annotation (Line(
        points={{20,50},{100,50},{100,0}}, color={0,127,0}),
    Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(acceleratorPosition.flange_b, driverInterface.acceleratorPedal)
    annotation (Line(points={{20,20},{98,20},{98,0},{100,0}},
                                                      color={0,127,0}),
    Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(steeringWheelAngle.flange_b, driverInterface.steeringWheel)
    annotation (Line(points={{20,80},{102,80},{102,0},{100,0}}),
    Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));

  annotation (
    defaultComponentName="driver",
    Documentation(info="<html>
<p>
Constant acceleration driver with the capabilitiy to step between two
constant throttle values.
</p>
</html>"));
end MinimalDriver;
