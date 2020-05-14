within VehicleInterfaces.Transmissions.Interfaces;
partial model BaseManualTransmission
  "Interface definition for a manual transmission"
  extends Base;

protected
  parameter Boolean includeManualShiftConnector=false
    "Include the manual shift connection";
  parameter Boolean includeClutchPedal=false
    "Include the clutch pedal connection";
public
  Modelica.Mechanics.Translational.Interfaces.Flange_b clutchPedal if
    includeClutchPedal "Clutch pedal connection (optional)"
    annotation (Placement(transformation(extent={{-70,90},{-50,110}})));
  VehicleInterfaces.Interfaces.ShiftConnector shiftConnector if
    includeManualShiftConnector
    "Manual shift selector connection (optional)"
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Rectangle(
          extent={{-12,112},{12,86}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot), Rectangle(
          extent={{-68,112},{-44,88}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot)}),
    Documentation(info="<html>
<p>
This partial model defines the interfaces required for a&nbsp;manual
transmission model within the VehicleInterfaces package. See the
<a href=\"modelica://VehicleInterfaces.Transmissions\">documentation</a>
and
<a href=\"modelica://VehicleInterfaces.Transmissions.Tutorial\">tutorial</a>
for more information.
</p>
</html>"));
end BaseManualTransmission;
