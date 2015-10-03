within VehicleInterfaces;
package UsersGuide "User's Guide"
  extends Modelica.Icons.Information;

  class QuickStart "Quick start guide"
    extends Modelica.Icons.Information;

    annotation (DocumentationClass=true, Documentation(info="<html>
<p>This section will quickly highlight some of the features of the library.</p>
<h4>Getting started</h4>
<p>A new subsystem should extend a class from within VehicleInterfaces.SubsystemTypeName.Interfaces.  These classes only provide the basic connection interface required.  If you also want to use the standard Icon for your new subsystem these can be found in VehicleInterfaces.Icons.</p>
<h4>Examples</h4>
<p>A number of vehicle model examples are included for four wheeled vehicles and could be duplicated or extended to create your own vehicle models.  All the subsystems are defined as replaceable so they can be changed to the required definition after extending from the example.  Control system blocks can be added as required by dragging the controller model into the vehicle model and connecting the controller to the control bus.</p>
<h4>WheelHub connectors</h4>
<p>The WheelHub connectors are based on a new connector found in Modelica.Mechanics.MultiBody.Interfaces called FlangeWithBearing.  This connector contains a 1D rotational connector and an optional MultiBody connector.  The MultiBody connector can be enabled/disabled via a parameter in the connector definition.  In the case of the VehicleInterfaces subsystem definitions these parameters are propogated to the subsystem level so that they can all be set by one parameter.  The MultiBody connector is used to provide the support for the rotating component.</p>
<p>For example, the MultiBody connector in the WheelHub connection between the driveline and chassis subsystems provides a way to support the ends of the halfshafts when modelling the driveline as a MultiBody system.  In the driveline and chassis subsystem templates this MultiBody connector is enabled via a parameter called <b>includeWheelBearings</b>.  Both subsystems must have the same setting for this parameter for them to be compatible.  Dymola generates a warning about unmatched connectors if this is not the case.  To access the parameters, first extend the template to create your new driveline model.  Then go to the component browser and right click on the extended class and select parameters.  The parameter dialog will now be displayed and allow you access to the connector parameters.</p>
<h4>Optional connectors</h4>
<p>Many of the subsystem templates contain optional connectors.  These are highlighted in the template diagrams by an orange dashed line around the connector.  These connectors are enabled by parameters.</p>
<p>For example: The driveline subsystem contains an optional MultiBody connector called <b>drivelineMount</b>.  This is enabled via a parameter called <b>includeMount</b>.  To access the parameters, first extend the template to create your new driveline model.  Then go to the component browser and right click on the extended class and select parameters.  The parameter dialog will now be displayed and allow you access to the connector parameters.</p>
<h4>Control Bus Structure</h4>
<p>The control bus structure utilises expandable connectors to provide a flexible bus concept.  This approach makes it easy to add new signals to the control bus so that data can be passed around the model.  The control bus structure implemented is heirarchical so that signals are easily located.  The approach adopted is that physical measurements taken from, for example, the transmission are placed on a sub-bus called <b>transmissionBus</b>.  Signals output from control blocks, for example the transmission controller, are placed on a sub-bus called <b>transmissionControlBus</b>.</p>
</html>", revisions="<html>
<p>
Copyright &copy; 2005-2013, Dassault Syst&egrave;mes, DLR and Modelon<br>
Copyright &copy; 2013-2015, Modelica Association
</p>
</html>"));
  end QuickStart;

  class NamingConventions "Naming conventions"
    extends Modelica.Icons.Information;

    annotation (DocumentationClass=true,Documentation(info="<html>
<p>This section describes the naming conventions used in the VehicleInterfaces Library.  The naming convention used throughout this library is also recommended as the naming convention to be used within compatible Automotive libraries but the user should refer to the documentation of the libraries they are using to confirm that this naming convention is used.</p>
<p>The convention on the naming of bus signals is the most important aspect of the convention that needs to be followed to ensure compatibility between libraries.</p>

<h4>Naming of classes and components</h4>
<p>Classes (for packages, models, records, etc.) are written with initial capital letters for each word, like in \"DriverEnvironments\".</p>
<p>Instances are written with a lower-case initial letter and then initial capital letters for each word, like in \"driverEnvironment\".</p>
<p>Variables and parameters that are derived from atomic types (Boolean, Integer, Real, String) names are written with a lower-case initial letter and then initial capital letters for each word, like in \"engineSpeed\". Abbreviated variable/parameter names are written with lower case letters, unless there is a strong convention, e.g. temperature is normally written \"T\". </p>
<p>Indices are denoted with an underscore, like in \"r_x\". </p>

<h4>Naming of Variables and Parameters</h4>
<p>Class instances normally have names that refer to the function/position of the instances, rather than the class name, like in \"leftLinkage\" for an instance of a \"TrailingArm\" linkage. </p>
<p>Parameters and variables have descriptive names, like in \"engineSpeed\", when it is practical. Short (single-letter) names or abbreviations are used when that is considered more natural, and are then named after the property they describe, like in \"v_x\". For short names, indices are separated by underscore.</p>

<h4>Initial Values</h4>
<p>
Parameters that represent initial values for simulation experiments are denoted with the index <b>start</b>, like \"v_start\".</p>

<h4>Naming of Properties</h4>
<p>Physical properties are named according to the standards established in the Modelica Standard Library:</p>
<table>
<tr><td> <b>r</b>  </td><td>&nbsp;</td><td> Position</td></tr>
<tr><td> <b>v</b>  </td><td>&nbsp;</td><td> Velocity</td></tr>
<tr><td> <b>a</b>  </td><td>&nbsp;</td><td> Acceleration</td></tr>
<tr><td> <b>phi</b></td><td>&nbsp;</td><td> Rotation angle </td></tr>
<tr><td> <b>w</b>  </td><td>&nbsp;</td><td> Angular velocity</td></tr>
<tr><td> <b>z</b>  </td><td>&nbsp;</td><td> Angular acceleration</td></tr>
<tr><td> <b>f</b>  </td><td>&nbsp;</td><td> Force </td></tr>
<tr><td> <b>tau</b></td><td>&nbsp;</td><td> Torque</td></tr>
<tr><td> <b>n</b>  </td><td>&nbsp;</td><td> Direction of rotation or translation</td></tr>
<tr><td> <b>m</b>  </td><td>&nbsp;</td><td> Mass</td></tr>
<tr><td> <b>c</b>  </td><td>&nbsp;</td><td> Stiffness</td></tr>
<tr><td> <b>d</b>  </td><td>&nbsp;</td><td> Damping</td></tr>
<tr><td> <b>J</b>  </td><td>&nbsp;</td><td> Inertia element, (gear) ratio</td></tr>
<tr><td> <b>k</b>  </td><td>&nbsp;</td><td> Amplification/gain </td></tr>
<tr><td> <b>s</b>  </td><td>&nbsp;</td><td> Distance </td></tr>
</table>
<p>&nbsp;</p>

<h4>Wheel Identifiers</h4>
<p>Wheels are identified by numbers from front left towards rear right. Those are, typically, used as indices in parameter or variable names. E.g., for a four-wheel car the front left wheel is \"1\", front right is \"2\", rear left \"3\", and rear right \"4\".</p>
</html>", revisions="<html>
<p>
Copyright &copy; 2005-2013, Dassault Syst&egrave;mes, DLR and Modelon<br>
Copyright &copy; 2013-2015, Modelica Association
</p>
</html>"));
  end NamingConventions;

  package SignalBus "Control signal bus"
    extends Modelica.Icons.Information;

    class AddingSignals "Adding signals to the bus"
      extends Modelica.Icons.Information;

      annotation (Documentation(info="<html>
<p>This method demonstrates how to add signals to the control signal bus.  To place an existing signal such as vehicle longitudinal velocity on to the signal bus in the chassis subsystem use the following process:</p>
<p>Working within your chassis model...</p>
<ol>
<li>If not already there, drag the <b>VehicleInterfaces.Interface.ChassisBus</b> connector in to the model.  It should get the default name <b>chassisBus</b> but rename it to this if it doesn't.</li>
<li>Draw a connection from this new connector to the controlBus connector.</li>
<li>In the connection dialog generated by Dymola select the following name: <b>chassisBus</b>
<br><img src=\"modelica://VehicleInterfaces/Resources/Images/signalNaming2.png\"><br><br></li>
<li>Add a sensor to measure the vehicle speed and drag a connection to the <b>chassisBus</b> connector just added.</li>
<li>In the connection dialog generated by Dymola select <b>longitudinalVelocity</b> from the list of options.
<br><img src=\"modelica://VehicleInterfaces/Resources/Images/signalNaming.png\"><br><br></li>
</ol>
<p>The chassis subsystem should look something like:</p>
<p><br><img src=\"modelica://VehicleInterfaces/Resources/Images/controlSignalExample2.png\"><br><br></p>
<p>There are two methods for adding a new signal to the controlBus.</p>
<ol>
<li>You draw the connection as in step 4 above, and instead of selecting an option from the list in step 5 you would select the \"Add variable\" option and then type the name of the signal you would like to add to the controlBus.</li>
<li>You extend from the chassisBus connector definition that can be found in <b>VehicleInterfaces.Chassis.Internal.StandardBus</b> and add the new signal definition.  Then, when you reach steps 4 and 5 (above) your new signal will appear in the list of options and can be selected.</li>
</ol>
</html>", revisions="<html>
<p>
Copyright &copy; 2005-2013, Dassault Syst&egrave;mes, DLR and Modelon<br>
Copyright &copy; 2013-2015, Modelica Association
</p>
</html>"));
    end AddingSignals;
    annotation (Documentation(info="<html>
<p>Every subsystem has access to the control signal bus which is modelled using expandable connectors.  This enables signals to be easily added to the control signal bus to suit a particular application.  A minimal set of signals has been defined to ensure basic compatibility between the various automotive libraries currently being developed.</p>
<p>The control signal bus should not contain physical connectors but should contain sensed or actuation values as signal connections.</p>
<h4>Naming of bus signals</h4>
<p>Signals placed on the control signal bus should be named following the same rules as naming the instance of a class.  This is based on the view that the items placed on to the control signal bus are actually connectors rather than simple variable values.</p>
<p>Signals placed on the bus are written with a lower-case initial letter and then initial capital letters for each word, like in \"driverEnvironment\".</p>
<p>The names of the connectors placed on to the bus should start with the name of the subsystem that is outputting the connector on to the bus.  This should then be followed by \"Bus.\" and then a descriptive name for the connector, like \"engineBus.engineSpeed\" or \"chassisBus.longitudinalVelocity\"</p>
<h4>Minimal signal set</h4>
<p>The signals in the following table are common to all vehicle types and should be combined with the additional signals defined for the different vehicle variants (i.e. manual and automatic transmission equipped vehicles).</p>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"1\">
<tr>
<td>Signal name</td>
<td>Units</td>
<td>Signal description</td>
</tr>
<tr>
<td><b>brakesBus.wheelSpeed_n</b></td>
<td>rad/s</td>
<td>Individual wheel speed where <b>n</b> is an integer describing which wheel this is from.</td>
</tr>
<tr>
<td><b>chassisBus.longitudinalVelocity</b></td>
<td>m/s</td>
<td>Vehicle Longitundinal Velocity</td>
</tr>
<tr>
<td><b>driverBus.ignition</b></td>
<td>Enumeration</td>
<td>Signals whether the driver wants the vehice to be operating.  There are 3 possible values:  Off, On or Start
(<a href=\"Modelica://VehicleInterfaces.Types.IgnitionSetting\">VehicleInterfaces.Types.IgnitionSetting</a>)
</td>
</tr>
<tr>
<td><b>engineBus.speed</b></td>
<td>rad/s</td>
<td>Engine speed</td>
</tr>
<tr>
<td><b>transmissionBus.outputSpeed</b></td>
<td>rad/s</td>
<td>Transmission output shaft speed</td>
</tr>
<tr>
<td><b>transmissionControlBus.currentGear</b></td>
<td>Integer</td>
<td>Currently selected gear</td>
</tr>
</table>
<p>The following additional signals are required for <b>manual</b> transmission vehicles.</p>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"1\">
<tr>
<td>Signal name</td>
<td>Units</td>
<td>Signal description</td>
</tr>
<tr>
<td><b>transmissionBus.clutchLocked</b></td>
<td>Boolean</td>
<td>True if the clutch is locked, otherwise false</td>
</tr>
</table>
<p>The following additional signals are required for an <b>automatic</b> transmission vehicles.</p>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"1\">
<tr>
<td>Signal name</td>
<td>Units</td>
<td>Signal description</td>
</tr>
<tr>
<td><b>driverBus.gearboxMode</b></td>
<td>Enumeration</td>
<td>Gearbox Mode (enumeration when supported, currently uses Integers defined according to <a href=\"Modelica://VehicleInterfaces.Types.GearMode\">VehicleInterfaces.Types.GearMode</a>)</td>
</tr>
<tr>
<td><b>driverBus.requestedGear</b></td>
<td>Integer</td>
<td>Driver requested gear for use in manual or limited gearbox modes</td>
</tr>
</table>
<h4>Additional signals for a drive-by-wire vehicle</h4>
<p>The following additional signals are required to model a drive-by-wire vehicle and are common for both manual and automatic transmission variants.</p>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"1\">
<tr>
<td>Signal name</td>
<td>Units</td>
<td>Signal description</td>
</tr>
<tr>
<td><b>driverBus.acceleratorPedalPosition</b></td>
<td>None</td>
<td>Driver accelerator pedal position - normalised Real, 0 = pedal released, 1 = pedal fully pressed</td>
</tr>
<tr>
<td><b>driverBus.brakePedalPosition</b></td>
<td>None</td>
<td>Driver brake pedal position - normalised Real, 0 = pedal released, 1 = pedal fully pressed</td>
</tr>
</table>
<p>The following additional signals are required for a <b>manual</b> transmission drive-by-wire vehicle.</p>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"1\">
<tr>
<td>Signal name</td>
<td>Units</td>
<td>Signal description</td>
</tr>
<tr>
<td><b>driverBus.clutchPedalPosition</b></td>
<td>None</td>
<td>Driver clutch pedal position - normalised Real, 0 = pedal released, 1 = pedal fully pressed</td>
</tr>
<tr>
<td><b>driverBus.gear</b></td>
<td>None</td>
<td>Driver selected gear</td>
</tr>
</table>
</html>", revisions="<html>
<p>
Copyright &copy; 2005-2013, Dassault Syst&egrave;mes, DLR and Modelon<br>
Copyright &copy; 2013-2015, Modelica Association
</p>
</html>"));
  end SignalBus;

  class DriverInteractionBus "Driver interaction bus"
    extends Modelica.Icons.Information;

    annotation (Documentation(info="<html>
<p>The Driver Interaction bus connects the DriverEnvironment to an external Driver model and is implemented using expandable connectors.  This enables signals to be easily added to the control signal bus to suit a particular application.  A minimal set of signals has been defined to ensure basic compatibility between the various automotive libraries currently being developed.</p>
<p>The Driver Interaction bus can contain both normalised physical connectors and sensed values as signal connections.</p>
<h4>Naming of Driver Interaction bus components</h4>
<p>Connectors placed on the Driver Interaction bus should be named following the same rules as naming the instance of a class.  This is based on the view that the items placed on to the control signal bus are actually connectors rather than simple variable values.</p>
<p>This means that connectors placed on the bus are written with a lower-case initial letter and then initial capital letters for each word, like in \"acceleratorPedal\".</p>
<h4>Standard names</h4>
<p>The following table defines the standard names and associated connector types and units used.</p>
<table cellspacing=\"0\" cellpadding=\"0\" border=\"1\">
<tr>
<td>Name on the bus</td>
<td>Connector Type</td>
<td>Units</td>
<td>Description</td>
</tr>
<tr>
<td><b>acceleratorPedal</b></td>
<td>NTI.Flange</td>
<td>-</td>
<td>Accelerator pedal connection using a normalised physical connector</td>
</tr>
<tr>
<td><b>brakePedal</b></td>
<td>NTI.Flange</td>
<td>-</td>
<td>Brake pedal connection using a normalised physical connector</td>
</tr>
<tr>
<td><b>clutchPedal</b></td>
<td>NTI.Flange</td>
<td>-</td>
<td>Clutch pedal connection using a normalised physical connector</td>
</tr>
<tr>
<td><b>steeringWheel</b></td>
<td>NRI.Flange_a</td>
<td>-</td>
<td>Steering wheel connection using a normalised physical connector</td>
</tr>
<tr>
<td><b>vehicleSpeed</b></td>
<td>RealSignal</td>
<td>m/s</td>
<td>Vehicle longitudinal speed in kmh</td>
</tr>
<tr>
<td><b>engineSpeed</b></td>
<td>RealSignal</td>
<td>rad/s</td>
<td>Engine speed in rpm</td>
</tr>
<tr>
<td><b>gear</b></td>
<td>IntegerSignal</td>
<td>-</td>
<td>Gear selected by the driver (manual transmission only)</td>
</tr>
<tr>
<td><b>clutchLocked</b></td>
<td>BooleanSignal</td>
<td>-</td>
<td>Flag for clutch state, true=clutch in stuck mode (manual transmission only)</td>
</tr>
<tr>
<td><b>gearboxMode</b></td>
<td>IntegerSignal</td>
<td>Enumeration</td>
<td>Gearbox mode selected by the driver (automatic transmission only)</td>
</tr>
<tr>
<td><b>requestedGear</b></td>
<td>IntegerSignal</td>
<td>-</td>
<td>Gear selected by the driver if the automatic is in a manual mode (automatic transmission only)</td>
</tr>
</table>
<p><b>Key:</b></p>
<p><b>NTI</b> = NormalisedTranslational.Interfaces<br>
<b>NRI</b> = NormalisedRotational.Interfaces<br>
<b>RealSignal</b> = Modelica.Blocks.Interfaces.RealSignal<br>
<b>IntegerSignal</b> = Modelica.Blocks.Interfaces.IntegerSignal<br>
<b>BooleanSignal</b> = Modelica.Blocks.Interfaces.BooleanSignal<br>
<b>VI</b> = VehicleInterfaces</p>
<h4>Pedal Conventions</h4>
<p>For the driver the following conventions are used to describe the pedal positions as normalised values.</p>
<ul>
<li>1 = Pedal Fully Pressed</li>
<li>0 = Pedal Fully Released</li>
</ul>
<p>For example: when the accelerator pedal position = 1, the driver is accelerating as fast as possible;  when the clutch pedal position = 1, the driver has pressed the clutch pedal and the clutch is actually disengaged.</p>
</html>", revisions="<html>
<p>
Copyright &copy; 2005-2013, Dassault Syst&egrave;mes, DLR and Modelon<br>
Copyright &copy; 2013-2015, Modelica Association
</p>
</html>"));

  end DriverInteractionBus;

  class ModelRotatingParts "Modelling rotating systems"
    extends Modelica.Icons.Information;

    annotation (Documentation(info="<html>
<p>Within VehicleInterfaces rather than limiting our-selves to modelling rotating components as a simple 1D rotation we have built in the flexibility to model rotating components as MultiBody systems. This has been possible through the development of a new connector called <a href=\"Modelica://Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing\">FlangeWithBearing</a>. This is a hierarchical connector that contains a 1D rotational connector and a conditional MultiBody connector. The use of the MultiBody connector is controlled by a parameter in the connector. This enables the FlangeWithBearing connector to model rotational effects as a purely 1D system or it can correctly include MultiBody effects.</p>
<p>Where this connector is used in an interface definition the parameter includeBearingConnector is linked to a parameter at the model level so that the model developer can easily activate this connector if required. These parameters are declared as protected parameters so that they are only available to the model developer as they create the subsystem model and cannot be changed when the model is used. </p>
<p>The use of the bearing connectors needs to carefully considered to avoid inadvertently creating mechanical loops in the model. The following example guidelines for the engine and transmission subsystems should help highlight the issues so that the model developer can determine when it is appropriate to use the bearing connectors. For the engine and transmission subsystem models: </p>
<ol>
<li>When they are modelled as a pure 1D rotational system then no bearing connectors are required.</li>
<li>When they are modelled as a 1D rotational system with reactions on to a MultiBody system then no bearing connectors are required.</li>
<li>When they are being modelled as a MultiBody system but they are rigidly connected together then the bearing frame between the engine and transmission should not be included. In this case the transmissionMount connector should support the MultiBody elements of the transmission. The rest of the model then needs to be consid-ered before deciding whether to include the bear-ing between the transmission and driveline or be-tween the engine and accessories subsystems.</li>
<li>When they are being modelled as a MultiBody system but they are not rigidly connected together then the bearing frame between the engine and transmission will be required to support the intermediate drive shaft. </li>
</ol>
</html>", revisions="<html>
<p>
Copyright &copy; 2005-2013, Dassault Syst&egrave;mes, DLR and Modelon<br>
Copyright &copy; 2013-2015, Modelica Association
</p>
</html>"));
  end ModelRotatingParts;

  class SubsystemDefinitions "Subsystem descriptions"
    extends Modelica.Icons.Information;

    annotation (Documentation(info="<html>
<p>The library contains the following subsystem definitions:</p>
<ul>
<li><a href=\"Modelica://VehicleInterfaces.Accessories\">Accessories</a> - engine driven accessories</li>
<li><a href=\"Modelica://VehicleInterfaces.Atmospheres\">Atmospheres</a> - ambient conditions</li>
<li><a href=\"Modelica://VehicleInterfaces.Brakes\">Brakes</a> - brake system</li>
<li><a href=\"Modelica://VehicleInterfaces.Chassis\">Chassis</a> - chassis system</li>
<li><a href=\"Modelica://VehicleInterfaces.Controllers\">Controllers</a> - generic controller interface</li>
<li><a href=\"Modelica://VehicleInterfaces.DataDictionaries\">DataDictionaries</a> - for signal aliasing</li>
<li><a href=\"Modelica://VehicleInterfaces.Drivelines\">Drivelines</a> - driveline system</li>
<li><a href=\"Modelica://VehicleInterfaces.DriverEnvironments\">DriverEnvironments</a> - driver vehicle interface</li>
<li><a href=\"Modelica://VehicleInterfaces.Drivers\">Drivers</a> - optional driver subsystem</li>
<li><a href=\"Modelica://VehicleInterfaces.ElectricDrives\">ElectricDrives</a> - electric machine interface</li>
<li><a href=\"Modelica://VehicleInterfaces.Engines\">Engines</a> - engine interface</li>
<li><a href=\"Modelica://VehicleInterfaces.PowertrainMounts\">PowertrainMounts</a> - powertrain mounting systems</li>
<li><a href=\"Modelica://VehicleInterfaces.Roads\">Roads</a> - road definition</li>
<li><a href=\"Modelica://VehicleInterfaces.Transmissions\">Transmissions</a> - transmission subsystem</li>
</ul>
</html>", revisions="<html>
<p>
Copyright &copy; 2005-2013, Dassault Syst&egrave;mes, DLR and Modelon<br>
Copyright &copy; 2013-2015, Modelica Association
</p>
</html>"));
  end SubsystemDefinitions;

  package Tutorials "Tutorials"
    extends Modelica.Icons.Information;
    class Tutorial1 "Creating a vehicle model by extending from an Example"
      extends Modelica.Icons.Information;

      annotation (Documentation(info="<html>
<p>The following process will demonstrate how to create a new vehicle model using one of the example model architectures as a template.  This tutorial will guide you through building a conventional passenger car, i.e. a vehicle with 4 wheels.</p>
<ol>
<li>Create a new model that extends <b>VehicleInterfaces.Exmaples.ConventionalManualVehicle</b>, it should look like this:
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewVehicleModel1.png\"><br><br></li>
<li>By right clicking on each subsystem in turn you can now select the appropriate models for each subsystem.<br>Using Dymola, the context menu should look like below when changing the engine subsystem
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewVehicleModel2.png\"><br><br></li>
<li>When you have set the appropriate model for each subsystem your model is ready for parametisation and simulation.</li>
</ol>
</html>", revisions="<html>
<p>
Copyright &copy; 2005-2013, Dassault Syst&egrave;mes, DLR and Modelon<br>
Copyright &copy; 2013-2015, Modelica Association
</p>
</html>"));
    end Tutorial1;

    annotation (Documentation(info="<html>
<p>Tutorials are provided as part of the VehicleInterfaces Users Guide and these demonstrate:</p>
<ol>
  <li><a href=\"Modelica://VehicleInterfaces.UsersGuide.Tutorials.Tutorial1\">How to create a
      vehicle model using one of the example architectures</a></li>
  <li>Each subsystem also contains a Tutorial class that demonstrates the use of that
      subsystem</li>
</ol>
<p>A tutorial session on the VehicleInterfaces package was run at the Modelica 2006 conference.  The tutorial material from this conference can be found at <a href=\"http://www.modelica.org/events/modelica2006/Proceedings/html/tutorials.html\">http://www.modelica.org/events/modelica2006/Proceedings/html/tutorials.html</a>.
Some elements of the library may have been renamed since this tutorial but the principles are still utilised.</p>
</html>", revisions="<html>
<p>
Copyright &copy; 2005-2013, Dassault Syst&egrave;mes, DLR and Modelon<br>
Copyright &copy; 2013-2015, Modelica Association
</p>
</html>"));
  end Tutorials;

  package ReleaseNotes "Release notes"
    class Version_1_2_3 "Version 1.2.3 (Sept. 9, 2015)"
      extends Modelica.Icons.ReleaseNotes;

      annotation (Documentation(info="<html>
<p>This version requires the <b>Modelica 3.2.1</b> Library.
   This version is backwards compatible to versions&nbsp;1.1.x and 1.2.x of the VehicleInterfaces library.</p>

<h4>Improvements in this version:</h4>

<ul>
<li> Typos in the documentation fixed. </li>
<li> Some LinePattern graphical annotations corrected
     (in Examples.PowerSplitHybrid, Examples.SeriesHybridConverting, Icons.DataDictionary) </li>
<li> Bitmap.extent corrected in Icons.Driver </li>
</ul>
</html>"));
    end Version_1_2_3;
    extends Modelica.Icons.ReleaseNotes;

    class Version_1_2_2 "Version 1.2.2 (Jun. 30, 2014)"
      extends Modelica.Icons.ReleaseNotes;

      annotation (Documentation(info="<html>
<p>This version requires the <b>Modelica 3.2.1</b> Library.
   This version is backwards compatible to versions&nbsp;1.1.x of the VehicleInterfaces library.</p>

<h4>Improvements in this version:</h4>

<ul>
<li>Further adaption to the conventions of the Modelica Specification 3.2 Revision 2, removal of Dymola specific visualization.
</li>
<li>Clean-up of superfluous annotations and HTML syntax and links</li>
</ul>
</html>"));
    end Version_1_2_2;

    class Version_1_2_1 "Version 1.2.1 (Oct. 1, 2013)"
      extends Modelica.Icons.ReleaseNotes;

      annotation (Documentation(info="<html>
<p>This version requires the <b>Modelica 3.2.1</b> Library.
   This version is backwards compatible to versions&nbsp;1.1.x of the VehicleInterfaces library.</p>

<h4>Improvements in this version:</h4>

<ul>
<li>Adapted to the conventions of the Modelica Standard Library 3.2.1.
</li>
</ul>
</html>"));
    end Version_1_2_1;

    class Version_1_2 "Version 1.2 (August 8, 2011)"
      extends Modelica.Icons.ReleaseNotes;

      annotation (Documentation(info="<html>
<p>This version requires Dymola 2012 or higher and the Modelica 3.2 Library.
   This version is backwards compatible to versions&nbsp;1.1.x of the VehicleInterfaces library.</p>

<h4>Improvements in this version:</h4>

<ul>
<li><b>Improved buses</b><br>
    In order to simplify working with buses, all buses in VehicleInterfaces
    are defined as replaceable expandable empty connectors.
    Whenever the buses are used concretely, they are redeclared to a connector
    model where all signal definitions are present. As a result, the actual signal
    definitions (with units and description texts) are always available at the
    place where they are used. Still, users can add more signals or need not use all
    defined signals (due to the new feature of Modelica 3.2, that not used signals
    of an expandable connector are ignored).<br>
</li>

<li>Adapted to the conventions of the Modelica Standard Library 3.2<br>
    (directory \"VehicleInterfaces/Extras\" moved to the new directory \"VehicleInterfaces/Resources\";
     all links to images, scripts, documentation etc. have been changed to URIs such as
     modelica://VehicleInterfaces/Resources/Images/xx.png; icon layout adapted to MSL 3.2 layout).<br>
</li>

<li> VehicleInterfaces.<b>EnergyStorage</b>.Interfaces.Base:<br>
     A optional ground and an optional heat port have been added. Both components
     can be enabled via a corresponding parameter</li>

</ul>
</html>"));
    end Version_1_2;

    class Version_1_1_2 "Version 1.1.2 (Nov. 8, 2010)"
      extends Modelica.Icons.ReleaseNotes;

      annotation (Documentation(info="<html>
<p>Adapted to Modelica Standard Library 3.2. This version is backward compatible to the version&nbsp;1.1.1.</p>
</html>"));
    end Version_1_1_2;

    class Version_1_1_1 "Version 1.1.1 (Jun. 30, 2009)"
      extends Modelica.Icons.ReleaseNotes;

      annotation (Documentation(info="<html>
<p>Further adaption to Modelica Language 3 and Modelica Standard Library 3.1. This version is backward compatible to the version&nbsp;1.1.</p>
<p>As enabled by Dymola 7, the library check was performed on the VehicleInterfaces library utilizing the ModelManagement Library. Consequently, especially the documentation has been upgraded and fulfilled. Main changes with respect to the version 1.1: </p>
<ul>
<li><a href=\"modelica://VehicleInterfaces.Mechanics\">VehicleInterfaces.Mechanics</a>: Small changes at icon and diagram layer to be Modelica 3 compliant. </li>
<li><a href=\"modelica://VehicleInterfaces.Mechanics.MultiBody.MultiBodyEnd\">VehicleInterfaces.Mechanics.MultiBody.MultiBodyEnd</a> adapted, so that \"Mixing of components and equations\" is avoided. </li>
<li><a href=\"modelica://VehicleInterfaces.UsersGuide.NamingConventions\">VehicleInterfaces.UsersGuide.NamingConventions</a>: changed \"a\" to \"z\" for an <i>angular</i> acceleration. </li>
<li>Changed icon for VehicleInterfaces.Examples.</li>
<li>Added icon <a href=\"modelica://VehicleInterfaces.Icons.BaseClassPackage\">BaseClassPackage</a> to be used for packages with base classes and internal material.</li>
</ul>
</html>"));
    end Version_1_1_1;

    class Version_1_1 "Version 1.1 (Feb. 5, 2008)"
      extends Modelica.Icons.ReleaseNotes;

      annotation (Documentation(info="<html>

<p>
Adapted to Modelica Language 3 and Modelica Standard Library 3.0.
This version is slightly non-backwards compatible to the previous
version 1.0. A conversion script is provided to automatically
convert to the new version. Changes with respect to version 1.0:
</p>

<ul>
<li> Graphical annotations changed to MSL3.0.
     <br>&nbsp;</li>

<li> Changed definition of Road and Atmosphere, since previous definition
     was not Modelica 3 compliant.
     <br>&nbsp;</li>

<li> VehicleInterfaces.Mechanics.MultiBody.MultiBodyEnd adapted, so that
     ObsoleteModelica3 is not used (was introduced by conversion script of
     Modelica Standard Libary 3.0).
     <br>&nbsp;</li>

<li> VehicleInterfaces.Types.Conversions removed, since no longer needed
     (since tools support displayUnit).
     <br>&nbsp;</li>

<li> VehicleInterfaces.Engines.MinimalEngine, VehicleInterfaces.Engines.MinimalEngineUsingPedal:<br>
     Replaced \"NonSI.AngularVelocity_rpm engineSpeed_start\" by
     SI.AngularVelocity with displayUnit=\"r/min\" and adapted
     flywheel Inertia initialization correspondingly.
     <br>&nbsp;</li>

<li> VehicleInterfaces.Roads.Internal.CheckContactCalculation adapted,
     so that it is according to Modelica 3 (equations for input variables of
     \"tyre\" moved from equation section into modifier of \"tyre\").
     <br>&nbsp;</li>

<li> VehicleInterfaces.Atmospheres.ConstantAtmosphere icon corrected:
     Automatic Dymola conversion was not corrected, since icon was transformed
     to 100,100 icon instead of 200,100 icon (complex situation because icon
     size was actually inherited from Icons.Atmospheres and it is understandable
     that the conversion did not recognized this).
     <br>&nbsp;</li>

<li> VehicleInterfaces.Atmospheres.ConstantAtmosphere:<br>
     Removed \"...degC(20)\" function call by \"20\", since displayUnit of
     temperatures is \"degC\".
     <br>&nbsp;</li>

<li> Removed definition \"import NonSI = xx\" at the top level
     (is no longer referenced).
     <br>&nbsp;</li>

<li> Renamed VehicleInterfaces.Examples.BaseCar to PartialVehicle.
     <br>&nbsp;</li>

<li> VehicleInterfaces.UsersGuide.ReleaseNotes introduced.</li>

</ul>



</html>"));
    end Version_1_1;

    class Version_1_0 "Version 1.0 (Dec. 3, 2007)"
      extends Modelica.Icons.ReleaseNotes;

      annotation (Documentation(info="<html>

<p>
First version of VehicleInterfaces library finalized, based on
Modelica Standard Library 2.2.2
</p>

</html>"));
    end Version_1_0;
    annotation (Documentation(info="<html>
<p>
This section summarizes the changes that have been performed
on the library.
</p>
</html>"));
  end ReleaseNotes;

  class License "VehicleInterfaces license"
    extends Modelica.Icons.Information;

    annotation (Documentation(info="<html>
<p>The VehicleInterfaces library is distributed under the Modelica license (Version 1.1)</P>
<p>Redistribution and use in source and binary forms, with or without
modification are permitted, provided that the following conditions are met:
<ol>
<li>
The author and copyright notices in the source files, these license conditions
and the disclaimer below are (a) retained and (b) reproduced in the documentation
provided with the distribution.</li>
<li>
Modifications of the original source files are allowed, provided that a
prominent notice is inserted in each changed file and the accompanying
documentation, stating how and when the file was modified, and provided
that the conditions under (1) are met.</li>
<li>
It is not allowed to charge a fee for the original version or a modified
version of the software, besides a reasonable fee for distribution and support.
Distribution in aggregate with other (possibly commercial) programs
as part of a larger (possibly commercial) software distribution is permitted,
provided that it is not advertised as a product of your own.</li>
</ol>

<h4>Disclaimer</h4>
<p>The software (sources, binaries, etc.) in their original or in a modified
form are provided
\"as is\" and the copyright holders assume no responsibility for its contents
what so ever. Any express or implied warranties, including, but not
limited to, the implied warranties of merchantability and fitness for a
particular purpose are <b>disclaimed</b>. <b>In no event</b> shall the
copyright holders, or any party who modify and/or redistribute the package,
<b>be liable</b> for any direct, indirect, incidental, special, exemplary, or
consequential damages, arising in any way out of the use of this software,
even if advised of the possibility of such damage.
</p>
</html>", revisions="<html>
<p>
Copyright &copy; 2005-2013, Dassault Syst&egrave;mes, DLR and Modelon<br>
Copyright &copy; 2013-2015, Modelica Association
</p>
</html>"));
  end License;

  class Contact "Contact"
    extends Modelica.Icons.Contact;

    annotation (Documentation(info="<html>
<p>This library is maintained by the Modelica Association. Further development takes place on <a href=\"https://github.com/modelica/VehicleInterfaces\">https://github.com/modelica/VehicleInterfaces</a> where users can also report issues and/or supply pull-requests.</p>
<h5>History</h5>
<p>A number of automotive library developers and consultants have co-operated to develop the VehicleInterfaces Library.  The developers were:</p>
<ul>
<li>Arsenal Research: Franz Pirker, Anton Haumer, Christian Kral</li>
<li>Claytex Services Ltd: Mike Dempsey</li>
<li>Dassault Syst&egrave;mes AB: Hilding Elmqvist</li>
<li>DLR Oberpfaffenhofen: Martin Otter, Christian Schweiger, Jakub Tobolar</li>
<li>DLR Stuttgart: Peter Treffinger, Marcus Baur, J&ouml;rg Ungeth&uuml;m</li>
<li>Modelon AB: Johan Andreasson, Magnus G&auml;fvert</li>
<li>Ricardo UK Ltd: Mark Ingram, Peter Harman</li>
</ul>
<p>This library has been developed from work on the original Modelica VMA (<a href=\"http://www.modelica.org/events/Conference2003/papers/h32_vehicle_Tiller.pdf\">Paper from the Modelica Conference 2003</a>) developed by Michael Tiller et al and published by Ford Motor Company.</p>
<p>Additional ideas from intermediate work by members of DLR Oberpfaffenhofen and Modelon has also been incorporated.  The above partners agreed to develop these ideas in to a new library and adopt this set of interface definitions.</p>
<p>The implementation of the VehicleInterfaces library was led by Claytex Services Limited under contract to Dassault Syst&egrave;mes AB</p>
</html>", revisions="<html>
<p>Copyright &copy; 2005-2013, Dassault Syst&egrave;mes, DLR and Modelon<br>
     Copyright &copy; 2013-2015, Modelica Association </p>
</html>"));
  end Contact;

  annotation (DocumentationClass=true, Documentation(info="<html>
<p>The VehicleInterfaces Modelica library provides standard interface definitions for automotive subsystems and vehicle models.  These are designed to promote compatibility between the various automotive libraries and provide a flexible, powerful structure for vehicle modelling.  The main focus of the library is on defining the interfaces for the individual subsystems and a number of vehicle model examples are included to demonstrate how they might be used.</p>
<p>
<img src=\"modelica://VehicleInterfaces/Resources/Images/conventionalVehicle.png\" align=\"middle\">
</p>
<p>For an automotive library to be compatible with other libraries based on this set of interface definitions they should extend the interface definition from within this library and following the naming convention for the control signal bus and driver interaction bus if used. </p>
<p>This library also contains a proposal for a naming convention covering the whole model library and the developers of this library would recommend that this convention is followed by other developers to ensure a consistent naming convention across the whole set of automotive models.</p>
<p>
The complete documentation of the VehicleInterfaces library in PDF format
is available as <a href=\"modelica://VehicleInterfaces/Resources/Documentation/VehicleInterfaces.pdf\">VehicleInterfaces.pdf</a>
</p>
</html>", revisions="<html>
<p>
Copyright &copy; 2005-2013, Dassault Syst&egrave;mes, DLR and Modelon<br>
Copyright &copy; 2013-2015, Modelica Association
</p>
</html>"));
end UsersGuide;
