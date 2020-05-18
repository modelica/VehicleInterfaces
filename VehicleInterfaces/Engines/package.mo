within VehicleInterfaces;
package Engines "Collection of combustion engine subsystem definitions"
  extends Modelica.Icons.VariantsPackage;







  annotation (Documentation(info="<html>
<p>
The engine subsystem interfaces are defined in this sub-package of
the VehicleInterfaces library. The engine subsystem has the following
connectors some of which are optional (see below for more information):
</p>
<ul>
  <li><strong>accessoryFlange</strong> &ndash; 1D rotational connection
      to the accessories subsystem (or other components driven by the
      engine)</li>
  <li><strong>transmissionFlange</strong> &ndash; 1D rotational connection
      to the transmission subsystem</li>
  <li><strong>controlBus</strong> &ndash; control signal bus connection</li>
  <li><strong>acceleratorPedal</strong> &ndash; 1D translational connection
      for the accelerator pedal connection to the driverEnvironment
      (optional)</li>
  <li><strong>engineMount</strong> &ndash; MultiBody connection to transmit
      the engine mount reactions (optional)</li>
</ul>
<p>
The optional connectors are, by default, disabled and can be ignored if
not required. They can be enabled by setting the appropriate parameter
to be true. This is only possible at design time, i.e. when you are building
the subsystem model.
</p>

<h4>Effects to be modelled in this subsystem</h4>
<p>
Within the VehicleIntefaces package the engine subsystem is used to model
the generation of torque and the application of this torque to the
transmission and accessories flange. The connections to the transmission
and accessories subsystems are via 1D rotational connectors. The torque
reaction in to the engine block and the block itself are also to be
modelled in this subsystem if required. The torque reactions, if included,
should all be referred back to a single reference frame for the engine
block (the engineMount connector).
</p>
</html>"));
end Engines;
