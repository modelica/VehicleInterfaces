within VehicleInterfaces.Interfaces.Internal;
expandable connector StandardControlBus
  "Do not use - Expandable connector defining sub-buses for control bus"
  extends VehicleInterfaces.Interfaces.ControlBus;
  VehicleInterfaces.Interfaces.AccessoriesBus accessoriesBus "AccessoriesBus";
  VehicleInterfaces.Interfaces.AccessoriesControlBus accessoriesControlBus "AccessoriesControlBus";
  VehicleInterfaces.Interfaces.BatteryBus batteryBus "BatteryBus";
  VehicleInterfaces.Interfaces.BrakesBus brakesBus "BrakesBus";
  VehicleInterfaces.Interfaces.BrakesControlBus brakesControlBus "BrakesControlBus";
  VehicleInterfaces.Interfaces.ChassisBus chassisBus "ChassisBus";
  VehicleInterfaces.Interfaces.ChassisControlBus chassisControlBus "ChassisControlBus";
  VehicleInterfaces.Interfaces.DrivelineBus drivelineBus "DrivelineBus";
  VehicleInterfaces.Interfaces.DrivelineControlBus drivelineControlBus "DrivelineControlBus";
  VehicleInterfaces.Interfaces.DriverBus driverBus "DriverBus";
  VehicleInterfaces.Interfaces.ElectricMotorBus electricMotorBus "ElectricMotorBus";
  VehicleInterfaces.Interfaces.ElectricMotorControlBus electricMotorControlBus "ElectricMotorControlBus";
  VehicleInterfaces.Interfaces.EngineBus engineBus "EngineBus";
  VehicleInterfaces.Interfaces.EngineControlBus engineControlBus "EngineControlBus";
  VehicleInterfaces.Interfaces.TransmissionBus transmissionBus "TransmissionBus";
  VehicleInterfaces.Interfaces.TransmissionControlBus transmissionControlBus "TransmissionControlBus";

  annotation (
    Documentation(info="<html>
<p>
An expandable connector that defines the structure for the control signal bus.
This connector shall <strong>not</strong> be used in models and is included here to enable
connection dialog (i.e. the GUI) for signal buses.
</p>
</html>"),
    Diagram(graphics={
        Text(
          extent={{-100,-40},{100,-80}},
          lineColor={255,0,0},
          textString="Do not use!")}));
end StandardControlBus;
