within VehicleInterfaces.Mechanics.NormalisedTranslational.Interfaces;
connector Flange "1D normalized translational flange"
  Types.NormalizedReal s "Normalized position of flange";
  flow SI.Force f "Cut force directed into flange";

  annotation (
    defaultComponentName="flange_a",
    Documentation(info="<html>
<p>
One-dimensional translational mechanical connector with normalized
position as opposed to the
<a href=\"modelica://Modelica.Mechanics.Translational.Interfaces.Flange_a\">Modelica.Mechanics.Translational.Interfaces.Flange_a</a>
connector. The force is not normalized in this connector.
</p>
</html>"), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={Polygon(
          points={{-100,0},{0,100},{100,0},{0,-100},{-100,0}},
          lineColor={0,127,0},
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid)}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Polygon(
          points={{-52,0},{0,52},{52,0},{0,-52},{-52,0}},
          lineColor={0,127,0},
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-100,-60},{100,-100}},
          textColor={0,127,0},
          textString="%name")}));
end Flange;
