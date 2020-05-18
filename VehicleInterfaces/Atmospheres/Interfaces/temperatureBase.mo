within VehicleInterfaces.Atmospheres.Interfaces;
partial function temperatureBase "Determine temperature"
  extends Modelica.Icons.Function;
  input SI.Position[3] r=zeros(3)
    "Position vector from world frame to point, resolved in world frame";
  output SI.Temperature T=298 "Temperature";
  annotation (Documentation(info="<html>
<p>
Partial base model for air temperature. Extend this model appropriately to define final user model.
</p>
</html>"));
end temperatureBase;
