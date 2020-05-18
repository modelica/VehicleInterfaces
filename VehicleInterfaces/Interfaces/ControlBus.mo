within VehicleInterfaces.Interfaces;
expandable connector ControlBus
  "Bus of VehicleInterfaces.Interfaces: Minimal standard control bus"
  extends Modelica.Icons.SignalBus;

  VehicleInterfaces.Interfaces.AccessoriesBus accessoriesBus "Accessories bus" annotation (Dialog(enable=false));
  VehicleInterfaces.Interfaces.AccessoriesControlBus accessoriesControlBus "Accessories control bus" annotation (Dialog(enable=false));
  VehicleInterfaces.Interfaces.BatteryBus batteryBus "Battery bus" annotation (Dialog(enable=false));
  VehicleInterfaces.Interfaces.BrakesBus brakesBus "Brakes bus" annotation (Dialog(enable=false));
  VehicleInterfaces.Interfaces.BrakesControlBus brakesControlBus "Brakes control bus" annotation (Dialog(enable=false));
  VehicleInterfaces.Interfaces.ChassisBus chassisBus "Chassis bus" annotation (Dialog(enable=false));
  VehicleInterfaces.Interfaces.ChassisControlBus chassisControlBus "Chassis control bus" annotation (Dialog(enable=false));
  VehicleInterfaces.Interfaces.DrivelineBus drivelineBus "Driveline bus" annotation (Dialog(enable=false));
  VehicleInterfaces.Interfaces.DrivelineControlBus drivelineControlBus "Driveline control bus" annotation (Dialog(enable=false));
  VehicleInterfaces.Interfaces.DriverBus driverBus "Driver bus" annotation (Dialog(enable=false));
  VehicleInterfaces.Interfaces.ElectricMotorBus electricMotorBus "Electric motor bus" annotation (Dialog(enable=false));
  VehicleInterfaces.Interfaces.ElectricMotorControlBus electricMotorControlBus "Electric motor control bus" annotation (Dialog(enable=false));
  VehicleInterfaces.Interfaces.EngineBus engineBus "Engine bus" annotation (Dialog(enable=false));
  VehicleInterfaces.Interfaces.EngineControlBus engineControlBus "Engine control bus" annotation (Dialog(enable=false));
  VehicleInterfaces.Interfaces.TransmissionBus transmissionBus "Transmission bus" annotation (Dialog(enable=false));
  VehicleInterfaces.Interfaces.TransmissionControlBus transmissionControlBus "Transmission control bus" annotation (Dialog(enable=false));

  annotation (
    Documentation(info="<html>
<p>
An empty expandable connector used as the top-level control signal bus in VehicleInterfaces.
</p>
</html>"));
end ControlBus;
