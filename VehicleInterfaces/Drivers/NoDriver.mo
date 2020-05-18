within VehicleInterfaces.Drivers;
model NoDriver "Empty driver"
  extends VehicleInterfaces.Drivers.Interfaces.Base;
  extends VehicleInterfaces.Icons.Driver;
  extends VehicleInterfaces.Icons.Empty;

  annotation (Documentation(info="<html>
<p>
Empty driver model. Using this empty model in overall vehicle architecture
the functionality of driver can be eliminated.
</p>
</html>"));
end NoDriver;
