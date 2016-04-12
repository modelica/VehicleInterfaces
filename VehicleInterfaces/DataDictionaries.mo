within VehicleInterfaces;
package DataDictionaries "Collection of data dictionary definitions"
  extends Modelica.Icons.VariantsPackage;

  class Tutorial "Data Dictionary Tutorial"
    extends Modelica.Icons.Information;

    annotation (DocumentationClass=true,Documentation(info="<html>
<h4>Tutorial - Defining a new data dictionary subsystem</h4>
<p>
The following process will demonstrate how to create a new data dictionary
model using these interface definitions.
</p>
<ol>
<li>Create a new model that extends <b>VehicleInterfaces.DataDictionaries.Interfaces.Base</b>,it should look like this:
<br>&nbsp;<br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewDataDictionary1.png\"><br>&nbsp;</li>
<li>You can now define your data dictionary model as required</li>
</ol>
<h4>Adding an alias signal to the data dictionary</h4>
<p>
The following steps demonstrate how to add a new alias signal to the control signal bus.
An alias signal for the vehicle longitudinal velocity in the chassisBus will be added called v_veh.
</p>
<ol>
<li>Add a block <b>Modelica.Blocks.Routing.RealPassThrough </b> and give it the name
of the alias signal that you would like to create, in this case <b>v_veh</b>.
Note, this block passes Real signal through without modification.</li>
<li>Then add the bus connector for the appropriate sub-bus, in this case the chassisBus
connector which can be found at <b>VehicleInterfaces.Interfaces.ChassisBus</b>.</li>
<li>Then add two connections between the RealSignal connector and the chassisBus connector.
The first connects to the <b>longitudinalVelocity</b> signal within the chassisBus,
the second creates a new signal called <b>v_veh</b>.
<br>&nbsp;<br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewDataDictionary2.png\"><br>&nbsp;</li>
</ol>
</html>"));
  end Tutorial;

  package Interfaces "Collection of interface definitions for data dictionary"
    extends Modelica.Icons.InterfacesPackage;
    partial model Base "Basic interface definition for a data dictionary"

      VehicleInterfaces.Interfaces.ControlBus controlBus "Control signal bus"
        annotation (Placement(transformation(extent={{-20,-80},{20,-120}})));
      annotation (                        Documentation(info="<html>
<p>This partial model defines the interfaces required for a data dictionary within the VehicleInterfaces package.
Especially, it provide alias names for the controBus. See the <a href=\"modelica://VehicleInterfaces.DataDictionaries\">documentation</a> and <a href=\"modelica://VehicleInterfaces.DataDictionaries.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end Base;

    annotation (Documentation(info="<html>
<p>
A collection of partial base classes which define interfaces for data dictionary.
</p>
</html>"));
  end Interfaces;

  model NoDataDictionary "Empty data dictionary"
    extends VehicleInterfaces.Icons.DataDictionary;
    extends VehicleInterfaces.Icons.Empty;
    extends VehicleInterfaces.DataDictionaries.Interfaces.Base;
    annotation (Documentation(info="<html>
<p>
Empty data dictionary model. Using this empty model in overall vehicle architecture the functionality of data dictionary can be eliminated.
</p>
</html>"));
  end NoDataDictionary;

  model MinimalExample "Basic data dictionary example"
    extends VehicleInterfaces.Icons.DataDictionary;
    extends VehicleInterfaces.DataDictionaries.Interfaces.Base;
  protected
    Modelica.Blocks.Routing.RealPassThrough v_veh
      annotation (Placement(transformation(extent={{6,-6},{-6,6}}),
          iconTransformation(extent={{-14,-6},{6,6}})));
    replaceable VehicleInterfaces.Chassis.Interfaces.StandardBus
                                            chassisBus constrainedby
      VehicleInterfaces.Interfaces.ChassisBus
      annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));

  equation
    connect(chassisBus, controlBus.chassisBus) annotation (Line(
        points={{0,-50},{0,-100}},
        color={255,204,51},
        thickness=0.5));
    connect(v_veh.u, chassisBus.longitudinalVelocity) annotation (Line(
        points={{7.2,0},{40,0},{40,-50},{0,-50}},
        color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(chassisBus.v_veh, v_veh.y) annotation (Line(
        points={{0,-50},{-40,-50},{-40,0},{-6.6,0}},
        color={0,0,127}), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    annotation (
      Documentation(info="<html>
 <p>A simple data dictionary example that creates a new signal called <b>v_veh</b> within the <b>chassisBus</b> sub-bus of the control bus.</p>
</html>"));
  end MinimalExample;

  annotation (Documentation(info="<html>
<p>The data dictionary interface is defined in this sub-package of the VehicleInterfaces library.  The data dictionary subsystem has the following connector:</p>
<ul>
<li><b>controlBus</b> - control signal bus connection</li>
</ul>
<h4>Effects to be modelled in this subsystem</h4>
<p>Within the VehicleIntefaces package the data dictionary subsystem is used to provide compatibility between the naming convention used in the VehicleInterfaces library and in-house naming conventions.  This is achieved by providing alias names for the various signals on the control signal bus.</p>
</html>"));
end DataDictionaries;
