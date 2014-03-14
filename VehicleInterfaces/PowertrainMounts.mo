within VehicleInterfaces;
package PowertrainMounts "Collection of powertrain mounts subsystem definition"
  extends Icons.VariantLibrary;

  class Tutorial "Powertrain Mounts Tutorial"
    extends Modelica.Icons.Information;

    annotation (DocumentationClass=true,Documentation(info="<html>
<p><b>Tutorial - Defining a new powertrain mounting system</b></p>
<p>The following process will demonstrate how to create a new powertrain mounting system.  In this example we will create a mounting system for the engine and transmission systems where these two systems are rigidly connected together.</p>
<ol>
<li>We are creating a powertrain mounting system to support 2 powertrain systems so we need to base our model on the <b>DualSystemMount</b> Interface definition.  Start by extending this class <b>VehicleInterfaces.PowertrainMounts.Interfaces.DualSystemMount</b></li>
<li>This interface definition contains 3 MultiBody connectors, the one called <b>chassisFrame</b> will be attached to the chassis subsystem in our vehicle model and is the chassis reference frame.  The other two connectors, <b>mount_1</b> and <b>mount_2</b> are the reference frames for the two subsystems that this mounting system will support.  In this case <b>mount_1</b> will be treated as the engine reference frame and <b>mount_2</b> as the transmission reference frame.  The first step is to add a fixed translation (<b>Modelica.Mechanics.MultiBody.Parts.FixedTranslation</b>) between mount_1 and mount_2 to define the position of the transmisison reference frame relative to the engine reference frame.</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewMounts1.png\"><br><br>
<li>The next step is to define the mounting system.  In this example we will utilise some components from the PowerTrain library to define the mounting system.  The engine and transmission systems will be mounted by 3 elastic mounts.  Start defining the mounting system by adding 3 fixed translation blocks that define the locations of the mounts relative to the chassisFrame.</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewMounts2.png\"><br><br>
<li>Add the elastic mount blocks, in this case they are defined in the PowerTrain library as <b>PowerTrain.MountingSystems.Mount</b></li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewMounts3.png\"><br><br>
<li>Finally add 3 more fixed translation blocks that define the location of the engine reference frame relative to each of the mount locations.</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewMounts4.png\"><br><br>
<li>The model is now complete and should check correctly</li>
</ol>
</html>"));
  end Tutorial;

  package Interfaces
    "Collection of interface definitions for powertrain mounting system"
    extends Modelica.Icons.InterfacesPackage;

    partial model Base "Basic interface definition for a mounting system"

      Modelica.Mechanics.MultiBody.Interfaces.Frame_a chassisFrame
        "Chassis frame" annotation (Placement(transformation(
            origin={0,-100},
            extent={{-16,-16},{16,16}},
            rotation=90)));
      annotation (        Documentation(info="<html>
<p>This partial model defines the common interfaces required for a mounting subsystem.  See the <a href=\"Modelica://VehicleInterfaces.PowertrainMounts\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.PowertrainMounts.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end Base;

    partial model SingleSystemMount
      "Single powertrain subsystem mounting interface definition"
      extends Base;
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b mount_1
        "Powertrain system 1"
        annotation (Placement(transformation(
            origin={0,100},
            extent={{-16,-16},{16,16}},
            rotation=90)));
      annotation (        Documentation(info="<html>
<p>This partial model defines the interfaces required for a single powertrain system mounting subsystem. This class should be extended to form a particular powertrain mounting model. See the <a href=\"Modelica://VehicleInterfaces.PowertrainMounts\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.PowertrainMounts.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end SingleSystemMount;

    partial model DualSystemMount
      "Two powertrain subsystem mounting interface definition"
      extends Base;
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b mount_1
        "Powertrain system 1"
        annotation (Placement(transformation(
            origin={-100,100},
            extent={{-16,-16},{16,16}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b mount_2
        "Powertrain system 2"
        annotation (Placement(transformation(
            origin={100,100},
            extent={{-16,-16},{16,16}},
            rotation=90)));
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-150,-100},{150,100}},
            grid={1,1},
            initialScale=0.1), graphics),
        Documentation(info="<html>
<p>This partial model defines the interfaces required for two powertrain system mounting subsystem. This class should be extended to form a particular powertrain mounting model. See the <a href=\"Modelica://VehicleInterfaces.PowertrainMounts\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.PowertrainMounts.Tutorial\">tutorial</a> for more information.</p>
</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-150,-100},{150,100}},
            grid={1,1},
            initialScale=0.1), graphics));
    end DualSystemMount;

    partial model TripleSystemMount
      "Three powertrain subsystem mounting interface definition"
      extends Base;
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b mount_1
        "Powertrain system 1"
        annotation (Placement(transformation(
            origin={-90,100},
            extent={{-16,-16},{16,16}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b mount_2
        "Powertrain system 2"
        annotation (Placement(transformation(
            origin={0,100},
            extent={{-16,-16},{16,16}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b mount_3
        "Powertrain system 3"
        annotation (Placement(transformation(
            origin={90,100},
            extent={{-16,-16},{16,16}},
            rotation=90)));
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-150,-100},{150,100}},
            grid={1,1},
            initialScale=0.1), graphics),
        Documentation(info="<html>
<p>This partial model defines the interfaces required for three powertrain system mounting subsystem. This class should be extended to form a particular powertrain mounting model. See the <a href=\"Modelica://VehicleInterfaces.PowertrainMounts\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.PowertrainMounts.Tutorial\">tutorial</a> for more information.</p>
</html>"),
        Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-150,-100},{150,100}},
            grid={1,1},
            initialScale=0.1)));

    end TripleSystemMount;

    annotation (Documentation(info="<html>
<p>
A collection of partial base classes which define interfaces for powertrain mounting systems.
</p>
</html>"));
  end Interfaces;

  model ThreeSystemRigidMount "3 system rigid mount"
    extends Interfaces.TripleSystemMount;
    extends VehicleInterfaces.Icons.MultipleMounts;
    parameter Modelica.SIunits.Position r_ChassisToMount1[3]={0,0,0}
      "Vector from chassis frame to mount_1 frame" annotation (Evaluate=false);
    parameter Modelica.SIunits.Position r_ChassisToMount2[3]={0,0,0}
      "Vector from chassis frame to mount_2 frame" annotation (Evaluate=false);
    parameter Modelica.SIunits.Position r_ChassisToMount3[3]={0,0,0}
      "Vector from chassis frame to mount_3 frame" annotation (Evaluate=false);

    Modelica.Mechanics.MultiBody.Parts.FixedTranslation chassisFrameToMount1(r=
          r_ChassisToMount1, animation=false)
      annotation (Placement(transformation(
          origin={-50,-20},
          extent={{-20,10},{20,-10}},
          rotation=180)));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation chassisFrameToMount2(
        animation=false, r=r_ChassisToMount2)
      annotation (Placement(transformation(
          origin={0,40},
          extent={{-20,-10},{20,10}},
          rotation=90)));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation chassisFrameToMount3(
        animation=false, r=r_ChassisToMount3)
      annotation (Placement(transformation(extent={{30,-30},{70,-10}}, rotation=
             0)));
  equation
    connect(chassisFrameToMount1.frame_a, chassisFrame) annotation (Line(
        points={{-30,-20},{0,-20},{0,-100}},
        color={95,95,95},
        thickness=0.5));
    connect(chassisFrameToMount1.frame_b, mount_1) annotation (Line(
        points={{-70,-20},{-90,-20},{-90,100}},
        color={95,95,95},
        thickness=0.5));
    connect(chassisFrameToMount2.frame_b, mount_2) annotation (Line(
        points={{1.22465e-015,60},{0,60},{0,100}},
        color={95,95,95},
        thickness=0.5));
    connect(chassisFrameToMount3.frame_b, mount_3) annotation (Line(
        points={{70,-20},{90,-20},{90,100}},
        color={95,95,95},
        thickness=0.5));
    connect(chassisFrameToMount2.frame_a, chassisFrame) annotation (Line(
        points={{-1.22465e-015,20},{0,20},{0,-100}},
        color={95,95,95},
        thickness=0.5));
    connect(chassisFrameToMount3.frame_a, chassisFrame) annotation (Line(
        points={{30,-20},{0,-20},{0,-100}},
        color={95,95,95},
        thickness=0.5));

    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -150,-100},{150,100}}),
                        graphics),
      Documentation(info="<html>
<p>Rigidly mounts 3 power train systems such as the engine, transmission and driveline on one supporting system, usually the chassis</p>
</html>"));
  end ThreeSystemRigidMount;

  model TwoSystemRigidMount "2 system rigid mount"
    extends Interfaces.DualSystemMount;
    extends VehicleInterfaces.Icons.TwoMounts;
    parameter Modelica.SIunits.Position r_ChassisToMount1[3]={0,0,0}
      "Vector from chassis frame to mount_1 frame" annotation (Evaluate=false);
    parameter Modelica.SIunits.Position r_ChassisToMount2[3]={0,0,0}
      "Vector from chassis frame to mount_2 frame" annotation (Evaluate=false);

    Modelica.Mechanics.MultiBody.Parts.FixedTranslation chassisFrameToMount1(r=
          r_ChassisToMount1)
      annotation (Placement(transformation(
          origin={-50,20},
          extent={{-20,10},{20,-10}},
          rotation=180)));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation chassisFrameToMount2(r=
          r_ChassisToMount2) annotation (Placement(transformation(extent={{30,
              10},{70,30}}, rotation=0)));
  equation
    connect(chassisFrameToMount1.frame_a, chassisFrame) annotation (Line(
        points={{-30,20},{0,20},{0,-100}},
        color={95,95,95},
        thickness=0.5));
    connect(chassisFrameToMount2.frame_b, mount_2) annotation (Line(
        points={{70,20},{100,20},{100,100}},
        color={95,95,95},
        thickness=0.5));
    connect(chassisFrameToMount1.frame_b, mount_1) annotation (Line(
        points={{-70,20},{-100,20},{-100,100}},
        color={95,95,95},
        thickness=0.5));
    connect(chassisFrameToMount2.frame_a, chassisFrame) annotation (Line(
        points={{30,20},{0,20},{0,-100}},
        color={95,95,95},
        thickness=0.5));

    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-150,-100},{
              150,100}}),
              graphics),
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-150,-100},{150,
              100}}),
           graphics),
      Documentation(info="<html>
<p>Rigidly mounts 2 power train systems such as the engine and transmission on one supporting system, usually the chassis</p>
</html>"));
  end TwoSystemRigidMount;

  model SingleSystemRigidMount "1 system rigid mount"
    extends Interfaces.SingleSystemMount;
    extends VehicleInterfaces.Icons.SingleMount;
    parameter Modelica.SIunits.Position r_ChassisToMount1[3]={0,0,0}
      "Vector from chassis frame to mount_1 frame" annotation (Evaluate=false);

    Modelica.Mechanics.MultiBody.Parts.FixedTranslation chassisFrameToMount1(r=
          r_ChassisToMount1) annotation (Placement(transformation(
          origin={0,0},
          extent={{-20,-10},{20,10}},
          rotation=90)));
  equation
    connect(chassisFrameToMount1.frame_a, chassisFrame) annotation (Line(
        points={{-1.22465e-015,-20},{-1.22465e-015,-40},{0,-92},{0,-100}},
        color={95,95,95},
        thickness=0.5));
    connect(chassisFrameToMount1.frame_b, mount_1) annotation (Line(
        points={{1.22465e-015,20},{0,20},{0,100}},
        color={95,95,95},
        thickness=0.5));

    annotation (
      Documentation(info="<html>
<p>Rigidly mounts 1 power train systems such as the engine or transmission on one supporting system, usually the chassis</p>
</html>"));
  end SingleSystemRigidMount;

  annotation (Documentation(info="<html>
<p>The powertrain mounts subsystem interfaces are defined in this sub-package of the VehicleInterfaces library.  There are three different powertrain mount interfaces defined and the one to use depends on how many powertrain systems are to be connected to this mounting system.  The following connections are provided</p>
<ul>
<li><b>chassisFrane</b> - MultiBody connection to transmit the mounting system forces in to the vehicle body</li>
<li><b>mount_n</b> - MultiBody connection(s) to the powertrain subsystem reference frames</li>
</ul>
<h4>Effects to be modelled in this subsystem</h4>
<p>Within the VehicleIntefaces package the powertrain mounts subsystem is used to model how a powertrain subsystem is mounted within the vehicle body.  The housing for the powertrain subsystem should be modelled within the relevant powertrain subsystem and this subsystem models the (usually) elastic mounts that suspend the housing within the vehicle body structure.</p>
</html>"));
end PowertrainMounts;
