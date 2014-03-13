within VehicleInterfaces;
package Interfaces "Collection of general interface definitions"
  extends Modelica.Icons.InterfacesPackage;

  package Internal
    "Internal class declarations - should not be used directly in any models (used to built up default menus for buses)"
    extends Modelica.Icons.InternalPackage;

    expandable connector StandardControlBus
      "Obsolete bus: Do not use (provided for backwards compatibility)"
      extends VehicleInterfaces.Interfaces.ControlBus;
      VehicleInterfaces.Interfaces.AccessoriesBus accessoriesBus
        "AccessoriesBus";
      VehicleInterfaces.Interfaces.AccessoriesControlBus accessoriesControlBus
        "AccessoriesControlBus";
      VehicleInterfaces.Interfaces.BatteryBus batteryBus "BatteryBus";
      VehicleInterfaces.Interfaces.BrakesBus brakesBus "BrakesBus";
      VehicleInterfaces.Interfaces.BrakesControlBus brakesControlBus
        "BrakesControlBus";
      VehicleInterfaces.Interfaces.ChassisBus chassisBus "ChassisBus";
      VehicleInterfaces.Interfaces.ChassisControlBus chassisControlBus
        "ChassisControlBus";
      VehicleInterfaces.Interfaces.DrivelineBus drivelineBus "DrivelineBus";
      VehicleInterfaces.Interfaces.DrivelineControlBus drivelineControlBus
        "DrivelineControlBus";
      VehicleInterfaces.Interfaces.DriverBus driverBus "DriverBus";
      VehicleInterfaces.Interfaces.ElectricMotorBus electricMotorBus
        "ElectricMotorBus";
      VehicleInterfaces.Interfaces.ElectricMotorControlBus
        electricMotorControlBus "ElectricMotorControlBus";
      VehicleInterfaces.Interfaces.EngineBus engineBus "EngineBus";
      VehicleInterfaces.Interfaces.EngineControlBus engineControlBus
        "EngineControlBus";
      VehicleInterfaces.Interfaces.TransmissionBus transmissionBus
        "TransmissionBus";
      VehicleInterfaces.Interfaces.TransmissionControlBus
        transmissionControlBus "TransmissionControlBus";

      annotation (Documentation(info="<html>
<p>An expandable connector that defines the structure for the control signal bus.  This connector should <b>NOT</b> be used in models and is included to enable Dymola to generate appropriate connection dialogs for signal buses.</p>
</html>"), Diagram(graphics={
                          Text(
              extent={{-100,-40},{100,-80}},
              lineColor={255,0,0},
              textString="Do not use!")}));
    end StandardControlBus;

    annotation (Documentation(info="<html>
<p>
A collection of internal material for interface models. Especially, the bus definitions are included here.
</p>
</html>"));
  end Internal;

  expandable connector ControlBus
    "Bus of VehicleInterfaces.Interfaces: Minimal standard control bus"
    extends Modelica.Icons.SignalBus;

    VehicleInterfaces.Interfaces.AccessoriesBus accessoriesBus
      "Accessories bus"                                                          annotation(Dialog(enable=false));
    VehicleInterfaces.Interfaces.AccessoriesControlBus accessoriesControlBus
      "Accessories control bus" annotation(Dialog(enable=false));
    VehicleInterfaces.Interfaces.BatteryBus batteryBus "Battery bus" annotation(Dialog(enable=false));
    VehicleInterfaces.Interfaces.BrakesBus brakesBus "Brakes bus" annotation(Dialog(enable=false));
    VehicleInterfaces.Interfaces.BrakesControlBus brakesControlBus
      "Brakes control bus" annotation(Dialog(enable=false));
    VehicleInterfaces.Interfaces.ChassisBus chassisBus "Chassis bus" annotation(Dialog(enable=false));
    VehicleInterfaces.Interfaces.ChassisControlBus chassisControlBus
      "Chassis control bus" annotation(Dialog(enable=false));
    VehicleInterfaces.Interfaces.DrivelineBus drivelineBus "Driveline bus" annotation(Dialog(enable=false));
    VehicleInterfaces.Interfaces.DrivelineControlBus drivelineControlBus
      "Driveline control bus" annotation(Dialog(enable=false));
    VehicleInterfaces.Interfaces.DriverBus driverBus "Driver bus" annotation(Dialog(enable=false));
    VehicleInterfaces.Interfaces.ElectricMotorBus electricMotorBus
      "Electric motor bus" annotation(Dialog(enable=false));
    VehicleInterfaces.Interfaces.ElectricMotorControlBus
      electricMotorControlBus "Electric motor control bus" annotation(Dialog(enable=false));
    VehicleInterfaces.Interfaces.EngineBus engineBus "Engine bus" annotation(Dialog(enable=false));
    VehicleInterfaces.Interfaces.EngineControlBus engineControlBus
      "Engine control bus" annotation(Dialog(enable=false));
    VehicleInterfaces.Interfaces.TransmissionBus transmissionBus
      "Transmission bus" annotation(Dialog(enable=false));
    VehicleInterfaces.Interfaces.TransmissionControlBus
      transmissionControlBus "Transmission control bus" annotation(Dialog(enable=false));

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics),
      Documentation(info="<html>
<p>An empty expandable connector used as the top-level control signal bus in VehicleInterfaces.</p>
</html>"));
  end ControlBus;

  expandable connector AccessoriesBus
    "Bus of VehicleInterfaces.Interfaces: Empty expandable connector used as accessory bus"
    extends Modelica.Icons.SignalSubBus;

    annotation (
      defaultComponentPrefixes="protected",
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={Rectangle(
            extent={{-20,2},{20,-2}},
            lineColor={255,204,51},
            lineThickness=0.5)}),
      Documentation(info="<html>
<p>Should be used to contain signals measured in the accessories subsystem.  It is defined as an empty expandable connector.</p>
</html>"));
  end AccessoriesBus;

  expandable connector AccessoriesControlBus
    "Bus of VehicleInterfaces.Interfaces: Empty expandable connector used as accessories control bus"
    extends Modelica.Icons.SignalSubBus;

    annotation (
      defaultComponentPrefixes="protected",
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={Rectangle(
            extent={{-20,2},{20,-2}},
            lineColor={255,204,51},
            lineThickness=0.5)}),
      Documentation(info="<html>
<p>Should be used to contain signals determined in the accessories controller.  It is defined as an empty expandable connector.</p>
</html>"));
  end AccessoriesControlBus;

  expandable connector BatteryBus
    "Bus of VehicleInterfaces.Interfaces: Empty expandable connector used as battery bus"
    extends Modelica.Icons.SignalSubBus;

    annotation (
      defaultComponentPrefixes="protected",
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={Rectangle(
            extent={{-20,2},{20,-2}},
            lineColor={255,204,51},
            lineThickness=0.5)}),
      Documentation(info="<html>
<p>Should be used to contain signals measured in the battery subsystem.  It is defined as an empty expandable connector.</p>
</html>"));
  end BatteryBus;

  expandable connector BatteryControlBus
    "Bus of VehicleInterfaces.Interfaces: Empty expandable connector used as battery control bus"
    extends Modelica.Icons.SignalSubBus;

    annotation (
      defaultComponentPrefixes="protected",
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={Rectangle(
            extent={{-20,2},{20,-2}},
            lineColor={255,204,51},
            lineThickness=0.5)}),
      Documentation(info="<html>
<p>Should be used to contain signals measured in the battery subsystem.  It is defined as an empty expandable connector.</p>
</html>"));
  end BatteryControlBus;

  expandable connector BrakesBus
    "Bus of VehicleInterfaces.Interfaces: Empty expandable connector used as brakes bus"
    extends Modelica.Icons.SignalSubBus;

    annotation (
      defaultComponentPrefixes="protected",
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={Rectangle(
            extent={{-20,2},{20,-2}},
            lineColor={255,204,51},
            lineThickness=0.5)}),
      Documentation(info="<html>
<p>Should be used to contain signals measured in the brakes subsystem.
It is defined as an empty expandable connector.</p>
</html>"));
  end BrakesBus;

  expandable connector BrakesControlBus
    "Bus of VehicleInterfaces.Interfaces: Empty expandable connector used as brakes control bus"
    extends Modelica.Icons.SignalSubBus;

    annotation (
      defaultComponentPrefixes="protected",
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={Rectangle(
            extent={{-20,2},{20,-2}},
            lineColor={255,204,51},
            lineThickness=0.5)}),
      Documentation(info="<html>
<p>Should be used to contain signals determined in the brakes controller.  It is defined as an empty expandable connector.</p>
</html>"));
  end BrakesControlBus;

  expandable connector ChassisBus
    "Bus of VehicleInterfaces.Interfaces: Empty expandable connector used as chassis bus"
    extends Modelica.Icons.SignalSubBus;

    annotation (
      defaultComponentPrefixes="protected",
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={Rectangle(
            extent={{-20,2},{20,-2}},
            lineColor={255,204,51},
            lineThickness=0.5)}),
      Documentation(info="<html>
<p>Should be used to contain signals measured in the chassis subsystem.  It is defined as an empty expandable connector.</p>
</html>"));
  end ChassisBus;

  expandable connector ChassisControlBus
    "Bus of VehicleInterfaces.Interfaces: Empty expandable connector used as chassis control bus"
    extends Modelica.Icons.SignalSubBus;

    annotation (
      defaultComponentPrefixes="protected",
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={Rectangle(
            extent={{-20,2},{20,-2}},
            lineColor={255,204,51},
            lineThickness=0.5)}),
      Documentation(info="<html>
<p>Should be used to contain signals determined in the chassis controller.  It is defined as an empty expandable connector.</p>
</html>"));
  end ChassisControlBus;

  expandable connector DrivelineBus
    "Bus of VehicleInterfaces.Interfaces: Empty expandable connector used as driveline bus"
    extends Modelica.Icons.SignalSubBus;

    annotation (
      defaultComponentPrefixes="protected",
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={Rectangle(
            extent={{-20,2},{20,-2}},
            lineColor={255,204,51},
            lineThickness=0.5)}),
      Documentation(info="<html>
<p>Should be used to contain signals measured in the driveline subsystem.  It is defined as an empty expandable connector.</p>
</html>"));
  end DrivelineBus;

  expandable connector DrivelineControlBus
    "Bus of VehicleInterfaces.Interfaces: Empty expandable connector used as driveline control bus"
    extends Modelica.Icons.SignalSubBus;

    annotation (
      defaultComponentPrefixes="protected",
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={Rectangle(
            extent={{-20,2},{20,-2}},
            lineColor={255,204,51},
            lineThickness=0.5)}),
      Documentation(info="<html>
<p>Should be used to contain signals determined in the driveline controller.  It is defined as an empty expandable connector.</p>
</html>"));
  end DrivelineControlBus;

  expandable connector DriverBus
    "Bus of VehicleInterfaces.Interfaces: Empty expandable connector used as driver bus"
    extends Modelica.Icons.SignalSubBus;

    annotation (
      defaultComponentPrefixes="protected",
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={Rectangle(
            extent={{-20,2},{20,-2}},
            lineColor={255,204,51},
            lineThickness=0.5)}),
      Documentation(info="<html>
<p>Should be used to contain signals that are determined in the driverEnvironment subsystem.  It is defined as an empty expandable connector.</p>
</html>"));
  end DriverBus;

  expandable connector DriverInterface
    "Bus of VehicleInterfaces.Interfaces: Empty expandable connector used as driver interface bus"
    //extends Modelica.Icons.SignalSubBus;

    annotation (
      defaultComponentPrefixes="protected",
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={
          Rectangle(
            extent={{-10,4},{10,-4}},
            lineColor={85,85,255},
            lineThickness=0.5),
          Polygon(
            points={{-80,50},{80,50},{100,30},{80,-40},{60,-50},{-60,-50},{-80,
                -40},{-100,30},{-80,50}},
            lineColor={0,0,0},
            fillColor={85,85,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-55,25},{-45,15}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{45,25},{55,15}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-5,-15},{5,-25}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid)}),
      Documentation(info="<html>
<p>Should be used to contain signals and normalised mechanical connections that need to be exchanged between the Driver and DriverEnvironment subsystems.</p>
</html>"),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={
          Polygon(
            points={{-40,25},{40,25},{50,15},{40,-20},{30,-25},{-30,-25},{-40,-20},
                {-50,15},{-40,25}},
            lineColor={0,0,0},
            fillColor={85,85,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-22.5,7.5},{-17.5,12.5}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{17.5,12.5},{22.5,7.5}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-2.5,-7.5},{2.5,-12.5}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-150,70},{150,40}},
            lineColor={0,0,0},
            textString="%name")}));
  end DriverInterface;

  expandable connector ElectricMotorBus
    "Bus of VehicleInterfaces.Interfaces: Empty expandable connector used as an electric motor bus"
    extends Modelica.Icons.SignalSubBus;

    annotation (
      defaultComponentPrefixes="protected",
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={Rectangle(
            extent={{-20,2},{20,-2}},
            lineColor={255,204,51},
            lineThickness=0.5)}),
      Documentation(info="<html>
<p>Should be used to contain signals measured in the electrical motor subsystem.  It is defined as an empty expandable connector.</p>
</html>"));
  end ElectricMotorBus;

  expandable connector ElectricMotorControlBus
    "Bus of VehicleInterfaces.Interfaces: Empty expandable connector used as an electric motor control bus"
    extends Modelica.Icons.SignalSubBus;

    annotation (
      defaultComponentPrefixes="protected",
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={Rectangle(
            extent={{-20,2},{20,-2}},
            lineColor={255,204,51},
            lineThickness=0.5)}),
      Documentation(info="<html>
<p>Should be used to contain signals measured in the electrical motor control subsystem.  It is defined as an empty expandable connector.</p>
</html>"));
  end ElectricMotorControlBus;

  expandable connector EngineBus
    "Bus of VehicleInterfaces.Interfaces: Empty expandable connector used as engine bus"
    extends Modelica.Icons.SignalSubBus;

    annotation (
      defaultComponentPrefixes="protected",
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={Rectangle(
            extent={{-20,2},{20,-2}},
            lineColor={255,204,51},
            lineThickness=0.5)}),
      Documentation(info="<html>
<p>Should be used to contain signals measured in the engine subsystem.  It is defined as an empty expandable connector.</p>
</html>"));
  end EngineBus;

  expandable connector EngineControlBus
    "Bus of VehicleInterfaces.Interfaces: Empty expandable connector used as engine control bus"
    extends Modelica.Icons.SignalSubBus;

    annotation (
      defaultComponentPrefixes="protected",
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={Rectangle(
            extent={{-20,2},{20,-2}},
            lineColor={255,204,51},
            lineThickness=0.5)}),
      Documentation(info="<html>
<p>Should be used to contain signals determined in the engine controller.  It is defined as an empty expandable connector.</p>
</html>"));
  end EngineControlBus;

  expandable connector TransmissionBus
    "Bus of VehicleInterfaces.Interfaces: Empty expandable connector used as transmission bus"
    extends Modelica.Icons.SignalSubBus;

    annotation (
      defaultComponentPrefixes="protected",
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={Rectangle(
            extent={{-20,2},{20,-2}},
            lineColor={255,204,51},
            lineThickness=0.5)}),
      Documentation(info="<html>
<p>Should be used to contain signals measured in the transmission subsystem.  It is defined as an empty expandable connector.</p>
</html>"));
  end TransmissionBus;

  expandable connector TransmissionControlBus
    "Bus of VehicleInterfaces.Interfaces: Bus that contains a minimal set of signals generated by the Transmission Controller model"
    extends Modelica.Icons.SignalSubBus;
    Integer currentGear "Currently selected gear" annotation (Dialog);

    annotation (
      defaultComponentPrefixes="protected",
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={Rectangle(
            extent={{-20,2},{20,-2}},
            lineColor={255,204,51},
            lineThickness=0.5)}),
      Documentation(info="<html>
<p>Should be used to contain signals determined in the transmission controller.  It is defined as an empty expandable connector.</p>
</html>"));
  end TransmissionControlBus;

  connector ShiftConnector "Manual transmission shift connector"
    Modelica.Mechanics.Translational.Interfaces.Flange_a crossGate
      "Gear shift lever movement across the selection gate";
    Modelica.Mechanics.Translational.Interfaces.Flange_a intoGear
      "Gear shift lever movement forwards and backwards in the selection gate";

    annotation (
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-22,34},{-8,-20},{4,-20},{-12,38},{-22,34}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-34,56},{-4,26}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-18,-44},{18,-10}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-60,-28},{60,-48}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}), graphics={
          Text(
            extent={{-150,140},{150,100}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid,
            textString="%name"),
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-22,34},{-8,-20},{4,-20},{-12,38},{-22,34}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-34,56},{-4,26}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-18,-44},{18,-10}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-60,-28},{60,-48}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Solid)}),
      Documentation(info="<html>
<p>Manual transmission shift connector.  It contains two 1D translational connectors that represent the position of the shift lever across the shift gate (<b>crossGate</b>) and forwards/backwards within the gate (<b>intoGear</b>).</p>
</html>"));
  end ShiftConnector;

  model ShiftInput
    "Convert an integer signal to a position in the manual shift connector"
    parameter Integer numberOfGears=5 "Number of forward gears";
    parameter Modelica.SIunits.Distance crossGateDisplacement=0.1
      "Total distance across the gate";
    parameter Modelica.SIunits.Distance intoGearDisplacement=0.1
      "Distance to move in to gear";
    ShiftConnector shiftConnector "Gear shift connection"
      annotation (Placement(transformation(extent={{-130,-30},{-70,30}},
            rotation=0)));
    Modelica.Blocks.Interfaces.IntegerInput gear "Gear number"
      annotation (Placement(transformation(
          origin={120,0},
          extent={{-20,20},{20,-20}},
          rotation=180)));
  equation
    if gear == 0 then
      shiftConnector.crossGate.s = 0;
      shiftConnector.intoGear.s = 0;
    elseif gear == 1 then
      shiftConnector.crossGate.s = -crossGateDisplacement/2;
      shiftConnector.intoGear.s = intoGearDisplacement;
    elseif gear == 2 then
      shiftConnector.crossGate.s = -crossGateDisplacement/2;
      shiftConnector.intoGear.s = -intoGearDisplacement;
    elseif gear == 3 then
      shiftConnector.crossGate.s = 0;
      shiftConnector.intoGear.s = intoGearDisplacement;
    elseif gear == 4 then
      shiftConnector.crossGate.s = 0;
      shiftConnector.intoGear.s = -intoGearDisplacement;
    elseif gear == 5 then
      shiftConnector.crossGate.s = crossGateDisplacement/2;
      shiftConnector.intoGear.s = intoGearDisplacement;
    else
      //Reverse gear
      shiftConnector.crossGate.s = crossGateDisplacement/2;
      shiftConnector.intoGear.s = -intoGearDisplacement;
    end if;

    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
              100,100}}),
              graphics),
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-48,68},{-40,60}},
            lineColor={215,215,215},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-48,-60},{-40,-68}},
            lineColor={215,215,215},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-48,64},{-40,-64}},
            lineColor={215,215,215},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{40,68},{48,60}},
            lineColor={215,215,215},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{40,-60},{48,-68}},
            lineColor={215,215,215},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{40,64},{48,-64}},
            lineColor={215,215,215},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-4,68},{4,60}},
            lineColor={215,215,215},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-4,-60},{4,-68}},
            lineColor={215,215,215},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-4,64},{4,-64}},
            lineColor={215,215,215},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-46,4},{42,-4}},
            lineColor={215,215,215},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-10,68},{10,48}},
            lineColor={215,215,215},
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid)}),
      Documentation(info="<html>
<p>Converts an integer signal in to positions on the <b>intoGear</b> and <b>crossGate</b> sub-connectors of the ShiftConnector.</p>
</html>"));
  end ShiftInput;

  model ShiftOutput
    "Convert a position in the manual shift connector to an integer value"
    parameter Integer numberOfGears=5 "Number of forward gears";
    parameter Modelica.SIunits.Distance crossGateDisplacement=0.1
      "Total distance across the gate";
    parameter Modelica.SIunits.Distance intoGearDisplacement=0.1
      "Distance to move in to gear";
    ShiftConnector shiftConnector "Gear shift connection"
      annotation (Placement(transformation(extent={{-130,-30},{-70,30}},
            rotation=0)));
    Modelica.Blocks.Interfaces.IntegerOutput gear "Gear number"
      annotation (Placement(transformation(extent={{100,-10},{120,10}},rotation=
             0)));
  equation
    shiftConnector.crossGate.f = 0;
    shiftConnector.intoGear.f = 0;
    if shiftConnector.crossGate.s <= -0.9*crossGateDisplacement/2 then
      if shiftConnector.intoGear.s >= 0.9*intoGearDisplacement then
        gear = 1;
      else
        gear = 2;
      end if;
    elseif shiftConnector.crossGate.s >= 0.9*crossGateDisplacement/2 then
      if shiftConnector.intoGear.s >= 0.9*intoGearDisplacement then
        gear = 5;
      else
        gear = -1;
      end if;
    else
      if shiftConnector.intoGear.s >= 0.9*intoGearDisplacement then
        gear = 3;
      elseif shiftConnector.intoGear.s <= 0.9*intoGearDisplacement then
        gear = 4;
      else
        gear = 0;
      end if;
    end if;

    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
              100,100}}),
              graphics),
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-48,68},{-40,60}},
            lineColor={215,215,215},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-48,-60},{-40,-68}},
            lineColor={215,215,215},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-48,64},{-40,-64}},
            lineColor={215,215,215},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{40,68},{48,60}},
            lineColor={215,215,215},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{40,-60},{48,-68}},
            lineColor={215,215,215},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{40,64},{48,-64}},
            lineColor={215,215,215},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-4,68},{4,60}},
            lineColor={215,215,215},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-4,-60},{4,-68}},
            lineColor={215,215,215},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-4,64},{4,-64}},
            lineColor={215,215,215},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-46,4},{42,-4}},
            lineColor={215,215,215},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-10,68},{10,48}},
            lineColor={215,215,215},
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid)}),
      Documentation(info="<html>
<p>Converts positions on the <b>intoGear</b> and <b>crossGate</b> sub-connectors of the ShiftConnector into an integer gear signal.</p>
</html>"));
  end ShiftOutput;

  annotation (Documentation(info="<html>
<p>
This library provides general interface definitions, such as the signal bus.
</p>
</html>"));
end Interfaces;
