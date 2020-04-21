within VehicleInterfaces.DriverEnvironments.Interfaces;
expandable connector BusForAutomaticTransmission
  "Bus of VehicleInterfaces.DriverEnvironment: BusForAutomaticTransmission"
  extends VehicleInterfaces.DriverEnvironments.Interfaces.MinimalBus;

  VehicleInterfaces.Types.Gear requestedGear
    "Requested gear for automatic transmission if gearboxMode=Manual or =Limited"
    annotation (Dialog);
  VehicleInterfaces.Types.GearMode.Temp gearboxMode
    "Selected gearbox mode (Park, Drive, Neutral, Rear, Manual, Limited)"
    annotation (Dialog);
  annotation (
    obsolete = "Obsolete model - use VehicleInterfaces.Interfaces.DriverBus instead",
    Documentation(info="<html>
<p>
An expandable connector that defines the minimum set of signals required on the <b>driverBus</b>.
</p>
</html>"),
    Diagram(graphics={
        Rectangle(
          extent={{-102,82},{102,-52}},
          lineColor={255,0,0},
          pattern=LinePattern.Dash,
          lineThickness=0.5)}));
end BusForAutomaticTransmission;
