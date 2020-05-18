within VehicleInterfaces.Drivelines;
model MinimalDriveline "Front wheel drive, 4 wheeled vehicle"
  extends VehicleInterfaces.Icons.Driveline;
  extends VehicleInterfaces.Drivelines.Interfaces.TwoAxleBase(includeMount=world.driveTrainMechanics3D);

  parameter SI.Inertia halfshaftInertia=0.1
    "Inertia of each halfshaft";
  parameter Real finalDriveRatio=3 "Final drive ratio";

  Modelica.Mechanics.MultiBody.Parts.Rotor1D rightHalfShaft(
    J=halfshaftInertia)
    annotation (Placement(transformation(
        origin={-40,50},
        extent={{-10,10},{10,-10}},
        rotation=270)));
  Modelica.Mechanics.MultiBody.Parts.Rotor1D leftHalfShaft(
    J=halfshaftInertia)
    annotation (Placement(transformation(
        origin={-40,-50},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.Rotational.Components.IdealPlanetary differential(
    ratio=1)
    annotation (Placement(transformation(
        origin={-40,20},
        extent={{-10,-10},{10,10}},
        rotation=90)));
protected
  outer Modelica.Mechanics.MultiBody.World world;
public
  Modelica.Mechanics.Rotational.Components.IdealGear finalDrive(
    ratio=finalDriveRatio,
    useSupport=false)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
equation
  connect(rightHalfShaft.flange_a, wheelHub_2.flange) annotation (Line(points=
         {{-40,60},{-40,80},{-60,80},{-60,100}}));
  connect(leftHalfShaft.flange_a, wheelHub_1.flange) annotation (Line(points=
          {{-40,-60},{-40,-80},{-60,-80},{-60,-100}}));
  connect(leftHalfShaft.flange_b, differential.sun) annotation (Line(points={
          {-40,-40},{-40,10}}));
  connect(differential.ring, rightHalfShaft.flange_b) annotation (Line(points=
         {{-40,30},{-40,40}}));
  connect(rightHalfShaft.frame_a, drivelineMount) annotation (Line(
      points={{-30,50},{0,50},{0,-100}},
      color={95,95,95},
      thickness=0.5));
  connect(leftHalfShaft.frame_a, drivelineMount) annotation (Line(
      points={{-30,-50},{0,-50},{0,-100}},
      color={95,95,95},
      thickness=0.5));
  connect(finalDrive.flange_b, differential.carrier) annotation (Line(points=
          {{-60,0},{-44,0},{-44,10}}));
  connect(finalDrive.flange_a, transmissionFlange.flange)
    annotation (Line(points={{-80,0},{-100,0}}));
  annotation (
    Documentation(info="<html>
<p>
This driveline model is of a&nbsp;front-wheel drive 4-wheeled vehicle.
The front differential is modelled using an ideal gear and planetary gear.
The model does include the 3D mount effects if the
<strong>driveTrainMechanics3D</strong> in the world object is set to true.
To properly include these effects the additional constant and
FrameForceAndTorque actuators are required on the front wheel hubs.
A&nbsp;constant zero torque is applied to the rear wheelhubs and the reaction
paths in to the wheelhubs are included.
</p>
</html>"));
end MinimalDriveline;
