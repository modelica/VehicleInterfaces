within VehicleInterfaces.Controllers;
model NoController "Empty controller"
  extends VehicleInterfaces.Icons.Controller;
  extends VehicleInterfaces.Icons.Empty;
  extends Interfaces.Base;
  annotation (Documentation(info="<html>
<p>
Empty controller model. Using this empty model in overall vehicle architecture the functionality of controller can be eliminated.
</p>
</html>"));
end NoController;
