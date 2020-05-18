within VehicleInterfaces;
package Brakes "Collection of brakes subsystem definitions"
  extends Modelica.Icons.VariantsPackage;






  annotation (Documentation(info="<html>
<p>
The brakes subsystem interfaces are defined in this sub-package of the
VehicleInterfaces library. The brakes subsystem has the following connectors
some of which are optional (see below for more information):
</p>
<ul>
  <li><strong>controlBus</strong> &ndash; control signal bus connection</li>
  <li><strong>wheelHub_n</strong> &ndash; wheelHub connectors that consist of
      a&nbsp;1D rotational connector and a&nbsp;MultiBody frame connector
      (see <a href=\"modelica://Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing\">Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing</a>.
      The number of these varies depending on how many wheels the vehicle has.</li>
  <li><strong>brakePedal</strong> &ndash; 1D translational connection for the brake
      pedal connection to the driverEnvironment (optional)</li>
</ul>
<p>
The optional connectors are, by default, disabled and can be ignored if not
required. They can be enabled by setting the appropriate parameter to be true.
This is only possible at design time, i.e. when you are building the subsystem 
model.
</p>

<h4>Effects to be modelled in this subsystem</h4>
<p>
Within the VehicleIntefaces package the brakes subsystem is used to model 
the entire braking system from the brake pedal position through to the torque 
applied at the wheel hubs to decelerate the vehicle and the reactions in 
to the wheel carrier. Different interface definitions are provided for 
vehicles with different numbers of wheels, a FlangeWithBearing connector 
is added for each wheel.
</p>
</html>"));
end Brakes;
