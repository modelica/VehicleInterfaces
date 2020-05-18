within VehicleInterfaces.Roads.Interfaces;
partial function frictionCoefficientBase
  "Determine friction coefficient on road"
  extends Modelica.Icons.Function;
  input Real s=0
    "Roads surface parameter 1 (usually arc length along road)";
  input Real w=0 "Roads surface parameter 2 (usually lateral direction)";
  output Real mu=1 "Roads friction coefficient at (s,w)";
  annotation (Documentation(info="<html>
<p>
Partial base model for friction coefficient at point on road.
Extend this model appropriately to define final user model.
</p>
</html>"));
end frictionCoefficientBase;
