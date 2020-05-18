within VehicleInterfaces;
package Drivers "Collection of driver subsystem definitions"
  extends Modelica.Icons.VariantsPackage;






  annotation (Documentation(info="<html>
<p>
The driver subsystem interfaces are defined in this sub-package of the
VehicleInterfaces library. The driver subsystem has the following connector:
</p>
<ul>
  <li><strong>driverInterface</strong> &ndash; a DriverInterface connector
      which is an empty expandable connector</li>
</ul>

<h4>Effects to be modelled in this subsystem</h4>
<p>
The driver logic should be modelled in this subsystem and communication with
the DriverEnvironment subsystem should be via normalised control signals.
</p>
</html>"));
end Drivers;
