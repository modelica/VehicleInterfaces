within VehicleInterfaces.EnergyStorage;
model Battery "Simple battery"
  parameter SI.Voltage V(start=1) "Value of constant voltage";
  extends .VehicleInterfaces.Icons.Battery;
  extends .VehicleInterfaces.EnergyStorage.Interfaces.Base(heatPort(Q_flow=0));

  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=V)
    annotation (Placement(transformation(
        origin={20,0},
        extent={{20,-20},{-20,20}},
        rotation=90)));
equation
  connect(constantVoltage.p, pin_p) annotation (Line(
      points={{20,20},{20,60},{100,60}},
      color={0,0,255}));
  connect(constantVoltage.n, pin_n) annotation (Line(
      points={{20,-20},{20,-60},{100,-60}},
      color={0,0,255}));

  annotation (
    Documentation(info="<html>
<p>An ideal battery with a constant voltage. No state of charge is introduced.</p>
</html>"));
end Battery;
