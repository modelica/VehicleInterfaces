within VehicleInterfaces.Blocks;
model BooleanPassThrough "Pass a Boolean signal through without modification"
  extends Modelica.Blocks.Icons.BooleanBlock;
  extends Modelica.Icons.ObsoleteModel;

  Modelica.Blocks.Interfaces.BooleanInput u "Input signal"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.BooleanOutput y "Output signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  y = u;

  annotation (
    obsolete = "Obsolete model - use Modelica.Blocks.Routing.BooleanPassThrough instead",
    Documentation(info="<html>
<p>Passes a Boolean signal through without modification.  Enables signals to be read out of one bus, have their name changed and be sent back to a bus.</p>
</html>"));
end BooleanPassThrough;
