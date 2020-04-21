within VehicleInterfaces.DriverEnvironments.Interfaces;
expandable connector BusForManualTransmission
  "Bus of VehicleInterfaces.DriverEnvironment: BusForManualTransmission"
  extends VehicleInterfaces.DriverEnvironments.Interfaces.MinimalBus;

  VehicleInterfaces.Types.NormalizedReal clutchPedalPosition
    "Clutch pedal position (0=fully released ... 1=fully pressed)"
    annotation (Dialog);
  Integer gear
    "Selected gear for manual transmission (>0:forward gear, <0:rear gear)"
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
end BusForManualTransmission;
