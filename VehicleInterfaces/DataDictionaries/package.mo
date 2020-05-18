within VehicleInterfaces;
package DataDictionaries "Collection of data dictionary definitions"
  extends Modelica.Icons.VariantsPackage;





  annotation (Documentation(info="<html>
<p>
The data dictionary interface is defined in this sub-package of the
VehicleInterfaces library. The data dictionary subsystem has the following
connector:
</p>
<ul>
  <li><strong>controlBus</strong> &ndash; control signal bus connection</li>
</ul>

<h4>Effects to be modelled in this subsystem</h4>
<p>
Within the VehicleIntefaces package the data dictionary subsystem is used
to provide compatibility between the naming convention used in the
VehicleInterfaces library and in-house naming conventions.
This is achieved by providing alias names for the various signals on
the control signal bus.
</p>
</html>"));
end DataDictionaries;
