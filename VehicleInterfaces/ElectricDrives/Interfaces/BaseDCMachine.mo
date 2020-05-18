within VehicleInterfaces.ElectricDrives.Interfaces;
partial model BaseDCMachine "Base interface for electric drive in series"
  extends VehicleInterfaces.ElectricDrives.Interfaces.Base;
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
    "Positive electrical pin" annotation (Placement(transformation(extent={
            {50,90},{70,110}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
    "Negative electrical pin" annotation (Placement(transformation(extent={
            {-70,90},{-50,110}})));

  annotation (Documentation(info="<html>
<p>
This partial model defines the interfaces required for an electric machine
subsystem. This class should be extended to form a particular electric
machine model. See the
<a href=\"modelica://VehicleInterfaces.ElectricDrives\">documentation</a>
and
<a href=\"modelica://VehicleInterfaces.ElectricDrives.Tutorial\">tutorial</a>
for more information.
</p>
</html>"));
end BaseDCMachine;
