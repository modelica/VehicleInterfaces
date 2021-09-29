within VehicleInterfaces.Interfaces;
connector ShiftConnector "Manual transmission shift connector"
  Modelica.Mechanics.Translational.Interfaces.Flange_a crossGate
    "Gear shift lever movement across the selection gate";
  Modelica.Mechanics.Translational.Interfaces.Flange_a intoGear
    "Gear shift lever movement forwards and backwards in the selection gate";

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-22,34},{-8,-20},{4,-20},{-12,38},{-22,34}},
          lineColor={0,0,0},
          fillColor={128,128,128},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-34,56},{-4,26}},
          lineColor={0,0,0},
          fillColor={128,128,128},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-18,-44},{18,-10}},
          lineColor={0,0,0},
          fillColor={128,128,128},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-60,-28},{60,-48}},
          lineColor={0,0,0},
          fillColor={128,128,128},
          fillPattern=FillPattern.Solid)}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics={
        Text(
          extent={{-150,140},{150,100}},
          textColor={0,0,255},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          textString="%name"),
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-22,34},{-8,-20},{4,-20},{-12,38},{-22,34}},
          lineColor={0,0,0},
          fillColor={128,128,128},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-34,56},{-4,26}},
          lineColor={0,0,0},
          fillColor={128,128,128},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-18,-44},{18,-10}},
          lineColor={0,0,0},
          fillColor={128,128,128},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-60,-28},{60,-48}},
          lineColor={0,0,0},
          fillColor={128,128,128},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p>
Manual transmission shift connector. It contains two 1D translational
connectors that represent the position of the shift lever across the shift
gate (<strong>crossGate</strong>) and forwards/backwards within the gate
(<strong>intoGear</strong>).
</p>
</html>"));
end ShiftConnector;
