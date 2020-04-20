within VehicleInterfaces.Drivers.Interfaces;
expandable connector MinimalBus
  "Bus of VehicleInterfaces.Drivers: MinimalBus (minimal set of signals for any type of transmissions)"
  extends .VehicleInterfaces.Interfaces.DriverInterface;
  extends .VehicleInterfaces.Icons.SignalSubBusWithExplicitSignals;
  extends Modelica.Icons.ObsoleteModel;

  VehicleInterfaces.Mechanics.NormalisedTranslational.Interfaces.Flange
    acceleratorPedal "Accelerator pedal" annotation (Dialog);
  VehicleInterfaces.Mechanics.NormalisedTranslational.Interfaces.Flange
    brakePedal "Brake pedal" annotation (Dialog);
  VehicleInterfaces.Mechanics.NormalisedRotational.Interfaces.Flange
    steeringWheel "Steering wheel" annotation (Dialog);
  VehicleInterfaces.Types.IgnitionSetting.Temp ignition
    "Engine ignition (Off, On or Start)" annotation (Dialog);

  SI.Velocity vehicleSpeed "Vehicle speed" annotation (Dialog);
  SI.AngularVelocity engineSpeed "Engine speed" annotation (Dialog);
  annotation (
    obsolete = "Obsolete model - use VehicleInterfaces.Interfaces.DriverInterface instead",
    Documentation(info="<html>
<p>An expandable connector that defines the minimum set of signals required
  on the <b>driverInteractionBus</b> for a driver of an automatic vehicle.
  </p>
</html>"),
    Diagram(graphics={
        Rectangle(
          extent={{-102,82},{102,-52}},
          lineColor={255,0,0},
          pattern=LinePattern.Dash,
          lineThickness=0.5)}));
end MinimalBus;
