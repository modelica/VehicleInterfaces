within VehicleInterfaces.DriverEnvironments;
model DriveByWireAutomaticExternalDriver
  "Minimal drive-by-wire driver-vehicle interface with external driver model"
  extends VehicleInterfaces.Icons.DriverEnvironment;
  extends Interfaces.BaseAutomaticTransmissionExternalDriver;

public
  Mechanics.NormalisedTranslational.PositionSensor acceleratorPosition
    annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
  Mechanics.NormalisedTranslational.PositionSensor brakePosition
    annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
  Modelica.Blocks.Routing.IntegerPassThrough gearboxMode annotation (Placement(transformation(
          extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Routing.IntegerPassThrough requestedGear
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Modelica.Blocks.Routing.IntegerPassThrough ignition annotation (Placement(transformation(
          extent={{-40,-70},{-20,-50}})));
protected
  VehicleInterfaces.Interfaces.DriverBus driverBus
    annotation (Placement(transformation(extent={{50,50},{70,70}})));
equation
  connect(driverBus, controlBus.driverBus) annotation (Line(
      points={{60,60},{80,60},{80,59.9},{100.1,59.9}},
      color={255,204,51},
      thickness=0.5));
  connect(driverInterface.gearboxMode, gearboxMode.u) annotation (
      Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}),
      Line(points={{-100,0},{-42,0}}, color={255,127,0}));
  connect(gearboxMode.y, driverBus.gearboxMode) annotation (
      Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}),
      Line(points={{-19,0},{58,0},{58,60.05},{60.05,60.05}}, color={255,127,0}));
  connect(driverInterface.requestedGear, requestedGear.u) annotation (
      Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}),
      Line(points={{-100,0},{-100,-2},{-80,-2},{-80,-30},{-42,-30}}, color={255,127,0}));
  connect(requestedGear.y, driverBus.requestedGear) annotation (
      Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}),
      Line(points={{-19,-30},{60.05,-30},{60.05,60.05}}, color={255,127,0}));
  connect(driverInterface.ignition, ignition.u) annotation (
      Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}),
      Line(points={{-100,0},{-100,-4},{-82,-4},{-82,-60},{-42,-60}}, color={255,127,0}));
  connect(ignition.y, driverBus.ignition) annotation (
      Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}),
      Line(points={{-19,-60},{62,-60},{62,60},{60,60}}, color={255,127,0}));
  connect(driverInterface.brakePedal, brakePosition.flange_a) annotation (Line(
      points={{-100,0},{-98,0},{-98,2},{-80,2},{-80,40},{-40,40}},
      color={0,127,0}), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(driverInterface.acceleratorPedal, acceleratorPosition.flange_a)
    annotation (Line(
      points={{-100,0},{-100,4},{-82,4},{-82,60},{-40,60}},
      color={0,127,0}), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(acceleratorPosition.position, driverBus.acceleratorPedalPosition)
    annotation (Line(
      points={{-19,60},{60,60}},
      color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(brakePosition.position, driverBus.brakePedalPosition) annotation (
      Line(
      points={{-19,40},{56,40},{56,60},{60,60}},
      color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  annotation (
    Documentation(info="<html>
<p>
Driver environment that requires an external driver model. Signals received
from external driver model are simply propagated throug withouth any
modification.
</p>
</html>"));
end DriveByWireAutomaticExternalDriver;
