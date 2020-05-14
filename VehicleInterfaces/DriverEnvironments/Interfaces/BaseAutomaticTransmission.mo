within VehicleInterfaces.DriverEnvironments.Interfaces;
partial model BaseAutomaticTransmission
  "Interface definition for the driver-vehicle interface with an automatic transmission"
  extends Base;
  annotation (Documentation(info="<html>
<p>
Base class for driver models for vehicles with automatic transmissions
where the driver control logic is contained within the derived model.
</p>
</html>"));
end BaseAutomaticTransmission;
