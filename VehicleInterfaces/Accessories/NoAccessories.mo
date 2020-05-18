within VehicleInterfaces.Accessories;
model NoAccessories "Empty accessories"
  extends VehicleInterfaces.Icons.Accessories;
  extends VehicleInterfaces.Icons.Empty;
  extends Interfaces.Base;

  annotation (
    Documentation(info="<html>
<p>
Empty accessories subsystem. Using this empty model in overall vehicle architecture the functionality of accessories subsystem can be eliminated.
</p>
</html>"));
end NoAccessories;
