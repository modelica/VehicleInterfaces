within VehicleInterfaces.Drivelines;
model NoDriveline "Empty driveline model for a 4 wheeled vehicle"
  extends VehicleInterfaces.Icons.Driveline;
  extends VehicleInterfaces.Icons.Empty;
  extends VehicleInterfaces.Drivelines.Interfaces.TwoAxleBase(
    includeWheelBearings=world.driveTrainMechanics3D);
protected
  outer Modelica.Mechanics.MultiBody.World world;
  annotation (
    Documentation(info="<html>
<p>
Zero torque is applied to all the wheelhubs and the reaction paths in to 
the wheel hubs included if the <strong>driveTrainMechanics3D</strong> 
flag in the world object is true.
</p>
<p>
Using this empty model in overall vehicle architecture the functionality 
of driveline can be eliminated.
</p>
</html>"));
end NoDriveline;
