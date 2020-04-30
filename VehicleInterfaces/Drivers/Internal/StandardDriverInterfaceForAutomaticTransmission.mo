within VehicleInterfaces.Drivers.Internal;
expandable connector StandardDriverInterfaceForAutomaticTransmission
  "Do not use - Expandable connector defining signals for driver bus for automatic transmissions"
  extends VehicleInterfaces.Interfaces.DriverInterface;

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
  VehicleInterfaces.Types.Gear requestedGear
    "Requested gear for automatic transmission if gearboxMode=Manual or =Limited"
    annotation (Dialog);
  VehicleInterfaces.Types.GearMode.Temp gearboxMode
    "Selected gearbox mode (Park, Drive, Neutral, Rear, Manual, Limited)"
    annotation (Dialog);

  annotation (Documentation(info="<html>
<p>
An expandable connector that defines the minimum set of signals required on
the <strong>driverInteractionBus</strong> for a driver of an automatic vehicle.
This connector shall <strong>not</strong> be used in models and is included here to enable
connection dialog (i.e. the GUI) for signal buses.
</p>
</html>"));
end StandardDriverInterfaceForAutomaticTransmission;
