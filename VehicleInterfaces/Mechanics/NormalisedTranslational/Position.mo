within VehicleInterfaces.Mechanics.NormalisedTranslational;
model Position "Applies a position to a Flange"

  parameter Boolean exact=true
    "True/false exact treatment/filtering the input signal";
  parameter SI.Frequency f_crit=50
    "If exact=false: critical frequency of filter to filter input signal"
    annotation (Dialog(enable=not exact));

  Interfaces.Flange flange_b "flange to be positioned"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealInput position "position to be applied"
    annotation (Placement(transformation(
        origin={-120,0},
        extent={{20,-20},{-20,20}},
        rotation=180)));

  Types.NormalizedReal s "Normalized position";
protected
  parameter Real w_crit=2*Modelica.Constants.pi*f_crit
    "Critical frequency in [1/s]";
  constant Real af=1.3617 "Coefficient s   of Bessel filter";
  constant Real bf=0.6180 "Coefficient s*s of Bessel filter";

  Real v;
  Real a;
equation
  s = flange_b.s;

  if exact then
    s = position;
    v = 0;
    a = 0;
  else
    v = der(s);
    a = der(v);
    a = ((position - s)*w_crit - af*v)*(w_crit/bf);
  end if;

initial equation
  if not exact then
    s = position;
  end if;

  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
            {100,100}}), graphics={Polygon(
          points={{44,-80},{24,-75},{24,-85},{44,-80}},
          lineColor={128,128,128},
          fillColor={128,128,128},
          fillPattern=FillPattern.Solid), Line(points={{-46,-80},{25,-80}},
            color={128,128,128})}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics={
        Text(
          extent={{-150,80},{150,40}},
          textString="%name",
          lineColor={0,0,255}), Rectangle(
          extent={{-100,2},{88,-2}},
          lineColor={0,127,0},
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p>
Applies a normalized position to a 1D normalized translational system.
Cannot be connected to components from the Modelica.Mechanics.Translational library.
</p>
</html>"));
end Position;
