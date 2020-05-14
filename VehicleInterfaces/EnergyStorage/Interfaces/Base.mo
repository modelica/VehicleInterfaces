within VehicleInterfaces.EnergyStorage.Interfaces;
partial model Base "Basic interface for an energy storage device"
  parameter Boolean includeGround=false
    "Include inner electrical ground at pin_n"
    annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
  parameter Boolean includeHeatPort = false "Include the battery heat port"
    annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
  parameter Boolean usingMultiBodyChassis=false
    "Include secondary ground node on the right port"
    annotation(Evaluate=true, HideResult=true, choices(checkBox=true));

  VehicleInterfaces.Interfaces.ControlBus controlBus if not usingMultiBodyChassis
    "Control signal bus"
    annotation (Placement(transformation(
        origin={-100,-60},
        extent={{-20,-20},{20,20}},
        rotation=90)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
    "Positive electrical pin" annotation (Placement(transformation(extent={{90,50},{110,70}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
    "Negative electrical pin" annotation (Placement(transformation(extent={{110,-70},{90,-50}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort if includeHeatPort
    "Conditional port for exhaust heat flow"
    annotation (Placement(transformation(extent={{-70,-110},{-50,-90}})));
protected
  Modelica.Electrical.Analog.Basic.Ground ground if includeGround
    "Conditional electrical ground"
    annotation (Placement(transformation(extent={{110,-100},{90,-80}})));

equation
  connect(ground.p, pin_n) annotation (Line(
      points={{100,-80},{100,-60}},
      color={0,0,255}));

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}),
      graphics={
        Line(
          visible=includeGround,
          points={{70,-106},{130,-106}},
          color={0,0,255}),
        Line(
          visible=includeGround,
          points={{85,-115},{115,-115}},
          color={0,0,255}),
        Line(
          visible=includeGround,
          points={{95,-123},{105,-123}},
          color={0,0,255}),
        Line(visible=includeGround,
          points={{100,-106},{100,-62}},
          color={0,0,255})}),
    Documentation(info="<html>
<p>
This partial model defines the interfaces required for an electrical energy
storage subsystem. Additionally, the ground is connected to the connector
pin_n. It can be disabled when <code>includeGround=false</code>.
</p>
<p>
This class should be extended to form a&nbsp;particular battery model.
See the
<a href=\"modelica://VehicleInterfaces.EnergyStorage\">documentation</a>
and
<a href=\"modelica://VehicleInterfaces.EnergyStorage.Tutorial\">tutorial</a>
for more information.
</p>
</html>"));
end Base;
