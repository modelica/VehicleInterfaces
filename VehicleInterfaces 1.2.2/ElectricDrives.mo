within VehicleInterfaces;
package ElectricDrives "Collection of electric drive subsystem definitions"
  extends VehicleInterfaces.Icons.VariantLibrary;

  class Tutorial "Electric Drives Tutorial"
    extends Modelica.Icons.Information;

    annotation (DocumentationClass=true, Documentation(info="<html>
<p><b>Tutorial - Defining a new electric motor model</b></p>
<p>The following process will demonstrate how to create a new electric motor model using these interface definitions.  This tutorial will guide you through building a simple DC electric motor.</p>
<ol>
<li>Create a new model that extends <b>VehicleInterfaces.ElectricDrives.Interfaces.BaseDCMachine</b>, it should look like this:</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewElectricDrive1.png\"><br><br>
<li>In the component browser, right click on <b>BaseDCMachine</b> and select <b>Parameters</b> from the context menu to produce the following parameter dialog</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewElectricDrive2.png\"><br><br>
<li>This dialog allows you to enable/disable the optional connections by setting <b>includeBearing</b> as required for your new motor model.  The shaft_b connector is of the type <a href=\"Modelica://VehicleInterfaces.Interfaces.FlangeWithBearing\">VehicleInterfaces.Interfaces.FlangeWithBearing</a>, the parameter <b>includeBearing</b> controls whether the bearing connector within the shaft_b connector is enabled or not.</li>
<li>You can now define your driveline model as required</li>
</ol>
<h4>Creating a simple electric motor example</h4>
<p>The following steps demonstrate how to create a simple rear-wheel drive driveline model.  The driveline model will transmit the torque from the transmission to the rear wheels via a propshaft, differential with final drive and then two halfshafts.  No torque reaction in to the transmission housings will be modelled.</p>
<p>Starting from step 3 above.</p>
<ol>
<li>First, decide if the bearing connector is required in the model and set the internal parameter appropriately.</li>
<li>Add the following blocks and connections to the diagram.</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewElectricDrive3.png\"><br><br>
</ol>
</html>"));
  end Tutorial;

  package Interfaces "Collection of interface definitions for electric drive"
    extends Modelica.Icons.InterfacesPackage;

    partial model Base "Basic interface for an electric drives"

      VehicleInterfaces.Interfaces.ControlBus controlBus "Control signal bus"
        annotation (Placement(transformation(
            origin={-100,-60},
            extent={{-20,-20},{20,20}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing shaft_b(
          includeBearingConnector=includeBearing or usingMultiBodySystem)
        "Mechanical shaft" annotation (Placement(transformation(extent={{90,-10},
                {110,10}}, rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_1(includeBearingConnector=
            includeBearing or usingMultiBodySystem)
        annotation (Placement(transformation(
            origin={100,22},
            extent={{-8,-6},{8,6}},
            rotation=270)));
      parameter Boolean usingMultiBodySystem=false
        "=true if connecting to a MultiBody system with a 1D model"
        annotation (Dialog(tab="Advanced"));
    protected
      parameter Boolean includeBearing=false "Include bearing connector";
    equation
      connect(end_1.flange, shaft_b) annotation (Line(
          points={{100,19.3333},{100,0}},
          color={135,135,135},
          thickness=0.5));

      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}})),
                           Icon(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}})),
        Documentation(info="<html>
<p>This partial model defines the interfaces required for an electric machine subsystem. This class should be extended to form an electric machine interface definition with propper electrical connectors. See the <a href=\"Modelica://VehicleInterfaces.ElectricDrives\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.ElectricDrives.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end Base;

    partial model BaseDCMachine "Base interface for electric drive in series"
      extends VehicleInterfaces.ElectricDrives.Interfaces.Base;
      Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
        "Positive electrical pin" annotation (Placement(transformation(extent={
                {50,90},{70,110}}, rotation=0)));
      Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
        "Negative electrical pin" annotation (Placement(transformation(extent={
                {-70,90},{-50,110}}, rotation=0)));

      annotation (Documentation(info="<html>
<p>This partial model defines the interfaces required for an electric machine subsystem.  
This class should be extended to form a particular electric machine model. See the <a href=\"Modelica://VehicleInterfaces.ElectricDrives\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.ElectricDrives.Tutorial\">tutorial</a> for more information.</p>information.</p>
</html>"), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}})));
    end BaseDCMachine;

    annotation (Documentation(info="<html>
<p>
A collection of partial base classes which define interfaces for electric drive models. 
</p>
</html>"));
  end Interfaces;

  model SimpleMotorDC "Simple DC electric motor"
    extends Interfaces.BaseDCMachine;
    extends VehicleInterfaces.Icons.ElectricMotor;
    parameter SI.Inductance L=1e-3 "Inductance";
    parameter SI.Resistance R=10 "Resistance";
    parameter SI.ElectricalTorqueConstant k=0.4 "Transformation coefficient";

    Modelica.Electrical.Analog.Basic.Resistor resistor(R=R)
      annotation (Placement(transformation(extent={{20,-40},{40,-20}}, rotation=
             0)));
    Modelica.Electrical.Analog.Basic.Inductor inductor(L=L)
      annotation (Placement(transformation(extent={{-40,-40},{-20,-20}},
            rotation=0)));
    Modelica.Electrical.Analog.Basic.EMF eMF(k=k)
      annotation (Placement(transformation(extent={{50,-10},{70,10}}, rotation=
              0)));
  equation
    connect(eMF.flange,   shaft_b.flange) annotation (Line(
        points={{70,0},{100,0}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(inductor.n, resistor.p) annotation (Line(
        points={{-20,-30},{20,-30}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(resistor.n, eMF.n) annotation (Line(
        points={{40,-30},{60,-30},{60,-10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(eMF.p, pin_p) annotation (Line(
        points={{60,10},{60,100}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(inductor.p, pin_n) annotation (Line(
        points={{-40,-30},{-60,-30},{-60,100}},
        color={0,0,255},
        smooth=Smooth.None));

    annotation (
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
              lineColor={0,0,0})}),
      Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
              100,100}})),
      Documentation(info="<html>
<p>A simple DC electric motor with inductance and internal resistance.</p>
</html>"));
  end SimpleMotorDC;

  annotation (Documentation(info="<html>
<p>The electric drive subsystem interfaces are defined in this sub-package of the VehicleInterfaces library.  The electric drive subsystem has the following connectors:</p>
<ul>
<li><b>shaft</b> - 1D rotational connection to the driven system</li>
<li><b>controlBus</b> - control signal bus connection</li>
</ul>
</html>"));
end ElectricDrives;
