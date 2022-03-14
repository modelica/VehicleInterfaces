within VehicleInterfaces;
package UsersGuide "User's Guide"
  extends Modelica.Icons.Information;

  class QuickStart "Quick start guide"
    extends Modelica.Icons.Information;

    annotation (DocumentationClass=true, Documentation(info="<html>
<p>
This section will quickly highlight some of the features of the library.
</p>

<h4>Getting started</h4>
<p>
A new subsystem should extend a&nbsp;class from within
VehicleInterfaces.SubsystemTypeName.Interfaces. These classes only provide
the basic connection interface required. If you also want to use the
standard Icon for your new subsystem these can be found in
VehicleInterfaces.Icons.
</p>

<h4>Examples</h4>
<p>
A number of vehicle model examples are included for four wheeled vehicles
and could be duplicated or extended to create your own vehicle models.
All the subsystems are defined as replaceable so they can be changed to
the required definition after extending from the example. Control system
blocks can be added as required by dragging the controller model into
the vehicle model and connecting the controller to the control bus.
</p>

<h4>WheelHub connectors</h4>
<p>
The WheelHub connectors are based on a&nbsp;new connector found in
Modelica.Mechanics.MultiBody.Interfaces called FlangeWithBearing.
This connector contains a&nbsp;1D rotational connector and an optional
MultiBody connector. The MultiBody connector can be enabled/disabled
via a&nbsp;parameter in the connector definition. In the case of the
VehicleInterfaces subsystem definitions these parameters are propagated
to the subsystem level so that they can all be set by one parameter.
The MultiBody connector is used to provide the support for the rotating
component.
</p>
<p>
For example, the MultiBody connector in the WheelHub connection between
the driveline and chassis subsystems provides a&nbsp;way to support the ends
of the halfshafts when modelling the driveline as a&nbsp;MultiBody system.
In the driveline and chassis subsystem templates this MultiBody connector
is enabled via a&nbsp;parameter called <strong>includeWheelBearings</strong>.
Both subsystems must have the same setting for this parameter for them
to be compatible. Dymola generates a&nbsp;warning about unmatched connectors
if this is not the case. To access the parameters, first extend the
template to create your new driveline model. Then go to the component
browser and right click on the extended class and select parameters.
The parameter dialog will now be displayed and allow you access to
the connector parameters.
</p>

<h4>Optional connectors</h4>
<p>
Many of the subsystem templates contain optional connectors.
These are highlighted in the template diagrams by an orange dashed line
around the connector. These connectors are enabled by parameters.
</p>
<p>
For example: The driveline subsystem contains an optional MultiBody
connector called <strong>drivelineMount</strong>. This is enabled
via a&nbsp;parameter called <strong>includeMount</strong>. To access
the parameters, first extend the template to create your new driveline
model. Then go to the component browser and right click on the extended
class and select parameters. The parameter dialog will now be displayed
and allow you access to the connector parameters.
</p>

<h4>Control Bus Structure</h4>
<p>
The control bus structure utilises expandable connectors to provide
a&nbsp;flexible bus concept. This approach makes it easy to add new signals
to the control bus so that data can be passed around the model.
The control bus structure implemented is hierarchical so that signals
are easily located. The approach adopted is that physical measurements
taken from, for example, the transmission are placed on a&nbsp;sub-bus
called <strong>transmissionBus</strong>. Signals output from control
blocks, for example the transmission controller, are placed on
a&nbsp;sub-bus called <strong>transmissionControlBus</strong>.
</p>
</html>"));
  end QuickStart;

  class NamingConventions "Naming conventions"
    extends Modelica.Icons.Information;

    annotation (DocumentationClass=true,Documentation(info="<html>
<p>
This section describes the naming conventions used in the VehicleInterfaces
Library. The naming convention used throughout this library is also
recommended as the naming convention to be used within compatible Automotive
libraries but the user should refer to the documentation of the libraries
they are using to confirm that this naming convention is used.
</p>
<p>
The convention on the naming of bus signals is the most important aspect
of the convention that needs to be followed to ensure compatibility
between libraries.
</p>

<h4>Naming of classes and components</h4>
<p>
Classes (for packages, models, records, etc.) are written with initial
capital letters for each word, like in &quot;DriverEnvironments&quot;.
</p>
<p>
Instances are written with a&nbsp;lower-case initial letter and then initial
capital letters for each word, like in &quot;driverEnvironment&quot;.
</p>
<p>
Variables and parameters that are derived from atomic types
(Boolean, Integer, Real, String) names are written with a&nbsp;lower-case
initial letter and then initial capital letters for each word, like in
&quot;engineSpeed&quot;. Abbreviated variable/parameter names are written
with lower case letters, unless there is a&nbsp;strong convention,
e.g. temperature is normally written &quot;T&quot;.
</p>
<p>
Indices are denoted with an underscore, like in &quot;r_x&quot;.
</p>

<h4>Naming of Variables and Parameters</h4>
<p>
Class instances normally have names that refer to the function/position of
the instances, rather than the class name, like in &quot;leftLinkage&quot;
for an instance of a&nbsp;&quot;TrailingArm&quot; linkage.
</p>
<p>
Parameters and variables have descriptive names, like in
&quot;engineSpeed&quot;, when it is practical. Short (single-letter)
names or abbreviations are used when that is considered more natural,
and are then named after the property they describe, like in &quot;v_x&quot;.
For short names, indices are separated by underscore.
</p>

<h4>Initial Values</h4>
<p>
Parameters that represent initial values for simulation experiments are
denoted with the index <strong>start</strong>, like &quot;v_start&quot;.
</p>

<h4>Naming of Properties</h4>
<p>
Physical properties are named according to the standards established
in the Modelica Standard Library:
</p>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
  <caption align=\"bottom\">List of quantities used in the VehicleInterfaces Library</caption>
  <tr><th> Symbol              </th><th> Quantity / Property</th></tr>
  <tr><td> <strong>r</strong>  </td><td> Position</td></tr>
  <tr><td> <strong>v</strong>  </td><td> Velocity</td></tr>
  <tr><td> <strong>a</strong>  </td><td> Acceleration</td></tr>
  <tr><td> <strong>phi</strong></td><td> Rotation angle </td></tr>
  <tr><td> <strong>w</strong>  </td><td> Angular velocity</td></tr>
  <tr><td> <strong>z</strong>  </td><td> Angular acceleration</td></tr>
  <tr><td> <strong>f</strong>  </td><td> Force </td></tr>
  <tr><td> <strong>tau</strong></td><td> Torque</td></tr>
  <tr><td> <strong>n</strong>  </td><td> Direction of rotation or translation</td></tr>
  <tr><td> <strong>m</strong>  </td><td> Mass</td></tr>
  <tr><td> <strong>c</strong>  </td><td> Stiffness</td></tr>
  <tr><td> <strong>d</strong>  </td><td> Damping</td></tr>
  <tr><td> <strong>J</strong>  </td><td> Inertia element, (gear) ratio</td></tr>
  <tr><td> <strong>k</strong>  </td><td> Amplification/gain </td></tr>
  <tr><td> <strong>s</strong>  </td><td> Distance </td></tr>
</table>

<h4>Wheel Identifiers</h4>
<p>
Wheels are identified by numbers from front left towards rear right.
Those are, typically, used as indices in parameter or variable names.
E.g., for a&nbsp;four-wheel car the front left wheel is &quot;1&quot;,
front right is &quot;2&quot;, rear left &quot;3&quot;, and rear
right &quot;4&quot;.
</p>
</html>"));
  end NamingConventions;

  package SignalBus "Control signal bus"
    extends Modelica.Icons.Information;

    class AddingSignals "Adding signals to the bus"
      extends Modelica.Icons.Information;

      annotation (Documentation(info="<html>
<p>
This method demonstrates how to add signals to the control signal bus.
To place an existing signal such as vehicle longitudinal velocity on to
the signal bus in the chassis subsystem use the following process:
</p>
<p>
Working within your chassis model&hellip;
</p>
<ol>
  <li>If not already there, drag the
      <strong>VehicleInterfaces.Interfaces.ChassisBus</strong> connector
      in to the model. It should get the default name
      <strong>chassisBus</strong> but rename it to this if it doesn&apos;t.</li>
  <li>Draw a&nbsp;connection from this new connector to the controlBus
      connector.</li>
  <li>In the connection dialog generated by Dymola select the following
      name: <strong>chassisBus</strong>
      <br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/UsersGuide/SignalBus/signalNaming2.png\">
      <br><br></li>
  <li>Add a&nbsp;sensor to measure the vehicle speed and drag a&nbsp;connection
      to the <strong>chassisBus</strong> connector just added.</li>
  <li>In the connection dialog generated by Dymola select
      <strong>longitudinalVelocity</strong> from the list of options.
      <br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/UsersGuide/SignalBus/signalNaming.png\">
      <br><br></li>
</ol>
<p>
The chassis subsystem should look something like:
</p>
<p>
<br><img src=\"modelica://VehicleInterfaces/Resources/Images/UsersGuide/SignalBus/controlSignalExample2.png\"><br><br>
</p>
<p>
There are two methods for adding a&nbsp;new signal to the controlBus.
</p>
<ol>
  <li>You draw the connection as in step 4 above, and instead of selecting
      an option from the list in step 5 you would select the
      &quot;Add variable&quot; option and then type the name of the signal
      you would like to add to the controlBus.</li>
  <li>You extend from the chassisBus connector definition that can be found
    in <strong>VehicleInterfaces.Chassis.Internal.StandardBus</strong> and
    add the new signal definition. Then, when you reach steps 4 and 5
    (above) your new signal will appear in the list of options and can
    be selected.</li>
</ol>
</html>"));
    end AddingSignals;
    annotation (Documentation(info="<html>
<p>
Every subsystem has access to the control signal bus which is modelled
using expandable connectors. This enables signals to be easily added to
the control signal bus to suit a&nbsp;particular application. A&nbsp;minimal
set of signals has been defined to ensure basic compatibility between
the various automotive libraries currently being developed.
</p>
<p>
The control signal bus should not contain physical connectors but should
contain sensed or actuation values as signal connections.
</p>

<h4>Naming of bus signals</h4>
<p>
Signals placed on the control signal bus should be named following the
same rules as naming the instance of a&nbsp;class. This is based on
the view that the items placed on to the control signal bus are actually
connectors rather than simple variable values.
</p>
<p>
Signals placed on the bus are written with a&nbsp;lower-case initial letter
and then initial capital letters for each word, like in
&quot;driverEnvironment&quot;.
</p>
<p>
The names of the connectors placed on to the bus should start with the name
of the subsystem that is outputting the connector on to the bus.
This should then be followed by &quot;Bus&quot;. and then a&nbsp;descriptive
name for the connector, like &quot;engineBus.engineSpeed&quot; or
&quot;chassisBus.longitudinalVelocity&quot;.
</p>

<h4>Minimal signal set</h4>
<p>
The signals in the following table are common to all vehicle types and
should be combined with the additional signals defined for the different
vehicle variants (i.e. manual and automatic transmission equipped vehicles).
</p>

<table cellspacing=\"0\" cellpadding=\"0\" border=\"1\">
  <tr>
    <th>Signal name</th>
    <th>Unit</th>
    <th>Signal description</th>
  </tr>
  <tr>
    <td>brakesBus.wheelSpeed_n</td>
    <td>rad/s</td>
    <td>Individual wheel speed where <strong>n</strong> is an integer
        describing which wheel this is from.
    </td>
  </tr>
  <tr>
    <td>chassisBus.longitudinalVelocity</td>
    <td>m/s</td>
    <td>Vehicle longitudinal velocity</td>
  </tr>
  <tr>
    <td>driverBus.ignition</td>
    <td>Enumeration</td>
    <td>Signals whether the driver wants the vehice to be operating.
        There are 3 possible values: Off, On or Start
        (<a href=\"modelica://VehicleInterfaces.Types.IgnitionSetting\">VehicleInterfaces.Types.IgnitionSetting</a>)
    </td>
  </tr>
  <tr>
    <td>engineBus.speed</td>
    <td>rad/s</td>
    <td>Engine speed</td>
  </tr>
  <tr>
    <td>transmissionBus.outputSpeed</td>
    <td>rad/s</td>
    <td>Transmission output shaft speed</td>
  </tr>
  <tr>
    <td>transmissionControlBus.currentGear</td>
    <td>Integer</td>
    <td>Currently selected gear</td>
  </tr>
</table>

<p>
The following additional signals are required for <strong>manual</strong>
transmission vehicles.
</p>

<table cellspacing=\"0\" cellpadding=\"0\" border=\"1\">
  <tr>
    <th>Signal name</th>
    <th>Unit</th>
    <th>Signal description</th>
  </tr>
  <tr>
    <td>transmissionBus.clutchLocked</td>
    <td>Boolean</td>
    <td>True if the clutch is locked, otherwise false</td>
  </tr>
</table>

<p>
The following additional signals are required for an <strong>automatic</strong>
transmission vehicles.
</p>

<table cellspacing=\"0\" cellpadding=\"0\" border=\"1\">
  <tr>
    <th>Signal name</th>
    <th>Unit</th>
    <th>Signal description</th>
  </tr>
  <tr>
    <td>driverBus.gearboxMode</td>
    <td>Enumeration</td>
    <td>Gearbox Mode (enumeration when supported, currently uses Integers
        defined according to
        <a href=\"modelica://VehicleInterfaces.Types.GearMode\">VehicleInterfaces.Types.GearMode</a>)
    </td>
  </tr>
  <tr>
    <td>driverBus.requestedGear</td>
    <td>Integer</td>
    <td>Driver requested gear for use in manual or limited gearbox modes</td>
  </tr>
</table>

<h4>Additional signals for a&nbsp;drive-by-wire vehicle</h4>
<p>
The following additional signals are required to model a&nbsp;drive-by-wire
vehicle and are common for both manual and automatic transmission variants.
</p>

<table cellspacing=\"0\" cellpadding=\"0\" border=\"1\">
  <tr>
    <th>Signal name</th>
    <th>Unit</th>
    <th>Signal description</th>
  </tr>
  <tr>
    <td>driverBus.acceleratorPedalPosition</td>
    <td>None</td>
    <td>Driver accelerator pedal position - normalised Real,
        0 = pedal released, 1 = pedal fully pressed</td>
  </tr>
  <tr>
    <td>driverBus.brakePedalPosition</td>
    <td>None</td>
    <td>Driver brake pedal position - normalised Real,
        0 = pedal released, 1 = pedal fully pressed</td>
  </tr>
</table>

<p>
The following additional signals are required for a&nbsp;<strong>manual</strong>
transmission drive-by-wire vehicle.
</p>

<table cellspacing=\"0\" cellpadding=\"0\" border=\"1\">
  <tr>
    <th>Signal name</th>
    <th>Unit</th>
    <th>Signal description</th>
  </tr>
  <tr>
    <td>driverBus.clutchPedalPosition</td>
    <td>None</td>
    <td>Driver clutch pedal position - normalised Real,
        0 = pedal released, 1 = pedal fully pressed</td>
  </tr>
  <tr>
    <td>driverBus.gear</td>
    <td>Integer</td>
    <td>Driver selected gear</td>
  </tr>
</table>
</html>"));
  end SignalBus;

  class DriverInteractionBus "Driver interaction bus"
    extends Modelica.Icons.Information;

    annotation (Documentation(info="<html>
<p>
The Driver Interaction bus connects the
<a href=\"modelica://VehicleInterfaces.DriverEnvironments\">driver&apos;s environment</a>
to an external
<a href=\"modelica://VehicleInterfaces.Drivers\">driver model</a>
and is implemented using expandable connectors. This enables
signals to be easily added to the control signal bus to suit a&nbsp;particular
application. A&nbsp;minimal set of signals has been defined,
see <a href=\"modelica://VehicleInterfaces.Drivers.Internal\">Drivers.Internal</a>,
to ensure basic compatibility between the various automotive libraries.
</p>
<p>
The Driver Interaction bus can contain both normalised physical connectors
and sensed values as signal connections.
</p>

<h4>Naming of Driver Interaction bus components</h4>
<p>
Connectors placed on the Driver Interaction bus should be named following
the same rules as naming the instance of a&nbsp;class. This is based on
the view that the items placed on to the control signal bus are actually
connectors rather than simple variable values.
</p>
<p>
This means that connectors placed on the bus are written with
a&nbsp;lower-case initial letter and then initial capital letters for
each word, like in &quot;acceleratorPedal&quot;.
</p>

<h4>Standard names</h4>
<p>
The following table defines the standard names and associated connector
types and units used.
</p>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
  <caption align=\"bottom\">Signals of the minimum Driver Interaction bus</caption>
  <tr>
    <th>Name on the bus</th>
    <th>Connector Type</th>
    <th>Units</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>acceleratorPedal</td>
    <td>NTI.Flange</td>
    <td>-</td>
    <td>Accelerator pedal connection using a normalised physical connector</td>
  </tr>
  <tr>
    <td>brakePedal</td>
    <td>NTI.Flange</td>
    <td>-</td>
    <td>Brake pedal connection using a normalised physical connector</td>
  </tr>
  <tr>
    <td>clutchPedal</td>
    <td>NTI.Flange</td>
    <td>-</td>
    <td>Clutch pedal connection using a normalised physical connector</td>
  </tr>
  <tr>
    <td>steeringWheel</td>
    <td>NRI.Flange_a</td>
    <td>-</td>
    <td>Steering wheel connection using a normalised physical connector</td>
  </tr>
  <tr>
    <td>vehicleSpeed</td>
    <td>RealSignal</td>
    <td>m/s</td>
    <td>Vehicle longitudinal velocity</td>
  </tr>
  <tr>
    <td>engineSpeed</td>
    <td>RealSignal</td>
    <td>rad/s</td>
    <td>Engine speed</td>
  </tr>
  <tr>
    <td>gear</td>
    <td>IntegerSignal</td>
    <td>-</td>
    <td>Gear selected by the driver (manual transmission only)</td>
  </tr>
  <tr>
    <td>clutchLocked</td>
    <td>BooleanSignal</td>
    <td>-</td>
    <td>Flag for clutch state, true=clutch in stuck mode (manual transmission only)</td>
  </tr>
  <tr>
    <td>gearboxMode</td>
    <td>IntegerSignal</td>
    <td>Enumeration</td>
    <td>Gearbox mode selected by the driver (automatic transmission only)</td>
  </tr>
  <tr>
    <td>requestedGear</td>
    <td>IntegerSignal</td>
    <td>-</td>
    <td>Gear selected by the driver if the automatic is in a manual mode
        (automatic transmission only)</td>
  </tr>
</table>

<p>
<strong>Key:</strong>
</p>

<ul>
  <li>NTI = NormalisedTranslational.Interfaces</li>
  <li>NRI = NormalisedRotational.Interfaces</li>
  <li>RealSignal = Modelica.Blocks.Interfaces.RealSignal</li>
  <li>IntegerSignal = Modelica.Blocks.Interfaces.IntegerSignal</li>
  <li>BooleanSignal = Modelica.Blocks.Interfaces.BooleanSignal</li>
  <li>VI = VehicleInterfaces</li>
</ul>

<h4>Pedal Conventions</h4>
<p>
For the driver the following conventions are used to describe the pedal
positions as normalised values.
</p>

<ul>
  <li>1 = Pedal Fully Pressed</li>
  <li>0 = Pedal Fully Released</li>
</ul>

<p>
For example: when the accelerator pedal position&nbsp;=&nbsp;1, the driver
is accelerating as fast as possible; when the clutch pedal
position&nbsp;=&nbsp;1, the driver has pressed the clutch pedal and
the clutch is actually disengaged.
</p>
</html>"));

  end DriverInteractionBus;

  class ModelRotatingParts "Modelling rotating systems"
    extends Modelica.Icons.Information;

    annotation (Documentation(info="<html>
<p>
Within VehicleInterfaces rather than limiting our-selves to modelling
rotating components as a&nbsp;simple 1D rotation we have built in
the flexibility to model rotating components as MultiBody systems.
This has been possible through the development of a&nbsp;new connector called
<a href=\"modelica://Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing\">FlangeWithBearing</a>.
This is a&nbsp;hierarchical connector that contains a&nbsp;1D rotational
connector and a&nbsp;conditional MultiBody connector.
The use of the MultiBody connector is controlled by a&nbsp;parameter
in the connector. This enables the FlangeWithBearing connector to model
rotational effects as a&nbsp;purely 1D system or it can correctly include
MultiBody effects.
</p>
<p>
Where this connector is used in an interface definition the parameter
includeBearingConnector is linked to a&nbsp;parameter at the model level
so that the model developer can easily activate this connector if required.
These parameters are declared as protected parameters so that they are only
available to the model developer as they create the subsystem model and
cannot be changed when the model is used.
</p>
<p>
The use of the bearing connectors needs to carefully considered to avoid
inadvertently creating mechanical loops in the model. The following example
guidelines for the engine and transmission subsystems should help highlight
the issues so that the model developer can determine when it is appropriate
to use the bearing connectors. For the engine and transmission subsystem
models:
</p>
<ol>
  <li>When they are modelled as a&nbsp;pure 1D rotational system then no
      bearing connectors are required.</li>
  <li>When they are modelled as a&nbsp;1D rotational system with reactions
      on to a&nbsp;MultiBody system then no bearing connectors are required.</li>
  <li>When they are being modelled as a&nbsp;MultiBody system but they are
      rigidly connected together then the bearing frame between the engine
      and transmission should not be included. In this case the
      transmissionMount connector should support the MultiBody elements
      of the transmission. The rest of the model then needs to be considered
      before deciding whether to include the bear-ing between the
      transmission and driveline or be-tween the engine and accessories
      subsystems.</li>
  <li>When they are being modelled as a&nbsp;MultiBody system but they are
      not rigidly connected together then the bearing frame between the
      engine and transmission will be required to support the intermediate
      drive shaft.</li>
</ol>
</html>"));
  end ModelRotatingParts;

  class SubsystemDefinitions "Subsystem descriptions"
    extends Modelica.Icons.Information;

    annotation (Documentation(info="<html>
<p>
The library contains the following subsystem definitions:
</p>
<ul>
  <li><a href=\"modelica://VehicleInterfaces.Accessories\">Accessories</a>
      &ndash; engine driven accessories</li>
  <li><a href=\"modelica://VehicleInterfaces.Atmospheres\">Atmospheres</a>
      &ndash; ambient conditions</li>
  <li><a href=\"modelica://VehicleInterfaces.Brakes\">Brakes</a>
      &ndash; brake system</li>
  <li><a href=\"modelica://VehicleInterfaces.Chassis\">Chassis</a>
      &ndash; chassis system</li>
  <li><a href=\"modelica://VehicleInterfaces.Controllers\">Controllers</a>
      &ndash; generic controller interface</li>
  <li><a href=\"modelica://VehicleInterfaces.DataDictionaries\">DataDictionaries</a>
      &ndash; for signal aliasing</li>
  <li><a href=\"modelica://VehicleInterfaces.Drivelines\">Drivelines</a>
      &ndash; driveline system</li>
  <li><a href=\"modelica://VehicleInterfaces.DriverEnvironments\">DriverEnvironments</a>
      &ndash; driver vehicle interface</li>
  <li><a href=\"modelica://VehicleInterfaces.Drivers\">Drivers</a>
      &ndash; optional driver subsystem</li>
  <li><a href=\"modelica://VehicleInterfaces.ElectricDrives\">ElectricDrives</a>
      &ndash; electric machine interface</li>
  <li><a href=\"modelica://VehicleInterfaces.Engines\">Engines</a>
      &ndash; engine interface</li>
  <li><a href=\"modelica://VehicleInterfaces.PowertrainMounts\">PowertrainMounts</a>
      &ndash; powertrain mounting systems</li>
  <li><a href=\"modelica://VehicleInterfaces.Roads\">Roads</a>
      &ndash; road definition</li>
  <li><a href=\"modelica://VehicleInterfaces.Transmissions\">Transmissions</a>
      &ndash; transmission subsystem</li>
</ul>
</html>"));
  end SubsystemDefinitions;

  package Tutorials "Tutorials"
    extends Modelica.Icons.Information;
    class Tutorial1 "Creating a vehicle model by extending from an Example"
      extends Modelica.Icons.Information;

      annotation (Documentation(info="<html>
<p>
The following process will demonstrate how to create a&nbsp;new vehicle
model using one of the example model architectures as a&nbsp;template.
This tutorial will guide you through building a&nbsp;conventional passenger
car, i.e. a&nbsp;vehicle with 4&nbsp;wheels.
</p>
<ol>
  <li>Create a&nbsp;new model that extends
      <strong>VehicleInterfaces.Exmaples.ConventionalManualVehicle</strong>,
      it should look like this:
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/UsersGuide/Tutorials/buildNewVehicleModel1.png\">
      <br><br></li>
  <li>By right clicking on each subsystem in turn you can now select the
      appropriate models for each subsystem.
      <br>
      Using Dymola, the context menu should look like below when changing
      the engine subsystem
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/UsersGuide/Tutorials/buildNewVehicleModel2.png\">
      <br><br></li>
  <li>When you have set the appropriate model for each subsystem your model
      is ready for parametisation and simulation.</li>
</ol>
</html>"));
    end Tutorial1;

    annotation (Documentation(info="<html>
<p>
Tutorials are provided as part of the VehicleInterfaces Users Guide
and these demonstrate:
</p>
<ol>
  <li><a href=\"modelica://VehicleInterfaces.UsersGuide.Tutorials.Tutorial1\">How to create a
      vehicle model using one of the example architectures</a></li>
  <li>Each subsystem also contains a Tutorial class that demonstrates
      the use of that subsystem.</li>
</ol>
<p>
A tutorial session on the VehicleInterfaces package was run at the
Modelica 2006 conference. The tutorial material from this conference
can be found at
<a href=\"http://www.modelica.org/events/modelica2006/Proceedings/html/tutorials.html\">http://www.modelica.org/events/modelica2006/Proceedings/html/tutorials.html</a>.
Some elements of the library may have been renamed since this tutorial
but the principles are still utilised.
</p>
</html>"));
  end Tutorials;

  package ReleaseNotes "Release notes"
    package Version_2_0_1 "Version 2.0.1 (2022-03-15)"
      extends Modelica.Icons.ReleaseNotes;

      annotation (Documentation(info="<html>
<p>
This version requires <strong>version 4.0.0</strong> of the 
<a href=\"https://github.com/modelica/ModelicaStandardLibrary\">Modelica Standard Library</a>.
This version is backwards compatible to version 2.0.0 of the
VehicleInterfaces library. 
</p>


<h4>Improvements in this version</h4>
<ul>
  <li>
    Use unit rev/min instead of r/min for <em>displayUnit</em> of initial engine
    speed in combustion engine models. This is, thus, compatible to the
    spelling adapted for angular velocity in some models of the
    Modelica Standard Library.
  </li>
  <li>
    GitHub issue <a href=\"https://github.com/modelica/VehicleInterfaces/issues/89\">#89</a>:
    Improve user dialog of road functions in 
    <a href=\"modelica://VehicleInterfaces.Roads.Interfaces.Base\">Roads.Interfaces.Base</a>
    and facilitate function redeclaration (choicesAllMatching&nbsp;=&nbsp;true).
  </li>
  <li>
    GitHub issue <a href=\"https://github.com/modelica/VehicleInterfaces/issues/88\">#88</a>:
    Limit possibility to modify <code>usingMultiBodyXXX</code> parameter
    in user dialog of base classes of several assemblies. This depends on
    the setting of <code>includeXXXBearing</code> now.
  </li>
</ul>
</html>"));
    end Version_2_0_1;

    package Version_2_0_0 "Version 2.0.0 (Jun. 26, 2020)"
      extends Modelica.Icons.ReleaseNotes;

      model ReintroduceExpandableConnectors "Reintroduce expandable connectors"
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
          Documentation(info="<html>
<p>
As documented in the
<a href=\"modelica://VehicleInterfaces.UsersGuide.SignalBus\">User&apos;s Guide</a>,
control signal buses are widely used within the library to easily
exchange signals between vehicle&apos;s subsystems.
In the previous versions of the VehicleInterfaces, the buses from
packages <code>&lt;subsystem&gt;.Interfaces</code> were directly instantiated
in the subsystem models, with the prefix &quot;replaceable&quot;.
This possibly led to some troubles especially when redeclaring
a&nbsp;subsystem within a&nbsp;vehicle architecture, since the
compatibility of the corresponding buses had to be granted.
</p>
<p>
In version 2.0.0 of the VehicleInterfaces, the original idea described in
the <a href=\"modelica://VehicleInterfaces.UsersGuide.SignalBus\">User&apos;s Guide</a>
is introduced again. Consequently, only the buses from
<a href=\"modelica://VehicleInterfaces.Interfaces\">VehicleInterfaces.Interfaces</a>
are instantiated in the subsystem models and base classes.
The prefix &quot;replaceable&quot; is omited. The bus signals are defined
in buses located in &lt;subsystem&gt;.Internal packages, but those particular
buses are only intended to enable a&nbsp;buildup of signal connection
dialog (i.e. the GUI) when connecting a&nbsp;signal.
Those particular buses shall not be used in models.
</p>
<p>
The buses formerly placed in packages <code>&lt;subsystem&gt;.Interfaces</code> are all
marked obsolete and they were moved into a&nbsp;separate library
<a href=\"modelica://ObsoleteVehicleInterfaces2\">ObsoleteVehicleInterfaces2</a>.
In user models, these obsolete connectors shall by replaced by buses from
<a href=\"modelica://VehicleInterfaces.Interfaces\">VehicleInterfaces.Interfaces</a>.
For example, a&nbsp;previous instantiation of engine bus such as
</p>

<blockquote><pre>
<strong>replaceable</strong> VehicleInterfaces.Engines.Interfaces.StandardBus engineBus
  <strong>constrainedby</strong> VehicleInterfaces.Interfaces.EngineBus
  <strong>annotation</strong>(...);
</pre></blockquote>

<p>
shall be replaced by
</p>

<blockquote><pre>
VehicleInterfaces.Interfaces.EngineBus engineBus
  <strong>annotation</strong>(...);
</pre></blockquote>
</html>"));
      end ReintroduceExpandableConnectors;
      annotation (Documentation(info="<html>
<p>
This version requires <strong>version 4.0.0</strong> of the 
<a href=\"https://github.com/modelica/ModelicaStandardLibrary\">Modelica Standard Library</a>.
This version is <strong>not</strong> backward compatible to previous
versions&nbsp;1.x.y of the VehicleInterfaces library.
</p>

<p>
A tested conversion script is provided to transform models and libraries
of previous versions 1.x.y to the new version.
Short Overview:
</p>
<ul>
  <li>This version is based on the recent Modelica language standard version 3.4.</li>
  <li>Obsolete classes of previous versions 1.x.y have been replaced.</li>
  <li>Obsolete classes that could not be automatically converted to alternative
      implementations have been moved to library ObsoleteVehicleInterfaces2.</li>
</ul>


<h4>Improvements in this version</h4>
<ul>
  <li><a href=\"modelica://VehicleInterfaces.Accessories.MinimalAccessories\">MinimalAccessories</a>:
      load torque changes its sign with direction of rotation.</li>
  <li>Road examples were moved into a&nbsp;particular package:
      <a href=\"modelica://VehicleInterfaces.Roads.Examples\">Roads.Examples</a>.</li>
  <li>Variable <code>currentGear</code> was deleted from
      <a href=\"modelica://VehicleInterfaces.Interfaces.TransmissionControlBus\">Interfaces.TransmissionControlBus</a>
      since it is yet properly defined in
      <a href=\"modelica://VehicleInterfaces.Transmissions.Internal.StandardControlBus\">
      Transmissions.Internal.StandardControlBus</a>.</li>
</ul>


<h4>Non-backward compatible changes</h4>
<p>
The following existing components have been changed in a&nbsp;non-backward
compatible way:
</p>
<ul>
  <li>GitHub issue <a href=\"https://github.com/modelica/VehicleInterfaces/issues/28\">#28</a>:
      Reintroducing the idea of expandable connectors for signal buses, see also
      <a href=\"modelica://VehicleInterfaces.UsersGuide.ReleaseNotes.Version_2_0_0.ReintroduceExpandableConnectors\">detailed description</a>.
      </li>
  <li>GitHub issues <a href=\"https://github.com/modelica/VehicleInterfaces/issues/56\">#56</a>
      and <a href=\"https://github.com/modelica/VehicleInterfaces/pull/46\">#46</a>:
      renaming of protected parameter includeAccessoriesBearing and
      includeTransmissionBearing, respectively.</li>
  <li>GitHub issue <a href=\"https://github.com/modelica/VehicleInterfaces/issues/38\">#38</a>:
      A&nbsp;<em>positive</em> load parameter <code>accessoriesLoad</code> of
      <a href=\"modelica://VehicleInterfaces.Accessories.MinimalAccessories\">MinimalAccessories</a>
      indicates accessories load now.</li>
  <li>GitHub issue <a href=\"https://github.com/modelica/VehicleInterfaces/issues/70\">#70</a>:
      Spell Greek letter for m (&mu;) correctly: mu instead of mue.
      This concerns classes in <a href=\"modelica://VehicleInterfaces.Roads\">Roads</a>
      package, in particular the function
      <a href=\"modelica://VehicleInterfaces.Roads.Interfaces.frictionCoefficientBase\">Roads.Interfaces.frictionCoefficientBase</a>.
      When using this function in your models, please check that automatic
      conversion performed correctly, i.e. the function&apos;s output is
      called <code>mu</code> now.</li>
</ul>
</html>"));
    end Version_2_0_0;

    class Version_1_2_5 "Version 1.2.5 (Mar. 6, 2019)"
      extends Modelica.Icons.ReleaseNotes;

      annotation (Documentation(info="<html>
<p>This version requires the <strong>Modelica 3.2.3</strong> Library.
   This version is backwards compatible to versions&nbsp;1.1.x and 1.2.x of the VehicleInterfaces library.
</p>

<h4>Improvements in this version</h4>

<ul>
<li>Obsolete blocks
    <a href=\"modelica://VehicleInterfaces.Blocks.RealPassThrough\">RealPassThrough</a>,
    <a href=\"modelica://VehicleInterfaces.Blocks.IntegerPassThrough\">IntegerPassThrough</a>,
    <a href=\"modelica://VehicleInterfaces.Blocks.BooleanPassThrough\">BooleanPassThrough</a>.</li>
<li>Resolved usage of obsolete <a href=\"modelica://VehicleInterfaces.Blocks.IntegerPassThrough\">IntegerPassThrough</a> in
    <a href=\"modelica://VehicleInterfaces.DriverEnvironments.DriveByWireAutomaticExternalDriver\">DriveByWireAutomaticExternalDriver</a>.</li>
<li>Deleted text string &quot;name&quot; from icons of
    <a href=\"modelica://VehicleInterfaces.Mechanics.NormalisedTranslational.Interfaces.Flange\">normalized translational flange</a> and
    <a href=\"modelica://VehicleInterfaces.Mechanics.NormalisedRotational.Interfaces.Flange\">normalized rotational flange</a>.</li>
</ul>
</html>"));
    end Version_1_2_5;

    class Version_1_2_4 "Version 1.2.4 (Mar. 2, 2016)"
      extends Modelica.Icons.ReleaseNotes;

      annotation (Documentation(info="<html>
<p>This version requires the <strong>Modelica 3.2.2</strong> Library.
   This version is backwards compatible to versions&nbsp;1.1.x and 1.2.x of the VehicleInterfaces library.
</p>

<h4>Improvements in this version</h4>

<ul>
<li> Typos in the documentation fixed. </li>
<li> Some FillPattern graphical annotations corrected
     (e.g. in Icons). </li>
<li> Icon <a href=\"modelica://VehicleInterfaces.Icons.VariantLibrary\">VariantLibrary</a>
     marked as obsolete and no more used. Using <a href=\"modelica://Modelica.Icons.VariantsPackage\">Modelica.Icons.VariantsPackage</a> instead.</li>
</ul>
</html>"));
    end Version_1_2_4;

    class Version_1_2_3 "Version 1.2.3 (Sept. 9, 2015)"
      extends Modelica.Icons.ReleaseNotes;

      annotation (Documentation(info="<html>
<p>This version requires the <strong>Modelica 3.2.1</strong> Library.
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
<p>This version requires the <strong>Modelica 3.2.1</strong> Library.
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
<p>This version requires the <strong>Modelica 3.2.1</strong> Library.
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
<li><strong>Improved buses</strong><br>
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
    (directory &quot;VehicleInterfaces/Extras&quot; moved to the new directory &quot;VehicleInterfaces/Resources&quot;;
     all links to images, scripts, documentation etc. have been changed to URIs such as
     modelica://VehicleInterfaces/Resources/Images/xx.png; icon layout adapted to MSL 3.2 layout).<br>
</li>

<li> VehicleInterfaces.<strong>EnergyStorage</strong>.Interfaces.Base:<br>
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
<li><a href=\"modelica://VehicleInterfaces.Mechanics.MultiBody.MultiBodyEnd\">VehicleInterfaces.Mechanics.MultiBody.MultiBodyEnd</a> adapted, so that &quot;Mixing of components and equations&quot; is avoided. </li>
<li><a href=\"modelica://VehicleInterfaces.UsersGuide.NamingConventions\">VehicleInterfaces.UsersGuide.NamingConventions</a>: changed &quot;a&quot; to &quot;z&quot; for an <em>angular</em> acceleration. </li>
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
     Replaced &quot;NonSI.AngularVelocity_rpm engineSpeed_start&quot; by
     SI.AngularVelocity with displayUnit=&quot;r/min&quot; and adapted
     flywheel Inertia initialization correspondingly.
     <br>&nbsp;</li>

<li> VehicleInterfaces.Roads.Internal.CheckContactCalculation adapted,
     so that it is according to Modelica 3 (equations for input variables of
     &quot;tyre&quot; moved from equation section into modifier of &quot;tyre&quot;).
     <br>&nbsp;</li>

<li> VehicleInterfaces.Atmospheres.ConstantAtmosphere icon corrected:
     Automatic Dymola conversion was not corrected, since icon was transformed
     to 100,100 icon instead of 200,100 icon (complex situation because icon
     size was actually inherited from Icons.Atmospheres and it is understandable
     that the conversion did not recognized this).
     <br>&nbsp;</li>

<li> VehicleInterfaces.Atmospheres.ConstantAtmosphere:<br>
     Removed &quot;...degC(20)&quot; function call by &quot;20&quot;, since displayUnit of
     temperatures is &quot;degC&quot;.
     <br>&nbsp;</li>

<li> Removed definition &quot;import NonSI = xx&quot; at the top level
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

  class License "Copyright and License"

    annotation (
      Documentation(info="<html>
<h4>Copyright</h4>
<p>
&copy; 2005-2013: Dassault Syst&egrave;mes, DLR and Modelon<br>
&copy; 2013-2022: Modelica Association
</p>
<h4>License</h4>
<p>The VehicleInterfaces library is distributed under the Modelica License (Version 1.1).</p>
<p>Redistribution and use in source and binary forms, with or without
modification are permitted, provided that the following conditions are met:
</p>
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
&quot;as is&quot; and the copyright holders assume no responsibility for its contents
what so ever. Any express or implied warranties, including, but not
limited to, the implied warranties of merchantability and fitness for a
particular purpose are <strong>disclaimed</strong>. <strong>In no event</strong> shall the
copyright holders, or any party who modify and/or redistribute the package,
<strong>be liable</strong> for any direct, indirect, incidental, special, exemplary, or
consequential damages, arising in any way out of the use of this software,
even if advised of the possibility of such damage.
</p>
</html>"),
      Icon(graphics={
          Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={245,245,245},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-50,50},{50,-54}},
            lineColor={0,0,0}),
          Rectangle(
            extent={{38,22},{74,-20}},
            lineColor={245,245,245},
            fillColor={245,245,245},
            fillPattern=FillPattern.Solid)}));
  end License;

  class Contact "Contact"
    extends Modelica.Icons.Contact;

    annotation (Documentation(info="<html>
<p>
This library is maintained by the
<a href=\"https://www.modelica.org/association\">Modelica Association</a>.
Further development takes place on
<a href=\"https://github.com/modelica/VehicleInterfaces\">https://github.com/modelica/VehicleInterfaces</a>
where users can also report issues and/or supply pull-requests.
</p>

<h4>History</h4>
<p>
A number of automotive library developers and consultants have co-operated
to develop the VehicleInterfaces Library. The developers were:
</p>
<ul>
  <li>Arsenal Research: Franz Pirker, Anton Haumer, Christian Kral</li>
  <li>Claytex Services Ltd: Mike Dempsey</li>
  <li>Dassault Syst&egrave;mes AB: Hilding Elmqvist</li>
  <li>DLR Oberpfaffenhofen: Martin Otter, Christian Schweiger, Jakub Tobolar</li>
  <li>DLR Stuttgart: Peter Treffinger, Marcus Baur, J&ouml;rg Ungeth&uuml;m</li>
  <li>Modelon AB: Johan Andreasson, Magnus G&auml;fvert</li>
  <li>Ricardo UK Ltd: Mark Ingram, Peter Harman</li>
</ul>
<p>
This library has been developed from work on the original Modelica VMA
(<a href=\"http://www.modelica.org/events/Conference2003/papers/h32_vehicle_Tiller.pdf\">Paper from the Modelica Conference 2003</a>)
developed by Michael Tiller et al and published by Ford Motor Company.
</p>
<p>
Additional ideas from intermediate work by members of DLR Oberpfaffenhofen
and Modelon has also been incorporated. The above partners agreed to develop
these ideas in to a&nbsp;new library and adopt this set of interface
definitions.
</p>
<p>
The implementation of the VehicleInterfaces library was led by
Claytex Services Limited under contract to Dassault Syst&egrave;mes AB.
</p>
</html>"));
  end Contact;
  annotation (DocumentationClass=true, Documentation(info="<html>
<p>
The VehicleInterfaces Modelica library provides standard interface
definitions for automotive subsystems and vehicle models. These are
designed to promote compatibility between the various automotive
libraries and provide a flexible, powerful structure for vehicle
modelling. The main focus of the library is on defining the interfaces
for the individual subsystems and a number of vehicle model examples are
included to demonstrate how they might be used.
</p>
<p>
<img src=\"modelica://VehicleInterfaces/Resources/Images/conventionalVehicle.png\" align=\"middle\">
</p>
<p>
For an automotive library to be compatible with other libraries based
on this set of interface definitions they should extend the interface
definition from within this library and following the naming convention
for the control signal bus and driver interaction bus if used.
</p>
<p>
This library also contains a proposal for a naming convention covering
the whole model library and the developers of this library would recommend
that this convention is followed by other developers to ensure a consistent
naming convention across the whole set of automotive models.
</p>
</html>"));
end UsersGuide;
