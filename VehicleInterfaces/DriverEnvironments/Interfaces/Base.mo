within VehicleInterfaces.DriverEnvironments.Interfaces;
partial model Base
  "Basic interface definition for the driver-vehicle interface"

  VehicleInterfaces.Interfaces.ControlBus controlBus "Control signal bus"
    annotation (Placement(transformation(
        origin={100,60},
        extent={{-20,-20},{20,20}},
        rotation=270)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a chassisFrame
    if includeDriverSeat "Chassis reference frame (optional)"
    annotation (Placement(transformation(
        origin={80,-100},
        extent={{-16,-16},{16,16}},
        rotation=90)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a steeringWheel
    if includeSteeringWheel "Steering wheel connection (optional)"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a acceleratorPedal
    if includeAcceleratorPedal "Accelerator pedal connection (optional)"
    annotation (Placement(transformation(extent={{-90,-90},{-70,-110}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a brakePedal
    if includeBrakePedal "Brake pedal connection (optional)"
    annotation (Placement(transformation(extent={{30,-90},{50,-110}})));
protected
  parameter Boolean includeDriverSeat=false
    "Include the drivers seat connection to the body";
  parameter Boolean includeSteeringWheel=false
    "Include the steering wheel connection";
  parameter Boolean includeAcceleratorPedal=false
    "Include the accelerator pedal connection";
  parameter Boolean includeBrakePedal=false
    "Include the brake pedal connection";
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
        Rectangle(
          extent={{70,-86},{94,-110}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{82,14},{106,-10}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{-98,-88},{-74,-112}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{22,-88},{46,-112}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot)}),
    Documentation(info="<html>
<p>
This partial model defines the interfaces required for the driver environment
subsystem. See the
<a href=\"modelica://VehicleInterfaces.DriverEnvironments\">documentation</a>
and
<a href=\"modelica://VehicleInterfaces.DriverEnvironments.Tutorial\">tutorial</a>
for more information.
</p>
</html>"));
end Base;
