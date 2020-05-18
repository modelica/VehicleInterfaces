within VehicleInterfaces.PowertrainMounts.Interfaces;
partial model SingleSystemMount
  "Single powertrain subsystem mounting interface definition"
  extends Base;
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b mount_1
    "Powertrain system 1"
    annotation (Placement(transformation(
        origin={0,100},
        extent={{-16,-16},{16,16}},
        rotation=90)));
  annotation (
    Documentation(info="<html>
<p>
This partial model defines the interfaces required for a&nbsp;single
powertrain system mounting subsystem. This class should be extended to
form a particular powertrain mounting model. See the
<a href=\"modelica://VehicleInterfaces.PowertrainMounts\">documentation</a>
and
<a href=\"modelica://VehicleInterfaces.PowertrainMounts.Tutorial\">tutorial</a>
for more information.
</p>
</html>"));
end SingleSystemMount;
