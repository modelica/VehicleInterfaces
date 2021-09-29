within VehicleInterfaces.Mechanics.MultiBody;
model MultiBodyEnd "Ends a MultiBody chain"
  parameter Boolean includeBearingConnector=false
    "= true, if bearing frame connector is present, otherwise not present";

  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing flange(
      includeBearingConnector=includeBearingConnector)
    "Flange with zero force and torque applied"
    annotation (Placement(transformation(extent={{0,-20},{40,20}})));
protected
  Modelica.Mechanics.MultiBody.Forces.Internal.ZeroForceAndTorque
    zeroForceAndTorque if includeBearingConnector
    annotation (Placement(transformation(extent={{-20,-10},{-40,10}})));

public
  Modelica.Mechanics.Rotational.Sources.ConstantTorque zeroTorque1D(
    final tau_constant=0)
    annotation (Placement(transformation(extent={{-20,30},{0,50}})));
equation
  connect(zeroTorque1D.flange, flange.flange) annotation (Line(
      points={{0,40},{20,40},{20,0}}));
  connect(zeroForceAndTorque.frame_a, flange.bearingFrame) annotation (Line(
      points={{-20,0},{20,0}},
      color={95,95,95},
      thickness=0.5));
  annotation (
    Documentation(info="<html>
<p>
This component is used to end a chain of multi-body components by applying
zero force and torque to the end of the chain. Uses the
<a href=\"modelica://Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing\">FlangeWithBearing</a>
connector where the <strong>flange</strong> connector has zero torque
applied to it and the <strong>bearingFrame</strong> can be optionally
included through the parameter <code>includeBearingConnector</code>.
If <code>includeBearingConnector=true</code> then zero force and torque
is applied to the bearingFrame.
</p>
</html>"),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-60,-80},{60,80}}), graphics={Polygon(
          points={{40,-40},{40,-60},{-40,-60},{-40,60},{40,60},{40,40},{-20,
              40},{-20,-40},{40,-40}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid)}),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-60,-80},{60,80}}), graphics={
        Rectangle(
          extent={{-66,18},{0,-24}},
          lineColor={0,127,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-64,-16},{-4,-22}},
          textColor={0,127,0},
          textString="if includeBearingConnector = true")}));
end MultiBodyEnd;
