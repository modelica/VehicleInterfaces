within VehicleInterfaces.Atmospheres.Interfaces;
partial function densityBase "Determine density"
  extends Modelica.Icons.Function;
  input SI.Position[3] r=zeros(3)
    "Position vector from world frame to point, resolved in world frame";
  output SI.Density rho=1.18 "Density";
  annotation (Documentation(info="<html>
<p>
Partial base model for air density. Extend this model appropriately to define final user model.
</p>
</html>"));
end densityBase;
