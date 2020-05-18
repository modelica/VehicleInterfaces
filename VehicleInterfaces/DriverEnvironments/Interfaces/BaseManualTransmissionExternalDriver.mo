within VehicleInterfaces.DriverEnvironments.Interfaces;
partial model BaseManualTransmissionExternalDriver
  "Interface definition for the driver-vehicle interface with a manual transmission and external driver"
  extends BaseManualTransmission;
  replaceable VehicleInterfaces.Interfaces.DriverInterface driverInterface
    "Driver Interaction Bus" annotation (Placement(transformation(extent={{-10,-10},
            {10,10}}, rotation=90, origin={-100,0})));
  annotation (Documentation(info="<html>
<p>
Base class for driver models for vehicles with manual transmissions where
the driver control logic is contained in an
<a href=\"modelica://VehicleInterfaces.Drivers\">external driver model</a>.
</p>
</html>"));
end BaseManualTransmissionExternalDriver;
