within VehicleInterfaces.Drivelines.Interfaces;
partial model ThreeAxleBase
  "Interface definition for a driveline of a 6 wheeled vehicle"
  extends VehicleInterfaces.Drivelines.Interfaces.Base;

  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_1(
    final includeBearingConnector=includeWheelBearings or usingMultiBodyChassis)
    "Front left wheel"
    annotation (Placement(transformation(
        origin={-60,-100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_2(
    final includeBearingConnector=includeWheelBearings or usingMultiBodyChassis)
    "Front right wheel"
    annotation (Placement(transformation(
        origin={-60,100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_3(
    final includeBearingConnector=includeWheelBearings or usingMultiBodyChassis)
    "Second axle left wheel"
    annotation (Placement(transformation(
        origin={50,-100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_4(
    final includeBearingConnector=includeWheelBearings or usingMultiBodyChassis)
    "Second axle right wheel"
    annotation (Placement(transformation(
        origin={50,100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_5(
    final includeBearingConnector=includeWheelBearings or usingMultiBodyChassis)
    "Third axle left wheel"
    annotation (Placement(transformation(
        origin={160,-100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_6(
    final includeBearingConnector=includeWheelBearings or usingMultiBodyChassis)
    "Third axle right wheel"
    annotation (Placement(transformation(
        origin={160,100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Mechanics.MultiBody.MultiBodyEnd end_1(
    final includeBearingConnector=includeWheelBearings or usingMultiBodyChassis)
    annotation (Placement(transformation(extent={{-88,-108},{-76,-92}})));
  Mechanics.MultiBody.MultiBodyEnd end_2(
    final includeBearingConnector=includeWheelBearings or usingMultiBodyChassis)
    annotation (Placement(transformation(extent={{-88,92},{-76,108}})));
  Mechanics.MultiBody.MultiBodyEnd end_3(
    final includeBearingConnector=includeWheelBearings or usingMultiBodyChassis)
    annotation (Placement(transformation(extent={{22,-108},{34,-92}})));
  Mechanics.MultiBody.MultiBodyEnd end_4(
    final includeBearingConnector=includeWheelBearings or usingMultiBodyChassis)
    annotation (Placement(transformation(extent={{22,92},{34,108}})));
  Mechanics.MultiBody.MultiBodyEnd end_5(
    final includeBearingConnector=includeWheelBearings or usingMultiBodyChassis)
    annotation (Placement(transformation(extent={{132,-108},{144,-92}})));
  Mechanics.MultiBody.MultiBodyEnd end_6(
    final includeBearingConnector=includeWheelBearings or usingMultiBodyChassis)
    annotation (Placement(transformation(extent={{132,92},{144,108}})));
equation
  connect(end_1.flange, wheelHub_1) annotation (Line(
      points={{-80,-100},{-60,-100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_2.flange, wheelHub_2) annotation (Line(
      points={{-80,100},{-60,100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_3.flange, wheelHub_3) annotation (Line(
      points={{30,-100},{50,-100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_4.flange, wheelHub_4) annotation (Line(
      points={{30,100},{50,100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_5.flange, wheelHub_5) annotation (Line(
      points={{140,-100},{160,-100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_6.flange, wheelHub_6) annotation (Line(
      points={{140,100},{160,100}},
      color={135,135,135},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{200,100}},
        grid={1,1}), graphics={
        Rectangle(
          extent={{-89,108},{-75,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{-89,-92},{-75,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{21,-92},{35,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{21,107},{35,91}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{131,-92},{145,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{131,108},{145,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot)}),
    Documentation(info="<html>
<p>
This partial model defines the interfaces required for the driveline subsystem
of a&nbsp;three axled vehicle within the VehicleInterfaces package.  See the
<a href=\"modelica://VehicleInterfaces.Drivelines\">documentation</a> and
<a href=\"modelica://VehicleInterfaces.Drivelines.Tutorial\">tutorial</a>
for more information.
</p>
</html>"));
end ThreeAxleBase;
