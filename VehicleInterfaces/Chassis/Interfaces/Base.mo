within VehicleInterfaces.Chassis.Interfaces;
partial model Base "Basic interface definition for a chassis"

  parameter Boolean usingMultiBodyDriveline=false
    "= true, if connecting to a MultiBody driveline"
    annotation (Dialog(tab="Advanced", group="Only for 1D chassis", enable=not includeWheelBearings));
protected
  parameter Boolean includeWheelBearings=false "Include wheel bearing connectors";
  parameter Boolean includeChassisFrame=false "Include the chassis frame";
  parameter Boolean includeSteeringWheel=false "Include the steering wheel connection";

public
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b chassisFrame
    if includeChassisFrame "Chassis reference frame (optional)"
    annotation (Placement(transformation(extent={{-176,-86},{-144,-54}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a steeringWheel
    if includeSteeringWheel "Steering wheel connection (optional)"
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));

public
  VehicleInterfaces.Interfaces.ControlBus controlBus "Control signal bus"
    annotation (Placement(transformation(
        origin={-158,60},
        extent={{-20,-20},{20,20}},
        rotation=90)));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-160,-100},{160,100}},
        grid={1,1}), graphics={Rectangle(
          extent={{-170,-59},{-151,-81}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot), Rectangle(
          extent={{-17,112},{6,92}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot)}),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-160,-100},{160,100}},
        grid={1,1})),
    Documentation(info="<html>
<p>
This partial model defines the basic interfaces required for any chassis
subsystem. This class should be extended to form a&nbsp;chassis interface
definition with the correct number of wheelHub connectors for the type
of vehicle being modelled. See the
<a href=\"modelica://VehicleInterfaces.Chassis\">documentation</a> and
<a href=\"modelica://VehicleInterfaces.Chassis.Tutorial\">tutorial</a>
for more information.
</p>
</html>"));
end Base;
