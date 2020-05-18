within VehicleInterfaces.Brakes.Interfaces;
partial model ThreeAxleBase
  "Interface definition for the brakes on a 6 wheeled vehicle"
  extends Base;

  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_1(
    final includeBearingConnector=includeWheelBearings)
    "Front left wheel"
    annotation (Placement(transformation(
        origin={-60,-100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_2(
    final includeBearingConnector=includeWheelBearings)
    "Front right wheel"
    annotation (Placement(transformation(
        origin={-60,100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_3(
    final includeBearingConnector=includeWheelBearings)
    "Second axle left wheel"
    annotation (Placement(transformation(
        origin={60,-100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_4(
    final includeBearingConnector=includeWheelBearings)
    "Second axle right wheel"
    annotation (Placement(transformation(
        origin={60,100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_5(
    final includeBearingConnector=includeWheelBearings)
    "Third axle left wheel"
    annotation (Placement(transformation(
        origin={160,-100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_6(
    final includeBearingConnector=includeWheelBearings)
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
    annotation (Placement(transformation(extent={{32,-108},{44,-92}})));
  Mechanics.MultiBody.MultiBodyEnd end_4(
    final includeBearingConnector=includeWheelBearings or usingMultiBodyChassis)
    annotation (Placement(transformation(extent={{32,92},{44,108}})));
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
      points={{40,-100},{60,-100}},
      color={135,135,135},
      thickness=0.5));
  connect(end_4.flange, wheelHub_4) annotation (Line(
      points={{40,100},{60,100}},
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
    Documentation(info="<html>
<p>
This partial model defines the interfaces required for the brakes subsystem
of a three axled vehicle within the VehicleInterfaces package. See the
<a href=\"modelica://VehicleInterfaces.Brakes\">documentation</a> and
<a href=\"modelica://VehicleInterfaces.Brakes.Tutorial\">tutorial</a>
for more information.
</p>
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {200,100}}), graphics={
        Rectangle(
          extent={{-89,108},{-75,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{31,107},{45,91}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{131,108},{145,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{131,-92},{145,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{31,-92},{45,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{-89,-92},{-75,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot)}));
end ThreeAxleBase;
