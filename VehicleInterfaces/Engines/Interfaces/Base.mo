within VehicleInterfaces.Engines.Interfaces;
partial model Base "Basic interface definition for an engine"
  parameter Boolean usingMultiBodyAccessories=false
    "=true, if using MultiBody accessories with a 1D engine"
    annotation (Dialog(tab="Advanced"));
  parameter Boolean usingMultiBodyTransmission=false
    "=true, if using a MultiBody transmission with a 1D engine"
    annotation (Dialog(tab="Advanced"));
protected
  parameter Boolean includeAcceleratorPedal=false "Include the accelerator pedal connection";
  parameter Boolean includeMount=false "Include the engine mount connection";
  parameter Boolean includeTransmissionBearing=false "Include the transmission bearing";
  parameter Boolean includeAccessoriesBearing=false "Include the accessories bearing";

public
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing accessoryFlange(
    final includeBearingConnector=includeAccessoriesBearing or usingMultiBodyAccessories)
    "Connection for the engine accessories"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing transmissionFlange(
    final includeBearingConnector=includeTransmissionBearing or usingMultiBodyTransmission)
    "Connection to the transmission" annotation (Placement(transformation(
          extent={{90,-10},{110,10}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a engineMount if
    includeMount "Engine mount connection (optional)"
    annotation (Placement(transformation(
        origin={0,-100},
        extent={{-16,-16},{16,16}},
        rotation=90)));
  Modelica.Mechanics.Translational.Interfaces.Flange_a acceleratorPedal if
    includeAcceleratorPedal "Accelerator pedal connection (optional)"
    annotation (Placement(transformation(extent={{-10,110},{10,90}})));
  VehicleInterfaces.Interfaces.ControlBus controlBus "Control signal bus"
    annotation (Placement(transformation(
        origin={-100,60},
        extent={{-20,-20},{20,20}},
        rotation=90)));
  Mechanics.MultiBody.MultiBodyEnd end_1(final includeBearingConnector=
        includeAccessoriesBearing or usingMultiBodyAccessories)
    annotation (Placement(transformation(
        origin={-100,22},
        extent={{-8,-6},{8,6}},
        rotation=270)));
  Mechanics.MultiBody.MultiBodyEnd end_2(final includeBearingConnector=
        includeTransmissionBearing or usingMultiBodyTransmission)
    annotation (Placement(transformation(
        origin={100,22},
        extent={{-8,-6},{8,6}},
        rotation=270)));
equation
  connect(end_2.flange, transmissionFlange) annotation (Line(
      points={{100,19.3333},{100,0}},
      color={135,135,135},
      thickness=0.5));
  connect(end_1.flange, accessoryFlange) annotation (Line(
      points={{-100,19.3333},{-100,0}},
      color={135,135,135},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
        Rectangle(
          extent={{-12,-88},{12,-112}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot),
        Rectangle(
          extent={{-18,112},{6,88}},
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
This partial model defines the interfaces required for an engine subsystem.
This class should be extended to form a particular engine model. See the
<a href=\"modelica://VehicleInterfaces.Engines\">documentation</a> and
<a href=\"modelica://VehicleInterfaces.Engines.Tutorial\">tutorial</a>
for more information.
</p>
</html>"));
end Base;
