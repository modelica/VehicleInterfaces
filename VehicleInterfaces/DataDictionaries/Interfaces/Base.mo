within VehicleInterfaces.DataDictionaries.Interfaces;
partial model Base "Basic interface definition for a data dictionary"

  VehicleInterfaces.Interfaces.ControlBus controlBus "Control signal bus"
    annotation (Placement(transformation(extent={{-20,-80},{20,-120}})));
  annotation (
    Documentation(info="<html>
<p>
This partial model defines the interfaces required for a&nbsp;data dictionary
within the VehicleInterfaces package. Especially, it provide alias names
for the controBus. See the
<a href=\"modelica://VehicleInterfaces.DataDictionaries\">documentation</a> and
<a href=\"modelica://VehicleInterfaces.DataDictionaries.Tutorial\">tutorial</a>
for more information.
</p>
</html>"));
end Base;
