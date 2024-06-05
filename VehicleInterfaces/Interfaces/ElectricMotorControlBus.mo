within VehicleInterfaces.Interfaces;
expandable connector ElectricMotorControlBus
  "Bus of VehicleInterfaces.Interfaces: Empty expandable connector used as an electric motor control bus"
  extends Modelica.Icons.SignalSubBus;

  annotation (
    defaultComponentPrefixes="protected",
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(
          extent={{-20,2},{20,-2}},
          lineColor={255,204,51},
          lineThickness=0.5)}),
    Documentation(info="<html>
<p>
Should be used to contain signals determined in the electrical drive controller.
It is defined as an empty expandable connector. 
</p>
</html>"));
end ElectricMotorControlBus;
