within VehicleInterfaces.Chassis;
model NoChassis "Empty chassis"
  extends VehicleInterfaces.Icons.Chassis;
  extends VehicleInterfaces.Icons.Empty;
  extends VehicleInterfaces.Chassis.Interfaces.TwoAxleBase(includeWheelBearings=world.driveTrainMechanics3D);
protected
  outer Modelica.Mechanics.MultiBody.World world;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,-100},{160,100}})),
    Documentation(info="<html>
<p>
Empty chassis model. Using this empty model in overall vehicle architecture the functionality of chassis can be eliminated.
</p>
</html>"));
end NoChassis;
