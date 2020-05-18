within VehicleInterfaces.Roads.Examples.Utilities;
model DummyTyre "Dummy wheel model to test contact point calculation of wheel within model CheckContactCalculation"
  import Modelica.Math.Vectors.normalize;

  parameter SI.Radius wheelRadius=1 "Radius of wheel";

  input Real[3] e_axis "Unit vector in direction of wheel axis" annotation(Dialog);
  input SI.Position[3] r_wheel "Position of center of wheel" annotation(Dialog);
  output SI.Position[3] r_CP(start={0,-wheelRadius,0})
    "Position vector to contact point of wheel with road, resolved in world frame";
  output SI.Length penetrationDepth
    "Penetration depth of wheel with respect to road";
  output Real mu "Friction coefficient";

  // Auxiliary variables
  Real s(start=0);
  Real w(start=0);

  outer VehicleInterfaces.Roads.Interfaces.Base road;

protected
  Real e_n[3] "Unit vector along road normal";
  Real e_s[3] "Unit vector along road heading direction";
  Real e_w[3] "Unit vector along road \"lateral\" direction";
  Real e_CP[3]
    "Unit vector from wheel center to contact point, resolved in world frame";
  SI.Position d_CP[3];
  SI.Radius reducedRadius;
equation
  r_CP = road.position(s, w);
  e_n = road.normal(s, w);
  e_s = road.headingDirection(s, w);
  e_w = cross(e_n, e_s);
  e_CP = normalize(e_n - (e_n*e_axis)*e_axis);
  d_CP = r_wheel - r_CP;

  /* The equation
        r_CP = r_wheel + (wheelRadius - penetrationDepth)*e_CP;
      or
        d_CP = reducedRadius*e_CP;
      is projected along e_n, e_s, e_w in order to eliminate the
      unknown penetrationDepth thus reducing the set of 3 non-linear
      equations to 2 non-linear equations.
   */
  reducedRadius = e_n*d_CP/(e_n*e_CP);
  penetrationDepth = wheelRadius - reducedRadius;
  0 = e_s*d_CP - reducedRadius*(e_s*e_CP);
  0 = e_w*d_CP - reducedRadius*(e_w*e_CP);

  // Friction coefficient at contact point
  mu = road.frictionCoefficient(s, w);

  annotation (
    Documentation(info="<html>
<p>
A&nbsp;dummy wheel model used in test models to check the road definitions.
Within this model, no tire force calculation is performed. Only kinematic
relationships between wheel input <code>e_axis</code> (unit vector in
direction of wheel axis) and <code>r_wheel</code> (wheel center position)
and road definition are given.
</p>
<p>
Simply change the two inputs <code>e_axis</code> and <code>r_wheel</code>
and compare wheel model outputs with road definition.
</p>
</html>"),
       Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
        Ellipse(
          extent={{-100,0},{100,-100}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-80,-20},{80,-80}},
          lineColor={95,95,95},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-150,60},{152,20}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name"),
        Line(
          points={{0,-20},{0,-80}},
          color={95,95,95}),
        Line(
          points={{-80,-50},{80,-50}},
          color={95,95,95}),
        Line(
          points={{-58,-30},{58,-70}},
          color={95,95,95}),
        Line(
          points={{-58,-70},{58,-30}},
          color={95,95,95})}));
end DummyTyre;
