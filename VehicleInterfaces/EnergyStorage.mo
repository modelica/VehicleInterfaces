within VehicleInterfaces;
package EnergyStorage "Collection of energy storage subsystem definitions"
  extends Modelica.Icons.VariantsPackage;

  class Tutorial "Energy Storage Device Tutorial"
    extends Modelica.Icons.Information;

    annotation (DocumentationClass=true, Documentation(info="<html>
<p><b>Tutorial - Defining a new energy storage device model</b></p>
<p>The following process will demonstrate how to create a new energy storage device model using these interface definitions.  This tutorial will guide you through building a simple battery.</p>
<ol>
<li>Create a new model that extends <b>VehicleInterfaces.EnergyStorage.Interfaces.Base</b>, it should look like this:
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewEnergyStorage1.png\"><br><br></li>
<li>Unlike most of the other systems in the VehicleInterfaces package, the energy storage device interface definition does not contain any optional connectors.</li>
<li>You can now define your energy storage device model as required</li>
</ol>
<h4>Creating a simple battery example</h4>
<p>The following steps demonstrate how to create a simple battery model.  The battery model will have a constant voltage and an internal resistance.</p>
<p>Starting from step 2 above.</p>
<ol>
<li>Add the following blocks and connections to the diagram.
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewEnergyStorage2.png\"><br><br></li>
</ol>
</html>"));
  end Tutorial;

  package Interfaces "Collection of interface definitions for energy storage"
    extends Modelica.Icons.InterfacesPackage;

    partial model Base "Basic interface for an energy storage device"
      parameter Boolean includeGround=false
        "Include inner electrical ground at pin_n"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
      parameter Boolean includeHeatPort = false "Include the battery heat port"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
      parameter Boolean usingMultiBodyChassis=false
        "Include secondary ground node on the right port"
            annotation(Evaluate=true, HideResult=true, choices(checkBox=true));

      VehicleInterfaces.Interfaces.ControlBus controlBus if not usingMultiBodyChassis
        "Control signal bus"
        annotation (Placement(transformation(
            origin={-100,-60},
            extent={{-20,-20},{20,20}},
            rotation=90)));
      Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
        "Positive electrical pin" annotation (Placement(transformation(extent={
                {90,50},{110,70}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
        "Negative electrical pin" annotation (Placement(transformation(extent={{110,-70},
                {90,-50}})));
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort if includeHeatPort
        "Conditional port for exhaust heat flow"
        annotation (Placement(transformation(extent={{-70,-110},{-50,-90}})));
    protected
      Modelica.Electrical.Analog.Basic.Ground ground if includeGround
        "Conditional electrical ground"
      annotation (Placement(transformation(extent={{110,-100},{90,-80}})));

    equation
      connect(ground.p, pin_n) annotation (Line(
          points={{100,-80},{100,-60}},
          color={0,0,255}));
      annotation (                           Icon(coordinateSystem(preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}),
                                graphics={
            Line(
              visible=includeGround,
              points={{70,-106},{130,-106}},
              color={0,0,255}),
            Line(
              visible=includeGround,
              points={{85,-115},{115,-115}},
              color={0,0,255}),
            Line(
              visible=includeGround,
              points={{95,-123},{105,-123}},
              color={0,0,255}),
            Line(visible=includeGround,
              points={{100,-106},{100,-62}},
              color={0,0,255})}),
        Documentation(info="<html>
<p>This partial model defines the interfaces required for an electrical energy storage subsystem. Additionally, the ground is connected to the connector pin_n. It can be disabled when <code>includeGround=false</code>.</p>
<p>This class should be extended to form a particular battery model. See the <a href=\"Modelica://VehicleInterfaces.EnergyStorage\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.EnergyStorage.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end Base;

    annotation (Documentation(info="<html>
<p>
A collection of partial base classes which define interfaces for energy storage models.
</p>
</html>"));
  end Interfaces;

  model Battery "Simple battery"
    parameter SI.Voltage V(start=1) "Value of constant voltage";
    extends .VehicleInterfaces.Icons.Battery;
    extends .VehicleInterfaces.EnergyStorage.Interfaces.Base(heatPort(Q_flow=0));

    Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=V)
      annotation (Placement(transformation(
          origin={20,0},
          extent={{20,-20},{-20,20}},
          rotation=90)));
  equation
    connect(constantVoltage.p, pin_p) annotation (Line(
        points={{20,20},{20,60},{100,60}},
        color={0,0,255}));
    connect(constantVoltage.n, pin_n) annotation (Line(
        points={{20,-20},{20,-60},{100,-60}},
        color={0,0,255}));

    annotation (
      Documentation(info="<html>
<p>An ideal battery with a constant voltage. No state of charge is introduced.</p>
</html>"));
  end Battery;

  annotation (Documentation(info="<html>
<p>The energy storage subsystem interfaces are defined in this sub-package of the VehicleInterfaces library.  The energy storage subsystem has the following connectors:</p>
<ul>
<li><b>pin_p</b> - Electrical connection</li>
<li><b>pin_n</b> - Electrical connection</li>
<li><b>controlBus</b> - control signal bus connection</li>
</ul>
</html>"));
end EnergyStorage;
