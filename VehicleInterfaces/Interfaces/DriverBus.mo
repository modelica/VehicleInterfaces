within VehicleInterfaces.Interfaces;
expandable connector DriverBus
  "Bus of VehicleInterfaces.Interfaces: Empty expandable connector used as driver bus"
  extends Modelica.Icons.SignalSubBus;

  annotation (
    defaultComponentPrefixes="protected",
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(
          extent={{-20,2},{20,-2}},
          lineColor={255,204,51},
          lineThickness=0.5)}),
    Documentation(info="<html>
<p>
Should be used to contain signals that are determined in the driverEnvironment subsystem.
It is defined as an empty expandable connector. 
</p>
</html>"));
end DriverBus;
