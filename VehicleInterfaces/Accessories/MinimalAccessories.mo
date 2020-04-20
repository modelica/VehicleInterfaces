within VehicleInterfaces.Accessories;
model MinimalAccessories
  "Constant torque loss and inertia due to the accessories"
  extends VehicleInterfaces.Icons.Accessories;
  extends Interfaces.Base(includeAccessoriesBearing=world.driveTrainMechanics3D);

  parameter Modelica.SIunits.Inertia accessoriesInertia=0.001
    "Total effective rotational inertia of the accessories";
  parameter Modelica.SIunits.Torque accessoriesLoad=2
    "Total effective torque load due to the accessories (constant)";
  parameter Modelica.Mechanics.MultiBody.Types.Axis axisOfRotation={1,0,0}
    "Axis of rotation for accessories when including MultiBody effects";

  Modelica.Mechanics.MultiBody.Parts.Rotor1D inertia(
    J=accessoriesInertia,
    n=axisOfRotation)   annotation (Placement(transformation(extent={{20,-10},
            {40,10}})));
  Modelica.Mechanics.Rotational.Sources.ConstantTorque torqueLoss(
    tau_constant=accessoriesLoad,
    useSupport=includeAccessoriesBearing)
                         annotation (Placement(transformation(extent={{-20,-10},
            {0,10}})));
  Modelica.Mechanics.MultiBody.Parts.Mounting1D torqueReaction(
    n=axisOfRotation) if includeAccessoriesBearing
    annotation (Placement(transformation(extent={{110,-20},{90,-40}})));
protected
  outer Modelica.Mechanics.MultiBody.World world;
equation
  connect(torqueLoss.flange, inertia.flange_a) annotation (Line(points={{0,0},{
          10,0},{20,0}}));
  connect(inertia.flange_b, engineFlange.flange)
    annotation (Line(points={{40,0},{100,0}}));
  connect(torqueReaction.frame_a, engineFlange.bearingFrame) annotation (Line(
      points={{100,-20},{100,0}},
      thickness=0.5));
  connect(torqueReaction.flange_b,torqueLoss.support)  annotation (Line(
        points={{90,-30},{-10,-30},{-10,-10}}));
  connect(inertia.frame_a, torqueReaction.frame_a) annotation (Line(
      points={{30,-10},{30,-20},{100,-20}},
      color={95,95,95},
      thickness=0.5));
  annotation (                         Documentation(info="<html>
<p>Simple accessory model with a single inertia and constant torque loss.</p>
</html>"));
end MinimalAccessories;
