within VehicleInterfaces.Drivers.Interfaces;
expandable connector BusForAutomaticTransmission
  "Bus of VehicleInterfaces.Drivers: BusForAutomaticTransmission"
  extends .VehicleInterfaces.Drivers.Interfaces.MinimalBus;
  extends Modelica.Icons.ObsoleteModel;

  VehicleInterfaces.Types.Gear requestedGear
    "Requested gear for automatic transmission if gearboxMode=Manual or =Limited"
    annotation (Dialog);
  VehicleInterfaces.Types.GearMode.Temp gearboxMode
    "Selected gearbox mode (Park, Drive, Neutral, Rear, Manual, Limited)"
    annotation (Dialog);

  annotation (
    obsolete = "Obsolete model - use VehicleInterfaces.Interfaces.DriverInterface instead",
    Documentation(info="<html>
<p>An expandable connector that defines the minimum set of signals required
  on the <b>driverInteractionBus</b> for a driver of an automatic vehicle.
  </p>
</html>"));
end BusForAutomaticTransmission;
