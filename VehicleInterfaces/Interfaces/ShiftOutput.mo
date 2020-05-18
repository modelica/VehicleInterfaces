within VehicleInterfaces.Interfaces;
model ShiftOutput
  "Convert a position in the manual shift connector to an integer value"
  parameter Integer numberOfGears=5 "Number of forward gears";
  parameter SI.Distance crossGateDisplacement=0.1
    "Total distance across the gate";
  parameter SI.Distance intoGearDisplacement=0.1
    "Distance to move in to gear";
  ShiftConnector shiftConnector "Gear shift connection"
    annotation (Placement(transformation(extent={{-130,-30},{-70,30}})));
  Modelica.Blocks.Interfaces.IntegerOutput gear "Gear number"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  shiftConnector.crossGate.f = 0;
  shiftConnector.intoGear.f = 0;
  if shiftConnector.crossGate.s <= -0.9*crossGateDisplacement/2 then
    if shiftConnector.intoGear.s >= 0.9*intoGearDisplacement then
      gear = 1;
    else
      gear = 2;
    end if;
  elseif shiftConnector.crossGate.s >= 0.9*crossGateDisplacement/2 then
    if shiftConnector.intoGear.s >= 0.9*intoGearDisplacement then
      gear = 5;
    else
      gear = -1;
    end if;
  else
    if shiftConnector.intoGear.s >= 0.9*intoGearDisplacement then
      gear = 3;
    elseif shiftConnector.intoGear.s <= 0.9*intoGearDisplacement then
      gear = 4;
    else
      gear = 0;
    end if;
  end if;

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-48,68},{-40,60}},
          lineColor={215,215,215},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-48,-60},{-40,-68}},
          lineColor={215,215,215},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-48,64},{-40,-64}},
          lineColor={215,215,215},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{40,68},{48,60}},
          lineColor={215,215,215},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{40,-60},{48,-68}},
          lineColor={215,215,215},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{40,64},{48,-64}},
          lineColor={215,215,215},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-4,68},{4,60}},
          lineColor={215,215,215},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-4,-60},{4,-68}},
          lineColor={215,215,215},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-4,64},{4,-64}},
          lineColor={215,215,215},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-46,4},{42,-4}},
          lineColor={215,215,215},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-10,68},{10,48}},
          lineColor={215,215,215},
          fillColor={255,128,0},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p>
Converts positions on the <strong>intoGear</strong> and <strong>crossGate</strong>
sub-connectors of the ShiftConnector into an integer gear signal.
</p>
</html>"));
end ShiftOutput;
