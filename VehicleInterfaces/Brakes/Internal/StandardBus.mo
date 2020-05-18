within VehicleInterfaces.Brakes.Internal;
expandable connector StandardBus
  "Do not use - Expandable connector defining signals for brakes bus"
  extends VehicleInterfaces.Interfaces.BrakesBus;

  SI.AngularVelocity wheelSpeed_1
    "Individual wheel speed (wheel 1 = front left wheel)"
    annotation (Dialog);
  SI.AngularVelocity wheelSpeed_2
    "Individual wheel speed (wheel 2 = front right wheel)"
    annotation (Dialog);
  SI.AngularVelocity wheelSpeed_3
    "Individual wheel speed (wheel 3 = rear left wheel)" annotation (Dialog);
  SI.AngularVelocity wheelSpeed_4
    "Individual wheel speed (wheel 4 = rear right wheel)"
    annotation (Dialog);

  annotation (
    Documentation(info="<html>
<p>
An expandable connector that defines the minimum set of signals required on the <strong>brakesBus</strong>.
This connector shall <strong>not</strong> be used in models and is included here to enable
connection dialog (i.e. the GUI) for signal buses.
</p>
</html>"),
    Diagram(graphics={
       Text(
          extent={{-100,-40},{100,-80}},
          lineColor={255,0,0},
          textString="Do not use!")}));
end StandardBus;
