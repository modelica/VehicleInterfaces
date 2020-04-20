within VehicleInterfaces.Roads.Interfaces;
partial function headingDirectionBase
  "Determine unit heading direction on road"
  extends Modelica.Icons.Function;
  input Real s=0
    "Roads surface parameter 1 (usually arc length along road)";
  input Real w=0 "Roads surface parameter 2 (usually lateral direction)";
  output Real e_s_0[3]={1,0,0}
    "Unit vector in direction of road heading at (s,w), resolved in world frame";
  annotation (Documentation(info="<html>
<p>
Partial base model for unit heading direction on road. Extend this model appropriately to define final user model.
</p>
</html>"));
end headingDirectionBase;
