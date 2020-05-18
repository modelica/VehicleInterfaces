within VehicleInterfaces;
package Transmissions "Collection of transmission subsystem definitions"
  extends Modelica.Icons.VariantsPackage;








  annotation (Documentation(info="<html>
<p>
The transmission subsystem interfaces are defined in this sub-package
of the VehicleInterfaces library. The transmission subsystem has the
following connectors some of which are optional (see below for more
information):
</p>
<ul>
  <li><strong>engineFlange</strong> &ndash; 1D rotational connection to
      the engine subsystem (or other systems connected to the transmission
      input)</li>
  <li><strong>drivelineFlange</strong> &ndash; 1D rotational connection
      to the driveline subsystem (or other systems connected to the
      transmission output)</li>
  <li><strong>controlBus</strong> &ndash; control signal bus connection</li>
  <li><strong>clutchPedal</strong> &ndash; 1D translational connection
      for the clutch pedal connection to the driverEnvironment (optional,
      for manual gearboxes only)</li>
  <li><strong>shiftConnector</strong> &ndash; shift connection to the
      driverEnvironment (optional, for manual gearboxes only)</li>
  <li><strong>transmissionMount</strong> &ndash; MultiBody connection
      to transmit the transmission mount reactions (optional)</li>
</ul>
<p>
The optional connectors are, by default, disabled and can be ignored if
not required. They can be enabled by setting the appropriate parameter
to be true. This is only possible at design time, i.e. when you are
building the subsystem model.
</p>

<h4>Effects to be modelled in this subsystem</h4>
<p>
Within the VehicleIntefaces package the transmission subsystem is used
to model the transmission of torque from the input shaft to the output shaft.
The connections to the engine and driveline subsystems are via 1D
rotational connectors. The torque reaction in to the transmission
housing and the housing itself are also to be modelled in this subsystem
if required.  The torque reactions, if included, should all be referred
back to a single reference frame for the transmission housing
(the transmissionMount connector).
</p>
</html>"));
end Transmissions;
