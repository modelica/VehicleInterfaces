within VehicleInterfaces.Interfaces;
model ShiftInput
  "Convert an integer signal to a position in the manual shift connector"
  parameter Integer numberOfGears=5 "Number of forward gears";
  parameter SI.Distance crossGateDisplacement=0.1
    "Total distance across the gate";
  parameter SI.Distance intoGearDisplacement=0.1
    "Distance to move in to gear";
  ShiftConnector shiftConnector "Gear shift connection"
    annotation (Placement(transformation(extent={{-130,-30},{-70,30}})));
  Modelica.Blocks.Interfaces.IntegerInput gear "Gear number"
    annotation (Placement(transformation(
        origin={120,0},
        extent={{-20,20},{20,-20}},
        rotation=180)));
equation
  if gear == 0 then
    shiftConnector.crossGate.s = 0;
    shiftConnector.intoGear.s = 0;
  elseif gear == 1 then
    shiftConnector.crossGate.s = -crossGateDisplacement/2;
    shiftConnector.intoGear.s = intoGearDisplacement;
  elseif gear == 2 then
    shiftConnector.crossGate.s = -crossGateDisplacement/2;
    shiftConnector.intoGear.s = -intoGearDisplacement;
  elseif gear == 3 then
    shiftConnector.crossGate.s = 0;
    shiftConnector.intoGear.s = intoGearDisplacement;
  elseif gear == 4 then
    shiftConnector.crossGate.s = 0;
    shiftConnector.intoGear.s = -intoGearDisplacement;
  elseif gear == 5 then
    shiftConnector.crossGate.s = crossGateDisplacement/2;
    shiftConnector.intoGear.s = intoGearDisplacement;
  else
    //Reverse gear
    shiftConnector.crossGate.s = crossGateDisplacement/2;
    shiftConnector.intoGear.s = -intoGearDisplacement;
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
Converts an integer signal in to positions on the <strong>intoGear</strong>
and <strong>crossGate</strong> sub-connectors of the ShiftConnector. 
</p>
</html>"));
end ShiftInput;
