within VehicleInterfaces.DriverEnvironments.Interfaces;
expandable connector MinimalBus
  "Bus of VehicleInterfaces.DriverEnvironment: MinimalBus (minimal set of signals for any type of transmissions)"
  extends VehicleInterfaces.Interfaces.DriverBus;
  extends .VehicleInterfaces.Icons.SignalSubBusWithExplicitSignals;
  extends Modelica.Icons.ObsoleteModel;

  VehicleInterfaces.Types.NormalizedReal acceleratorPedalPosition
    "Normalized accelerator pedal position (0=fully released ... 1=fully pressed)"
    annotation (Dialog);
  VehicleInterfaces.Types.NormalizedReal brakePedalPosition
    "Brake pedal position (0=fully released ... 1=fully pressed)"
    annotation (Dialog);
  VehicleInterfaces.Types.IgnitionSetting.Temp ignition
    "Engine ignition (Off, On or Start)" annotation (Dialog);
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
end MinimalBus;
