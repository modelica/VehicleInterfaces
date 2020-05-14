within VehicleInterfaces.DriverEnvironments.Interfaces;
partial model BaseManualTransmission
  "Interface definition for the driver-vehicle interface with a manual transmission"
  extends Base;
protected
  parameter Boolean includeClutchPedal=false
    "Include the clutch pedal connection";
  parameter Boolean includeManualShiftConnector=false
    "Include the manual shift connection";
public
  Modelica.Mechanics.Translational.Interfaces.Flange_a clutchPedal if
    includeClutchPedal "Clutch pedal connection (optional)"
    annotation (Placement(transformation(extent={{-50,-90},{-30,-110}})));
  VehicleInterfaces.Interfaces.ShiftConnector shiftConnector if
    includeManualShiftConnector
    "Manual transmission shift connection (optional)"
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics={Rectangle(
          extent={{-58,-88},{-34,-112}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot), Rectangle(
          extent={{-12,-88},{12,-114}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot)}),
    Documentation(info="<html>
<p>
Base class for driver models for vehicles with manual transmissions where
the driver control logic is contained within the derived model.
</p>
</html>"));
end BaseManualTransmission;
