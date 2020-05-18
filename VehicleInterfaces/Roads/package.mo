within VehicleInterfaces;
package Roads "Collection of road definitions"
  extends Modelica.Icons.VariantsPackage;







  annotation (Documentation(info="<html>
<p>
The road subsystem interfaces are defined in this sub-package of the
VehicleInterfaces library. The road subsystem has no connectors but
contains standard functions that can be redeclared to implement different
roads. When a road subsystem is used in a model architecture it should be
declared as an <strong>inner</strong> system so that it&apos;s functions can
be accessed by other components in the model.
</p>

<h4>Effects to be modelled in this subsystem</h4>
<p>
Within the VehicleIntefaces package the road subsystem is used to define
the road surface.
</p>
</html>"));
end Roads;
