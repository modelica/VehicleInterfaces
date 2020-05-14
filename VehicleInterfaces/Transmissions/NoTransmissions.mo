within VehicleInterfaces.Transmissions;
model NoTransmissions "Empty transmission"
  extends VehicleInterfaces.Icons.Transmission;
  extends VehicleInterfaces.Icons.Empty;
  extends Interfaces.Base;
equation
  connect(engineFlange, drivelineFlange)
    annotation (Line(points={{-100,0},{100,0}}));
  annotation (
    Documentation(info="<html>
<p>
Empty transmission model (just rigid connection between engine and
driveline flange). Using this empty model in overall vehicle
architecture the functionality of transmission can be eliminated.
</p>
</html>"));
end NoTransmissions;
