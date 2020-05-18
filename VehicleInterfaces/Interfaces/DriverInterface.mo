within VehicleInterfaces.Interfaces;
expandable connector DriverInterface
  "Bus of VehicleInterfaces.Interfaces: Empty expandable connector used as driver interface bus"
  //extends Modelica.Icons.SignalSubBus;

  annotation (
    defaultComponentPrefixes="protected",
    Documentation(info="<html>
<p>
Should be used to contain signals and normalised mechanical connections that
need to be exchanged between the Driver and DriverEnvironment subsystems. 
</p>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={
        Rectangle(
          extent={{-10,4},{10,-4}},
          lineColor={85,85,255},
          lineThickness=0.5),
        Polygon(
          points={{-80,50},{80,50},{100,30},{80,-40},{60,-50},{-60,-50},{-80,
              -40},{-100,30},{-80,50}},
          lineColor={0,0,0},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier),
        Ellipse(
          extent={{-55,25},{-45,15}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{45,25},{55,15}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-5,-15},{5,-25}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics={
        Polygon(
          points={{-40,25},{40,25},{50,15},{40,-20},{30,-25},{-30,-25},{-40,-20},
              {-50,15},{-40,25}},
          lineColor={0,0,0},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier),
        Ellipse(
          extent={{-22.5,7.5},{-17.5,12.5}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{17.5,12.5},{22.5,7.5}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-2.5,-7.5},{2.5,-12.5}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-150,70},{150,40}},
          lineColor={0,0,0},
          textString="%name")}));
end DriverInterface;
