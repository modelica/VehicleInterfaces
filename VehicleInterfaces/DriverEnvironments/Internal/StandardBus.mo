within VehicleInterfaces.DriverEnvironments.Internal;
expandable connector StandardBus
  "Do not use - Expandable connector defining signals for driver bus"
  extends VehicleInterfaces.Interfaces.DriverBus;

  VehicleInterfaces.Types.NormalizedReal acceleratorPedalPosition
    "Normalized accelerator pedal position (0=fully released ... 1=fully pressed)"
    annotation (Dialog);
  VehicleInterfaces.Types.NormalizedReal brakePedalPosition
    "Brake pedal position (0=fully released ... 1=fully pressed)"
    annotation (Dialog);
  VehicleInterfaces.Types.NormalizedReal clutchPedalPosition
    "Clutch pedal position (0=fully released ... 1=fully pressed)"
    annotation (Dialog);
  Integer gear
    "Selected gear for manual transmission (>0:forward gear, <0:rear gear)"
    annotation (Dialog);
  VehicleInterfaces.Types.Gear requestedGear
    "Requested gear for automatic transmission if gearboxMode=Manual or =Limited"
    annotation (Dialog);
  VehicleInterfaces.Types.GearMode.Temp gearboxMode
    "Selected gearbox mode (Park, Drive, Neutral, Rear, Manual, Limited)"
    annotation (Dialog);
  VehicleInterfaces.Types.IgnitionSetting.Temp ignition
    "Engine ignition (Off, On or Start)" annotation (Dialog);
  annotation (Documentation(info="<html>
<p>
An expandable connector that defines the minimum set of signals required
on the <strong>driverBus</strong>. This connector shall <strong>not</strong>
be used in models and is included here to enable connection dialog
(i.e. the GUI) for signal buses.
</p>
</html>"),
    Diagram(graphics={
        Text(
          extent={{-100,-40},{100,-80}},
          lineColor={255,0,0},
          textString="Do not use!")}));
end StandardBus;
