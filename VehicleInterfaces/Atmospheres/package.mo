within VehicleInterfaces;
package Atmospheres "Collection of atmosphere subsystem definitions"
  extends Modelica.Icons.VariantsPackage;



  annotation (Documentation(info="<html>
<p>
The atmosphere subsystem interfaces are defined in this sub-package of the
VehicleInterfaces library. The atmosphere subsystem has no connectors but
contains standard functions that can be redeclared to implement different
ambient conditions. When an atmosphere subsystem is used in a model
architecture it should be declared as an <strong>inner</strong> system
so that it&apos;s functions can be accessed by other components in the model.
</p>

<h4>Effects to be modelled in this subsystem</h4>
<p>
Within the VehicleIntefaces package the atmosphere subsystem is used to define
the ambient conditions. These include air temperature, pressure, density,
humidity and wind speed.
</p>
</html>"));
end Atmospheres;
