within VehicleInterfaces.Accessories.Interfaces;
partial model Base "Basic interface definition for the accessories"

  parameter Boolean usingMultiBodyEngine=false
    "= true, if connecting to a MultiBody engine"
    annotation (Dialog(tab="Advanced", group="Only for 1D accessories", enable=not includeEngineBearing));
protected
  parameter Boolean includeEngineBearing=false "Include the engine bearing";

public
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing engineFlange(
    final includeBearingConnector=includeEngineBearing or usingMultiBodyEngine)
    "Source of drive torque"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  VehicleInterfaces.Interfaces.ControlBus controlBus "Control signal bus"
    annotation (Placement(transformation(
        origin={-100,60},
        extent={{-20,-20},{20,20}},
        rotation=90)));
  Mechanics.MultiBody.MultiBodyEnd end_2(
    final includeBearingConnector=includeEngineBearing or usingMultiBodyEngine)
    annotation (Placement(transformation(
        origin={100,22},
        extent={{-8,-6},{8,6}},
        rotation=270)));
equation
  connect(end_2.flange, engineFlange) annotation (Line(
      points={{100,19.3333},{100,0}},
      color={135,135,135},
      thickness=0.5));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Rectangle(
          extent={{92,28},{108,16}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot)}),
    Documentation(info="<html>
<p>
This partial model defines the interfaces required for an accessories subsystem.
This class should be extended to form a particular accessory model. See the
<a href=\"modelica://VehicleInterfaces.Accessories\">documentation</a> and
<a href=\"modelica://VehicleInterfaces.Accessories.Tutorial\">tutorial</a>
for more information.
</p>
</html>"));
end Base;
