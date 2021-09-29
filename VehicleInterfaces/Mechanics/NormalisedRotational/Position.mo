within VehicleInterfaces.Mechanics.NormalisedRotational;
model Position "Applies a rotation to a Flange"

  parameter Boolean exact=true
    "True/false exact treatment/filtering the input signal";
  parameter SI.Frequency f_crit=50
    "If exact=false: critical frequency of filter to filter input signal"
    annotation (Dialog(enable=not exact));

  Interfaces.Flange flange_b "flange to be rotated"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealInput phi_ref "position to be applied"
    annotation (Placement(transformation(
        origin={-120,0},
        extent={{20,-20},{-20,20}},
        rotation=180)));
  Types.NormalizedReal phi;
protected
  parameter Real w_crit=2*Modelica.Constants.pi*f_crit
    "critical frequency in [1/s]";
  constant Real af=1.3617 "Coefficient s   of Bessel filter";
  constant Real bf=0.6180 "Coefficient s*s of Bessel filter";

  Real w;
  Real a;
equation
  phi = flange_b.phi;

  w = der(phi);
  a = der(w);

  if exact then
    phi = phi_ref;
  else
    a = ((phi_ref - phi)*w_crit - af*w)*(w_crit/bf);
  end if;

initial equation
  if not exact then
    phi = phi_ref;
  end if;

  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
            {100,100}}), graphics={
        Polygon(
          points={{56,-80},{36,-75},{36,-85},{56,-80}},
          lineColor={128,128,128},
          fillColor={128,128,128},
          fillPattern=FillPattern.Solid),
        Line(points={{-34,-80},{37,-80}}, color={128,128,128}),
        Rectangle(
          extent={{-100,20},{100,-20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Text(extent={{150,60},{-150,100}}, textString="%name")}),
    Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
            100,100}}), graphics={Rectangle(
          extent={{-100,20},{100,-20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Text(
          extent={{-150,100},{150,60}},
          textString="%name",
          textColor={0,0,255})}),
    Documentation(info="<html>
<p>
Applies a&nbsp;normalized angle to a&nbsp;1D normalized rotational system.
Cannot be connected to components from the Modelica.Mechanics.Rotational library.
</p>
</html>"));
end Position;
