within VehicleInterfaces.Chassis.Interfaces;
expandable connector StandardBus
  "Bus of VehicleInterfaces.Chassis: StandardBus of signals generated by the chassis"
  extends .VehicleInterfaces.Interfaces.ChassisBus;
  extends .VehicleInterfaces.Icons.SignalSubBusWithExplicitSignals;
  extends Modelica.Icons.ObsoleteModel;

  .Modelica.SIunits.Velocity longitudinalVelocity
    "Longitudinal velocity of vehicle"
    annotation (Dialog);
  annotation (
    obsolete = "Obsolete model - use VehicleInterfaces.Interfaces.ChassisBus instead",
    defaultComponentPrefixes="protected",
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(
          extent={{-20,2},{20,-2}},
          lineColor={255,204,51},
          lineThickness=0.5)}),
    Documentation(info="<html>
<p>Bus with a set of standard signals generated by the chassis subsystem. </p>
</html>"),
    Diagram(graphics={
        Rectangle(
          extent={{-102,82},{102,-52}},
          lineColor={255,0,0},
          pattern=LinePattern.Dash,
          lineThickness=0.5)}));
end StandardBus;
