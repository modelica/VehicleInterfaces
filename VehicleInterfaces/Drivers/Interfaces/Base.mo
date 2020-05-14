within VehicleInterfaces.Drivers.Interfaces;
partial model Base "Basic interface definition for a driver"

  VehicleInterfaces.Interfaces.DriverInterface driverInterface "Driver Interaction Bus"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}}, rotation=-90,
        origin={100,0})));
  annotation (
    Documentation(info="<html>
<p>
This partial model defines the interfaces required for the driver subsystem.
This class should be extended to form a particular driver model. See the
<a href=\"modelica://VehicleInterfaces.Drivers\">documentation</a> and
<a href=\"modelica://VehicleInterfaces.Drivers.Tutorial\">tutorial</a>
for more information.
</p>
</html>"));
end Base;
