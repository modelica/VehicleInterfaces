within VehicleInterfaces.Chassis.Internal;
expandable connector StandardBus
  "Do not use - Expandable connector defining signals for chassis bus"
  extends VehicleInterfaces.Interfaces.ChassisBus;

  SI.Velocity longitudinalVelocity "Longitudinal velocity of vehicle"
    annotation (Dialog);

  annotation (Documentation(info="<html>
<p>
An expandable connector that defines the minimum set of signals required on the <strong>chassisBus</strong>.
This connector shall <strong>not</strong> be used in models and is included here to enable
connection dialog (i.e. the GUI) for signal buses.
</p>
</html>"),
    Diagram(graphics={
        Text(
          extent={{-100,-40},{100,-80}},
          textColor={255,0,0},
          textString="Do not use!")}));
end StandardBus;
