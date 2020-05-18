within VehicleInterfaces.Chassis.Interfaces;
partial model ThreeAxleBase
  "Interface definition for a chassis of a 6 wheeled vehicle"
  extends Base;
public
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_1(
    final includeBearingConnector=includeWheelBearings)
    "Front left wheel"
    annotation (Placement(transformation(
        origin={-90,-100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_2(
    final includeBearingConnector=includeWheelBearings)
    "Front right wheel"
    annotation (Placement(transformation(
        origin={-90,100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_3(
    final includeBearingConnector=includeWheelBearings)
    "Second axle left wheel"
    annotation (Placement(transformation(
        origin={90,-100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_4(
    final includeBearingConnector=includeWheelBearings)
    "Second axle right wheel"
    annotation (Placement(transformation(
        origin={90,100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_5(
    final includeBearingConnector=includeWheelBearings)
    "Third axle left wheel"
    annotation (Placement(transformation(
        origin={250,-100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_6(
    final includeBearingConnector=includeWheelBearings)
    "Third axle right wheel"
    annotation (Placement(transformation(
        origin={250,100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Mechanics.MultiBody.MultiBodyEnd end_1(
    includeBearingConnector=includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{-118,-108},{-106,-92}})));
  Mechanics.MultiBody.MultiBodyEnd end_2(
    includeBearingConnector=includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{-118,92},{-106,108}})));
  Mechanics.MultiBody.MultiBodyEnd end_3(
    includeBearingConnector=includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{62,-108},{74,-92}})));
  Mechanics.MultiBody.MultiBodyEnd end_4(
    includeBearingConnector=includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{62,92},{74,108}})));
  Mechanics.MultiBody.MultiBodyEnd end_5(
    includeBearingConnector=includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{223,92},{235,108}})));
  Mechanics.MultiBody.MultiBodyEnd end_6(
    includeBearingConnector=includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{223,-108},{235,-92}})));
equation
  connect(end_1.flange, wheelHub_1) annotation (Line(
      points={{-110,-100},{-90,-100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_2.flange, wheelHub_2) annotation (Line(
      points={{-110,100},{-90,100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_3.flange, wheelHub_3) annotation (Line(
      points={{70,-100},{90,-100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_4.flange, wheelHub_4) annotation (Line(
      points={{70,100},{90,100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_6.flange, wheelHub_5) annotation (Line(
      points={{231,-100},{250,-100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_5.flange, wheelHub_6) annotation (Line(
      points={{231,100},{250,100}},
      color={135,135,135},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-160,-100},{320,100}},
        grid={1,1}), graphics={
        Rectangle(
          extent={{-119,108},{-105,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{61,108},{75,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{-119,-92},{-105,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{61,-92},{75,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{222,108},{236,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{222,-92},{236,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot)}),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-160,-100},{320,100}},
        grid={1,1})),
    Documentation(info="<html>
<p>
This partial model defines the interfaces required for the chassis subsystem
of a&nbsp;three axled vehicle within the VehicleInterfaces package. See the
<a href=\"modelica://VehicleInterfaces.Chassis\">documentation</a> and
<a href=\"modelica://VehicleInterfaces.Chassis.Tutorial\">tutorial</a>
for more information.
</p>
</html>"));
end ThreeAxleBase;
