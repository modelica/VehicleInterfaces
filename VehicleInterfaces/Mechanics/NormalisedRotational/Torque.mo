within VehicleInterfaces.Mechanics.NormalisedRotational;
model Torque "Applies a torque to a Flange"

  Interfaces.Flange flange_b "Flange to be turned"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealInput tau "Torque to be applied"
    annotation (Placement(transformation(
        origin={-120,0},
        extent={{20,-20},{-20,20}},
        rotation=180)));

equation
  tau = -flange_b.tau;

  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
            {100,100}}), graphics={
        Line(points={{-50,-90},{30,-90}}),
        Polygon(
          points={{60,-90},{30,-80},{30,-100},{60,-90}},
          lineColor={128,128,128},
          fillColor={128,128,128},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-84,0},{-60,30},{-32,52},{2,62},{32,56},{52,44},{68,28},
              {80,14},{84,10}},
          thickness=0.5,
          smooth=Smooth.Bezier),
        Polygon(
          points={{90,0},{70,58},{42,28},{90,0}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics={
        Text(
          extent={{14,-10},{-100,-60}},
          textColor={95,95,95},
          textString="tau"),
        Polygon(
          points={{94,10},{75,59},{41,24},{94,10}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-150,100},{150,60}},
          textString="%name",
          textColor={0,0,255}),
        Line(
          points={{-100,0},{-76,30},{-48,48},{-14,58},{16,56},{40,50},{56,
              42},{66,32},{80,20}},
          thickness=0.5,
          smooth=Smooth.Bezier)}),
    Documentation(info="<html>
<p>
Applies a&nbsp;torque to a&nbsp;1D normalized rotational system.
Cannot be connected to components from the Modelica.Mechanics.Rotational library.
</p>
</html>"));
end Torque;
