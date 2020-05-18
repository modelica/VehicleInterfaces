within VehicleInterfaces.Roads;
model FlatRoad "Straight road along x-axis (perpendicular to world z-axis)"
  extends VehicleInterfaces.Icons.Road;
  extends VehicleInterfaces.Roads.Interfaces.Base(
    redeclare final function position = linePosition,
    redeclare final function trackOffset = constantOffset (offset=offset),
    redeclare final function normal = lineNormal,
    redeclare final function headingDirection = lineHeadingDirection,
    redeclare final function frictionCoefficient = lineFrictionCoefficient (mu_fixed=mu));

  parameter Boolean animation=true "= true, if road shall be visualized";
  parameter Real mu=0.5 "Friction coefficient of road";
  parameter Modelica.Mechanics.MultiBody.Types.Color roadColor={255,0,0}
    "Color of road" annotation (Dialog(group="Animation",enable=animation));
  parameter SI.Length width=8 "Width of road"
    annotation (Dialog(group="Animation", enable=animation));
  parameter SI.Position x_min=-100
    "Roads is visualized in the range [x_min .. x_max]"
    annotation (Dialog(group="Animation", enable=animation));
  parameter SI.Position x_max=100
    "Roads is visualized in the range [x_min .. x_max]"
    annotation (Dialog(group="Animation", enable=animation));
  parameter SI.Distance offset=0
    "Offset from the road centre line";
protected
  outer Modelica.Mechanics.MultiBody.World world;
  VehicleInterfaces.Roads.Internal.VisualizeSimpleRoads roadShape(
    ns=2,
    nw=2,
    s_min=x_min,
    s_max=x_max,
    w_min=-width/2,
    w_max=width/2,
    color=roadColor) if animation and world.enableAnimation;

  function linePosition "Determine point on road"
    extends VehicleInterfaces.Roads.Interfaces.positionBase;
  algorithm
    r_0 := {s,w,0};
  end linePosition;

  function constantOffset "Determine offset from road centre line"
    extends VehicleInterfaces.Roads.Interfaces.trackOffsetBase;
    input SI.Distance offset=0;
  algorithm
    trackOffset := {0,offset,0};
  end constantOffset;

  function lineNormal "Determine unit normal on road"
    extends VehicleInterfaces.Roads.Interfaces.normalBase;
  algorithm
    e_n_0 := {0,0,1};
  end lineNormal;

  function lineHeadingDirection "Determine unit heading direction on road"
    extends VehicleInterfaces.Roads.Interfaces.headingDirectionBase;
  algorithm
    e_s_0 := {1,0,0};
  end lineHeadingDirection;

  function lineFrictionCoefficient
    "Determine friction coefficient at point on road"
    extends VehicleInterfaces.Roads.Interfaces.frictionCoefficientBase;
    input Real mu_fixed=1 "Friction coefficient";
  algorithm
    mu := mu_fixed;
  end lineFrictionCoefficient;

  annotation (
    defaultComponentName="road",
    defaultComponentPrefixes="inner",
    Documentation(info="<html>
<p>
The road is a line along the x-axis of the world system.
The road surface parameters are defined as:
</p>
<blockquote><pre>
s: x-coordinate in world frame (x-axis is road heading direction)
w: y-coordinate in world frame (y-axis is lateral displacement)
</pre></blockquote>
<p>
The point s=0, w=0 has position vector r={0, 0, 0};
</p>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-200,-100},{200,100}})));
end FlatRoad;
