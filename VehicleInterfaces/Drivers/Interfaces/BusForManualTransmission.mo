within VehicleInterfaces.Drivers.Interfaces;
expandable connector BusForManualTransmission
  "Bus of VehicleInterfaces.Drivers: BusForManualTransmission"
  extends .VehicleInterfaces.Drivers.Interfaces.MinimalBus;
  extends Modelica.Icons.ObsoleteModel;

  VehicleInterfaces.Mechanics.NormalisedTranslational.Interfaces.Flange
    clutchPedal "Clutch pedal" annotation (Dialog);
  Integer gear
    "Selected gear for manual transmission (>0:forward gear, <0:rear gear)"
    annotation (Dialog);
  Boolean clutchLocked "Clutch locked flag" annotation (Dialog);

  annotation (
    obsolete = "Obsolete model - use VehicleInterfaces.Interfaces.DriverInterface instead",
    Documentation(info="<html>
<p>An expandable connector that defines the minimum set of signals required on the <b>driverInteractionBus</b> for a driver of a manual vehicle.</p>
</html>"));
end BusForManualTransmission;
