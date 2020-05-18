within VehicleInterfaces.PowertrainMounts.Interfaces;
partial model Base "Basic interface definition for a mounting system"

  Modelica.Mechanics.MultiBody.Interfaces.Frame_a chassisFrame
    "Chassis frame" annotation (Placement(transformation(
        origin={0,-100},
        extent={{-16,-16},{16,16}},
        rotation=90)));
  annotation (        Documentation(info="<html>
<p>
This partial model defines the common interfaces required for
a&nbsp;mounting subsystem. See the
<a href=\"modelica://VehicleInterfaces.PowertrainMounts\">documentation</a>
and
<a href=\"modelica://VehicleInterfaces.PowertrainMounts.Tutorial\">tutorial</a>
for more information.
</p>
</html>"));
end Base;
