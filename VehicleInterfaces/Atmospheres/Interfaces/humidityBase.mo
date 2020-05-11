within VehicleInterfaces.Atmospheres.Interfaces;
partial function humidityBase "Determine humidity"
  extends Modelica.Icons.Function;
  input SI.Position[3] r=zeros(3)
    "Position vector from world frame to point, resolved in world frame";
  output Real h=0.5 "Humidity";
  annotation (Documentation(info="<html>
<p>
Partial base model for air humidity. Extend this model appropriately to define final user model.
</p>
</html>"));
end humidityBase;
