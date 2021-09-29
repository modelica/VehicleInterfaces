within VehicleInterfaces.Mechanics.NormalisedRotational.Interfaces;
connector Flange "1D normalized rotational flange"
  Types.NormalizedReal phi "Normalized rotation of flange";
  flow SI.Torque tau "Cut torque directed in the flange";

  annotation (
    defaultComponentName="flange_a",
    Documentation(info="<html>
<p>
1D rotational mechanical connector with normalized position as opposed to the
<a href=\"modelica://Modelica.Mechanics.Rotational.Interfaces.Flange_a\">Modelica.Mechanics.Rotational.Interfaces.Flange_a</a>
connector. The torque is not normalized in this connector.
</p>
</html>"), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
        Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-70,0},{0,70},{70,0},{0,-70},{-70,0}},
          lineColor={255,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={
        Ellipse(
          extent={{-40,40},{40,-40}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-30,0},{0,30},{30,0},{0,-30},{-30,0}},
          lineColor={255,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-100,-60},{100,-100}},
          textColor={95,95,95},
          textString="%name")}));
end Flange;
