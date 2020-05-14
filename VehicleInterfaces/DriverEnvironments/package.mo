within VehicleInterfaces;
package DriverEnvironments "Collection of driver environment subsystem definitions"
  extends Modelica.Icons.VariantsPackage;








  annotation (Documentation(info="<html>
<p>
The driver environment subsystem interfaces are defined in this sub-package
of the VehicleInterfaces library. The driver environment subsystem has
the following connectors some of which are optional (see below for more
information):
</p>
<ul>
  <li><strong>controlBus</strong> &ndash; control signal bus connection</li>
  <li><strong>chassisFrame</strong> &ndash; MultiBody connection providing
      a&nbsp;connection point to the vehicle body (optional)</li>
  <li><strong>steeringWheel</strong> &ndash; steering wheel connection
      (optional)</li>
  <li><strong>acceleratorPedal</strong> &ndash; 1D translational connection
      for the accelerator pedal connection to the driverEnvironment
      (optional)</li>
  <li><strong>brakePedal</strong> &ndash; 1D translational connection for
      the brake pedal connection to the driverEnvironment (optional)</li>
  <li><strong>clutchPedal</strong> &ndash; 1D translational connection for
      the clutch pedal connection to the driverEnvironment (optional,
      for manual gearboxes only)</li>
  <li><strong>shiftConnector</strong> &ndash; shift connection to the
      driverEnvironment (optional, for manual gearboxes only)</li>
</ul>
<p>
The optional connectors are, by default, disabled and can be ignored
if not required. They can be enabled by setting the appropriate parameter
to be true. This is only possible at design time, i.e. when you are
building the subsystem model.
</p>

<h4>Effects to be modelled in this subsystem</h4>
<p>
Within the VehicleIntefaces package the driver environment subsystem is
used to model the interaction between the human driver and the vehicle
itself. A&nbsp;library developer may also choose to include the driver
logic within this subsystem or they may use a&nbsp;separate Driver
subsystem based on VehicleInterfaces.Drivers.Interfaces.Base.
</p>
</html>"));
end DriverEnvironments;
