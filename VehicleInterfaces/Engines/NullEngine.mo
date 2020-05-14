within VehicleInterfaces.Engines;
model NullEngine "Empty engine"
  extends VehicleInterfaces.Icons.Engine;
  extends VehicleInterfaces.Icons.Empty;
  extends Interfaces.Base;
equation
  connect(accessoryFlange, transmissionFlange)
    annotation (Line(points={{-100,0},{100,0}}));

  annotation (
    Documentation(info="<html>
<p>
Empty engine model (just rigid connection between accessory and transmission
flange). Using this empty model in overall vehicle architecture the
functionality of engine can be eliminated.
</p>
</html>"));
end NullEngine;
