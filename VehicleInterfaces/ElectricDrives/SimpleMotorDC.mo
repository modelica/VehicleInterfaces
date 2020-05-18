within VehicleInterfaces.ElectricDrives;
model SimpleMotorDC "Simple DC electric motor"
  extends Interfaces.BaseDCMachine;
  extends VehicleInterfaces.Icons.ElectricMotor;
  parameter SI.Inductance L=1e-3 "Inductance";
  parameter SI.Resistance R=10 "Resistance";
  parameter SI.ElectricalTorqueConstant k=0.4 "Transformation coefficient";

  Modelica.Electrical.Analog.Basic.Resistor resistor(R=R)
    annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor(L=L)
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Modelica.Electrical.Analog.Basic.RotationalEMF eMF(k=k)
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
equation
  connect(eMF.flange,   shaft_b.flange) annotation (Line(
      points={{70,0},{100,0}}));
  connect(inductor.n, resistor.p) annotation (Line(
      points={{-20,-30},{20,-30}},
      color={0,0,255}));
  connect(resistor.n, eMF.n) annotation (Line(
      points={{40,-30},{60,-30},{60,-10}},
      color={0,0,255}));
  connect(eMF.p, pin_p) annotation (Line(
      points={{60,10},{60,100}},
      color={0,0,255}));
  connect(inductor.p, pin_n) annotation (Line(
      points={{-40,-30},{-60,-30},{-60,100}},
      color={0,0,255}));

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
            lineColor={0,0,0})}),
    Documentation(info="<html>
<p>A simple DC electric motor with inductance and internal resistance.</p>
</html>"));
end SimpleMotorDC;
