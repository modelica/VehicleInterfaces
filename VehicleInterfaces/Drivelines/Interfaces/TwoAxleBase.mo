within VehicleInterfaces.Drivelines.Interfaces;
partial model TwoAxleBase
  "Interface definition for a driveline of a 4 wheeled vehicle"
  extends Base;

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
    "Rear left wheel"
    annotation (Placement(transformation(
        origin={60,-100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_4(
    final includeBearingConnector=includeWheelBearings or usingMultiBodyChassis)
    "Rear right wheel"
    annotation (Placement(transformation(
        origin={60,100},
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
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics={
        Rectangle(
          extent={{-89,108},{-75,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{31,108},{45,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{-89,-92},{-75,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{31,-92},{45,-108}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot)}),
    Documentation(info="<html>
<p>
This partial model defines the interfaces required for the driveline subsystem
of a&nbsp;two axled vehicle within the VehicleInterfaces package. See the
<a href=\"modelica://VehicleInterfaces.Drivelines\">documentation</a> and
<a href=\"modelica://VehicleInterfaces.Drivelines.Tutorial\">tutorial</a>
for more information.
</p>
</html>"));
end TwoAxleBase;
