within VehicleInterfaces.Brakes.Interfaces;
partial model Base "Base interface definition for a brakes"

  parameter Boolean usingMultiBodyChassis=false
    "=true, if using a MultiBody chassis with a 1D driveline"
    annotation (Dialog(tab="Advanced"));
protected
  parameter Boolean includeBrakePedal=false "Include the brake pedal connection";
  parameter Boolean includeWheelBearings=false "Include the wheel bearing connectors";

public
  Modelica.Mechanics.Translational.Interfaces.Flange_a brakePedal if
    includeBrakePedal "Brake pedal connection (optional)"
    annotation (Placement(transformation(extent={{-10,110},{10,90}})));
  VehicleInterfaces.Interfaces.ControlBus controlBus "Control signal bus"
    annotation (Placement(transformation(
        origin={-100,60},
        extent={{-20,-20},{20,20}},
        rotation=90)));

  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={Rectangle(
          extent={{-18,112},{6,88}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot)}),
    Documentation(info="<html>
<p>
This partial model defines the basic interfaces required for any brakes
subsystem. This class should be extended to form a brakes interface
definition with the correct number of wheelHub connectors for the type
of vehicle being modelled. See the
<a href=\"modelica://VehicleInterfaces.Brakes\">documentation</a> and
<a href=\"modelica://VehicleInterfaces.Brakes.Tutorial\">tutorial</a>
for more information.
</p>
</html>"));
end Base;
