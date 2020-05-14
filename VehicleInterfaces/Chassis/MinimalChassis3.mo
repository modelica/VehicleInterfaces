within VehicleInterfaces.Chassis;
model MinimalChassis3
  "Basic chassis model with rigid connection between all 4 wheels, uses chassisFrame connection, includes wheel bearings"
  extends MinimalChassis2(includeWheelBearings=true, body(r_CM={0,0,0}));

public
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r={0,-1.4,
        0}, animation=false)
    annotation (Placement(transformation(
        origin={-70,50},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r={0,
        -1.4,0}, animation=false)
    annotation (Placement(transformation(
        origin={150,50},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(r={0,
        0.7,0}, animation=false)
    annotation (Placement(transformation(
        origin={-50,-70},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation3(r={-2.6,
        0.7,0}, animation=false)
    annotation (Placement(transformation(extent={{120,-80},{140,-60}})));
equation
  connect(fixedTranslation.frame_b, wheelHub_2.bearingFrame) annotation (Line(
      points={{-70,60},{-70,100},{-90,100}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedTranslation1.frame_b, wheelHub_4.bearingFrame) annotation (Line(
      points={{150,60},{150,100},{90,100}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedTranslation1.frame_a, fixedTranslation3.frame_b) annotation (Line(
      points={{150,40},{150,-70},{140,-70}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedTranslation2.frame_b, fixedTranslation.frame_a) annotation (Line(
      points={{-60,-70},{-70,-70},{-70,40}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedTranslation2.frame_b, wheelHub_1.bearingFrame) annotation (Line(
      points={{-60,-70},{-70,-70},{-70,-100},{-90,-100}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedTranslation3.frame_b, wheelHub_3.bearingFrame) annotation (Line(
      points={{140,-70},{150,-70},{150,-100},{90,-100}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedTranslation2.frame_a, fixedTranslation3.frame_a) annotation (
      Line(
      points={{-40,-70},{120,-70}},
      color={95,95,95},
      thickness=0.5));
  connect(body.frame_a, fixedTranslation2.frame_a) annotation (Line(
      points={{1.83697e-015,-40},{0,-40},{0,-30},{-20,-30},{-20,-70},{-40,-70}},
      color={95,95,95},
      thickness=0.5));

  annotation (Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-160,
            -100},{160,100}})),
    Documentation(info="<html>
<p>
Single degree-of-freedom chassis model with mass and speed dependant drag model.
Uses MultiBody wheelHub connections and positions these relative to the
vehicle body position.
</p>
</html>"));
end MinimalChassis3;
