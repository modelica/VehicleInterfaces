within VehicleInterfaces.Roads.Examples;
model CheckFunctionDifferentiation_FlatRoads "Check that road functions can be differentiated"
  import Modelica.Mechanics.MultiBody.Frames;
  extends Modelica.Icons.Example;

  parameter Real k=0.8 "Constant acceleration";
  Real s;
  Real r[3];
  Real e_s[3];
  Real e_n[3];
  Real e_y[3];
  Real T[3, 3];
  Real v[3];
  Real a[3];
  Real w[3];
  Real z[3];
  Frames.Orientation R;

  inner Modelica.Mechanics.MultiBody.World world(
    enableAnimation=true,
    n={0,0,-1}) annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  inner FlatRoad road annotation (Placement(transformation(extent={{-40,40},{0,60}})));

equation
  s = (k/2)*time*time;
  r = road.position(s, 0);
  e_s = road.headingDirection(s, 0);
  e_n = road.normal(s, 0);
  e_y = cross(e_n, e_s);
  T = transpose([e_s, e_y, e_n]);
  R = Frames.from_T2(T, der(T));

  // Velocity and acceleration
  v = der(r);
  a = der(v);

  // Angular velocity and angular acceleration
  w = Frames.angularVelocity2(R);
  z = der(w);

  annotation (
    experiment(StopTime=1),
    Documentation(info="<html>
<p>
Model to check that the road functions can be differentiated correctly.
</p>
</html>"));
end CheckFunctionDifferentiation_FlatRoads;
