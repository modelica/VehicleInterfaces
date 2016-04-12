within VehicleInterfaces;
package Controllers "Collection of controllers subsystem definitions"
  extends Modelica.Icons.VariantsPackage;

  class Tutorial "Controllers Tutorial"
    extends Modelica.Icons.Information;

    annotation (DocumentationClass=true,Documentation(info="<html>
<p><b>Tutorial - Defining a new controller model</b></p>
<p>The following process will demonstrate how to create a new controller model using these interface definitions.  This tutorial will guide you through building a simple idle speed controller for an engine.</p>
<ol>
<li>Create a new model that extends <b>VehicleInterfaces.Controllers.Interfaces.Base</b>, it should look like this:
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewController1.png\"><br><br></li>
<li>You can now define your controller model as required</li>
</ol>
<h4>Creating a simple idle speed controller example</h4>
<p>The following steps demonstrate how to create a simple idle speed controller model.  The controller model will sense the engine speed, coolant temperature and accelerator pedal position and adjust the throttle signal to the engine to attempt to maintain the correct idle speed.</p>
<p>Starting from step 2 above.</p>
<ol>
<li>Add the following blocks and connections to the diagram.
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewController2.png\"><br><br></li>
<li>The controller model is built on the assumption that a corresponding engine model will be developed that outputs the required signals to the control signal bus.  We need to add connections to the control signal bus and will assume the following names for the additional signals required that are not part of the minimal set defined as part of the VehicleInterfaces:
<ul>
<li>engineBus.coolantTemperature</li>
<li>engineBus.acceleratorPedalPosition</li>
<li>engineControlBus.throttlePosition</li>
</ul>
<li>To add these control signals we first need to add the <b>engineBus</b> and <b>engineControlBus</b> connectors and connect them to the <b>controlBus</b>.  These connectors are <b>VehicleInterfaces.Interfaces.EngineBus</b> and <b>VehicleInterfaces.Interfaces.EngineControlBus</b>.  When connecting these to the controlBus the following dialog will be produced and should be completed as following substituting <b>engineControlBus</b> for <b>engineBus</b> as appropriate.
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewController4.png\"><br><br></li>
<li>We can then complete the model by connecting the blocks to the control bus connectors and using the appropriate signal names.  The finished model should look like:
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewController3.png\"><br><br></li>
<li>The model is now complete and should check successfully and can be used in any model compatible with the VehicleInterfaces library assuming the selected engine model puts the required signals on to the control signal bus</li>
</ol>
</html>"));
  end Tutorial;

  package Interfaces "Collection of interface definitions for controller"
    extends Modelica.Icons.InterfacesPackage;
    partial model Base "Basic interface definition for a controller"

      VehicleInterfaces.Interfaces.ControlBus controlBus "Control signal bus"
        annotation (Placement(transformation(extent={{-20,-80},{20,-120}})));
      annotation (
        Documentation(info="<html>
<p>This partial model defines the interfaces required for a controller subsystem. This class should be extended to form a particular controller model. See the <a href=\"Modelica://VehicleInterfaces.Controllers\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.Controllers.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end Base;
    annotation (Documentation(info="<html>
<p>
A collection of partial base classes which define interfaces for control system models.
</p>
</html>"));
  end Interfaces;

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

  annotation (Documentation(info="<html>
<p>The controller subsystem interface is defined in this sub-package of the VehicleInterfaces library.  The controller subsystem has the following connector:</p>
<ul>
<li><b>controlBus</b> - control signal bus connection</li>
</ul>
<h4>Effects to be modelled in this subsystem</h4>
<p>Within the VehicleIntefaces package the controller subsystem is a generic controller interface definition and should be used to model the vehicle control systems in an appropriate manner.</p>
</html>"));
end Controllers;
