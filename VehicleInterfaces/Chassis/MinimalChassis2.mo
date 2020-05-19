within VehicleInterfaces.Chassis;
model MinimalChassis2
  "Basic chassis model with rigid connection between all 4 wheels, uses chassisFrame connection"
  extends VehicleInterfaces.Icons.Chassis;
  extends VehicleInterfaces.Chassis.Interfaces.TwoAxleBase(includeChassisFrame=true);

  parameter SI.Mass vehicleMass=1200 "Vehicle mass";
  parameter SI.Radius tyreRadius=0.34 "Tyre rolling radius";
  parameter SI.TranslationalDampingConstant drag=1 "Drag force (force = drag*vehicle_speed)";

  Modelica.Mechanics.Rotational.Components.IdealRollingWheel tyres(
    useSupportR=true,
    useSupportT=true,
    radius=tyreRadius)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Mechanics.Translational.Components.Damper dragForces(
    d=drag)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Mechanics.Translational.Sensors.SpeedSensor longitudinalVelocity
    annotation (Placement(transformation(extent={{5,20},{-15,40}})));
  Modelica.Mechanics.MultiBody.Parts.Body body(m=vehicleMass)
    annotation (Placement(transformation(
        origin={0,-50},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic constraint(
    useAxisFlange=true,
    a(fixed=false),
    s(fixed=true),
    v(fixed=false))
    annotation (Placement(transformation(extent={{60,-40},{40,-20}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed ground
    annotation (Placement(transformation(extent={{100,-40},{80,-20}})));
protected
  VehicleInterfaces.Interfaces.ChassisBus chassisBus
    annotation (Placement(transformation(extent={{-130,30},{-110,50}})));
public
  Modelica.Mechanics.MultiBody.Parts.Mounting1D mountingR(n=constraint.n)
    annotation (Placement(transformation(extent={{-50,-20},{-30,0}})));
equation
  connect(tyres.flangeR, wheelHub_2.flange) annotation (Line(points={{-20,0},
          {-90,0},{-90,100}}));
  connect(tyres.flangeR, wheelHub_1.flange) annotation (Line(points={{-20,0},
          {-90,0},{-90,-100}}));
  connect(tyres.flangeR, wheelHub_4.flange) annotation (Line(points={{-20,0},
          {-90,0},{-90,80},{90,80},{90,100}}));
  connect(tyres.flangeR, wheelHub_3.flange) annotation (Line(points={{-20,0},
          {-90,0},{-90,-80},{90,-80},{90,-100}}));
  connect(tyres.flangeT, dragForces.flange_a)
    annotation (Line(points={{0,0},{40,0}}, color={0,127,0}));
  connect(longitudinalVelocity.flange, dragForces.flange_a) annotation (Line(
        points={{5,30},{20,30},{20,0},{40,0}}, color={0,127,0}));
  connect(dragForces.flange_b, constraint.support) annotation (Line(points={{60,0},{
          60,-24},{54,-24}}, color={0,127,0}));
  connect(dragForces.flange_a, constraint.axis) annotation (Line(points={{40,0},{
          40,-12},{40,-24},{42,-24}}, color={0,127,0}));
  connect(controlBus.chassisBus, chassisBus) annotation (Line(
      points={{-158,60},{-120,60},{-120,40}},
      color={255,204,51},
      thickness=0.5));
  connect(constraint.frame_a, ground.frame_b) annotation (Line(
      points={{60,-30},{80,-30}},
      color={95,95,95},
      thickness=0.5));
  connect(mountingR.flange_b, tyres.supportR) annotation (Line(
      points={{-30,-10},{-20,-10}}));
  connect(constraint.support, tyres.supportT) annotation (Line(
      points={{54,-24},{60,-24},{60,-14},{0,-14},{0,-10}},
      color={0,127,0}));
  connect(chassisBus.longitudinalVelocity, longitudinalVelocity.v)
    annotation (Line(
      points={{-120,40},{-120,30},{-16,30}},
      color={0,0,127}), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(body.frame_a, mountingR.frame_a) annotation (Line(
      points={{1.83697e-015,-40},{0,-40},{0,-30},{-40,-30},{-40,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(body.frame_a, constraint.frame_b) annotation (Line(
      points={{1.83697e-015,-40},{0,-40},{0,-30},{40,-30}},
      color={95,95,95},
      thickness=0.5));
  connect(body.frame_a, chassisFrame) annotation (Line(
      points={{1.83697e-015,-40},{0,-40},{0,-30},{-160,-30},{-160,-70}},
      color={95,95,95},
      thickness=0.5));
  annotation (
    Documentation(info="<html>
<p>
Single degree-of-freedom chassis model with mass and speed dependant drag model.
Couples the 1d system to a&nbsp;Multibody system to support the other subsystems.
</p>
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-160,-100},{160,100}})));
end MinimalChassis2;
