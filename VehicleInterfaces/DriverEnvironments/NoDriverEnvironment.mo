within VehicleInterfaces.DriverEnvironments;
model NoDriverEnvironment "Empty driver-vehicle interface"
  extends VehicleInterfaces.Icons.DriverEnvironment;
  extends VehicleInterfaces.Icons.Empty;
  extends Interfaces.Base;
  annotation (Documentation(info="<html>
<p>
Empty driver environment. Using this empty model in overall vehicle
architecture the functionality of driver environment can be eliminated.
</p>
</html>"));
end NoDriverEnvironment;
