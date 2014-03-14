within VehicleInterfaces;
package Chassis "Collection of chassis subsystem definitions"
  extends VehicleInterfaces.Icons.VariantLibrary;

  class Tutorial "Chassis Tutorial"
    extends Modelica.Icons.Information;

    annotation (DocumentationClass=true,Documentation(info="<html>
<p><b>Tutorial - Defining a new chassis model</b></p>
<p>The following process will demonstrate how to create a new chassis model using these interface definitions.  This tutorial will guide you through building a chassis for a passenger car, i.e. a vehicle with 4 wheels.</p>
<ol>
<li>Create a new model that extends <b>VehicleInterfaces.Chassis.Interfaces.FourWheelBase</b>, it should look like this:</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewChassis1.png\"><br><br>
<li>In the component browser, right click on <b>FourWheelBase</b> and select <b>Parameters</b> from the context menu to produce the following parameter dialog</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewChassis2.png\"><br><br>
<li>This dialog allows you to enable/disable the optional connections by setting <b>includeWheelBearings</b>, <b>includeSteeringWheel</b> and <b>includeChassisFrame</b> as required for your new chassis model.  The wheelHub connectors are of the type <a href=\"Modelica://VehicleInterfaces.Interfaces.FlangeWithBearing\">VehicleInterfaces.Interfaces.FlangeWithBearing</a>, the parameter <b>includeWheelBearings</b> controls whether the bearing connectors within the wheelHubs is enabled or not.</li>
<li>You can now define your chassis model as required</li>
</ol>
<h4>Creating a simple chassis model for longitudinal motion</h4>
<p>The following steps demonstrate how to create a simple chassis model for longitudinal motion.  The chassis model will transmit the torque from the wheel hub connections in to a force being applied to the vehicle model.  Only the longitudinal dynamics of the vehicle body will be modelled so no suspension is required.</p>
<p>Starting from step 3 above.</p>
<ol>
<li>First, decide which of the optional connectors are required in the model.  For this example we don't need any of the optional connections</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewChassis3.png\"><br><br>
<li>Add the following blocks and connections to the diagram.  When you draw the connections to the wheelHub connectors the dialog box shown below will appear asking which connector within the wheelHub connector you would like to make the connection to.  As we are modelling the wheels as a 1D system you should select <b>flange</b> from the list of options which is the 1D connector within the wheelHub connector.</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewChassis4.png\">
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewDriveline5.png\"><br><br>
<li>Next, we need to check to see if any connections to the control signal bus are required for the chassis, see <a href=\"Modelica://VehicleInterfaces.UsersGuide.SignalBus\">here</a> for a complete list of the minimum connections required.  In this case we need to add the vehicle longitudinal velocity to the control signal bus and this can be done by connecting a speed sensor to the vehicle body and then connecting this to the signal bus. As the longitudinal speed signals are added to the chassisBus we first need to add this connector.  The chassisBus connector is <b>VehicleInterfaces.Interfaces.ChassisBus</b>.  This should be connected to the <b>controlBus</b>, when this connection is made the following dialog is produced and should be completed as shown.</li>
<p><br><img src=\"modelica://VehicleInterfaces/Resources/Images/signalNaming2.png\"><br><br></p>
<li>When the connection between the sensor and the chassisBus connector is added the dialog below appears and should be completed as shown</li>
<p><br><img src=\"modelica://VehicleInterfaces/Resources/Images/signalNaming.png\"><br><br></p>
<li>The model is now complete and should check successfully and can be used in any model compatible with the VehicleInterfaces library assuming the selected Driver model doesn't use the steering wheel or chassis frame connections</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewChassis5.png\">
</ol>
</html>"));
  end Tutorial;

  package Interfaces "Collection of interface definitions for chassis"
    extends Modelica.Icons.InterfacesPackage;
    partial model Base "Basic interface definition for a chassis"

      VehicleInterfaces.Interfaces.ControlBus controlBus "Control signal bus"
        annotation (Placement(transformation(
            origin={-158,60},
            extent={{-20,-20},{20,20}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b chassisFrame if
        includeChassisFrame "Chassis reference frame (optional)"
        annotation (Placement(transformation(extent={{-176,-86},{-144,-54}},
              rotation=0)));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a steeringWheel if
        includeSteeringWheel "Steering wheel connection (optional)"
        annotation (Placement(transformation(extent={{-10,90},{10,110}},
              rotation=0)));
      parameter Boolean usingMultiBodyDriveline=false
        "=true if using a MultiBody driveline with a 1D chassis"
        annotation (Dialog(tab="Advanced"));
    protected
      parameter Boolean includeWheelBearings=false
        "Include wheel bearing connectors";
      parameter Boolean includeChassisFrame=false "Include the chassis frame";
      parameter Boolean includeSteeringWheel=false
        "Include the steering wheel connection";

      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-160,-100},{160,100}},
            grid={1,1},
            initialScale=0.1), graphics={Rectangle(
              extent={{-170,-59},{-151,-81}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot), Rectangle(
              extent={{-17,112},{6,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot)}),
        Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-160,-100},{160,100}},
            grid={1,1},
            initialScale=0.1)),
        Documentation(info="<html>
<p>This partial model defines the basic interfaces required for any chassis subsystem.  This class should be extended to form a chassis interface definition with the correct number of wheelHub connectors for the type of vehicle being modelled. See the <a href=\"Modelica://VehicleInterfaces.Chassis\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.Chassis.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end Base;

    partial model TwoAxleBase
      "Interface definition for a chassis of a 4 wheeled vehicle"
      extends Base;
    public
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_1(
          final includeBearingConnector=includeWheelBearings or
            usingMultiBodyDriveline) "Front left wheel"
        annotation (Placement(transformation(
            origin={-90,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_2(
          final includeBearingConnector=includeWheelBearings or
            usingMultiBodyDriveline) "Front right wheel"
        annotation (Placement(transformation(
            origin={-90,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_3(
          final includeBearingConnector=includeWheelBearings or
            usingMultiBodyDriveline) "Rear left wheel"
        annotation (Placement(transformation(
            origin={90,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_4(
          final includeBearingConnector=includeWheelBearings or
            usingMultiBodyDriveline) "Rear right wheel"
        annotation (Placement(transformation(
            origin={90,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Mechanics.MultiBody.MultiBodyEnd end_2(includeBearingConnector=
            includeWheelBearings or usingMultiBodyDriveline)
        annotation (Placement(transformation(extent={{-118,92},{-106,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_4(includeBearingConnector=
            includeWheelBearings or usingMultiBodyDriveline)
        annotation (Placement(transformation(extent={{62,92},{74,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_3(includeBearingConnector=
            includeWheelBearings or usingMultiBodyDriveline)
        annotation (Placement(transformation(extent={{62,-108},{74,-92}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_1(includeBearingConnector=
            includeWheelBearings or usingMultiBodyDriveline)
        annotation (Placement(transformation(extent={{-118,-108},{-106,-92}},
              rotation=0)));
    equation
      connect(end_2.flange, wheelHub_2) annotation (Line(
          points={{-110,100},{-90,100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_4.flange, wheelHub_4) annotation (Line(
          points={{70,100},{90,100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_3.flange, wheelHub_3) annotation (Line(
          points={{70,-100},{90,-100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_1.flange, wheelHub_1) annotation (Line(
          points={{-110,-100},{-90,-100}},
          color={135,135,135},
          thickness=0.5));
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-160,-100},{160,100}},
            grid={1,1},
            initialScale=0.1), graphics={
            Rectangle(
              extent={{-119,108},{-105,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{61,108},{75,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{61,-92},{75,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{-119,-92},{-105,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot)}),
        Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-160,-100},{160,100}},
            grid={1,1},
            initialScale=0.1)),
        Documentation(info="<html>
<p>This partial model defines the interfaces required for the chassis subsystem of a two axled vehicle within the VehicleInterfaces package.  See the <a href=\"Modelica://VehicleInterfaces.Chassis\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.Chassis.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end TwoAxleBase;

    partial model ThreeAxleBase
      "Interface definition for a chassis of a 6 wheeled vehicle"
      extends Base;
    public
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_1(
          final includeBearingConnector=includeWheelBearings)
        "Front left wheel"
        annotation (Placement(transformation(
            origin={-90,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_2(
          final includeBearingConnector=includeWheelBearings)
        "Front right wheel"
        annotation (Placement(transformation(
            origin={-90,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_3(
          final includeBearingConnector=includeWheelBearings)
        "Second axle left wheel"
        annotation (Placement(transformation(
            origin={90,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_4(
          final includeBearingConnector=includeWheelBearings)
        "Second axle right wheel"
        annotation (Placement(transformation(
            origin={90,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_5(
          final includeBearingConnector=includeWheelBearings)
        "Third axle left wheel"
        annotation (Placement(transformation(
            origin={250,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_6(
          final includeBearingConnector=includeWheelBearings)
        "Third axle right wheel"
        annotation (Placement(transformation(
            origin={250,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Mechanics.MultiBody.MultiBodyEnd end_2(includeBearingConnector=
            includeWheelBearings or usingMultiBodyDriveline)
        annotation (Placement(transformation(extent={{-118,92},{-106,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_4(includeBearingConnector=
            includeWheelBearings or usingMultiBodyDriveline)
        annotation (Placement(transformation(extent={{62,92},{74,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_1(includeBearingConnector=
            includeWheelBearings or usingMultiBodyDriveline)
        annotation (Placement(transformation(extent={{-118,-108},{-106,-92}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_3(includeBearingConnector=
            includeWheelBearings or usingMultiBodyDriveline)
        annotation (Placement(transformation(extent={{62,-108},{74,-92}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_5(includeBearingConnector=
            includeWheelBearings or usingMultiBodyDriveline)
        annotation (Placement(transformation(extent={{223,92},{235,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_6(includeBearingConnector=
            includeWheelBearings or usingMultiBodyDriveline)
        annotation (Placement(transformation(extent={{223,-108},{235,-92}},
              rotation=0)));
    equation
      connect(end_2.flange, wheelHub_2) annotation (Line(
          points={{-110,100},{-90,100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_4.flange, wheelHub_4) annotation (Line(
          points={{70,100},{90,100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_1.flange, wheelHub_1) annotation (Line(
          points={{-110,-100},{-90,-100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_3.flange, wheelHub_3) annotation (Line(
          points={{70,-100},{90,-100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_6.flange, wheelHub_5) annotation (Line(
          points={{231,-100},{250,-100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_5.flange, wheelHub_6) annotation (Line(
          points={{231,100},{250,100}},
          color={135,135,135},
          thickness=0.5));
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-160,-100},{320,100}},
            grid={1,1},
            initialScale=0.1), graphics={
            Rectangle(
              extent={{-119,108},{-105,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{61,108},{75,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{-119,-92},{-105,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{61,-92},{75,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{222,108},{236,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{222,-92},{236,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot)}),
        Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-160,-100},{320,100}},
            grid={1,1},
            initialScale=0.1)),
        Documentation(info="<html>
<p>This partial model defines the interfaces required for the chassis subsystem of a three axled vehicle within the VehicleInterfaces package.  See the <a href=\"Modelica://VehicleInterfaces.Chassis\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.Chassis.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end ThreeAxleBase;

    partial model FourAxleBase
      "Interface definition for a chassis of a 8 wheeled vehicle"
      extends Base;
    public
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_1(
          final includeBearingConnector=includeWheelBearings)
        "Front left wheel"
        annotation (Placement(transformation(
            origin={-90,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_2(
          final includeBearingConnector=includeWheelBearings)
        "Front right wheel"
        annotation (Placement(transformation(
            origin={-90,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_3(
          final includeBearingConnector=includeWheelBearings)
        "Second axle left wheel"
        annotation (Placement(transformation(
            origin={90,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_4(
          final includeBearingConnector=includeWheelBearings)
        "Second axle right wheel"
        annotation (Placement(transformation(
            origin={90,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_5(
          final includeBearingConnector=includeWheelBearings)
        "Third axle left wheel"
        annotation (Placement(transformation(
            origin={250,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_6(
          final includeBearingConnector=includeWheelBearings)
        "Third axle right wheel"
        annotation (Placement(transformation(
            origin={250,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_7(
          final includeBearingConnector=includeWheelBearings)
        "Fourth axle left wheel"
        annotation (Placement(transformation(
            origin={410,-100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing wheelHub_8(
          final includeBearingConnector=includeWheelBearings)
        "Fourth axle right wheel"
        annotation (Placement(transformation(
            origin={410,100},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Mechanics.MultiBody.MultiBodyEnd end_2(includeBearingConnector=
            includeWheelBearings or usingMultiBodyDriveline)
        annotation (Placement(transformation(extent={{-117,92},{-105,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_1(includeBearingConnector=
            includeWheelBearings or usingMultiBodyDriveline)
        annotation (Placement(transformation(extent={{-117,-108},{-105,-92}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_4(includeBearingConnector=
            includeWheelBearings or usingMultiBodyDriveline)
        annotation (Placement(transformation(extent={{63,92},{75,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_3(includeBearingConnector=
            includeWheelBearings or usingMultiBodyDriveline)
        annotation (Placement(transformation(extent={{63,-108},{75,-92}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_5(includeBearingConnector=
            includeWheelBearings or usingMultiBodyDriveline)
        annotation (Placement(transformation(extent={{224,92},{236,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_6(includeBearingConnector=
            includeWheelBearings or usingMultiBodyDriveline)
        annotation (Placement(transformation(extent={{224,-108},{236,-92}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_7(includeBearingConnector=
            includeWheelBearings or usingMultiBodyDriveline)
        annotation (Placement(transformation(extent={{382,92},{394,108}},
              rotation=0)));
      Mechanics.MultiBody.MultiBodyEnd end_8(includeBearingConnector=
            includeWheelBearings or usingMultiBodyDriveline)
        annotation (Placement(transformation(extent={{382,-108},{394,-92}},
              rotation=0)));
    equation
      connect(end_2.flange, wheelHub_2) annotation (Line(
          points={{-109,100},{-90,100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_1.flange, wheelHub_1) annotation (Line(
          points={{-109,-100},{-90,-100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_4.flange, wheelHub_4) annotation (Line(
          points={{71,100},{90,100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_3.flange, wheelHub_3) annotation (Line(
          points={{71,-100},{90,-100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_6.flange, wheelHub_5) annotation (Line(
          points={{232,-100},{250,-100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_5.flange, wheelHub_6) annotation (Line(
          points={{232,100},{250,100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_7.flange, wheelHub_8) annotation (Line(
          points={{390,100},{410,100}},
          color={135,135,135},
          thickness=0.5));
      connect(end_8.flange, wheelHub_7) annotation (Line(
          points={{390,-100},{401,-100},{401,-100},{410,-100}},
          color={135,135,135},
          thickness=0.5));
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-160,-100},{480,100}},
            grid={1,1},
            initialScale=0.1), graphics={
            Rectangle(
              extent={{-118,108},{-104,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{-118,-92},{-104,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{62,108},{76,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{62,-92},{76,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{223,108},{237,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{223,-92},{237,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{381,108},{395,92}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{381,-92},{395,-108}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot)}),
        Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-160,-100},{480,100}},
            grid={1,1},
            initialScale=0.1)),
        Documentation(info="<html>
<p>This partial model defines the interfaces required for the chassis subsystem of a four axled vehicle within the VehicleInterfaces package. See the <a href=\"Modelica://VehicleInterfaces.Chassis\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.Chassis.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end FourAxleBase;

    expandable connector StandardBus
      "Bus of VehicleInterfaces.Chassis: StandardBus of signals generated by the chassis"
      extends .VehicleInterfaces.Interfaces.ChassisBus;
      extends .VehicleInterfaces.Icons.SignalSubBusWithExplicitSignals;

      .Modelica.SIunits.Velocity longitudinalVelocity
        "Longitudinal velocity of vehicle"
        annotation (Dialog);
      annotation (
        defaultComponentPrefixes="protected",
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={Rectangle(
              extent={{-20,2},{20,-2}},
              lineColor={255,204,51},
              lineThickness=0.5)}),
        Documentation(info="<html>
<p>Bus with a set of standard signals generated by the chassis subsystem. </p>
</html>"));
    end StandardBus;
    annotation (Documentation(info="<html>
<p>
A collection of partial base classes which define interfaces for chassis models.
</p>
</html>"));
  end Interfaces;

  model NoChassis "Empty chassis"
    extends VehicleInterfaces.Icons.Chassis;
    extends VehicleInterfaces.Icons.Empty;
    extends VehicleInterfaces.Chassis.Interfaces.TwoAxleBase(
        includeWheelBearings=world.driveTrainMechanics3D);
  protected
    outer Modelica.Mechanics.MultiBody.World world;
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,
              -100},{160,100}})),
                         Documentation(info="<html>
<p>
Empty chassis model. Using this empty model in overall vehicle architecture the functionality of chassis can be eliminated.
</p>
</html>"));
  end NoChassis;

  model MinimalChassis
    "Basic chassis model with rigid connection between all 4 wheels"
    extends VehicleInterfaces.Icons.Chassis;
    extends VehicleInterfaces.Chassis.Interfaces.TwoAxleBase;

    parameter Modelica.SIunits.Mass vehicleMass=1200 "Vehicle mass";
    parameter Modelica.SIunits.Radius tyreRadius=0.34 "Tyre rolling radius";
    parameter Real drag=1 "Drag force (force = drag*vehicle_speed)";

    Modelica.Mechanics.Rotational.Components.IdealRollingWheel tyres(
      radius=tyreRadius,
      useSupportT=true,
      useSupportR=true)
      annotation (Placement(transformation(extent={{-40,-10},{-20,10}},
            rotation=0)));
    Modelica.Mechanics.Translational.Components.Mass body(
                                                      m=vehicleMass, s(
        stateSelect=StateSelect.always,
        start=0,
        fixed=true)) annotation (Placement(transformation(extent={{0,-10},{20,
              10}}, rotation=0)));
    Modelica.Mechanics.Translational.Components.Damper dragForces(
                                                       d=drag)
      annotation (Placement(transformation(extent={{40,-10},{60,10}}, rotation=
              0)));
    Modelica.Mechanics.Translational.Components.Fixed ground
      annotation (Placement(transformation(
          origin={80,0},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica.Mechanics.Translational.Sensors.SpeedSensor longitudinalVelocity
      annotation (Placement(transformation(extent={{5,20},{-15,40}}, rotation=0)));
  protected
    replaceable VehicleInterfaces.Chassis.Interfaces.StandardBus
                                            chassisBus constrainedby
      VehicleInterfaces.Interfaces.ChassisBus
      annotation (Placement(transformation(extent={{-130,30},{-110,50}},
            rotation=0)));
  public
    Modelica.Mechanics.Rotational.Components.Fixed fixed
      annotation (Placement(transformation(extent={{-50,-26},{-30,-6}})));
  equation
    connect(tyres.flangeT,  body.flange_a) annotation (Line(points={{-20,0},{0,
            0}}, color={0,127,0}));
    connect(body.flange_b, dragForces.flange_a) annotation (Line(points={{20,0},
            {40,0}}, color={0,127,0}));
    connect(dragForces.flange_b,ground.flange)    annotation (Line(points={{60,
            0},{80,0}}, color={0,127,0}));
    connect(body.flange_b,longitudinalVelocity.flange)    annotation (Line(
          points={{20,0},{20,30},{5,30}}, color={0,127,0}));
    connect(tyres.flangeR,  wheelHub_1.flange) annotation (Line(points={{-40,0},
            {-90,0},{-90,-100}}, color={0,0,0}));
    connect(tyres.flangeR,  wheelHub_2.flange) annotation (Line(points={{-40,0},
            {-90,0},{-90,100}}, color={0,0,0}));
    connect(tyres.flangeR,  wheelHub_3.flange) annotation (Line(points={{-40,0},
            {-90,0},{-90,-80},{90,-80},{90,-100}}, color={0,0,0}));
    connect(tyres.flangeR,  wheelHub_4.flange) annotation (Line(points={{-40,0},
            {-90,0},{-90,80},{90,80},{90,100}}, color={0,0,0}));
    connect(controlBus.chassisBus, chassisBus) annotation (Line(
        points={{-158,60},{-120,60},{-120,40}},
        color={255,204,51},
        thickness=0.5));
    connect(ground.flange, tyres.supportT) annotation (Line(
        points={{80,0},{80,-20},{-20,-20},{-20,-10}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(fixed.flange, tyres.supportR) annotation (Line(
        points={{-40,-16},{-40,-10}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(chassisBus.longitudinalVelocity, longitudinalVelocity.v)
      annotation (Line(
        points={{-120,40},{-120,30},{-16,30}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    annotation (Documentation(info="<html>
 <p>Single degree-of-freedom chassis model with mass and speed dependant drag model</p>
</html>"), Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-160,
              -100},{160,100}})));
  end MinimalChassis;

  model MinimalChassis2
    "Basic chassis model with rigid connection between all 4 wheels, uses chassisFrame connection"
    extends VehicleInterfaces.Icons.Chassis;
    extends VehicleInterfaces.Chassis.Interfaces.TwoAxleBase(
        includeChassisFrame=true);

    parameter Modelica.SIunits.Mass vehicleMass=1200 "Vehicle mass";
    parameter Modelica.SIunits.Radius tyreRadius=0.34 "Tyre rolling radius";
    parameter Real drag=1 "Drag force (force = drag*vehicle_speed)";

    Modelica.Mechanics.Rotational.Components.IdealRollingWheel tyres(
      useSupportR=true,
      useSupportT=true,
      radius=tyreRadius)
      annotation (Placement(transformation(extent={{-20,-10},{0,10}},
            rotation=0)));
    Modelica.Mechanics.Translational.Components.Damper dragForces(
                                                       d=drag)
      annotation (Placement(transformation(extent={{40,-10},{60,10}}, rotation=
              0)));
    Modelica.Mechanics.Translational.Sensors.SpeedSensor longitudinalVelocity
      annotation (Placement(transformation(extent={{5,20},{-15,40}}, rotation=0)));
    Modelica.Mechanics.MultiBody.Parts.Body body(m=vehicleMass)
      annotation (Placement(transformation(
          origin={0,-50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Mechanics.MultiBody.Joints.Prismatic constraint(
      useAxisFlange=true,
      a(fixed=false),
      s(fixed=true),
      v(fixed=false))
      annotation (Placement(transformation(extent={{60,-40},{40,-20}}, rotation=
             0)));
    Modelica.Mechanics.MultiBody.Parts.Fixed ground
      annotation (Placement(transformation(extent={{100,-40},{80,-20}},
            rotation=0)));
  protected
    replaceable VehicleInterfaces.Chassis.Interfaces.StandardBus
                                            chassisBus constrainedby
      VehicleInterfaces.Interfaces.ChassisBus
      annotation (Placement(transformation(extent={{-130,30},{-110,50}},
            rotation=0)));
  public
    Modelica.Mechanics.MultiBody.Parts.Mounting1D mountingR(n=constraint.n)
      annotation (Placement(transformation(extent={{-50,-20},{-30,0}})));
  equation
    connect(tyres.flangeR,  wheelHub_2.flange) annotation (Line(points={{-20,0},
            {-90,0},{-90,100}}, color={0,0,0}));
    connect(tyres.flangeR,  wheelHub_1.flange) annotation (Line(points={{-20,0},
            {-90,0},{-90,-100}}, color={0,0,0}));
    connect(tyres.flangeR,  wheelHub_4.flange) annotation (Line(points={{-20,0},
            {-90,0},{-90,80},{90,80},{90,100}}, color={0,0,0}));
    connect(tyres.flangeR,  wheelHub_3.flange) annotation (Line(points={{-20,0},
            {-90,0},{-90,-80},{90,-80},{90,-100}}, color={0,0,0}));
    connect(tyres.flangeT,  dragForces.flange_a)
      annotation (Line(points={{0,0},{40,0}},   color={0,127,0}));
    connect(longitudinalVelocity.flange,   dragForces.flange_a) annotation (Line(
          points={{5,30},{20,30},{20,0},{40,0}}, color={0,127,0}));
    connect(dragForces.flange_b,constraint.support)  annotation (Line(points={{60,0},{
            60,-24},{54,-24}},                 color={0,127,0}));
    connect(dragForces.flange_a, constraint.axis) annotation (Line(points={{40,0},{
            40,-12},{40,-24},{42,-24}},
                          color={0,127,0}));
    connect(controlBus.chassisBus, chassisBus) annotation (Line(
        points={{-158,60},{-120,60},{-120,40}},
        color={255,204,51},
        thickness=0.5));
    connect(constraint.frame_a, ground.frame_b) annotation (Line(
        points={{60,-30},{80,-30}},
        color={95,95,95},
        thickness=0.5));
    connect(mountingR.flange_b, tyres.supportR) annotation (Line(
        points={{-30,-10},{-20,-10}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(constraint.support, tyres.supportT) annotation (Line(
        points={{54,-24},{60,-24},{60,-14},{0,-14},{0,-10}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(chassisBus.longitudinalVelocity, longitudinalVelocity.v)
      annotation (Line(
        points={{-120,40},{-120,30},{-16,30}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(body.frame_a, mountingR.frame_a) annotation (Line(
        points={{1.83697e-015,-40},{0,-40},{0,-30},{-40,-30},{-40,-20}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
    connect(body.frame_a, constraint.frame_b) annotation (Line(
        points={{1.83697e-015,-40},{0,-40},{0,-30},{40,-30}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
    connect(body.frame_a, chassisFrame) annotation (Line(
        points={{1.83697e-015,-40},{0,-40},{0,-30},{-160,-30},{-160,-70}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
    annotation (Documentation(info="<html>
<p>Single degree-of-freedom chassis model with mass and speed dependant drag model.  Couples the 1d system to a Multibody system to support the other subsystems.</p>
</html>"), Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-160,
              -100},{160,100}})));
  end MinimalChassis2;

  model MinimalChassis3
    "Basic chassis model with rigid connection between all 4 wheels, uses chassisFrame connection, includes wheel bearings"
    extends MinimalChassis2(includeWheelBearings=true, body(r_CM={0,0,0}));

  public
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r={0,-1.4,
          0}, animation=false)
      annotation (Placement(transformation(
          origin={-70,50},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r={0,
          -1.4,0}, animation=false)
      annotation (Placement(transformation(
          origin={150,50},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(r={0,
          0.7,0}, animation=false)
      annotation (Placement(transformation(
          origin={-50,-70},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation3(r={-2.6,
          0.7,0}, animation=false)
      annotation (Placement(transformation(extent={{120,-80},{140,-60}},
            rotation=0)));
  equation
    connect(fixedTranslation.frame_b, wheelHub_2.bearingFrame) annotation (Line(
        points={{-70,60},{-70,100},{-90,100}},
        color={95,95,95},
        thickness=0.5));
    connect(fixedTranslation1.frame_b, wheelHub_4.bearingFrame) annotation (Line(
        points={{150,60},{150,100},{90,100}},
        color={95,95,95},
        thickness=0.5));
    connect(fixedTranslation1.frame_a, fixedTranslation3.frame_b) annotation (Line(
        points={{150,40},{150,-70},{140,-70}},
        color={95,95,95},
        thickness=0.5));
    connect(fixedTranslation2.frame_b, fixedTranslation.frame_a) annotation (Line(
        points={{-60,-70},{-70,-70},{-70,40}},
        color={95,95,95},
        thickness=0.5));
    connect(fixedTranslation2.frame_b, wheelHub_1.bearingFrame) annotation (Line(
        points={{-60,-70},{-70,-70},{-70,-100},{-90,-100}},
        color={95,95,95},
        thickness=0.5));
    connect(fixedTranslation3.frame_b, wheelHub_3.bearingFrame) annotation (Line(
        points={{140,-70},{150,-70},{150,-100},{90,-100}},
        color={95,95,95},
        thickness=0.5));
    connect(fixedTranslation2.frame_a, fixedTranslation3.frame_a) annotation (
        Line(
        points={{-40,-70},{120,-70}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));
    connect(body.frame_a, fixedTranslation2.frame_a) annotation (Line(
        points={{1.83697e-015,-40},{0,-40},{0,-30},{-20,-30},{-20,-70},{-40,-70}},
        color={95,95,95},
        thickness=0.5,
        smooth=Smooth.None));

    annotation (Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-160,
              -100},{160,100}})),
                         Documentation(info="<html>
<p>Single degree-of-freedom chassis model with mass and speed dependant drag model.  Uses MultiBody wheelHub connections and positions these relative to the vehicle body position.</p>
</html>"));
  end MinimalChassis3;

  package Internal "Collection of internal material involving chassis"
    extends Modelica.Icons.InternalPackage;

    expandable connector StandardBus
      "Obsolete bus: Do not use (provided for backwards compatibility)"
      extends VehicleInterfaces.Interfaces.ChassisBus;

      SI.Velocity longitudinalVelocity "Longitudinal velocity of vehicle"
        annotation (Dialog);

      annotation (Documentation(info="<html>
<p>An expandable connector that defines the minimum set of signals required on the <b>chassisBus</b>.  This connector should <b>NOT</b> be used in models and is included to enable Dymola to generate appropriate connection dialogs for signal buses.</p>
</html>"), Diagram(graphics={
                          Text(
              extent={{-100,-40},{100,-80}},
              lineColor={255,0,0},
              textString="Do not use!")}));
    end StandardBus;

    annotation (Documentation(info="<html>
<p>
A collection of internal material for chassis models. Control bus definitions are mainly included.
</p>
</html>"));
  end Internal;

  annotation (Documentation(info="<html>
<p>The chassis subsystem interfaces are defined in this sub-package of the VehicleInterfaces library.  The chassis subsystem has the following connectors some of which are optional (see below for more information):</p>
<ul>
<li><b>controlBus</b> - control signal bus connection</li>
<li><b>wheelHub_n</b> - wheelHub connectors that consist of a 1D rotational connector and a MultiBody frame connector (see <a href=\"Modelica://VehicleInterfaces.Iterfaces.FlangeWithBearing\">here</a>.  The number of these varies depending on how many wheels the vehicle has.</li>
<li><b>steeringWheel</b> - 1D rotational connection for the steering wheel connection to the driverEnvironment (optional)</li>
<li><b>chassisMount</b> - MultiBody connection providing a connection point to the vehicle body (optional)</li>
</ul>
<p>The optional connectors are, by default, disabled and can be ignored if not required.  They can be enabled by setting the appropriate parameter to be true.  This is only possible at design time, i.e. when you are building the subsystem model.</p>
<h4>Effects to be modelled in this subsystem</h4>
<p>Within the VehicleIntefaces package the chassis subsystem is used to model the wheels, tires, suspension and vehicle body.</p>
</html>"));
end Chassis;
