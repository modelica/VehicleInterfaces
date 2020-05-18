within VehicleInterfaces.ElectricDrives.Interfaces;
partial model Base "Basic interface for an electric drives"

  parameter Boolean usingMultiBodySystem=false
    "=true, if connecting to a MultiBody system with a 1D model"
    annotation (Dialog(tab="Advanced"));
protected
  parameter Boolean includeBearing=false "Include bearing connector";

public
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing shaft_b(
    includeBearingConnector=includeBearing or usingMultiBodySystem)
    "Mechanical shaft" annotation (Placement(transformation(extent={{90,-10},
            {110,10}})));
  VehicleInterfaces.Interfaces.ControlBus controlBus "Control signal bus"
    annotation (Placement(transformation(
        origin={-100,-60},
        extent={{-20,-20},{20,20}},
        rotation=90)));
  Mechanics.MultiBody.MultiBodyEnd end_1(
    includeBearingConnector=includeBearing or usingMultiBodySystem)
    annotation (Placement(transformation(
        origin={100,22},
        extent={{-8,-6},{8,6}},
        rotation=270)));
equation
  connect(end_1.flange, shaft_b) annotation (Line(
      points={{100,19.3333},{100,0}},
      color={135,135,135},
      thickness=0.5));

  annotation (
    Documentation(info="<html>
<p>
This partial model defines the interfaces required for an electric machine
subsystem. This class should be extended to form an electric machine
interface definition with propper electrical connectors. See the
<a href=\"modelica://VehicleInterfaces.ElectricDrives\">documentation</a>
and
<a href=\"modelica://VehicleInterfaces.ElectricDrives.Tutorial\">tutorial</a>
for more information.
</p>
</html>"));
end Base;
