within VehicleInterfaces;
package DriverEnvironments
  "Collection of driver environment subsystem definitions"
  extends Modelica.Icons.VariantsPackage;

  class Tutorial "Driver Environment Tutorial"
    extends Modelica.Icons.Information;

    annotation (
      DocumentationClass=true,
      Documentation(info="<html>
<p><b>Tutorial - Defining a new driver environment model</b></p>
<p>The following process will demonstrate how to create a new driver environment model using these interface definitions.  This tutorial will guide you through building a driver environment for a conventional passenger car with a manual transmission.</p>
<ol>
<li>Create a new model that extends <b>VehicleInterfaces.DriverEnvironments.Interfaces.BaseManualTransmission</b>, it should look like this:
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewDriverEnvironment1.png\"><br><br></li>
<li>In the component browser, right click on <b>Base</b> and select <b>Parameters</b> from the context menu to produce the following parameter dialog
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewDriverEnvironment2.png\"><br><br></li>
<li>This dialog allows you to enable/disable the optional connections by setting the various parameters as required for your new driver environment model.</li>
<li>You can now define your driver environment model as required</li>
</ol>
</html>"));
  end Tutorial;

  package Interfaces
    "Collection of interface definitions for driver environment"
    extends Modelica.Icons.InterfacesPackage;
    partial model Base
      "Basic interface definition for the driver-vehicle interface"

      VehicleInterfaces.Interfaces.ControlBus controlBus "Control signal bus"
        annotation (Placement(transformation(
            origin={100,60},
            extent={{-20,-20},{20,20}},
            rotation=270)));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a chassisFrame if
        includeDriverSeat "Chassis reference frame (optional)"
        annotation (Placement(transformation(
            origin={80,-100},
            extent={{-16,-16},{16,16}},
            rotation=90)));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a steeringWheel if
        includeSteeringWheel "Steering wheel connection (optional)"
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica.Mechanics.Translational.Interfaces.Flange_a acceleratorPedal if
        includeAcceleratorPedal "Accelerator pedal connection (optional)"
        annotation (Placement(transformation(extent={{-90,-90},{-70,-110}})));
      Modelica.Mechanics.Translational.Interfaces.Flange_a brakePedal if
        includeBrakePedal "Brake pedal connection (optional)"
        annotation (Placement(transformation(extent={{30,-90},{50,-110}})));
    protected
      parameter Boolean includeDriverSeat=false
        "Include the drivers seat connection to the body";
      parameter Boolean includeSteeringWheel=false
        "Include the steering wheel connection";
      parameter Boolean includeAcceleratorPedal=false
        "Include the accelerator pedal connection";
      parameter Boolean includeBrakePedal=false
        "Include the brake pedal connection";
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={
            Rectangle(
              extent={{70,-86},{94,-110}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{82,14},{106,-10}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{-98,-88},{-74,-112}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot),
            Rectangle(
              extent={{22,-88},{46,-112}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot)}),
        Documentation(info="<html>
<p>This partial model defines the interfaces required for the driver environment subsystem.  See the <a href=\"Modelica://VehicleInterfaces.DriverEnvironments\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.DriverEnvironments.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end Base;

    partial model BaseAutomaticTransmission
      "Interface definition for the driver-vehicle interface with an automatic transmission"
      extends Base;
      annotation (Documentation(info="<html>
<p>Base class for driver models for vehicles with automatic transmissions where the driver control logic is contained within the derived model.</p>
</html>"));
    end BaseAutomaticTransmission;

    partial model BaseAutomaticTransmissionExternalDriver
      "Interface definition for the driver-vehicle interface with an automatic transmission and external driver"
      extends BaseAutomaticTransmission;
      replaceable VehicleInterfaces.Interfaces.DriverInterface driverInterface
        "Driver Interaction Bus" annotation (Placement(transformation(extent={{-10,-10},
                {10,10}},            rotation=90,
            origin={-100,0})));
      annotation (Documentation(info="<html>
<p>Base class for driver models for vehicles with automatic transmissions where the driver control logic is contained in an <a href=\"Modelica://VehicleInterfaces.Drivers\">external driver model</a>. </p>
</html>"));
    end BaseAutomaticTransmissionExternalDriver;

    partial model BaseManualTransmission
      "Interface definition for the driver-vehicle interface with a manual transmission"
      extends Base;
    protected
      parameter Boolean includeClutchPedal=false
        "Include the clutch pedal connection";
      parameter Boolean includeManualShiftConnector=false
        "Include the manual shift connection";
    public
      Modelica.Mechanics.Translational.Interfaces.Flange_a clutchPedal if
        includeClutchPedal "Clutch pedal connection (optional)"
        annotation (Placement(transformation(extent={{-50,-90},{-30,-110}})));
      VehicleInterfaces.Interfaces.ShiftConnector shiftConnector if
        includeManualShiftConnector
        "Manual transmission shift connection (optional)"
        annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Rectangle(
              extent={{-58,-88},{-34,-112}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot), Rectangle(
              extent={{-12,-88},{12,-114}},
              lineColor={255,128,0},
              pattern=LinePattern.Dot)}),
                            Documentation(info="<html>
 <p>Base class for driver models for vehicles with manual transmissions where the driver control logic is contained within the derived model.</p>
</html>"));
    end BaseManualTransmission;

    partial model BaseManualTransmissionExternalDriver
      "Interface definition for the driver-vehicle interface with a manual transmission and external driver"
      extends BaseManualTransmission;
      replaceable VehicleInterfaces.Interfaces.DriverInterface driverInterface
        "Driver Interaction Bus" annotation (Placement(transformation(extent={{-10,-10},
                {10,10}},            rotation=90,
            origin={-100,0})));
      annotation (Documentation(info="<html>
<p>Base class for driver models for vehicles with manual transmissions where the driver control logic is contained in an <a href=\"Modelica://VehicleInterfaces.Drivers\">external driver model</a>. </p>
</html>"));
    end BaseManualTransmissionExternalDriver;

    expandable connector MinimalBus
      "Bus of VehicleInterfaces.DriverEnvironment: MinimalBus (minimal set of signals for any type of transmissions)"
      extends VehicleInterfaces.Interfaces.DriverBus;
      extends .VehicleInterfaces.Icons.SignalSubBusWithExplicitSignals;

      VehicleInterfaces.Types.NormalizedReal acceleratorPedalPosition
        "Normalized accelerator pedal position (0=fully released ... 1=fully pressed)"
        annotation (Dialog);
      VehicleInterfaces.Types.NormalizedReal brakePedalPosition
        "Brake pedal position (0=fully released ... 1=fully pressed)"
        annotation (Dialog);
      VehicleInterfaces.Types.IgnitionSetting.Temp ignition
        "Engine ignition (Off, On or Start)" annotation (Dialog);
      annotation (Documentation(info="<html>
<p>
An expandable connector that defines the minimum set of signals required on the <b>driverBus</b>.
</p>
</html>"));
    end MinimalBus;

    expandable connector BusForAutomaticTransmission
      "Bus of VehicleInterfaces.DriverEnvironment: BusForAutomaticTransmission"
      extends VehicleInterfaces.DriverEnvironments.Interfaces.MinimalBus;

      VehicleInterfaces.Types.Gear requestedGear
        "Requested gear for automatic transmission if gearboxMode=Manual or =Limited"
        annotation (Dialog);
      VehicleInterfaces.Types.GearMode.Temp gearboxMode
        "Selected gearbox mode (Park, Drive, Neutral, Rear, Manual, Limited)"
        annotation (Dialog);
      annotation (Documentation(info="<html>
<p>
An expandable connector that defines the minimum set of signals required on the <b>driverBus</b>.
</p>
</html>"));
    end BusForAutomaticTransmission;

    expandable connector BusForManualTransmission
      "Bus of VehicleInterfaces.DriverEnvironment: BusForManualTransmission"
       extends VehicleInterfaces.DriverEnvironments.Interfaces.MinimalBus;

      VehicleInterfaces.Types.NormalizedReal clutchPedalPosition
        "Clutch pedal position (0=fully released ... 1=fully pressed)"
        annotation (Dialog);
      Integer gear
        "Selected gear for manual transmission (>0:forward gear, <0:rear gear)"
        annotation (Dialog);

      annotation (Documentation(info="<html>
<p>
An expandable connector that defines the minimum set of signals required on the <b>driverBus</b>.
</p>
</html>"));
    end BusForManualTransmission;

    annotation (Documentation(info="<html>
<p>
A collection of partial base classes which define interfaces for driver environment models.
</p>
</html>"));
  end Interfaces;

  model NoDriverEnvironment "Empty driver-vehicle interface"
    extends VehicleInterfaces.Icons.DriverEnvironment;
    extends VehicleInterfaces.Icons.Empty;
    extends Interfaces.Base;
    annotation (Documentation(info="<html>
<p>
Empty driver environment. Using this empty model in overall vehicle architecture the functionality of driver environment can be eliminated.
</p>
</html>"));
  end NoDriverEnvironment;

  model DriveByWireAutomatic "Minimal Drive-by-wire Driver-Vehicle Interface"
    extends .VehicleInterfaces.Icons.DriverEnvironment;
    extends
      .VehicleInterfaces.DriverEnvironments.Interfaces.BaseAutomaticTransmission;
  public
    parameter Real initialAccelRequest(
      min=0,
      max=1) = 1 "Initial accelerator pedal position";
    parameter Real initialBrakeRequest(
      min=0,
      max=1) = 0 "Initial brake pedal position";
    parameter Real finalAccelRequest(
      min=0,
      max=1) = 1 "Final accelerator pedal position";
    parameter Real finalBrakeRequest(
      min=0,
      max=1) = 0 "Final brake pedal position";
    parameter Modelica.SIunits.Time accelTime=10 "Time of accel apply";
    parameter Modelica.SIunits.Time brakeTime=10 "Time of brake apply";
    parameter VehicleInterfaces.Types.GearMode.Temp selectedGearboxMode=
      VehicleInterfaces.Types.GearMode.Drive "Current gearbox mode"
      annotation (__Dymola_choicesFromPackage=true);
    parameter VehicleInterfaces.Types.Gear manualGearRequest=0
      "Requested gear in manual mode";

    Modelica.Blocks.Sources.Step brakeDemand(
      height=finalBrakeRequest,
      offset=initialBrakeRequest,
      startTime=brakeTime) annotation (Placement(transformation(extent={{-60,50},
              {-40,70}})));
    Modelica.Blocks.Sources.Step acceleratorDemand(
      height=finalAccelRequest,
      offset=initialAccelRequest,
      startTime=accelTime) annotation (Placement(transformation(extent={{-20,70},
              {0,90}})));

    Modelica.Blocks.Sources.IntegerConstant gearSelect(k=manualGearRequest)
      annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
    Modelica.Blocks.Sources.IntegerConstant gearMode(k=selectedGearboxMode)
      annotation (Placement(transformation(extent={{-60,10},{-40,30}})));
    Modelica.Blocks.Sources.IntegerStep ignition(
      height=-1,
      startTime=0.5,
      offset=VehicleInterfaces.Types.IgnitionSetting.Start)
      annotation (Placement(transformation(extent={{-20,30},{0,50}})));
  protected
    replaceable
      VehicleInterfaces.DriverEnvironments.Interfaces.BusForAutomaticTransmission
                                           driverBus constrainedby
      VehicleInterfaces.Interfaces.DriverBus
      annotation (Placement(transformation(extent={{50,50},{70,70}})));
  equation
    connect(controlBus.driverBus, driverBus) annotation (Line(
        points={{100,60},{80,60},{60,60}},
        color={255,204,51},
        thickness=0.5));
    connect(acceleratorDemand.y, driverBus.acceleratorPedalPosition)
      annotation (Line(points={{1,80},{60,80},{60,62},{60,60}},
                                                  color={0,0,127}));
    connect(gearSelect.y, driverBus.requestedGear) annotation (Line(points={{1,0},{
            64,0},{64,60},{60,60}},             color={255,127,0}));
    connect(driverBus.brakePedalPosition, brakeDemand.y) annotation (Line(
          points={{60,60},{-39,60}},                               color={0,0,
            127}));
    connect(gearMode.y, driverBus.gearboxMode) annotation (Line(points={{-39,20},
            {62,20},{62,60},{60,60}},color={255,127,0}));
    connect(ignition.y, driverBus.ignition) annotation (Line(points={{1,40},{60,
            40},{60,60}}, color={255,127,0}));

    annotation (
      Documentation(info="<html>
<p>Constant acceleration driver with the capabilitiy to step between two constant throttle values and to step on/off the brakes.</p>
</html>"));
  end DriveByWireAutomatic;

  model ConventionalManual
    "Minimal Driver-Vehicle Interface, manual transmission, uses physical pedal connections"
    import VehicleInterfaces;
    extends VehicleInterfaces.Icons.DriverEnvironment;
    extends Interfaces.BaseManualTransmission(
      includeManualShiftConnector=true,
      includeAcceleratorPedal=true,
      includeBrakePedal=true,
      includeClutchPedal=true);

  public
    parameter Real initialAccelRequest(
      min=0,
      max=1) = 1 "Initial accelerator pedal position";
    parameter Real initialBrakeRequest(
      min=0,
      max=1) = 0 "Initial brake pedal position";
    parameter Real finalAccelRequest(
      min=0,
      max=1) = 1 "Final accelerator pedal position";
    parameter Real finalBrakeRequest(
      min=0,
      max=1) = 0 "Final brake pedal position";
    parameter Modelica.SIunits.Time accelTime=10 "Time of accel apply";
    parameter Modelica.SIunits.Time brakeTime=10 "Time of brake apply";
    parameter VehicleInterfaces.Types.Gear selectedGear=2
      "Requested gear in manual mode";
    parameter Real clutchRequest=0
      "Clutch position (constant during simulation)";

    Modelica.Blocks.Sources.Step brakeDemand(
      height=finalBrakeRequest,
      offset=initialBrakeRequest,
      startTime=brakeTime) annotation (Placement(transformation(
          origin={40,-20},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Blocks.Sources.Step acceleratorDemand(
      height=finalAccelRequest,
      offset=initialAccelRequest,
      startTime=accelTime)
      annotation (Placement(transformation(
          origin={-80,-20},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Blocks.Sources.IntegerConstant gear(k=selectedGear)
      annotation (Placement(transformation(
          origin={0,-20},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Blocks.Sources.Constant clutchDemand(k=clutchRequest)
      annotation (Placement(transformation(
          origin={-40,-20},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    VehicleInterfaces.Interfaces.ShiftInput shiftInput
      annotation (Placement(transformation(
          origin={0,-60},
          extent={{-10,-10},{10,10}},
          rotation=90)));
    Modelica.Mechanics.Translational.Sources.Position acceleratorPosition
      annotation (Placement(transformation(
          origin={-80,-60},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Mechanics.Translational.Sources.Position clutchPosition
      annotation (Placement(transformation(
          origin={-40,-60},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Mechanics.Translational.Sources.Position brakePosition
      annotation (Placement(transformation(
          origin={40,-60},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Blocks.Sources.IntegerStep ignition(
      height=-1,
      startTime=0.5,
      offset=VehicleInterfaces.Types.IgnitionSetting.Start)
      annotation (Placement(transformation(extent={{0,50},{20,70}})));
  protected
    replaceable VehicleInterfaces.DriverEnvironments.Interfaces.MinimalBus
                                           driverBus constrainedby
      VehicleInterfaces.Interfaces.DriverBus
      annotation (Placement(transformation(extent={{50,50},{70,70}})));
  equation
    connect(acceleratorDemand.y, acceleratorPosition.s_ref) annotation (Line(
          points={{-80,-31},{-80,-48}}, color={0,0,127}));
    connect(acceleratorPosition.flange,   acceleratorPedal) annotation (Line(
          points={{-80,-70},{-80,-100}}, color={0,127,0}));
    connect(brakeDemand.y, brakePosition.s_ref) annotation (Line(points={{40,
            -31},{40,-48}}, color={0,0,127}));
    connect(brakePosition.flange,   brakePedal) annotation (Line(points={{40,
            -70},{40,-100}}, color={0,127,0}));
    connect(clutchDemand.y, clutchPosition.s_ref) annotation (Line(points={{-40,
            -31},{-40,-48}}, color={0,0,127}));
    connect(clutchPosition.flange,   clutchPedal) annotation (Line(points={{-40,
            -70},{-40,-100}}, color={0,127,0}));
    connect(shiftInput.shiftConnector, shiftConnector) annotation (Line(points={{
            -6.12323e-016,-70},{0,-70},{0,-100}}));
    connect(gear.y, shiftInput.gear) annotation (Line(points={{-2.02067e-015,
            -31},{7.34788e-016,-31},{7.34788e-016,-48}}, color={255,127,0}));
    connect(controlBus.driverBus, driverBus) annotation (Line(
        points={{100,60},{60,60}},
        color={255,204,51},
        thickness=0.5));

    connect(ignition.y, driverBus.ignition) annotation (Line(points={{21,60},{
            21,60},{60,60}},
                     color={255,127,0}));

    annotation (
      Documentation(info="<html>
<p>Constant acceleration driver with the capabilitiy to step between two constant throttle values.
Fixed gear and constant clutch position.</p>
</html>"));
  end ConventionalManual;

  model DriveByWireAutomaticExternalDriver
    "Minimal drive-by-wire driver-vehicle interface with external driver model"
    extends VehicleInterfaces.Icons.DriverEnvironment;
    extends Interfaces.BaseAutomaticTransmissionExternalDriver;

  public
    Mechanics.NormalisedTranslational.PositionSensor acceleratorPosition
      annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
    Mechanics.NormalisedTranslational.PositionSensor brakePosition
      annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
    Blocks.IntegerPassThrough gearboxMode annotation (Placement(transformation(
            extent={{-40,-10},{-20,10}})));
    Blocks.IntegerPassThrough requestedGear
      annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
    Blocks.IntegerPassThrough ignition annotation (Placement(transformation(
            extent={{-40,-70},{-20,-50}})));
  protected
    replaceable
      VehicleInterfaces.DriverEnvironments.Interfaces.BusForAutomaticTransmission
                                           driverBus constrainedby
      VehicleInterfaces.Interfaces.DriverBus
      annotation (Placement(transformation(extent={{50,50},{70,70}})));
  equation
    connect(driverBus, controlBus.driverBus) annotation (Line(
        points={{60,60},{100,60}},
        color={255,204,51},
        thickness=0.5));
    connect(driverInterface.gearboxMode, gearboxMode.u) annotation (
      Text(
        string="%first",
        index=-1,
        extent=[-6, 3; -6, 3],
        style(color=0, rgbcolor={0,0,0})), Line(points={{-100,0},{-70,0},{-42,0}},
          color={255,127,0}));
    connect(gearboxMode.y, driverBus.gearboxMode) annotation (
      Text(
        string="%second",
        index=1,
        extent=[6, 3; 6, 3],
        style(color=0, rgbcolor={0,0,0})), Line(points={{-19,0},{58,0},{58,60},{
            60,60}},  color={255,127,0}));
    connect(driverInterface.requestedGear, requestedGear.u) annotation (
      Text(
        string="%first",
        index=-1,
        extent=[-6, 3; -6, 3],
        style(color=0, rgbcolor={0,0,0})), Line(points={{-100,0},{-100,-2},{-80,
            -2},{-80,-30},{-42,-30}}, color={255,127,0}));
    connect(requestedGear.y, driverBus.requestedGear) annotation (
      Text(
        string="%second",
        index=1,
        extent=[6, 3; 6, 3],
        style(color=0, rgbcolor={0,0,0})), Line(points={{-19,-30},{60,-30},{60,60}},
                     color={255,127,0}));
    connect(driverInterface.ignition, ignition.u) annotation (
      Text(
        string="%first",
        index=-1,
        extent=[-6, 3; -6, 3],
        style(color=0, rgbcolor={0,0,0})), Line(points={{-100,0},{-100,-4},{-82,
            -4},{-82,-60},{-42,-60}},
                       color={255,127,0}));
    connect(ignition.y, driverBus.ignition) annotation (
      Text(
        string="%second",
        index=1,
        extent=[6, 3; 6, 3],
        style(color=0, rgbcolor={0,0,0})), Line(points={{-19,-60},{62,-60},{62,60},
            {60,60}},        color={255,127,0}));

    connect(driverInterface.brakePedal, brakePosition.flange_a) annotation (Line(
        points={{-100,0},{-98,0},{-98,2},{-80,2},{-80,40},{-40,40}},
        color={0,127,0}), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(driverInterface.acceleratorPedal, acceleratorPosition.flange_a)
      annotation (Line(
        points={{-100,0},{-100,4},{-82,4},{-82,60},{-40,60}},
        color={0,127,0}), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(acceleratorPosition.position, driverBus.acceleratorPedalPosition)
      annotation (Line(
        points={{-19,60},{60,60}},
        color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(brakePosition.position, driverBus.brakePedalPosition) annotation (
        Line(
        points={{-19,40},{56,40},{56,60},{60,60}},
        color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    annotation (
      Documentation(info="<html>
<p>Driver environment that requires an external driver model. Signals received from external driver model are simply propagated throug withouth any modification.</p>
</html>"));
  end DriveByWireAutomaticExternalDriver;

  package Internal
    "Collection of internal material involving driver environments"
    extends Modelica.Icons.InternalPackage;

    expandable connector StandardBus
      "Obsolete bus: Do not use (provided for backwards compatibility)"
      extends VehicleInterfaces.Interfaces.DriverBus;

      VehicleInterfaces.Types.NormalizedReal acceleratorPedalPosition
        "Normalized accelerator pedal position (0=fully released ... 1=fully pressed)"
        annotation (Dialog);
      VehicleInterfaces.Types.NormalizedReal brakePedalPosition
        "Brake pedal position (0=fully released ... 1=fully pressed)"
        annotation (Dialog);
      VehicleInterfaces.Types.NormalizedReal clutchPedalPosition
        "Clutch pedal position (0=fully released ... 1=fully pressed)"
        annotation (Dialog);
      Integer gear
        "Selected gear for manual transmission (>0:forward gear, <0:rear gear)"
        annotation (Dialog);
      VehicleInterfaces.Types.Gear requestedGear
        "Requested gear for automatic transmission if gearboxMode=Manual or =Limited"
        annotation (Dialog);
      VehicleInterfaces.Types.GearMode.Temp gearboxMode
        "Selected gearbox mode (Park, Drive, Neutral, Rear, Manual, Limited)"
        annotation (Dialog);
      VehicleInterfaces.Types.IgnitionSetting.Temp ignition
        "Engine ignition (Off, On or Start)" annotation (Dialog);
      annotation (Documentation(info="<html>
<p>
An expandable connector that defines the minimum set of signals required on the <b>driverBus</b>.  This connector should <b>NOT</b> be used in models and is included to enable Dymola to generate appropriate connection dialogs for signal buses.
</p>
</html>"), Diagram(graphics={
                          Text(
              extent={{-100,-40},{100,-80}},
              lineColor={255,0,0},
              textString="Do not use!")}));
    end StandardBus;

    annotation (Documentation(info="<html>
<p>
A collection of internal material for driver environment models. Control bus definitions are mainly included.
</p>
</html>"));
  end Internal;

  annotation (Documentation(info="<html>
<p>The driver environment subsystem interfaces are defined in this sub-package of the VehicleInterfaces library.  The driver environment subsystem has the following connectors some of which are optional (see below for more information):</p>
<ul>
<li><b>controlBus</b> - control signal bus connection</li>
<li><b>chassisFrame</b> - MultiBody connection providing a connection point to the vehicle body (optional)</li>
<li><b>steeringWheel</b> - steering wheel connection (optional)</li>
<li><b>acceleratorPedal</b> - 1D translational connection for the accelerator pedal connection to the driverEnvironment (optional)</li>
<li><b>brakePedal</b> - 1D translational connection for the brake pedal connection to the driverEnvironment (optional)</li>
<li><b>clutchPedal</b> - 1D translational connection for the clutch pedal connection to the driverEnvironment (optional, for manual gearboxes only)</li>
<li><b>shiftConnector</b> - shift connection to the driverEnvironment (optional, for manual gearboxes only)</li>
</ul>
<p>The optional connectors are, by default, disabled and can be ignored if not required.  They can be enabled by setting the appropriate parameter to be true.  This is only possible at design time, i.e. when you are building the subsystem model.</p>
<h4>Effects to be modelled in this subsystem</h4>
<p>Within the VehicleIntefaces package the driver environment subsystem is used to model the interaction between the human driver and the vehicle itself.  A library developer may also choose to include the driver logic within this subsystem or they may use a separate Driver subsystem based on VehicleInterfaces.Drivers.Interfaces.Base.</p>
</html>"));
end DriverEnvironments;
