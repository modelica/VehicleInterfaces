within VehicleInterfaces.Mechanics.NormalisedTranslational;
model Force "Applies a force to a Flange"

  Interfaces.Flange flange_b "Flange to be forced"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealInput force "Force to be applied"
    annotation (Placement(transformation(
        origin={-120,0},
        extent={{20,-20},{-20,20}},
        rotation=180)));

equation
  force = -flange_b.f;

  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
            {100,100}}), graphics={
        Line(points={{-50,-90},{30,-90}}),
        Polygon(
          points={{60,-90},{30,-80},{30,-100},{60,-90}},
          lineColor={128,128,128},
          fillColor={128,128,128},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-100,10},{-100,-10},{20,-10},{20,-40},{90,0},{20,40},{20,10},{-100,10}},
          lineColor={0,127,0},
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid)}),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
            100,100}}), graphics={
        Text(
          extent={{-100,-30},{-40,-70}},
          textColor={95,95,95},
          textString="f",
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-150,100},{150,60}},
          textString="%name",
          textColor={0,0,255}),
        Polygon(
          points={{-100,10},{-100,-10},{20,-10},{20,-40},{90,0},{20,40},{20,10},{-100,10}},
          lineColor={0,127,0},
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p>
Applies a force to a 1D normalized translational system. Cannot be connected
to components from the Modelica.Mechanics.Translational library.
</p>
</html>"));
end Force;
