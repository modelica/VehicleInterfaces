within VehicleInterfaces.Engines.Internal;
expandable connector StandardBus
  "Do not use - Expandable connector defining signals for engine bus"
  extends VehicleInterfaces.Interfaces.EngineBus;

  SI.AngularVelocity speed "Speed of engine" annotation (Dialog);

  annotation (
    Documentation(info="<html>
<p>
An expandable connector that defines the minimum set of signals required on the <strong>engineBus</strong>.
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
