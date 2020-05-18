within VehicleInterfaces;
package Accessories "Collection of accessory subsystem definitions"
  extends Modelica.Icons.VariantsPackage;





  annotation (Documentation(info="<html>
<p>
The accessory subsystem interfaces are defined in this sub-package of the
VehicleInterfaces library. The accessories subsystem has the following
connectors:
</p>
<ul>
  <li><strong>engineFlange</strong> &ndash; 1D rotational connection to the engine
      subsystem (or other systems mechanically connected to the accessories)</li>
  <li><strong>controlBus</strong> &ndash; control signal bus connection</li>
</ul>

<h4>Effects to be modelled in this subsystem</h4>
<p>
Within the VehicleIntefaces package the accessories subsystem is used
to model the torque losses and inertia effects of the engine accessories
such as the alternator, power steering pump, etc.
</p>
</html>"));
end Accessories;
