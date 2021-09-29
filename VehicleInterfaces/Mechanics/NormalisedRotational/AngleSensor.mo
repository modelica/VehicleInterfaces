within VehicleInterfaces.Mechanics.NormalisedRotational;
model AngleSensor "Ideal sensor to measure the rotation of a Flange"
  extends Modelica.Icons.RoundSensor;

  Interfaces.Flange flange_a "flange to be measured"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Interfaces.RealOutput phi
    "Absolute angle of flange as output signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

equation
  phi = flange_a.phi;
  0 = flange_a.tau;

  annotation (
    Documentation(info="<html>
<p>
Measures a&nbsp;normalized angle in a&nbsp;1D normalized rotational system.
Cannot be connected to components from the Modelica.Mechanics.Rotational library.
</p>
</html>"),
    Icon(graphics={
        Line(points={{70,0},{100,0}}, color={95,95,95}),
        Line(points={{-96,0},{-70,0}}, color={95,95,95}),
        Text(
          extent={{-150,120},{150,80}},
          textString="%name",
          textColor={0,0,255})}));
end AngleSensor;
