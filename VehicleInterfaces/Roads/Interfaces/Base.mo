within VehicleInterfaces.Roads.Interfaces;
partial model Base "Basic model for all roads"

  replaceable function position = Roads.Interfaces.positionBase
    "Get position vector at a road location" annotation (
      choicesAllMatching=true,
      Dialog(tab="Functions"),
      Documentation(info="<html>
<p>
This function returns the road position vector w.r.t world at the road location (s,w).
</p>
</html>"));

  replaceable function trackOffset = Roads.Interfaces.trackOffsetBase
    "Get track offset at a road location" annotation (
      choicesAllMatching=true,
      Dialog(tab="Functions"),
      Documentation(info="<html>
<p>
This function returns the track offset at the road location (s,w).
</p>
</html>"));

  replaceable function normal = Roads.Interfaces.normalBase
    "Get road normal at a road location" annotation (
      choicesAllMatching=true,
      Dialog(tab="Functions"),
      Documentation(info="<html>
<p>
This function returns the normal vector of the road surface at the road location (s,w).
</p>
</html>"));

  replaceable function headingDirection = Roads.Interfaces.headingDirectionBase
    "Get heading direction at a road location" annotation (
      choicesAllMatching=true,
      Dialog(tab="Functions"),
      Documentation(info="<html>
<p>
This function returns the unit heading direction at the road location (s,w).
</p>
</html>"));

  replaceable function frictionCoefficient = Roads.Interfaces.frictionCoefficientBase
    "Get friction coefficient at a road location" annotation (
      choicesAllMatching=true,
      Dialog(tab="Functions"),
      Documentation(info="<html>
<p>
This function returns the friction coefficient at the road location (s,w).
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
