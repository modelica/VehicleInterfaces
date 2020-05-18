within VehicleInterfaces.Transmissions.Interfaces;
partial model Base "Basic interface definition for a transmission"
  parameter Boolean usingMultiBodyEngine=false
    "=true, if using MultiBody engine with a 1D transmission"
    annotation (Dialog(tab="Advanced"));
  parameter Boolean usingMultiBodyDriveline=false
    "=true, if using a MultiBody driveline with a 1D transmission"
    annotation (Dialog(tab="Advanced"));
protected
  parameter Boolean includeMount=false "Include the transmission mount connection";
  parameter Boolean includeDrivelineBearing=false "Include the driveline bearing";
  parameter Boolean includeEngineBearing=false "Include the engine bearing";

public
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing engineFlange(
    final includeBearingConnector=includeEngineBearing or usingMultiBodyEngine)
    "Connection to the engine"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing drivelineFlange(
    final includeBearingConnector=includeDrivelineBearing or usingMultiBodyDriveline)
    "Connection to the driveline"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a transmissionMount if
    includeMount "Transmission mount connection (optional)"
    annotation (Placement(transformation(
        origin={0,-100},
        extent={{-16,-16},{16,16}},
        rotation=90)));
  VehicleInterfaces.Interfaces.ControlBus controlBus "Control signal bus"
    annotation (Placement(transformation(
        origin={-100,60},
        extent={{-20,-20},{20,20}},
        rotation=90)));
  Mechanics.MultiBody.MultiBodyEnd end_1(
    final includeBearingConnector=includeEngineBearing or usingMultiBodyEngine)
    annotation (Placement(transformation(
        origin={-100,22},
        extent={{-8,-6},{8,6}},
        rotation=270)));
  Mechanics.MultiBody.MultiBodyEnd end_2(
    final includeBearingConnector=includeDrivelineBearing or usingMultiBodyDriveline)
    annotation (Placement(transformation(
        origin={100,22},
        extent={{-8,-6},{8,6}},
        rotation=270)));

equation
  connect(end_1.flange, engineFlange) annotation (Line(
      points={{-100,19.3333},{-100,0}},
      color={135,135,135},
      thickness=0.5));
  connect(end_2.flange, drivelineFlange) annotation (Line(
      points={{100,19.3333},{100,0}},
      color={135,135,135},
      thickness=0.5));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={
        Rectangle(
          extent={{-10,-86},{14,-110}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{92,28},{108,16}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{-108,28},{-92,16}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot)}),
    Documentation(info="<html>
<p>
This partial model defines the common interfaces required for
a&nbsp;transmission subsystem. See the
<a href=\"modelica://VehicleInterfaces.Transmissions\">documentation</a>
and
<a href=\"modelica://VehicleInterfaces.Transmissions.Tutorial\">tutorial</a>
for more information.
</p>
</html>"));
end Base;
