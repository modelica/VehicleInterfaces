within VehicleInterfaces.Roads.Examples;
model CheckContactCalculation "Check that wheel contact point calculation is properly working with road model"
  extends Modelica.Icons.Example;

  parameter SI.Radius wheelRadius=1 "Radius of wheel";
  SI.Angle phi;
  SI.Radius radius_wheel;
  Real axis_wheel[3];
  SI.Position r_circle[3]={road.radius*sin(phi),-road.radius*cos(phi),0};
  VehicleInterfaces.Roads.Examples.Utilities.DummyTyre tyre(
    wheelRadius=wheelRadius,
    e_axis=Modelica.Math.Vectors.normalize(axis_wheel),
    r_wheel={radius_wheel*sin(phi),-radius_wheel*cos(phi),1 + sin(phi)/20}) annotation (Placement(transformation(extent={{20,40},{40,60}})));
  inner VehicleInterfaces.Roads.CircleRoad road(
    radius=50,
    width=8,
    mu=0.5,
    roadColor={100,100,100}) annotation (Placement(transformation(extent={{-40,40},{0,80}})));
  inner Modelica.Mechanics.MultiBody.World world(
    enableAnimation=true,
    axisLength=20,
    n={0,0,-1}) annotation (Placement(transformation(extent={{-80,40},{-60,60}})));

protected
  constant SI.AngularVelocity w = 1;
equation
  // Define movement of center of wheel r_wheel and of wheel axis axis_wheel
  phi = w*time;
  radius_wheel = road.radius + (road.radius/20)*sin(20*phi);
  axis_wheel = {sin(phi),-cos(phi),sin(10*phi)/10};

  annotation (
    experiment(StopTime=6.2),
    Documentation(info="<html>
<p>
Model to check that the tire contact patch calculation is working
correctly with the road models.
</p>
</html>"));
end CheckContactCalculation;
