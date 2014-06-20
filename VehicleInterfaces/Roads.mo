within VehicleInterfaces;
package Roads "Collection of road definitions"
  extends VehicleInterfaces.Icons.VariantLibrary;

  class Tutorial "Roads Tutorial"
    extends Modelica.Icons.Information;

    annotation (DocumentationClass=true,Documentation(info="<html>
<p><b>Tutorial - Defining a new road</b></p>
<p>This tutorial will guide you through the steps required to build the FlatRoad model.</p>
<ol>
<li>Create a new road model by extending the base definition which is <b>VehicleInterfaces.Roads.Interfaces.Base</b></li>
<li>The minimum steps necessary to define a road model are to provide definitions to the following partial function definitions included in the base road model.</li>
<ul>
<li><b>position</b></li>
<li><b>trackOffset</b></li>
<li><b>normal</b></li>
<li><b>headingDirection</b></li>
<li><b>frictionCoefficient</b></li>
</ul>
<li>Define the position function.  The road is to be defined as a line along the x-axis with the lateral direction along the y-axis.  The inputs to the base position function are <b>s</b> and <b>w</b> and these have the following meaning in this road definition:<br>
<pre>

   s: x-coordinate in world frame (x-axis is road heading direction)
   w: y-coordinate in world frame (y-axis is lateral displacement)
</pre>
<br>The input arguments <b>s</b> and <b>w</b> are common to all the road functions that we need to define and are included in the base function definitions.  These definitions can then be used to define our position function as follows:</li>
<br><br><pre>
  function linePosition \"Determine point on road\"
    extends VehicleInterfaces.Roads.Interfaces.Base.position;
  algorithm
    r_0 := {s,w,0};
  end linePosition;

</pre>
<li>Define the trackOffset function.  This road is defined with a constant offset that can be non-zero so the function is defined as:</li>
<br><br><pre>
  function constantOffset \"Determine offset from road centre line\"
    extends VehicleInterfaces.Roads.Interfaces.Base.trackOffset;
    input Modelica.SIunits.Distance offset;
  algorithm
    trackOffset := {0,offset,0};
  end constantOffset;

</pre>
<li>Define the normal function.  This road is a flat road so the normal is always in the same direction along the z-axis and our normal function can be defined as:</li>
<br><br><pre>
  function lineNormal \"Determine unit normal on road\"
    extends VehicleInterfaces.Roads.Interfaces.Base.normal;
  algorithm
    e_n_0 := {0,0,1};
  end lineNormal;

</pre>
<li>Define the headingDirection function.  In step 3, we define the road as a line along the x-axis.  This means that the heading direction is always in the same direction along the x-axis and our headingDirection function can be defined as:</li>
<br><br><pre>
  function lineHeadingDirection
    \"Determine unit heading direction on road\"
    extends VehicleInterfaces.Roads.Interfaces.Base.headingDirection;
  algorithm
    e_s_0 := {1,0,0};
  end lineHeadingDirection;

</pre>
<li>Define the frictionCoefficient function.  The friction coefficient could be defined to vary along the road surface but in this case we are going to define it as a constant.  Our frictionCoefficient can be defined as:</li>
<br><br><pre>
  function lineFrictionCoefficient
    \"Determine friction coefficient at point on road\"
    extends VehicleInterfaces.Roads.Interfaces.Base.frictionCoefficient;
    input Real mue_fixed \"Friction coefficient\";
  algorithm
    mue := mue_fixed;
  end lineFrictionCoefficient;

</pre>
<li>We now need to redeclare the functions in the base road definition to be the functions shown above.  We do this with the following code assuming that the above functions have been defined within the class <b>FlatRoad</b>:</li>
<br><br><pre>
  model FlatRoad \"Straight road along x-axis (perpendicular to world z-axis)\"
    extends VehicleInterfaces.Roads.Interfaces.Base(
      redeclare final function position = linePosition,
      redeclare final function trackOffset = constantOffset(offset=offset)
      redeclare final function normal = lineNormal,
      redeclare final function headingDirection = lineHeadingDirection,
      redeclare final function frictionCoefficient = lineFrictionCoefficient(mue_fixed=mue));

    //rest of definition
    ...
  end FlatRoad;

</pre>
<li>In redeclaring the functions we have also introduced new parameters <b>mue</b> and <b>offset</b> that need to be added to the model to define the friction coefficient of the road and the track offset from the road centre line.</li>
<li>The <b>FlatRoad</b> model included in this package also includes animation of the road surface but this is not essential to the definition of the road and will not be described in this tutorial.</li>
<li>The road model is complete and can now be used</li>
</ol>
</html>"));
  end Tutorial;

  package Interfaces "Collection of interface definitions for roads"
    extends Modelica.Icons.InterfacesPackage;

    partial function positionBase "Determine road position"
      extends Modelica.Icons.Function;
      input Real s=0
        "Roads surface parameter 1 (usually arc length along road)";
      input Real w=0 "Roads surface parameter 2 (usually lateral direction)";
      output Modelica.SIunits.Position r_0[3]=zeros(3)
        "Position vector from world frame to point on road at (s,w), resolved in world frame";
      annotation (Documentation(info="<html>
<p>
Partial base model for road position. Extend this model appropriately to define final user model.
</p>
</html>"));
    end positionBase;

    partial function trackOffsetBase
      "Determine track offset from road centre line"
      extends Modelica.Icons.Function;
      input Real s=0
        "Roads surface parameter 1 (usually arc length along road)";
      input Real w=0 "Roads surface parameter 2 (usually lateral direction)";
      output Modelica.SIunits.Position trackOffset[3]=zeros(3)
        "Track offset vector from road centre line to desired trajectory point";
      annotation (Documentation(info="<html>
<p>
Partial base model for track offset from road centre line. Extend this model appropriately to define final user model.
</p>
</html>"));
    end trackOffsetBase;

    partial function normalBase "Determine unit normal on road"
      extends Modelica.Icons.Function;
      input Real s=0
        "Roads surface parameter 1 (usually arc length along road)";
      input Real w=0 "Roads surface parameter 2 (usually lateral direction)";
      output Real e_n_0[3]={0,0,1}
        "Unit normal of road at (s,w), resolved in world frame";
      annotation (Documentation(info="<html>
<p>
Partial base model for unit normal on road. Extend this model appropriately to define final user model.
</p>
</html>"));
    end normalBase;

    partial function headingDirectionBase
      "Determine unit heading direction on road"
      extends Modelica.Icons.Function;
      input Real s=0
        "Roads surface parameter 1 (usually arc length along road)";
      input Real w=0 "Roads surface parameter 2 (usually lateral direction)";
      output Real e_s_0[3]={1,0,0}
        "Unit vector in direction of road heading at (s,w), resolved in world frame";
      annotation (Documentation(info="<html>
<p>
Partial base model for unit heading direction on road. Extend this model appropriately to define final user model.
</p>
</html>"));
    end headingDirectionBase;

    partial function frictionCoefficientBase
      "Determine friction coefficient on road"
      extends Modelica.Icons.Function;
      input Real s=0
        "Roads surface parameter 1 (usually arc length along road)";
      input Real w=0 "Roads surface parameter 2 (usually lateral direction)";
      output Real mue=1 "Roads friction coefficient at (s,w)";
      annotation (Documentation(info="<html>
<p>
Partial base model for friction coefficient at point on road. Extend this model appropriately to define final user model.
</p>
</html>"));
    end frictionCoefficientBase;

    partial model Base "Base model for all roads"

      replaceable function position =
          VehicleInterfaces.Roads.Interfaces.positionBase
        "Dummy model for road position" annotation (Documentation(info="<html>
<p>
Dummy model to demonstrate how the road position should be defined and included in road model.
</p>
</html>"));

      replaceable function trackOffset =
          VehicleInterfaces.Roads.Interfaces.trackOffsetBase
        "Dummy model for track offset from road centre line" annotation (
          Documentation(info="<html>
<p>
Dummy model to demonstrate how the track offset should be defined and included in road model.
</p>
</html>"));

      replaceable function normal =
          VehicleInterfaces.Roads.Interfaces.normalBase
        "Dummy model for unit normal on road" annotation (Documentation(info="<html>
<p>
Dummy model to demonstrate how the unit normal should be defined and included in road model.
</p>
</html>"));

      replaceable function headingDirection =
          VehicleInterfaces.Roads.Interfaces.headingDirectionBase
        "Dummy model for unit heading direction on road"
        annotation (Documentation(info="<html>
<p>
Dummy model to demonstrate how the unit heading direction should be defined and included in road model.
</p>
</html>"));

      replaceable function frictionCoefficient =
          VehicleInterfaces.Roads.Interfaces.frictionCoefficientBase
        "Dummy model for friction coefficient on road" annotation (Documentation(
            info="<html>
<p>
Dummy model to demonstrate how the friction coefficient should be defined and included in road model.
</p>
</html>"));

      annotation (
        defaultComponentName="road",
        defaultComponentPrefixes="inner",
        Documentation(info="<html>
<p>
A vehicle is driving on a road that is described
as parameterized surface r<sub>0</sub> = r<sub>0</sub>(s, w),
where (s, w) are the surface parameters. Usually, \"s\"
describes the heading direction, i.e., the direction in which the
vehicle is driving, whereas \"w\" describes the lateral direction
of the track.
</p>
</html>"));
    end Base;

    annotation (Documentation(info="<html>
<p>
Basic interface definition of a generic road as parameterized surface.
</p>
</html>"));
  end Interfaces;

  model FlatRoad "Straight road along x-axis (perpendicular to world z-axis)"
    extends VehicleInterfaces.Icons.Road;
    extends VehicleInterfaces.Roads.Interfaces.Base(
      redeclare final function position = linePosition,
      redeclare final function trackOffset = constantOffset (
        offset=offset),
      redeclare final function normal = lineNormal,
      redeclare final function headingDirection = lineHeadingDirection,
      redeclare final function frictionCoefficient = lineFrictionCoefficient (
        mue_fixed=mue));

    parameter Boolean animation=true "= true, if road shall be visualized";
    parameter Real mue=0.5 "Friction coefficient of road";
    parameter Modelica.Mechanics.MultiBody.Types.Color roadColor={255,0,0}
      "Color of road" annotation (Dialog(group="Animation",enable=animation));
    parameter Modelica.SIunits.Length width=8 "Width of road"
      annotation (Dialog(group="Animation", enable=animation));
    parameter Modelica.SIunits.Position x_min=-100
      "Roads is visualized in the range [x_min .. x_max]"
      annotation (Dialog(group="Animation", enable=animation));
    parameter Modelica.SIunits.Position x_max=100
      "Roads is visualized in the range [x_min .. x_max]"
      annotation (Dialog(group="Animation", enable=animation));
    parameter Modelica.SIunits.Distance offset=0
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
      input Modelica.SIunits.Distance offset=0;
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
      input Real mue_fixed=1 "Friction coefficient";
    algorithm
      mue := mue_fixed;
    end lineFrictionCoefficient;

    annotation (
      defaultComponentName="road",
      defaultComponentPrefixes="inner",
      Documentation(info="<html>
<p>
The road is a line along the x-axis of the world system.
The road surface parameters are defined as:
</p>
<pre>
   s: x-coordinate in world frame (x-axis is road heading direction)
   w: y-coordinate in world frame (y-axis is lateral displacement)
</pre>
<p>
The point s=0, w=0 has position vector r={0, 0, 0};
</p>
</html>"),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-200,-100},{200,
              100}}), graphics));
  end FlatRoad;

  model CircleRoad "Circular road (perpendicular to world z-axis)"
    extends VehicleInterfaces.Roads.Interfaces.Base(
      redeclare final function position = circlePosition (
        radius=radius,
        width=width),
      redeclare final function trackOffset = constantOffset,
      redeclare final function normal = circleNormal,
      redeclare final function headingDirection = circleHeadingDirection (
        radius=radius),
      redeclare final function frictionCoefficient = circleFrictionCoefficient
          (
        mue_fixed=mue));

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

  package Internal "Collection of internal material involving roads"
    extends Modelica.Icons.InternalPackage;

    model VisualizeSimpleRoads
      "Simple visualization of a road as parameterized surface"
      parameter Integer ns(min=2) = 2
        "Number of points along surface parameter 1";
      parameter Integer nw(min=2) = 2
        "Number of points along surface parameter 2";
      extends Modelica.Mechanics.MultiBody.Visualizers.Advanced.Surface(
        final nu=ns,
        final nv=nw,
        redeclare final function surfaceCharacteristic =
            roadSurfaceCharacteristic (
          final position=road.position,
          final s_min=s_min,
          final s_max=s_max,
          final w_min=w_min,
          final w_max=w_max));
      parameter Real s_min=0 "Minimum value of s";
      parameter Real s_max=1 "Maximum value of s";
      parameter Real w_min=-1 "Minimum value of w";
      parameter Real w_max=1 "Maximum value of w";

    protected
      outer VehicleInterfaces.Roads.Interfaces.Base road;

      encapsulated function roadSurfaceCharacteristic
      import  Modelica;
      import VehicleInterfaces;
        extends
          Modelica.Mechanics.MultiBody.Interfaces.partialSurfaceCharacteristic(            final multiColoredSurface=false);
        input VehicleInterfaces.Roads.Interfaces.positionBase position;
        input Real s_min=0 "Minimum value of s";
        input Real s_max=1 "Maximum value of s";
        input Real w_min=-1 "Minimum value of w";
        input Real w_max=1 "Maximum value of w";
      protected
        Real s;
        Real w;
        Real r[3];
        parameter Real ds = s_max - s_min
          "Length of one segment in s-direction";
        parameter Real dw = w_max - w_min
          "Length of one segment in w-direction";
      algorithm
        for j in 1:nv loop
          w := w_min + (j - 1)*dw/(nv - 1);
          for i in 1:nu loop
            s := s_min + (i - 1)*ds/(nu - 1);
            r := position(s, w);
            X[i, j] := r[1];
            Y[i, j] := r[2];
            Z[i, j] := r[3];
          end for;
        end for;
      end roadSurfaceCharacteristic;

      annotation (preferredView="info", Documentation(info="<html>
<p>Object used for visualization of road surface. Road position evaluation is performed internally to enable correct visualization of the road surface. The road length and width can be given via parameters (see list below). The road visualization object consists of segments. Their number is dependent on the number of points along <i>s</i> and <i>w</i>.</p>
</html>"));
    end VisualizeSimpleRoads;

    model DummyTyre
      "Dummy wheel model to test contact point calculation of wheel within model CheckContactCalculation"
      import Modelica.Math.Vectors.normalize;

      parameter SI.Radius wheelRadius=1 "Radius of wheel";

      input Real[3] e_axis "Unit vector in direction of wheel axis" annotation(Dialog);
      input SI.Position[3] r_wheel "Position of center of wheel" annotation(Dialog);
      output SI.Position[3] r_CP(start={0,-wheelRadius,0})
        "Position vector to contact point of wheel with road, resolved in world frame";
      output SI.Length penetrationDepth
        "Penetration depth of wheel with respect to road";
      output Real mue "friction coefficient";

      // Auxiliary variables
      Real s(start=0);
      Real w(start=0);

      outer VehicleInterfaces.Roads.Interfaces.Base road;

    protected
      Real e_n[3] "Unit vector along road normal";
      Real e_s[3] "Unit vector along road heading direction";
      Real e_w[3] "Unit vector along road \"lateral\" direction";
      Real e_CP[3]
        "Unit vector from wheel center to contact point, resolved in world frame";
      Real d_CP[3];
      Modelica.SIunits.Radius reducedRadius;
    equation
      r_CP = road.position(s, w);
      e_n = road.normal(s, w);
      e_s = road.headingDirection(s, w);
      e_w = cross(e_n, e_s);
      e_CP = normalize(e_n - (e_n*e_axis)*e_axis);
      d_CP = r_wheel - r_CP;

      /* The equation
        r_CP = r_wheel + (wheelRadius - penetrationDepth)*e_CP;
      or
        d_CP = reducedRadius*e_CP;
      is projected along e_n, e_s, e_w in order to eliminate the
      unknown penetrationDepth thus reducing the set of 3 non-linear
      equations to 2 non-linear equations.
   */
      reducedRadius = e_n*d_CP/(e_n*e_CP);
      penetrationDepth = wheelRadius - reducedRadius;
      0 = e_s*d_CP - reducedRadius*(e_s*e_CP);
      0 = e_w*d_CP - reducedRadius*(e_w*e_CP);

      // Friction coefficient at contact point
      mue = road.frictionCoefficient(s, w);
      annotation (Documentation(info="<html>
<p>A dummy wheel model used in test models to check the road definitions. Within this model, no tire force calculation is performed. Only kinematic relationships between wheel input <code>e_axis</code> (unit vector in direction of wheel axis) and <code>r_wheel</code> (wheel center position) and road definition are given. </p>
<p>
Simply change the two inputs <code>e_axis</code> and <code>r_wheel</code> and compare wheel model outputs with road definition. </p>
</html>"), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={
            Ellipse(
              extent={{-100,0},{100,-100}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-80,-20},{80,-80}},
              lineColor={95,95,95},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,60},{152,20}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%name"),
            Line(
              points={{0,-20},{0,-80}},
              color={95,95,95},
              smooth=Smooth.None),
            Line(
              points={{-80,-50},{80,-50}},
              color={95,95,95},
              smooth=Smooth.None),
            Line(
              points={{-58,-30},{58,-70}},
              color={95,95,95},
              smooth=Smooth.None),
            Line(
              points={{-58,-70},{58,-30}},
              color={95,95,95},
              smooth=Smooth.None)}));
    end DummyTyre;

    model CheckContactCalculation
      "Check that wheel contact point calculation is properly working with road model"
      extends Modelica.Icons.Example;

      parameter Real wheelRadius=1 "Radius of wheel";
      Real phi;
      Real radius_wheel;
      Real axis_wheel[3];
      Real r_circle[3]={road.radius*sin(phi),-road.radius*cos(phi),0};
      VehicleInterfaces.Roads.Internal.DummyTyre tyre(
        wheelRadius=wheelRadius,
        e_axis = Modelica.Math.Vectors.normalize(axis_wheel),
        r_wheel={radius_wheel*sin(phi),-radius_wheel*cos(phi),1 + sin(phi)/20})
        annotation (Placement(transformation(extent={{20,40},{40,60}}, rotation=
               0)));
      inner VehicleInterfaces.Roads.CircleRoad road(
        radius=50,
        width=8,
        mue=0.5,
        roadColor={100,100,100}) annotation (Placement(transformation(extent={{
                -40,40},{0,80}}, rotation=0)));
      inner Modelica.Mechanics.MultiBody.World world(
        enableAnimation=true,
        axisLength=20,
        n={0,0,-1}) annotation (Placement(transformation(extent={{-80,40},{-60,
                60}}, rotation=0)));
    equation
      // Define movement of center of wheel r_wheel and of wheel axis axis_wheel
      phi = time;
      radius_wheel = road.radius + (road.radius/20)*sin(20*phi);
      axis_wheel = {sin(phi),-cos(phi),sin(10*phi)/10};

      annotation (
        experiment(StopTime=6.2),
        Documentation(info="<html>
<p>Model to check that the tire contact patch calculation is working correctly with the road models.</p>
</html>"));
    end CheckContactCalculation;

    model CheckFunctionDifferentiation_FlatRoads
      "Check that road functions can be differentiated"
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
      inner Modelica.Mechanics.MultiBody.World world(enableAnimation=true, n={0,
            0,-1}) annotation (Placement(transformation(extent={{-80,40},{-60,
                60}}, rotation=0)));
      inner FlatRoad road annotation (Placement(transformation(extent={{-40,40},
                {0,60}}, rotation=0)));
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
<p>Model to check that the road functions can be differentiated correctly</p>
</html>"));
    end CheckFunctionDifferentiation_FlatRoads;

    model CheckFunctionDifferentiation_CircleRoads
      "Check that road functions can be differentiated"
      import Modelica.Mechanics.MultiBody.Frames;
      extends Modelica.Icons.Example;
      parameter Real k=0.8 "Constant acceleration";
      Real phi;
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
      inner Modelica.Mechanics.MultiBody.World world(enableAnimation=true, n={0,
            0,-1}) annotation (Placement(transformation(extent={{-80,40},{-60,
                60}}, rotation=0)));
      inner CircleRoad road(
        radius=1,
        width=0.2,
        mue=0.5) annotation (Placement(transformation(extent={{-40,40},{0,80}},
              rotation=0)));
    equation
      phi = (k/2)*time*time;
      s = road.radius*phi;
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
<p>Model to check that the road functions can be differentiated correctly</p>
</html>"));
    end CheckFunctionDifferentiation_CircleRoads;

    annotation (Documentation(info="<html>
<p>
A collection of internal material for road models. Utility models and functions that are usually of no interest for the user are mainly included.
</p>
</html>"));
  end Internal;

  annotation (Documentation(info="<html>
<p>The road subsystem interfaces are defined in this sub-package of the VehicleInterfaces library.  The road subsystem has no connectors but contains standard functions that can be redeclared to implement different roads.  When a road subsystem is used in a model architecture it should be declared as an <b>inner</b> system so that it's functions can be accessed by other components in the model.</p>
<h4>Effects to be modelled in this subsystem</h4>
<p>Within the VehicleIntefaces package the road subsystem is used to define the road surface.</p>
</html>"));
end Roads;
