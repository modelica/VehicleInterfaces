within VehicleInterfaces;
package PowertrainMounts "Collection of powertrain mounts subsystem definition"
  extends Modelica.Icons.VariantsPackage;






  annotation (Documentation(info="<html>
<p>
The powertrain mounts subsystem interfaces are defined in this sub-package
of the VehicleInterfaces library. There are three different powertrain
mount interfaces defined and the one to use depends on how many powertrain
systems are to be connected to this mounting system.
The following connections are provided
</p>
<ul>
  <li><strong>chassisFrane</strong> &ndash; MultiBody connection to transmit
      the mounting system forces in to the vehicle body</li>
  <li><strong>mount_n</strong> &ndash; MultiBody connection(s) to the
      powertrain subsystem reference frames</li>
</ul>

<h4>Effects to be modelled in this subsystem</h4>
<p>
Within the VehicleIntefaces package the powertrain mounts subsystem is used
to model how a powertrain subsystem is mounted within the vehicle body.
The housing for the powertrain subsystem should be modelled within the
relevant powertrain subsystem and this subsystem models the (usually)
elastic mounts that suspend the housing within the vehicle body structure.
</p>
</html>"));
end PowertrainMounts;
