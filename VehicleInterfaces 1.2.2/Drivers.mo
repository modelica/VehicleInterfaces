within VehicleInterfaces;
package Drivers "Collection of driver subsystem definitions"
  extends VehicleInterfaces.Icons.VariantLibrary;

  class Tutorial "Drivers Tutorial"
    extends Modelica.Icons.Information;

    annotation (DocumentationClass=true, Documentation(info="<html>
<p><b>Tutorial - Defining a new driver model</b></p>
<p>The following process will demonstrate how to create a new driver model using these interface definitions.  This tutorial will guide you through building a driver for a conventional automatic transmission passenger car.</p>
<ol>
<li>Create a new model that extends <b>VehicleInterfaces.Drivers.Interfaces.Base</b>, it should look like this:</li>
<br><br><img src=\"modelica://VehicleInterfaces/Resources/Images/buildNewDriver1.png\"><br><br>
<li>Unlike the other interface definitions in the VehicleInterfaces package the Driver model doesn't include optional connections.  It simply uses an expandable connector to exchange information with the DriverEnvironment subsystem.  The required signals are defined in the <a href=\"Modelica://VehicleInterfaces.UsersGuide.DriverInteractionBus\">Driver interaction bus</a> section of the Users Guide.  Normalised mechanical sensors and actuators are provided in the <a href=\"Modelica://VehicleInterfaces.Mechanics\">VehicleInterfaces.Mechanics</a> package.
</ol></html>"));
  end Tutorial;

  package Interfaces "Collection of interface definitions for driver"
    extends Modelica.Icons.InterfacesPackage;
    partial model Base "Basic interface definition for a driver"

      replaceable VehicleInterfaces.Interfaces.DriverInterface driverInterface
        "Driver Interaction Bus" annotation (Placement(transformation(extent={{-10,-10},
                {10,10}},          rotation=-90,
            origin={100,0})));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{100,
                100}})),
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}})),
        Documentation(info="<html>
<p>This partial model defines the interfaces required for the driver subsystem. This class should be extended to form a particular driver model. See the <a href=\"Modelica://VehicleInterfaces.Drivers\">documentation</a> and <a href=\"Modelica://VehicleInterfaces.Drivers.Tutorial\">tutorial</a> for more information.</p>
</html>"));
    end Base;

    expandable connector MinimalBus
      "Bus of VehicleInterfaces.Drivers: MinimalBus (minimal set of signals for any type of transmissions)"
      extends .VehicleInterfaces.Interfaces.DriverInterface;
      extends .VehicleInterfaces.Icons.SignalSubBusWithExplicitSignals;

      VehicleInterfaces.Mechanics.NormalisedTranslational.Interfaces.Flange
        acceleratorPedal "Accelerator pedal" annotation (Dialog);
      VehicleInterfaces.Mechanics.NormalisedTranslational.Interfaces.Flange
        brakePedal "Brake pedal" annotation (Dialog);
      VehicleInterfaces.Mechanics.NormalisedRotational.Interfaces.Flange
        steeringWheel "Steering wheel" annotation (Dialog);
      VehicleInterfaces.Types.IgnitionSetting.Temp ignition
        "Engine ignition (Off, On or Start)" annotation (Dialog);

      SI.Velocity vehicleSpeed "Vehicle speed" annotation (Dialog);
      SI.AngularVelocity engineSpeed "Engine speed" annotation (Dialog);
      annotation (Documentation(info="<html>
<p>An expandable connector that defines the minimum set of signals required 
  on the <b>driverInteractionBus</b> for a driver of an automatic vehicle.  
  </p>
</html>"));
    end MinimalBus;

    expandable connector BusForAutomaticTransmission
      "Bus of VehicleInterfaces.Drivers: BusForAutomaticTransmission"
      extends .VehicleInterfaces.Drivers.Interfaces.MinimalBus;

      VehicleInterfaces.Types.Gear requestedGear
        "Requested gear for automatic transmission if gearboxMode=Manual or =Limited"
        annotation (Dialog);
      VehicleInterfaces.Types.GearMode.Temp gearboxMode
        "Selected gearbox mode (Park, Drive, Neutral, Rear, Manual, Limited)"
        annotation (Dialog);

      annotation (Documentation(info="<html>
<p>An expandable connector that defines the minimum set of signals required 
  on the <b>driverInteractionBus</b> for a driver of an automatic vehicle.  
  </p>
</html>"));
    end BusForAutomaticTransmission;

    expandable connector BusForManualTransmission
      "Bus of VehicleInterfaces.Drivers: BusForManualTransmission"
      extends .VehicleInterfaces.Drivers.Interfaces.MinimalBus;

      VehicleInterfaces.Mechanics.NormalisedTranslational.Interfaces.Flange
        clutchPedal "Clutch pedal" annotation (Dialog);
      Integer gear
        "Selected gear for manual transmission (>0:forward gear, <0:rear gear)"
                                                                                           annotation (Dialog);
      Boolean clutchLocked "Clutch locked flag" annotation (Dialog);

      annotation (Documentation(info="<html>
<p>An expandable connector that defines the minimum set of signals required on the <b>driverInteractionBus</b> for a driver of a manual vehicle.</p>
</html>"));
    end BusForManualTransmission;

    annotation (Documentation(info="<html>
<p>
A collection of partial base classes which define interfaces for driver models. 
</p>
</html>"));
  end Interfaces;

  model NoDriver "Empty driver"
    extends VehicleInterfaces.Drivers.Interfaces.Base;
    extends VehicleInterfaces.Icons.Driver;
    extends VehicleInterfaces.Icons.Empty;

    annotation (Documentation(info="<html>
<p>
Empty driver model. Using this empty model in overall vehicle architecture the functionality of driver can be eliminated. 
</p>
</html>"));
  end NoDriver;

  model MinimalDriver "Constant acceleration Driver"
    extends VehicleInterfaces.Icons.Driver;
    extends VehicleInterfaces.Drivers.Interfaces.Base;
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
      startTime=brakeTime) annotation (Placement(transformation(extent={{-40,40},
              {-20,60}}, rotation=0)));
    Modelica.Blocks.Sources.Step acceleratorDemand(
      height=finalAccelRequest,
      offset=initialAccelRequest,
      startTime=accelTime) annotation (Placement(transformation(extent={{-40,10},
              {-20,30}}, rotation=0)));
    Modelica.Blocks.Sources.Constant steeringAngle(k=0)
      annotation (Placement(transformation(extent={{-40,70},{-20,90}}, rotation=
             0)));
    Modelica.Blocks.Sources.IntegerConstant gearboxMode(k=selectedGearboxMode)
      annotation (Placement(transformation(extent={{-40,-30},{-20,-10}},
            rotation=0)));
    Modelica.Blocks.Sources.IntegerConstant requestedGear(k=manualGearRequest)
      annotation (Placement(transformation(extent={{-40,-60},{-20,-40}},
            rotation=0)));
    Mechanics.NormalisedRotational.Position steeringWheelAngle
      annotation (Placement(transformation(extent={{0,70},{20,90}},  rotation=0)));
    Mechanics.NormalisedTranslational.Position brakePosition
      annotation (Placement(transformation(extent={{0,40},{20,60}},  rotation=0)));
    Mechanics.NormalisedTranslational.Position acceleratorPosition
      annotation (Placement(transformation(extent={{0,10},{20,30}},  rotation=0)));
    Modelica.Blocks.Sources.IntegerStep ignition(
      height=-1,
      startTime=0.5,
      offset=VehicleInterfaces.Types.IgnitionSetting.Start)
      annotation (Placement(transformation(extent={{-40,-90},{-20,-70}},
            rotation=0)));
  equation
    connect(gearboxMode.y, driverInterface.gearboxMode) annotation (
      Line(points={{-19,-20},{98,-20},{98,0},{100,0}}, color={255,127,0}),
      Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(requestedGear.y, driverInterface.requestedGear) annotation (Line(
          points={{-19,-50},{100,-50},{100,0}}, color={255,127,0}),
      Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(ignition.y, driverInterface.ignition) annotation (Line(points={{-19,
            -80},{102,-80},{102,0},{100,0}}, color={255,127,0}),
      Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(steeringAngle.y, steeringWheelAngle.phi_ref) annotation (Line(
          points={{-19,80},{-2,80}}, color={0,0,127}));
    connect(brakeDemand.y, brakePosition.position) annotation (Line(points={{-19,50},
            {-2,50}},         color={0,0,127}));
    connect(acceleratorDemand.y, acceleratorPosition.position) annotation (Line(
          points={{-19,20},{-2,20}}, color={0,0,127}));
    connect(brakePosition.flange_b, driverInterface.brakePedal) annotation (Line(
          points={{20,50},{100,50},{100,0}}, color={0,127,0}),
      Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(acceleratorPosition.flange_b, driverInterface.acceleratorPedal)
      annotation (Line(points={{20,20},{98,20},{98,0},{100,0}},
                                                        color={0,127,0}),
      Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(steeringWheelAngle.flange_b, driverInterface.steeringWheel)
      annotation (Line(points={{20,80},{102,80},{102,0},{100,0}},
                                                          color={0,0,0}),
      Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));

    annotation (
      defaultComponentName="driver",
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}})),
      Documentation(info="<html>
<p>Constant acceleration driver with the capabilitiy to step between two constant throttle values.</p>
</html>"));
  end MinimalDriver;

  package Internal "Collection of internal material involving driver"
    extends Modelica.Icons.InternalPackage;

    expandable connector StandardDriverInterfaceForAutomaticTransmission
      "Obsolete bus: Do not use (provided for backwards compatibility)"
      extends VehicleInterfaces.Interfaces.DriverInterface;

      VehicleInterfaces.Mechanics.NormalisedTranslational.Interfaces.Flange
        acceleratorPedal "Accelerator pedal" annotation (Dialog);
      VehicleInterfaces.Mechanics.NormalisedTranslational.Interfaces.Flange
        brakePedal "Brake pedal" annotation (Dialog);
      VehicleInterfaces.Mechanics.NormalisedRotational.Interfaces.Flange
        steeringWheel "Steering wheel" annotation (Dialog);
      SI.Velocity vehicleSpeed "Vehicle speed" annotation (Dialog);
      SI.AngularVelocity engineSpeed "Engine speed" annotation (Dialog);
      annotation (Documentation(info="<html>
<p>An expandable connector that defines the minimum set of signals required on the <b>driverInteractionBus</b> for a driver of an automatic vehicle.  This connector should <b>NOT</b> be used in models and is included to enable Dymola to generate appropriate connection dialogs for signal buses.</p>
</html>"));
    end StandardDriverInterfaceForAutomaticTransmission;

    expandable connector StandardDriverInterfaceForManualTransmission
      "Obsolete bus: Do not use (provided for backwards compatibility)"
      extends VehicleInterfaces.Interfaces.DriverInterface;

      VehicleInterfaces.Mechanics.NormalisedTranslational.Interfaces.Flange
        acceleratorPedal "Accelerator pedal" annotation (Dialog);
      VehicleInterfaces.Mechanics.NormalisedTranslational.Interfaces.Flange
        brakePedal "Brake pedal" annotation (Dialog);
      VehicleInterfaces.Mechanics.NormalisedTranslational.Interfaces.Flange
        clutchPedal "Clutch pedal" annotation (Dialog);
      VehicleInterfaces.Mechanics.NormalisedRotational.Interfaces.Flange
        steeringWheel "Steering wheel" annotation (Dialog);
      SI.Velocity vehicleSpeed "Vehicle speed" annotation (Dialog);
      SI.AngularVelocity engineSpeed "Engine speed" annotation (Dialog);
      Integer gear "Selected gear" annotation (Dialog);
      Boolean clutchLocked "Clutch locked flag" annotation (Dialog);
      annotation (Documentation(info="<html>
<p>An expandable connector that defines the minimum set of signals required on the <b>driverInteractionBus</b> for a driver of a manual vehicle.  This connector should <b>NOT</b> be used in models and is included to enable Dymola to generate appropriate connection dialogs for signal buses.</p>
</html>"));
    end StandardDriverInterfaceForManualTransmission;

    annotation (Documentation(info="<html>
<p>
A collection of internal material for driver models. Control bus definitions are mainly included.
</p>
</html>"));
  end Internal;

  annotation (Documentation(info="<html>
<p>The driver subsystem interfaces are defined in this sub-package of the VehicleInterfaces library.  The driver subsystem has the following connector:</p>
<ul>
<li><b>driverInterface</b> - a DriverInterface connector which is an empty expandable connector</li>
</ul>
<h4>Effects to be modelled in this subsystem</h4>
<p>The driver logic should be modelled in this subsystem and communication with the DriverEnvironment subsystem should be via normalised control signals.</p>
</html>"));
end Drivers;
