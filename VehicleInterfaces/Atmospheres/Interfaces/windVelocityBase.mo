within VehicleInterfaces.Atmospheres.Interfaces;
partial function windVelocityBase "Determine wind velocity"
  extends Modelica.Icons.Function;
  input SI.Position[3] r=zeros(3)
    "Position vector from world frame to point, resolved in world frame";
  output SI.Velocity[3] v=zeros(3)
    "Wind velocity vector, resolved in world frame";
  annotation (Documentation(info="<html>
<p>
Partial base model for wind velocity. Extend this model appropriately to define final user model.
</p>
</html>"));
end windVelocityBase;
