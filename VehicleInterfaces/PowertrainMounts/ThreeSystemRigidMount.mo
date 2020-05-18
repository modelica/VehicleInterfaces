within VehicleInterfaces.PowertrainMounts;
model ThreeSystemRigidMount "3 system rigid mount"
  extends Interfaces.TripleSystemMount;
  extends VehicleInterfaces.Icons.MultipleMounts;
  parameter SI.Position r_ChassisToMount1[3]={0,0,0}
    "Vector from chassis frame to mount_1 frame" annotation (Evaluate=false);
  parameter SI.Position r_ChassisToMount2[3]={0,0,0}
    "Vector from chassis frame to mount_2 frame" annotation (Evaluate=false);
  parameter SI.Position r_ChassisToMount3[3]={0,0,0}
    "Vector from chassis frame to mount_3 frame" annotation (Evaluate=false);

  Modelica.Mechanics.MultiBody.Parts.FixedTranslation chassisFrameToMount1(r=
        r_ChassisToMount1, animation=false)
    annotation (Placement(transformation(
        origin={-50,-20},
        extent={{-20,10},{20,-10}},
        rotation=180)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation chassisFrameToMount2(
      animation=false, r=r_ChassisToMount2)
    annotation (Placement(transformation(
        origin={0,40},
        extent={{-20,-10},{20,10}},
        rotation=90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation chassisFrameToMount3(
      animation=false, r=r_ChassisToMount3)
    annotation (Placement(transformation(extent={{30,-30},{70,-10}})));
equation
  connect(chassisFrameToMount1.frame_a, chassisFrame) annotation (Line(
      points={{-30,-20},{0,-20},{0,-100}},
      color={95,95,95},
      thickness=0.5));
  connect(chassisFrameToMount1.frame_b, mount_1) annotation (Line(
      points={{-70,-20},{-90,-20},{-90,100}},
      color={95,95,95},
      thickness=0.5));
  connect(chassisFrameToMount2.frame_b, mount_2) annotation (Line(
      points={{1.22465e-015,60},{0,60},{0,100}},
      color={95,95,95},
      thickness=0.5));
  connect(chassisFrameToMount3.frame_b, mount_3) annotation (Line(
      points={{70,-20},{90,-20},{90,100}},
      color={95,95,95},
      thickness=0.5));
  connect(chassisFrameToMount2.frame_a, chassisFrame) annotation (Line(
      points={{-1.22465e-015,20},{0,20},{0,-100}},
      color={95,95,95},
      thickness=0.5));
  connect(chassisFrameToMount3.frame_a, chassisFrame) annotation (Line(
      points={{30,-20},{0,-20},{0,-100}},
      color={95,95,95},
      thickness=0.5));

  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -150,-100},{150,100}})),
    Documentation(info="<html>
<p>
Rigidly mounts three power train systems such as the engine, transmission
and driveline on one supporting system, usually the chassis.
</p>
</html>"));
end ThreeSystemRigidMount;
