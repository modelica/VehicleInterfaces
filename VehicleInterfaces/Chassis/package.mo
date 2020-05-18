within VehicleInterfaces;
package Chassis "Collection of chassis subsystem definitions"
  extends Modelica.Icons.VariantsPackage;








  annotation (Documentation(info="<html>
<p>
The chassis subsystem interfaces are defined in this sub-package of the
VehicleInterfaces library. The chassis subsystem has the following connectors
some of which are optional (see below for more information):
</p>
<ul>
  <li><strong>controlBus</strong> &ndash; control signal bus connection</li>
  <li><strong>wheelHub_n</strong> &ndash; wheelHub connectors that consist of
      a&nbsp;1D rotational connector and a&nbsp;MultiBody frame connector (see
      <a href=\"modelica://Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing\">Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing</a>.
      The number of these varies depending on how many wheels the vehicle has.</li>
  <li><strong>steeringWheel</strong> &ndash; 1D rotational connection for
      the steering wheel connection to the driverEnvironment (optional)</li>
  <li><strong>chassisMount</strong> &ndash; MultiBody connection providing
      a&nbsp;connection point to the vehicle body (optional)</li>
</ul>
<p>
The optional connectors are, by default, disabled and can be ignored if not
required. They can be enabled by setting the appropriate parameter to be true.
This is only possible at design time, i.e. when you are building the
subsystem model.
</p>

<h4>Effects to be modelled in this subsystem</h4>
<p>
Within the VehicleIntefaces package the chassis subsystem is used to model
the wheels, tires, suspension and vehicle body.
</p>
</html>"));
end Chassis;
