within VehicleInterfaces.PowertrainMounts;
model SingleSystemRigidMount "1 system rigid mount"
  extends Interfaces.SingleSystemMount;
  extends VehicleInterfaces.Icons.SingleMount;
  parameter SI.Position r_ChassisToMount1[3]={0,0,0}
    "Vector from chassis frame to mount_1 frame" annotation (Evaluate=false);

  Modelica.Mechanics.MultiBody.Parts.FixedTranslation chassisFrameToMount1(r=
        r_ChassisToMount1) annotation (Placement(transformation(
        extent={{-20,-10},{20,10}},
        rotation=90)));
equation
  connect(chassisFrameToMount1.frame_a, chassisFrame) annotation (Line(
      points={{-1.22465e-015,-20},{-1.22465e-015,-40},{0,-92},{0,-100}},
      color={95,95,95},
      thickness=0.5));
  connect(chassisFrameToMount1.frame_b, mount_1) annotation (Line(
      points={{1.22465e-015,20},{0,20},{0,100}},
      color={95,95,95},
      thickness=0.5));

  annotation (
    Documentation(info="<html>
<p>
Rigidly mounts one power train system such as the engine or transmission on
one supporting system, usually the chassis.
</p>
</html>"));
end SingleSystemRigidMount;
