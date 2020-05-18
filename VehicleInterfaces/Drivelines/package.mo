within VehicleInterfaces;
package Drivelines "Collection of drivelines subsystem definitions"
  extends Modelica.Icons.VariantsPackage;





  annotation (Documentation(info="<html>
<p>
The driveline subsystem interfaces are defined in this sub-package of the
VehicleInterfaces library. The driveline subsystem has the following
connectors some of which are optional (see below for more information):
</p>
<ul>
  <li><strong>transmissionFlange</strong> &ndash; 1D rotational connection
      to the transmission subsystem (or other systems connected to the
      driveline input)</li>
  <li><strong>controlBus</strong> &ndash; control signal bus connection</li>
  <li><strong>wheelHub_n</strong> &ndash; wheelHub connectors that consist
      of a&nbsp;1D rotational connector and a&nbsp;MultiBody frame connector
      (see <a href=\"modelica://Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing\">Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing</a>).
      The number of these varies depending on how many wheels the vehicle has.</li>
  <li><strong>drivelineMount</strong> &ndash; MultiBody connection to transmit
      the driveline mount reactions (optional)</li>
</ul>
<p>
The optional connectors are, by default, disabled and can be ignored if not
required. They can be enabled by setting the appropriate parameter to be true.
This is only possible at design time, i.e. when you are building the subsystem
model.
</p>

<h4>Effects to be modelled in this subsystem</h4>
<p>
Within the VehicleIntefaces package the driveline subsystem is used to model
the transmission of torque from the transmission output shaft to the wheel hubs.
The connection to the transmission subsystem is a&nbsp;1D rotational connectors.
Different interface definitions are provided for vehicles with different numbers
of wheels, a&nbsp;FlangeWithBearing connector is added for each wheel.
The torque reaction in to the driveline housings and the housings themselves
are also to be modelled in this subsystem if required. The torque reactions,
if included, should all be referred back to a&nbsp;single reference frame
(the drivelineMount connector).
</p>
</html>"));
end Drivelines;
