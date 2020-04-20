within VehicleInterfaces.Roads;
class Tutorial "Roads Tutorial"
  extends Modelica.Icons.Information;

  annotation (DocumentationClass=true,Documentation(info="<html>
<p><b>Tutorial - Defining a new road</b></p>
<p>This tutorial will guide you through the steps required to build the FlatRoad model.</p>
<ol>
<li>Create a new road model by extending the base definition which is <b>VehicleInterfaces.Roads.Interfaces.Base</b></li>
<li>The minimum steps necessary to define a road model are to provide definitions to the following partial function definitions included in the base road model.
<ul>
<li><b>position</b></li>
<li><b>trackOffset</b></li>
<li><b>normal</b></li>
<li><b>headingDirection</b></li>
<li><b>frictionCoefficient</b></li>
</ul></li>
<li>Define the position function.  The road is to be defined as a line along the x-axis with the lateral direction along the y-axis.  The inputs to the base position function are <b>s</b> and <b>w</b> and these have the following meaning in this road definition:<br>
<pre>

   s: x-coordinate in world frame (x-axis is road heading direction)
   w: y-coordinate in world frame (y-axis is lateral displacement)
</pre>
<br>The input arguments <b>s</b> and <b>w</b> are common to all the road functions that we need to define and are included in the base function definitions.  These definitions can then be used to define our position function as follows:
<br><br><pre>
  function linePosition \"Determine point on road\"
    extends VehicleInterfaces.Roads.Interfaces.Base.position;
  algorithm
    r_0 := {s,w,0};
  end linePosition;

</pre></li>
<li>Define the trackOffset function.  This road is defined with a constant offset that can be non-zero so the function is defined as:
<br><br><pre>
  function constantOffset \"Determine offset from road centre line\"
    extends VehicleInterfaces.Roads.Interfaces.Base.trackOffset;
    input Modelica.SIunits.Distance offset;
  algorithm
    trackOffset := {0,offset,0};
  end constantOffset;

</pre></li>
<li>Define the normal function.  This road is a flat road so the normal is always in the same direction along the z-axis and our normal function can be defined as:
<br><br><pre>
  function lineNormal \"Determine unit normal on road\"
    extends VehicleInterfaces.Roads.Interfaces.Base.normal;
  algorithm
    e_n_0 := {0,0,1};
  end lineNormal;

</pre></li>
<li>Define the headingDirection function.  In step 3, we define the road as a line along the x-axis.  This means that the heading direction is always in the same direction along the x-axis and our headingDirection function can be defined as:
<br><br><pre>
  function lineHeadingDirection
    \"Determine unit heading direction on road\"
    extends VehicleInterfaces.Roads.Interfaces.Base.headingDirection;
  algorithm
    e_s_0 := {1,0,0};
  end lineHeadingDirection;

</pre></li>
<li>Define the frictionCoefficient function.  The friction coefficient could be defined to vary along the road surface but in this case we are going to define it as a constant.  Our frictionCoefficient can be defined as:
<br><br><pre>
  function lineFrictionCoefficient
    \"Determine friction coefficient at point on road\"
    extends VehicleInterfaces.Roads.Interfaces.Base.frictionCoefficient;
    input Real mue_fixed \"Friction coefficient\";
  algorithm
    mue := mue_fixed;
  end lineFrictionCoefficient;

</pre></li>
<li>We now need to redeclare the functions in the base road definition to be the functions shown above.  We do this with the following code assuming that the above functions have been defined within the class <b>FlatRoad</b>:
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

</pre></li>
<li>In redeclaring the functions we have also introduced new parameters <b>mue</b> and <b>offset</b> that need to be added to the model to define the friction coefficient of the road and the track offset from the road centre line.</li>
<li>The <b>FlatRoad</b> model included in this package also includes animation of the road surface but this is not essential to the definition of the road and will not be described in this tutorial.</li>
<li>The road model is complete and can now be used</li>
</ol>
</html>"));
end Tutorial;
