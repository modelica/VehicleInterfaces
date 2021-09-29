within VehicleInterfaces.Transmissions;
model PowerSplitDevice
  "Simple power split device based on an ideal epicyclic gear"
  extends Interfaces.BaseTwoInputTransmission;

  parameter Real ratio=100/50 "Number of ring_teeth/sun_teeth (e.g. ratio=100/50)";

  Modelica.Mechanics.Rotational.Sensors.SpeedSensor outputSpeed
    annotation (Placement(transformation(
        origin={60,60},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  Modelica.Mechanics.Rotational.Components.IdealPlanetary idealPlanetary(
    ratio=ratio)
    annotation (Placement(transformation(extent={{-10,10},{10,-10}})));
  Modelica.Blocks.Sources.IntegerConstant currentGear(k=1)
    annotation (Placement(transformation(extent={{30,80},{10,100}})));
protected
  VehicleInterfaces.Interfaces.TransmissionBus transmissionBus
    annotation (Placement(transformation(extent={{-30,50},{-10,70}})));
  VehicleInterfaces.Interfaces.TransmissionControlBus transmissionControlBus
    annotation (Placement(transformation(extent={{-30,80},{-10,100}})));
  outer Modelica.Mechanics.MultiBody.World world;
equation
  connect(outputSpeed.flange, drivelineFlange.flange) annotation (Line(
      points={{70,60},{80,60},{80,0.05},{100.05,0.05}}));
  connect(controlBus.transmissionBus, transmissionBus) annotation (Line(
      points={{-100.1,60.1},{-100,60.1},{-100,60},{-20,60}},
      color={255,204,51},
      thickness=0.5));
  connect(idealPlanetary.ring, drivelineFlange.flange) annotation (Line(
      points={{10,0},{56,0},{56,0.05},{100.05,0.05}}));
  connect(idealPlanetary.sun, engineFlange.flange) annotation (Line(
      points={{-10,0},{-54,0},{-54,0.05},{-99.95,0.05}}));
  connect(idealPlanetary.carrier, motorFlange.flange) annotation (Line(
      points={{-10,-4},{-40,-4},{-40,-59.95},{-99.95,-59.95}}));
  connect(controlBus.transmissionControlBus, transmissionControlBus)
    annotation (Line(
      points={{-100.1,60.1},{-100,60.1},{-100,60},{-40,60},{-40,90},{-20,90}},
      color={255,204,51},
      thickness=0.5));
  connect(currentGear.y, transmissionControlBus.currentGear) annotation (Line(
        points={{9,90},{-20,90}}, color={255,127,0}));
  connect(outputSpeed.w, transmissionBus.outputSpeed) annotation (Line(
      points={{49,60},{14,60},{14,60.05},{-19.95,60.05}},
      color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{60,94},{20,-92}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Rectangle(
          extent={{0,-80},{-40,-40}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Rectangle(
          extent={{0,30},{-40,-30}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Rectangle(
          extent={{-40,10},{-90,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Rectangle(
          extent={{110,10},{60,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Rectangle(
          extent={{60,90},{-40,95}},
          lineColor={160,160,164},
          fillColor={160,160,164},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-70,-54},{-40,-66}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Line(points={{-100,-50},{-100,-38},{-60,-38}}),
        Line(points={{-70,-48},{-50,-48}}),
        Line(points={{-60,-38},{-60,-48}}),
        Line(points={{-70,-74},{-49,-74}}),
        Line(points={{-60,-74},{-60,-84}}),
        Text(
          extent={{-150,140},{150,100}},
          textColor={0,0,255},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          textString="%name")}),
    Documentation(info="<html>
<p>
Simple power-split device based on an ideal epicyclic gear.
No losses are included in this model.
</p>
</html>"));
end PowerSplitDevice;
