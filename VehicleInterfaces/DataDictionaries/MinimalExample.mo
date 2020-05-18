within VehicleInterfaces.DataDictionaries;
model MinimalExample "Basic data dictionary example"
  extends VehicleInterfaces.Icons.DataDictionary;
  extends VehicleInterfaces.DataDictionaries.Interfaces.Base;
protected
  Modelica.Blocks.Routing.RealPassThrough v_veh
    annotation (Placement(transformation(extent={{6,-6},{-6,6}}),
        iconTransformation(extent={{-14,-6},{6,6}})));
  VehicleInterfaces.Interfaces.ChassisBus chassisBus
    annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));

equation
  connect(chassisBus, controlBus.chassisBus) annotation (Line(
      points={{0,-50},{0,-100}},
      color={255,204,51},
      thickness=0.5));
  connect(v_veh.u, chassisBus.longitudinalVelocity) annotation (Line(
      points={{7.2,0},{40,0},{40,-50},{0,-50}},
      color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(chassisBus.v_veh, v_veh.y) annotation (Line(
      points={{0,-50},{-40,-50},{-40,0},{-6.6,0}},
      color={0,0,127}), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  annotation (
    Documentation(info="<html>
<p>
A&nbsp;simple data dictionary example that creates a&nbsp;new signal called
<strong>v_veh</strong> within the <strong>chassisBus</strong> sub-bus of
the control bus.
</p>
</html>"));
end MinimalExample;
