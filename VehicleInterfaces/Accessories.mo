within VehicleInterfaces;
package Accessories "Collection of accessory subsystem definitions"
  extends Modelica.Icons.VariantsPackage;

  class Tutorial "Accessories Tutorial"
    extends Modelica.Icons.Information;

    annotation (DocumentationClass=true, Documentation(info="<html>
<p><b>Tutorial - Defining a new accessories model</b></p>
<p>The following process will demonstrate how to create a new accessories model using these interface definitions.  This tutorial will guide you through building an accessory subsystem with a power steering pump and alternator.  Both will be modelled using speed dependant torque loss maps.</p>
<ol>
<li>Create a new model that extends <b>VehicleInterfaces.Accessories.Interfaces.Base</b>, it should look like this:
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/Accessories/buildNewAccessories1.png\"><br><br></li>
<li>In the component browser, right click on <b>Base</b> and select <b>Parameters</b> from the context menu to produce the following parameter dialog:
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/Accessories/buildNewAccessories3.png\"><br><br></li>
<li>This dialog allows you to enable/disable the optional bearing connectors within the engineFlange by setting <b>includeEngineBearing</b> as required.</li>
<li>You can now define your accessory model as required</li>
</ol>
<h4>Adding an alternator and power steering pump</h4>
<p>The following steps demonstrate how to create a simple accessories model.  The subsystem will include an alternator and power steering pump that are modelled separately but both use speed-dependant torque loss maps.</p>
<p>Starting from step 2 above.</p>
<ol>
<li>Add the following blocks and connections to the diagram:
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/Accessories/buildNewAccessories2.png\"><br><br></li>
<li>Next, we need to check to see if any connections to the control signal bus are required for the driveline, see <a href=\"Modelica://VehicleInterfaces.UsersGuide.SignalBus\">a complete list</a> of the minimum connections required.  In this case we don't need to add any signals to the control signal bus.</li>
<li>The model is now complete and should check successfully and can be used in any model compatible with the VehicleInterfaces library</li>
</ol>
</html>"));
  end Tutorial;

  package Interfaces "Collection of interface definitions for accessories"
    extends Modelica.Icons.InterfacesPackage;
    partial model Base "Basic interface definition for the accessories"

    public
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing engineFlange(
          final includeBearingConnector=includeAccessoriesBearing or
            usingMultiBodyEngine) "Source of drive torque"
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Mechanics.MultiBody.MultiBodyEnd end_2(final includeBearingConnector=
            includeAccessoriesBearing or usingMultiBodyEngine)
        annotation (Placement(transformation(
            origin={100,22},
            extent={{-8,-6},{8,6}},
            rotation=270)));
      VehicleInterfaces.Interfaces.ControlBus controlBus "Control signal bus"
        annotation (Placement(transformation(
            origin={-100,60},
            extent={{-20,-20},{20,20}},
            rotation=90)));
      parameter Boolean usingMultiBodyEngine=false
        "=true if using a MultiBody engine with a 1D accessories model"
        annotation (Dialog(tab="Advanced"));
    protected
      parameter Boolean includeAccessoriesBearing=false
        "Include the engine bearing";
    equation
      connect(end_2.flange, engineFlange) annotation (Line(
          points={{100,19.3333},{100,0}},
          color={135,135,135},
          thickness=0.5));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{92,28},{108,16}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot)}),
                           Documentation(info="<html>
<p>This partial model defines the interfaces required for an accessories subsystem. This class should be extended to form a particular accessory model. See the <a href=\"Modelica://VehicleInterfaces.Accessories\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.Accessories.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end Base;
    annotation (Documentation(info="<html>
<p>
A collection of partial base classes which define interfaces for accessories models.
</p>
</html>"));
  end Interfaces;

  model NoAccessories "Empty accessories"
    extends VehicleInterfaces.Icons.Accessories;
    extends VehicleInterfaces.Icons.Empty;
    extends Interfaces.Base;

    annotation (                         Documentation(info="<html>
<p>
Empty accessories subsystem. Using this empty model in overall vehicle architecture the functionality of accessories subsystem can be eliminated.
</p>
</html>"));
  end NoAccessories;

  model MinimalAccessories
    "Constant torque loss and inertia due to the accessories"
    extends VehicleInterfaces.Icons.Accessories;
    extends Interfaces.Base(includeAccessoriesBearing=world.driveTrainMechanics3D);

    parameter Modelica.SIunits.Inertia accessoriesInertia=0.001
      "Total effective rotational inertia of the accessories";
    parameter Modelica.SIunits.Torque accessoriesLoad=2
      "Total effective torque load due to the accessories (constant)";
    parameter Modelica.Mechanics.MultiBody.Types.Axis axisOfRotation={1,0,0}
      "Axis of rotation for accessories when including MultiBody effects";

    Modelica.Mechanics.MultiBody.Parts.Rotor1D inertia(
      J=accessoriesInertia,
      n=axisOfRotation)   annotation (Placement(transformation(extent={{20,-10},
              {40,10}})));
    Modelica.Mechanics.Rotational.Sources.ConstantTorque torqueLoss(
      tau_constant=accessoriesLoad,
      useSupport=includeAccessoriesBearing)
                           annotation (Placement(transformation(extent={{-20,-10},
              {0,10}})));
    Modelica.Mechanics.MultiBody.Parts.Mounting1D torqueReaction(
      n=axisOfRotation) if includeAccessoriesBearing
      annotation (Placement(transformation(extent={{110,-20},{90,-40}})));
  protected
    outer Modelica.Mechanics.MultiBody.World world;
  equation
    connect(torqueLoss.flange, inertia.flange_a) annotation (Line(points={{0,0},{
            10,0},{20,0}}));
    connect(inertia.flange_b, engineFlange.flange)
      annotation (Line(points={{40,0},{100,0}}));
    connect(torqueReaction.frame_a, engineFlange.bearingFrame) annotation (Line(
        points={{100,-20},{100,0}},
        thickness=0.5));
    connect(torqueReaction.flange_b,torqueLoss.support)  annotation (Line(
          points={{90,-30},{-10,-30},{-10,-10}}));
    connect(inertia.frame_a, torqueReaction.frame_a) annotation (Line(
        points={{30,-10},{30,-20},{100,-20}},
        color={95,95,95},
        thickness=0.5));
    annotation (                         Documentation(info="<html>
<p>Simple accessory model with a single inertia and constant torque loss.</p>
</html>"));
  end MinimalAccessories;

  annotation (Documentation(info="<html>
<p>The accessory subsystem interfaces are defined in this sub-package of the VehicleInterfaces library.  The accessories subsystem has the following connectors:</p>
<ul>
<li><b>engineFlange</b> - 1D rotational connection to the engine subsystem (or other systems mechanically connected to the accessories)</li>
<li><b>controlBus</b> - control signal bus connection</li>
</ul>
<h4>Effects to be modelled in this subsystem</h4>
<p>Within the VehicleIntefaces package the accessories subsystem is used to model the torque losses and inertia effects of the engine accessories such as the alternator, power steering pump, etc.</p>
</html>"));
end Accessories;
