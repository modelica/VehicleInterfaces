within VehicleInterfaces.Roads;
model CircleRoad "Circular road (perpendicular to world z-axis)"
  extends VehicleInterfaces.Roads.Interfaces.Base(
    redeclare final function position = circlePosition (radius=radius, width=width),
    redeclare final function trackOffset = constantOffset,
    redeclare final function normal = circleNormal,
    redeclare final function headingDirection = circleHeadingDirection (radius=radius),
    redeclare final function frictionCoefficient = circleFrictionCoefficient (mue_fixed=mue));

  parameter Boolean animation=true "= true, if road shall be visualized";
  parameter Modelica.SIunits.Radius radius "Radius of road";
  parameter Modelica.SIunits.Length width "Width of road";
  parameter Real mue "Friction coefficient of road";
  parameter Modelica.Mechanics.MultiBody.Types.Color roadColor={255,0,0}
    "Color of road";
  constant Real pi=Modelica.Constants.pi;
protected
  outer Modelica.Mechanics.MultiBody.World world;
  VehicleInterfaces.Roads.Internal.VisualizeSimpleRoads roadShape(
    ns=100,
    nw=10,
    s_min=0,
    s_max=2*pi*radius,
    w_min=-width/2,
    w_max=width/2,
    color=roadColor) if animation and world.enableAnimation;

  function r_middle
    "Determine point on road in the middle of the circle (w=0"
    extends Modelica.Icons.Function;
    input Real s=0
      "Roads surface parameter 1 (usually arc length along road)";
    input Real radius=1 "Radius of circle";
    output Real r_0[3]={radius*sin(s/radius),-radius*cos(s/radius),0};
  algorithm
    r_0 := {radius*sin(s/radius),-radius*cos(s/radius),0};
  end r_middle;

  function circlePosition "Determine point on road"
    import Modelica.Math.Vectors.normalize;
    extends VehicleInterfaces.Roads.Interfaces.positionBase;
    input Modelica.SIunits.Radius radius=1 "Radius of circle";
    input Modelica.SIunits.Length width=1 "Width of road";
  algorithm
    r_0 := r_middle(s, radius) + w*normalize(r_middle(s, radius));
  end circlePosition;

  function constantOffset "Determine offset from road centre line"
    extends VehicleInterfaces.Roads.Interfaces.trackOffsetBase;
  algorithm
    trackOffset := {0,0,0};
  end constantOffset;

  function circleNormal
    "Determine unit normal on road, given road surface parameters"
    extends VehicleInterfaces.Roads.Interfaces.normalBase;
  algorithm
    e_n_0 := {0,0,1};
  end circleNormal;

  function circleHeadingDirection "Determine unit heading direction on road"
    extends VehicleInterfaces.Roads.Interfaces.headingDirectionBase;
    input Modelica.SIunits.Radius radius=1 "Radius of circle";
  algorithm
    e_s_0 := {cos(s/radius),sin(s/radius),0};
  end circleHeadingDirection;

  function circleFrictionCoefficient
    "Determine friction coefficient at point on road"
    extends VehicleInterfaces.Roads.Interfaces.frictionCoefficientBase;
    input Real mue_fixed=1 "Friction coefficient";
  algorithm
    mue := mue_fixed;
  end circleFrictionCoefficient;

  annotation (
    defaultComponentName="road",
    defaultComponentPrefixes="inner",
    Documentation(info="<html>
<p>
The road is a circle described by \"radius\" and \"width\".
The road surface parameters are defined as:
</p>
<pre>
   s: arc length along circle
   w: lateral displacement of road, perpendiular to circle
</pre>
<p>
The point s=0, w=0 has position vector r={0,-radius, 0};
</p>
<p>
The functions are defined in such a way that Dymola inlines
all the functions. As a result, it is easy to get derivatives
of the functions.
</p>
</html>"),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2},
        initialScale=0.2), graphics={
        Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-40,40},{40,-40}},
          lineColor={95,95,95},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-70,70},{70,-70}},
          lineColor={255,255,255},
          pattern=LinePattern.Dash),
        Text(
          extent={{-150,160},{150,110}},
          lineColor={0,0,255},
          textString="%name")}));
end CircleRoad;
