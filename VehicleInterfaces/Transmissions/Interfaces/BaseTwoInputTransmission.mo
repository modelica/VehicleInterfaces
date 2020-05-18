within VehicleInterfaces.Transmissions.Interfaces;
model BaseTwoInputTransmission
  "Interface definition for a transmission with two input shafts"
  extends Base;

  parameter Boolean usingMultiBodyMotor=false
    "=true, if using MultiBody motor with a 1D transmission"
    annotation (Dialog(tab="Advanced"));
protected
  parameter Boolean includeMotorBearing=false
    "Include the motor bearing connection";

public
  Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing motorFlange(
    final includeBearingConnector=includeMotorBearing or usingMultiBodyMotor)
    "Connection to the electric machine"
    annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
  Mechanics.MultiBody.MultiBodyEnd end_3(
    final includeBearingConnector=includeMotorBearing or usingMultiBodyMotor)
    annotation (Placement(transformation(
        origin={-100,-82},
        extent={{-8,-6},{8,6}},
        rotation=90)));
equation
  connect(end_3.flange, motorFlange) annotation (Line(
      points={{-100,-79.3333},{-100,-60}},
      color={135,135,135},
      thickness=0.5));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Rectangle(
          extent={{-108,-76},{-92,-88}},
          lineColor={255,128,0},
          pattern=LinePattern.Dot)}),
    Documentation(info="<html>
<p>
This partial model defines the interfaces required for a transmission
model that has two input shafts (such as a power-split device) within
the VehicleInterfaces package. See the
<a href=\"modelica://VehicleInterfaces.Transmissions\">documentation</a> and
<a href=\"modelica://VehicleInterfaces.Transmissions.Tutorial\">tutorial</a>
for more information.
</p>
</html>"));
end BaseTwoInputTransmission;
