within VehicleInterfaces.Roads.Internal;
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
  parameter SI.Length s_min=0 "Minimum value of s";
  parameter SI.Length s_max=1 "Maximum value of s";
  parameter SI.Length w_min=-1 "Minimum value of w";
  parameter SI.Length w_max=1 "Maximum value of w";

protected
  outer VehicleInterfaces.Roads.Interfaces.Base road;

  encapsulated function roadSurfaceCharacteristic
  import Modelica;
  import VehicleInterfaces;
    extends Modelica.Mechanics.MultiBody.Interfaces.partialSurfaceCharacteristic(      final multiColoredSurface=false);
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
<p>
Object used for visualization of road surface. Road position evaluation
is performed internally to enable correct visualization of the road surface.
The road length and width can be given via parameters (see list below).
The road visualization object consists of segments. Their number is
dependent on the number of points along <em>s</em> and <em>w</em>.
</p>
</html>"));
end VisualizeSimpleRoads;
