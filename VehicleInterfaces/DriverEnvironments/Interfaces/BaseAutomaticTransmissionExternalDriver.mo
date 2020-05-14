within VehicleInterfaces.DriverEnvironments.Interfaces;
partial model BaseAutomaticTransmissionExternalDriver
  "Interface definition for the driver-vehicle interface with an automatic transmission and external driver"
  extends BaseAutomaticTransmission;
  replaceable VehicleInterfaces.Interfaces.DriverInterface driverInterface
    "Driver Interaction Bus" annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90, origin={-100,0})));
  annotation (Documentation(info="<html>
<p>
Base class for driver models for vehicles with automatic transmissions
where the driver control logic is contained in an
<a href=\"modelica://VehicleInterfaces.Drivers\">external driver model</a>.
</p>
</html>"));
end BaseAutomaticTransmissionExternalDriver;
