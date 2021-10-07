within VehicleInterfaces.Drivelines.Interfaces;
partial model Base "Basic interface definition for a driveline"

  parameter Boolean usingMultiBodyChassis=false
    "= true, if connecting to a MultiBody chassis"
    annotation (Dialog(tab="Advanced", group="Only for 1D driveline", enable=not includeWheelBearings));
  parameter Boolean usingMultiBodyTransmission=false
    "= true, if connecting to a MultiBody transmission"
    annotation (Dialog(tab="Advanced", group="Only for 1D driveline", enable=not includeTransmissionBearing));
protected
  parameter Boolean includeWheelBearings=false "Include wheel bearing connectors";
  parameter Boolean includeMount=false "Include the driveline mount";
  parameter Boolean includeTransmissionBearing=false
    "Include the transmission bearing";

public
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing transmissionFlange(
    final includeBearingConnector=includeTransmissionBearing or usingMultiBodyTransmission)
    "Connection to the Transmission output shaft"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a drivelineMount
    if includeMount "Driveline mount connection (optional)"
    annotation (Placement(transformation(
        origin={0,-100},
        extent={{-16,-16},{16,16}},
        rotation=90)));
  VehicleInterfaces.Interfaces.ControlBus controlBus "Control signal bus"
    annotation (Placement(transformation(
        origin={-100,60},
        extent={{-20,-20},{20,20}},
        rotation=90)));
  Mechanics.MultiBody.MultiBodyEnd end_0(
    final includeBearingConnector=includeTransmissionBearing or usingMultiBodyTransmission)
    annotation (Placement(transformation(
        origin={-100,22},
        extent={{-6,-8},{6,8}},
        rotation=270)));
equation
  connect(end_0.flange, transmissionFlange) annotation (Line(
      points={{-100,20},{-100,0}},
      color={135,135,135},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={Rectangle(
          extent={{-12,-88},{12,-112}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot), Rectangle(
          extent={{-108,28},{-92,16}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot)}),
    Documentation(info="<html>
<p>
This partial model defines the basic interfaces required for any driveline
subsystem. This class should be extended to form a&nbsp;driveline interface
definition with the correct number of wheelHub connectors for the type of
vehicle being modelled. See the
<a href=\"modelica://VehicleInterfaces.Drivelines\">documentation</a> and
<a href=\"modelica://VehicleInterfaces.Drivelines.Tutorial\">tutorial</a>
for more information.
</p>
</html>"));
end Base;
