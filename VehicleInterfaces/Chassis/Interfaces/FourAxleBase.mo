within VehicleInterfaces.Chassis.Interfaces;
partial model FourAxleBase
  "Interface definition for a chassis of a 8 wheeled vehicle"
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
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_7(
    final includeBearingConnector=includeWheelBearings)
    "Fourth axle left wheel"
    annotation (Placement(transformation(
        origin={410,-100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_8(
    final includeBearingConnector=includeWheelBearings)
    "Fourth axle right wheel"
    annotation (Placement(transformation(
        origin={410,100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Mechanics.MultiBody.MultiBodyEnd end_1(
    includeBearingConnector=includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{-117,-108},{-105,-92}})));
  Mechanics.MultiBody.MultiBodyEnd end_2(
    includeBearingConnector=includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{-117,92},{-105,108}})));
  Mechanics.MultiBody.MultiBodyEnd end_3(
    includeBearingConnector=includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{63,-108},{75,-92}})));
  Mechanics.MultiBody.MultiBodyEnd end_4(
    includeBearingConnector=includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{63,92},{75,108}})));
  Mechanics.MultiBody.MultiBodyEnd end_5(
    includeBearingConnector=includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{224,92},{236,108}})));
  Mechanics.MultiBody.MultiBodyEnd end_6(
    includeBearingConnector=includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{224,-108},{236,-92}})));
  Mechanics.MultiBody.MultiBodyEnd end_7(
    includeBearingConnector=includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{382,92},{394,108}})));
  Mechanics.MultiBody.MultiBodyEnd end_8(
    includeBearingConnector=includeWheelBearings or usingMultiBodyDriveline)
    annotation (Placement(transformation(extent={{382,-108},{394,-92}})));
equation
  connect(end_1.flange, wheelHub_1) annotation (Line(
      points={{-109,-100},{-90,-100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_2.flange, wheelHub_2) annotation (Line(
      points={{-109,100},{-90,100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_3.flange, wheelHub_3) annotation (Line(
      points={{71,-100},{90,-100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_4.flange, wheelHub_4) annotation (Line(
      points={{71,100},{90,100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_5.flange, wheelHub_6) annotation (Line(
      points={{232,100},{250,100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_6.flange, wheelHub_5) annotation (Line(
      points={{232,-100},{250,-100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_7.flange, wheelHub_8) annotation (Line(
      points={{390,100},{410,100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_8.flange, wheelHub_7) annotation (Line(
      points={{390,-100},{401,-100},{401,-100},{410,-100}},
      color={135,135,135},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-160,-100},{480,100}},
        grid={1,1}), graphics={
        Rectangle(
          extent={{-118,108},{-104,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{-118,-92},{-104,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{62,108},{76,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{62,-92},{76,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{223,108},{237,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{223,-92},{237,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{381,108},{395,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{381,-92},{395,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot)}),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-160,-100},{480,100}},
        grid={1,1})),
    Documentation(info="<html>
<p>
This partial model defines the interfaces required for the chassis subsystem
of a&nbsp;four axled vehicle within the VehicleInterfaces package. See the
<a href=\"modelica://VehicleInterfaces.Chassis\">documentation</a> and
<a href=\"modelica://VehicleInterfaces.Chassis.Tutorial\">tutorial</a>
for more information.
</p>
</html>"));
end FourAxleBase;
