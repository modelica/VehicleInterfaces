within VehicleInterfaces.Drivers.Internal;
expandable connector StandardDriverInterfaceForManualTransmission
  "Do not use - Expandable connector defining signals for driver bus for manual transmissions"
  extends VehicleInterfaces.Interfaces.DriverInterface;

  VehicleInterfaces.Mechanics.NormalisedTranslational.Interfaces.Flange
    acceleratorPedal "Accelerator pedal" annotation (Dialog);
  VehicleInterfaces.Mechanics.NormalisedTranslational.Interfaces.Flange
    brakePedal "Brake pedal" annotation (Dialog);
  VehicleInterfaces.Mechanics.NormalisedTranslational.Interfaces.Flange
    clutchPedal "Clutch pedal" annotation (Dialog);
  VehicleInterfaces.Mechanics.NormalisedRotational.Interfaces.Flange
    steeringWheel "Steering wheel" annotation (Dialog);
  VehicleInterfaces.Types.IgnitionSetting.Temp ignition
    "Engine ignition (Off, On or Start)" annotation (Dialog);
  SI.Velocity vehicleSpeed "Vehicle speed" annotation (Dialog);
  SI.AngularVelocity engineSpeed "Engine speed" annotation (Dialog);
  Integer gear "Selected gear" annotation (Dialog);
  Boolean clutchLocked "Clutch locked flag" annotation (Dialog);
  annotation (Documentation(info="<html>
<p>
An expandable connector that defines the minimum set of signals required on
the <strong>driverInteractionBus</strong> for a driver of a manual vehicle.
This connector shall <strong>not</strong> be used in models and is included here to enable
connection dialog (i.e. the GUI) for signal buses.
</p>
</html>"));
end StandardDriverInterfaceForManualTransmission;
