within VehicleInterfaces.Blocks;
model IntegerPassThrough "Pass a Integer signal through without modification"
  extends Modelica.Blocks.Icons.IntegerBlock;
  extends Modelica.Icons.ObsoleteModel;

  Modelica.Blocks.Interfaces.IntegerInput u "Input signal"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.IntegerOutput y "Output signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  y = u;

  annotation (
    obsolete = "Obsolete model - use Modelica.Blocks.Routing.IntegerPassThrough instead",
    Documentation(info="<html>
<p>Passes a Integer signal through without modification.  Enables signals to be read out of one bus, have their name changed and be sent back to a bus.</p>
</html>"));
end IntegerPassThrough;
