within VehicleInterfaces.Controllers.Interfaces;
partial model Base "Basic interface definition for a controller"

  VehicleInterfaces.Interfaces.ControlBus controlBus "Control signal bus"
    annotation (Placement(transformation(extent={{-20,-80},{20,-120}})));
  annotation (
    Documentation(info="<html>
<p>This partial model defines the interfaces required for a controller subsystem. This class should be extended to form a particular controller model. See the <a href=\"Modelica://VehicleInterfaces.Controllers\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.Controllers.Tutorial\">tutorial</a> for more information.</p>
</html>"));
end Base;
