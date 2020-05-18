within VehicleInterfaces.Accessories;
class Tutorial "Accessories Tutorial"
  extends Modelica.Icons.Information;

  annotation (DocumentationClass=true, Documentation(info="<html>
<h4>Tutorial - Defining a new accessories model</h4>
<p>
The following process will demonstrate how to create a&nbsp;new
accessories model using these interface definitions. This tutorial
will guide you through building an accessory subsystem with
a&nbsp;power steering pump and alternator. Both will be modelled
using speed dependant torque loss maps.
</p>
<ol>
  <li>Create a new model that extends
      <strong>VehicleInterfaces.Accessories.Interfaces.Base</strong>,
      it should look like this:
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/Accessories/buildNewAccessories1.png\">
      <br><br></li>
  <li>In the component browser, right click on <strong>Base</strong> and
      select <strong>Parameters</strong> from the context menu to produce
      the following parameter dialog:
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/Accessories/buildNewAccessories3.png\">
      <br><br></li>
  <li>This dialog allows you to enable/disable the optional bearing connectors
      within the engineFlange by setting <strong>includeEngineBearing</strong>
      as required.</li>
  <li>You can now define your accessory model as required</li>
</ol>


<h4>Adding an alternator and power steering pump</h4>
<p>
The following steps demonstrate how to create a simple accessories model.
The subsystem will include an alternator and power steering pump that are
modelled separately but both use speed-dependant torque loss maps.
</p>
<p>
Starting from step&nbsp;2 above.
</p>
<ol>
  <li>Add the following blocks and connections to the diagram:
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/Accessories/buildNewAccessories2.png\">
      <br><br></li>
  <li>Next, we need to check to see if any connections to the control signal
      bus are required for the driveline, see
      <a href=\"modelica://VehicleInterfaces.UsersGuide.SignalBus\">a complete list</a>
      of the minimum connections required. In this case we don&apos;t need to add
      any signals to the control signal bus.</li>
  <li>The model is now complete and should check successfully and can be used
      in any model compatible with the VehicleInterfaces library</li>
</ol>
</html>"));
end Tutorial;
