within VehicleInterfaces.Roads;
class Tutorial "Roads Tutorial"
  extends Modelica.Icons.Information;

  annotation (DocumentationClass=true,Documentation(info="<html>
<h4>Tutorial - Defining a new road</h4>
<p>
This tutorial will guide you through the steps required to build the
FlatRoad model.
</p>
<ol>
  <li>Create a&nbsp;new road model by extending the base definition which
      is <strong>VehicleInterfaces.Roads.Interfaces.Base</strong></li>

  <li>The minimum steps necessary to define a&nbsp;road model are to provide
      definitions to the following partial function definitions included
      in the base road model.
      <ul>
        <li><strong>position</strong></li>
        <li><strong>trackOffset</strong></li>
        <li><strong>normal</strong></li>
        <li><strong>headingDirection</strong></li>
        <li><strong>frictionCoefficient</strong></li>
      </ul>
      </li>

  <li>Define the position function. The road is to be defined as a&nbsp;line
      along the x-axis with the lateral direction along the y-axis.
      The inputs to the base position function are <strong>s</strong> and
      <strong>w</strong> and these have the following meaning in this road
      definition:

      <blockquote><pre>
s: x-coordinate in world frame (x-axis is road heading direction)
w: y-coordinate in world frame (y-axis is lateral displacement)
      </pre></blockquote>

      The input arguments <strong>s</strong> and <strong>w</strong>
      are common to all the road functions that we need to define and are
      included in the base function definitions. These definitions can
      then be used to define our position function as follows:

      <blockquote><pre>
<strong>function</strong> linePosition \"Determine point on road\"
  <strong>extends</strong> VehicleInterfaces.Roads.Interfaces.Base.position;
<strong>algorithm</strong>
  r_0 := {s,w,0};
<strong>end</strong> linePosition;
      </pre></blockquote>
      </li>

  <li>Define the trackOffset function. This road is defined with a&nbsp;constant
      offset that can be non-zero so the function is defined as:

      <blockquote><pre>
<strong>function</strong> constantOffset \"Determine offset from road centre line\"
  <strong>extends</strong> VehicleInterfaces.Roads.Interfaces.Base.trackOffset;
  <strong>input</strong> Modelica.SIunits.Distance offset;
<strong>algorithm</strong>
  trackOffset := {0,offset,0};
<strong>end</strong> constantOffset;
      </pre></blockquote>
      </li>

  <li>Define the normal function. This road is a&nbsp;flat road so the normal
      is always in the same direction along the z-axis and our normal
      function can be defined as:

      <blockquote><pre>
<strong>function</strong> lineNormal \"Determine unit normal on road\"
  <strong>extends</strong> VehicleInterfaces.Roads.Interfaces.Base.normal;
<strong>algorithm</strong>
  e_n_0 := {0,0,1};
<strong>end</strong> lineNormal;
      </pre></blockquote>
      </li>

  <li>Define the headingDirection function.  In step 3, we define the road
      as a&nbsp;line along the x-axis. This means that the heading direction
      is always in the same direction along the x-axis and our headingDirection
      function can be defined as:

      <blockquote><pre>
<strong>function</strong> lineHeadingDirection
  \"Determine unit heading direction on road\"
  <strong>extends</strong> VehicleInterfaces.Roads.Interfaces.Base.headingDirection;
<strong>algorithm</strong>
  e_s_0 := {1,0,0};
<strong>end</strong> lineHeadingDirection;
      </pre></blockquote>
      </li>

  <li>Define the frictionCoefficient function. The friction coefficient could
      be defined to vary along the road surface but in this case we are going
      to define it as a&nbsp;constant. Our frictionCoefficient can be defined as:

      <blockquote><pre>
<strong>function</strong> lineFrictionCoefficient
  \"Determine friction coefficient at point on road\"
  <strong>extends</strong> VehicleInterfaces.Roads.Interfaces.Base.frictionCoefficient;
  <strong>input</strong> Real mu_fixed \"Friction coefficient\";
<strong>algorithm</strong>
  mu := mu_fixed;
<strong>end</strong> lineFrictionCoefficient;
      </pre></blockquote>
      </li>

  <li>We now need to redeclare the functions in the base road definition to
      be the functions shown above. We do this with the following code assuming
      that the above functions have been defined within the class
      <strong>FlatRoad</strong>:

      <blockquote><pre>
<strong>model</strong> FlatRoad \"Straight road along x-axis (perpendicular to world z-axis)\"
  <strong>extends</strong> VehicleInterfaces.Roads.Interfaces.Base(
    <strong>redeclare final function</strong> position = linePosition,
    <strong>redeclare final function</strong> trackOffset = constantOffset(offset=offset)
    <strong>redeclare final function</strong> normal = lineNormal,
    <strong>redeclare final function</strong> headingDirection = lineHeadingDirection,
    <strong>redeclare final function</strong> frictionCoefficient = lineFrictionCoefficient(mu_fixed=mu));

  //rest of definition
  ...
<strong>end</strong> FlatRoad;
      </pre></blockquote>
      </li>

  <li>In redeclaring the functions we have also introduced new parameters
      <strong>mu</strong> and <strong>offset</strong> that need to be added
      to the model to define the friction coefficient of the road and
      the track offset from the road centre line.</li>

  <li>The <strong>FlatRoad</strong> model included in this package also
      includes animation of the road surface but this is not essential
      to the definition of the road and will not be described in this
      tutorial.</li>

  <li>The road model is complete and can now be used.</li>
  </ol>
</html>"));
end Tutorial;
