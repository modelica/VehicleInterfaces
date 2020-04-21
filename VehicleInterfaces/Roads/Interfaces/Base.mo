within VehicleInterfaces.Roads.Interfaces;
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
