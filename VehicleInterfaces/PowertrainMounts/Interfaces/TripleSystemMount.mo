within VehicleInterfaces.PowertrainMounts.Interfaces;
partial model TripleSystemMount
  "Three powertrain subsystem mounting interface definition"
  extends Base;
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b mount_1
    "Powertrain system 1"
    annotation (Placement(transformation(
        origin={-90,100},
        extent={{-16,-16},{16,16}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b mount_2
    "Powertrain system 2"
    annotation (Placement(transformation(
        origin={0,100},
        extent={{-16,-16},{16,16}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b mount_3
    "Powertrain system 3"
    annotation (Placement(transformation(
        origin={90,100},
        extent={{-16,-16},{16,16}},
        rotation=90)));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-150,-100},{150,100}},
        grid={1,1})),
    Documentation(info="<html>
<p>
This partial model defines the interfaces required for three powertrain
system mounting subsystem. This class should be extended to form
a&nbsp;particular powertrain mounting model. See the
<a href=\"modelica://VehicleInterfaces.PowertrainMounts\">documentation</a>
and
<a href=\"modelica://VehicleInterfaces.PowertrainMounts.Tutorial\">tutorial</a>
for more information.
</p>
</html>"),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-150,-100},{150,100}},
        grid={1,1})));

end TripleSystemMount;
