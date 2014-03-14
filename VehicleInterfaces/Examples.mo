within VehicleInterfaces;
package Examples "Collection of vehicle model examples"
  extends Modelica.Icons.ExamplesPackage;

  model ConventionalAutomaticVehicle
    "Conventional automatic transmission vehicle"
    extends Modelica.Icons.Example;

    replaceable Engines.MinimalEngine engine constrainedby
      VehicleInterfaces.Engines.Interfaces.Base "Engine subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-110,-30},{-80,0}}, rotation=0)));
    replaceable Transmissions.SingleGearAutomaticTransmission transmission
      constrainedby
      VehicleInterfaces.Transmissions.Interfaces.BaseAutomaticTransmission
      "Transmission subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-60,-30},{-30,0}}, rotation=0)));
    replaceable Chassis.MinimalChassis chassis constrainedby
      VehicleInterfaces.Chassis.Interfaces.TwoAxleBase "Chassis subsystem"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{40,-40},{100,0}}, rotation=0)));
    replaceable Drivelines.MinimalDriveline driveline constrainedby
      VehicleInterfaces.Drivelines.Interfaces.TwoAxleBase "Driveline subsystem"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-10,-30},{20,0}}, rotation=0)));
    replaceable Brakes.MinimalBrakes brakes constrainedby
      VehicleInterfaces.Brakes.Interfaces.TwoAxleBase "Brakes subsystem"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{120,-30},{150,0}}, rotation=0)));
    replaceable Accessories.MinimalAccessories accessories constrainedby
      VehicleInterfaces.Accessories.Interfaces.Base "Accesories subsystem"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-145,-25},{-125,-5}}, rotation=0)));
    replaceable DriverEnvironments.DriveByWireAutomatic driverEnvironment
      constrainedby
      VehicleInterfaces.DriverEnvironments.Interfaces.BaseAutomaticTransmission
      "Driver environment" annotation (
      choicesAllMatching=true,
      Dialog(group="Driver Models"),
      Placement(transformation(extent={{0,50},{30,80}}, rotation=0)));
    inner replaceable Roads.FlatRoad road constrainedby
      VehicleInterfaces.Roads.Interfaces.Base "Road model" annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-120,-100},{-80,-80}}, rotation=0)));
    inner replaceable Atmospheres.ConstantAtmosphere atmosphere constrainedby
      VehicleInterfaces.Atmospheres.Interfaces.Base "Atmospheric model"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-70,-100},{-30,-80}}, rotation=0)));
    inner replaceable Modelica.Mechanics.MultiBody.World world(
      enableAnimation=false,
      n={0,0,-1},
      driveTrainMechanics3D=false)
      constrainedby Modelica.Mechanics.MultiBody.World
      "Global co-ordinate system" annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-150,-100},{-130,-80}}, rotation=0)));
  protected
    Interfaces.ControlBus controlBus "Control bus connector"
      annotation (Placement(transformation(
          origin={-150,20},
          extent={{-20,-20},{20,20}},
          rotation=90), iconTransformation(
          extent={{0,0},{0,0}},
          rotation=90,
          origin={-100,60})));
  equation
    connect(accessories.engineFlange, engine.accessoryFlange) annotation (Line(
          points={{-125,-15},{-110,-15}}, color={0,0,0}));
    connect(engine.transmissionFlange, transmission.engineFlange) annotation (Line(
          points={{-80,-15},{-60,-15}}, color={0,0,0}));
    connect(transmission.drivelineFlange, driveline.transmissionFlange)
      annotation (Line(points={{-30,-15},{-10,-15}}, color={0,0,0}));
    connect(chassis.wheelHub_2, driveline.wheelHub_2) annotation (Line(
        points={{53.125,0},{53.125,15},{-4,15},{-4,0}},
        color={135,135,135},
        thickness=0.5));
    connect(driveline.wheelHub_4, chassis.wheelHub_4) annotation (Line(
        points={{14,0},{14,10},{86.875,10},{86.875,0}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_4, brakes.wheelHub_4) annotation (Line(
        points={{86.875,0},{86.875,10},{144,10},{144,0}},
        color={135,135,135},
        thickness=0.5));
    connect(brakes.wheelHub_2, chassis.wheelHub_2) annotation (Line(
        points={{126,0},{126,15},{53.125,15},{53.125,0}},
        color={135,135,135},
        thickness=0.5));
    connect(driveline.wheelHub_3, chassis.wheelHub_3) annotation (Line(
        points={{14,-30},{14,-50},{86.875,-50},{86.875,-40}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_1, driveline.wheelHub_1) annotation (Line(
        points={{53.125,-40},{53.125,-55},{-4,-55},{-4,-30}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_3, brakes.wheelHub_3) annotation (Line(
        points={{86.875,-40},{86.875,-50},{144,-50},{144,-30}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_1, brakes.wheelHub_1) annotation (Line(
        points={{53.125,-40},{53.125,-55},{126,-55},{126,-30}},
        color={135,135,135},
        thickness=0.5));
    connect(controlBus, engine.controlBus) annotation (Line(
        points={{-150,20},{-120,20},{-120,-6},{-110,-6}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, transmission.controlBus) annotation (Line(
        points={{-150,20},{-70,20},{-70,-6},{-60,-6}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, driveline.controlBus) annotation (Line(
        points={{-150,20},{-20,20},{-20,-6},{-10,-6}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, chassis.controlBus) annotation (Line(
        points={{-150,20},{34,20},{34,-8},{40.375,-8}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, brakes.controlBus) annotation (Line(
        points={{-150,20},{110,20},{110,-6},{120,-6}},
        color={255,204,51},
        thickness=0.5));
    connect(accessories.controlBus, controlBus) annotation (Line(
        points={{-145,-9},{-150,-9},{-150,20}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, driverEnvironment.controlBus) annotation (Line(
        points={{-150,20},{80,20},{80,74},{30,74}},
        color={255,204,51},
        thickness=0.5));
    connect(driveline.drivelineMount, chassis.chassisFrame) annotation (Line(
        points={{5,-30},{5,-34},{40,-34}},
        color={95,95,95},
        thickness=0.5));
    connect(transmission.transmissionMount, chassis.chassisFrame) annotation (Line(
        points={{-45,-30},{-45,-34},{40,-34}},
        color={95,95,95},
        thickness=0.5));
    connect(engine.engineMount, chassis.chassisFrame) annotation (Line(
        points={{-95,-30},{-95,-34},{40,-34}},
        color={95,95,95},
        thickness=0.5));
    connect(driverEnvironment.acceleratorPedal, engine.acceleratorPedal)
      annotation (Line(points={{3,50},{3,40},{-95,40},{-95,0}}, color={0,127,0}));
    connect(driverEnvironment.brakePedal, brakes.brakePedal) annotation (Line(
          points={{21,50},{21,40},{135,40},{135,0}}, color={0,127,0}));
    connect(driverEnvironment.steeringWheel, chassis.steeringWheel) annotation (Line(
          points={{30,65},{70,65},{70,0}}, color={0,0,0}));
    connect(driverEnvironment.chassisFrame, chassis.chassisFrame) annotation (Line(
        points={{27,50},{27,-34},{40,-34}},
        color={95,95,95},
        thickness=0.5));

    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-160,-100},{160,100}},
          grid={1,1},
          initialScale=0.1), graphics),
      Documentation(info="<html>
<p>Example model architecture of a passenger car with an automatic transmission.  In this architecture variant the PowerTrain systems are rigidly mounted to the chassis when MultiBody effects are included.</p>
</html>"),
      experiment(StopTime=10));
  end ConventionalAutomaticVehicle;

  model ConventionalVehicle_AltNames
    "Extension of ConventionalAutomaticVehicle demonstrating the data dictionary"
    extends ConventionalAutomaticVehicle;
    replaceable DataDictionaries.MinimalExample dataDictionary constrainedby
      DataDictionaries.Interfaces.Base "Data dictionary" annotation (
      Dialog(group="Control Systems"),
      choicesAllMatching=true,
      Placement(transformation(extent={{-120,40},{-100,60}}, rotation=0)));
  equation
    connect(dataDictionary.controlBus, controlBus) annotation (Line(
        points={{-110,40},{-110,20},{-150,20}},
        color={255,204,51},
        thickness=0.5));

    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-160,-100},{160,100}},
          grid={1,1},
          initialScale=0.1), graphics),
      Documentation(info="<html>
<p>Example model architecture of a passenger car with an automatic transmission.  Based on <a href=\"Modelica://VehicleInterfaces.Examples.ConventionalAutomaticVehicle\">ConventionalAutomaticVehicle</a> this example shows how the DataDictionary can be used.</p>
</html>"),
      experiment(StopTime=10));
  end ConventionalVehicle_AltNames;

  model RearWheelDriveAutomaticVehicle
    "A conventional front-wheel drive automatic transmission vehicle with separate powertrain mounting system for the front axle and engine-transmission systems"
    extends Modelica.Icons.Example;

    replaceable Engines.MinimalEngine engine constrainedby
      VehicleInterfaces.Engines.Interfaces.Base "Engine subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-110,-20},{-80,10}}, rotation=0)));
    replaceable Transmissions.SingleGearAutomaticTransmission transmission
      constrainedby
      VehicleInterfaces.Transmissions.Interfaces.BaseAutomaticTransmission
      "Transmission subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-60,-20},{-30,10}}, rotation=0)));
    replaceable Chassis.MinimalChassis3 chassis constrainedby
      VehicleInterfaces.Chassis.Interfaces.TwoAxleBase "Chassis subsystem"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{40,-30},{100,10}}, rotation=0)));
    replaceable Drivelines.MinimalDriveline driveline(
      usingMultiBodyChassis=true)
      constrainedby VehicleInterfaces.Drivelines.Interfaces.TwoAxleBase
      "Driveline subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-10,-20},{20,10}}, rotation=0)));
    replaceable Brakes.MinimalBrakes brakes(usingMultiBodyChassis=true)
      constrainedby VehicleInterfaces.Brakes.Interfaces.TwoAxleBase
      "Brakes subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{120,-20},{150,10}}, rotation=0)));
    replaceable Accessories.MinimalAccessories accessories constrainedby
      VehicleInterfaces.Accessories.Interfaces.Base "Accessories subsystem"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-150,-15},{-130,5}}, rotation=0)));
    replaceable DriverEnvironments.DriveByWireAutomaticExternalDriver
      driverEnvironment constrainedby
      VehicleInterfaces.DriverEnvironments.Interfaces.BaseAutomaticTransmissionExternalDriver
      "Driver environment" annotation (
      choicesAllMatching=true,
      Dialog(group="Driver Models"),
      Placement(transformation(extent={{0,60},{30,90}}, rotation=0)));
    inner replaceable Roads.FlatRoad road constrainedby
      VehicleInterfaces.Roads.Interfaces.Base "Road model" annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-120,-100},{-80,-80}}, rotation=0)));
    inner replaceable Atmospheres.ConstantAtmosphere atmosphere constrainedby
      VehicleInterfaces.Atmospheres.Interfaces.Base "Atmospheric model"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-60,-100},{-20,-80}}, rotation=0)));
    inner replaceable Modelica.Mechanics.MultiBody.World world(
      enableAnimation=false,
      n={0,0,-1},
      driveTrainMechanics3D=false)
      constrainedby Modelica.Mechanics.MultiBody.World
      "Global co-ordinate system" annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-150,-100},{-130,-80}}, rotation=0)));
  protected
    Interfaces.ControlBus controlBus "Control bus connector"
      annotation (Placement(transformation(
          origin={-160,40},
          extent={{-20,-20},{20,20}},
          rotation=90), iconTransformation(
          extent={{0,0},{0,0}},
          rotation=90,
          origin={-100,60})));
  public
    replaceable PowertrainMounts.TwoSystemRigidMount engineTransmissionMount
      constrainedby PowertrainMounts.Interfaces.DualSystemMount
      "Engine and Transmission mounting system" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-100,-55},{-40,-40}}, rotation=0)));
    replaceable PowertrainMounts.SingleSystemRigidMount diffMount constrainedby
      PowertrainMounts.Interfaces.SingleSystemMount
      "Differential mounting system" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{0,-54},{10,-40}}, rotation=0)));
    replaceable Drivers.MinimalDriver driver constrainedby
      Drivers.Interfaces.Base "Driver model"
                     annotation (
      choicesAllMatching=true,
      Dialog(group="Driver Models"),
      Placement(transformation(extent={{-70,60},{-40,90}}, rotation=0)));
  equation
    connect(accessories.engineFlange, engine.accessoryFlange) annotation (Line(
          points={{-130,-5},{-110,-5}}, color={0,0,0}));
    connect(engine.transmissionFlange, transmission.engineFlange)
      annotation (Line(points={{-80,-5},{-60,-5}}, color={0,0,0}));
    connect(transmission.drivelineFlange, driveline.transmissionFlange)
      annotation (Line(points={{-30,-5},{-10,-5}}, color={0,0,0}));
    connect(chassis.wheelHub_2, driveline.wheelHub_2) annotation (Line(
        points={{53.125,10},{53.125,25},{-4,25},{-4,10}},
        color={135,135,135},
        thickness=0.5));
    connect(driveline.wheelHub_4, chassis.wheelHub_4) annotation (Line(
        points={{14,10},{14,20},{86.875,20},{86.875,10}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_4, brakes.wheelHub_4) annotation (Line(
        points={{86.875,10},{86.875,20},{144,20},{144,10}},
        color={135,135,135},
        thickness=0.5));
    connect(brakes.wheelHub_2, chassis.wheelHub_2) annotation (Line(
        points={{126,10},{126,25},{53.125,25},{53.125,10}},
        color={135,135,135},
        thickness=0.5));
    connect(driveline.wheelHub_3, chassis.wheelHub_3) annotation (Line(
        points={{14,-20},{14,-45},{86.875,-45},{86.875,-30}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_1, driveline.wheelHub_1) annotation (Line(
        points={{53.125,-30},{53.125,-70},{-4,-70},{-4,-20}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_3, brakes.wheelHub_3) annotation (Line(
        points={{86.875,-30},{86.875,-45},{144,-45},{144,-20}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_1, brakes.wheelHub_1) annotation (Line(
        points={{53.125,-30},{53.125,-70},{126,-70},{126,-20}},
        color={135,135,135},
        thickness=0.5));
    connect(controlBus, engine.controlBus) annotation (Line(
        points={{-160,40},{-120,40},{-120,4},{-110,4}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, transmission.controlBus) annotation (Line(
        points={{-160,40},{-67,40},{-67,4},{-60,4}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, driveline.controlBus) annotation (Line(
        points={{-160,40},{-20,40},{-20,4},{-10,4}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, chassis.controlBus) annotation (Line(
        points={{-160,40},{34,40},{34,2},{40.375,2}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, brakes.controlBus) annotation (Line(
        points={{-160,40},{110,40},{110,4},{120,4}},
        color={255,204,51},
        thickness=0.5));
    connect(accessories.controlBus, controlBus) annotation (Line(
        points={{-150,1},{-160,1},{-160,40}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, driverEnvironment.controlBus) annotation (Line(
        points={{-160,40},{80,40},{80,84},{30,84}},
        color={255,204,51},
        thickness=0.5));
    connect(driverEnvironment.acceleratorPedal, engine.acceleratorPedal)
      annotation (Line(points={{3,60},{3,50},{-95,50},{-95,10}}, color={0,127,0}));
    connect(driverEnvironment.brakePedal, brakes.brakePedal) annotation (Line(
          points={{21,60},{21,50},{135,50},{135,10}}, color={0,127,0}));
    connect(driverEnvironment.steeringWheel, chassis.steeringWheel) annotation (Line(
          points={{30,75},{70,75},{70,10}}, color={0,0,0}));
    connect(driverEnvironment.chassisFrame, chassis.chassisFrame) annotation (Line(
        points={{27,60},{27,-24},{40,-24}},
        color={95,95,95},
        thickness=0.5));
    connect(engineTransmissionMount.chassisFrame, chassis.chassisFrame)
      annotation (Line(
        points={{-70,-55},{-70,-65},{27,-65},{27,-24},{40,-24}},
        color={95,95,95},
        thickness=0.5));
    connect(diffMount.chassisFrame, chassis.chassisFrame) annotation (Line(
        points={{5,-54},{5,-65},{27,-65},{27,-24},{40,-24}},
        color={95,95,95},
        thickness=0.5));
    connect(engineTransmissionMount.mount_2, transmission.transmissionMount)
      annotation (Line(
        points={{-50,-40},{-50,-30},{-45,-30},{-45,-20}},
        color={95,95,95},
        thickness=0.5));
    connect(engineTransmissionMount.mount_1, engine.engineMount) annotation (Line(
        points={{-90,-40},{-90,-30},{-95,-30},{-95,-20}},
        color={95,95,95},
        thickness=0.5));
    connect(diffMount.mount_1, driveline.drivelineMount) annotation (Line(
        points={{5,-40},{5,-20}},
        color={95,95,95},
        thickness=0.5));

    connect(driverEnvironment.driverInterface, driver.driverInterface)
      annotation (Line(
        points={{0,75},{-20,75},{-20,75},{-40,75}},
        color={85,85,255},
        thickness=0.5,
        smooth=Smooth.None));
    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-160,-100},{160,100}},
          grid={1,1},
          initialScale=0.1), graphics),
      Documentation(info="<html>
<p>Example model architecture of a rear wheel drive passenger car with an automatic transmission.  In this architecture variant the PowerTrain systems can be elastically mounted in the chassis when MultiBody effects are included.</p>
</html>"),
      experiment(StopTime=10));
  end RearWheelDriveAutomaticVehicle;

  model ConventionalAutomaticVehicleExternalDriver
    "Conventional automatic transmission vehicle using separate driver and driver-interface components"
    extends Modelica.Icons.Example;

    replaceable Engines.MinimalEngine engine constrainedby
      VehicleInterfaces.Engines.Interfaces.Base "Engine subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-110,-30},{-80,0}}, rotation=0)));
    replaceable Transmissions.SingleGearAutomaticTransmission transmission
      constrainedby
      VehicleInterfaces.Transmissions.Interfaces.BaseAutomaticTransmission
      "Transmission subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-60,-30},{-30,0}}, rotation=0)));
    replaceable Chassis.MinimalChassis chassis constrainedby
      VehicleInterfaces.Chassis.Interfaces.TwoAxleBase "Chassis subsystem"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{40,-40},{100,0}}, rotation=0)));
    replaceable Drivelines.MinimalDriveline driveline constrainedby
      VehicleInterfaces.Drivelines.Interfaces.TwoAxleBase "Driveline subsystem"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-10,-30},{20,0}}, rotation=0)));
    replaceable Brakes.MinimalBrakes brakes constrainedby
      VehicleInterfaces.Brakes.Interfaces.TwoAxleBase "Brakes subsystem"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{120,-30},{150,0}}, rotation=0)));
    replaceable Accessories.MinimalAccessories accessories constrainedby
      VehicleInterfaces.Accessories.Interfaces.Base "Accessories subsystem"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-145,-25},{-125,-5}}, rotation=0)));
    replaceable
      VehicleInterfaces.DriverEnvironments.DriveByWireAutomaticExternalDriver
      driverEnvironment constrainedby
      VehicleInterfaces.DriverEnvironments.Interfaces.BaseAutomaticTransmissionExternalDriver
      "Driver environment" annotation (
      choicesAllMatching=true,
      Dialog(group="Driver Models"),
      Placement(transformation(extent={{0,50},{30,80}}, rotation=0)));
    inner replaceable Roads.FlatRoad road constrainedby
      VehicleInterfaces.Roads.Interfaces.Base "Road model" annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-120,-100},{-80,-80}}, rotation=0)));
    inner replaceable Atmospheres.ConstantAtmosphere atmosphere constrainedby
      VehicleInterfaces.Atmospheres.Interfaces.Base "Atmospheric model"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-70,-100},{-30,-80}}, rotation=0)));
    inner replaceable Modelica.Mechanics.MultiBody.World world(
      enableAnimation=false,
      n={0,0,-1},
      driveTrainMechanics3D=false)
      constrainedby Modelica.Mechanics.MultiBody.World
      "Global co-ordinate system" annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-150,-100},{-130,-80}}, rotation=0)));
  protected
    Interfaces.ControlBus controlBus "Control bus connector"
      annotation (Placement(transformation(
          origin={-150,20},
          extent={{-20,-20},{20,20}},
          rotation=90), iconTransformation(
          extent={{0,0},{0,0}},
          rotation=90,
          origin={-100,60})));
  public
    replaceable Drivers.MinimalDriver driver constrainedby
      Drivers.Interfaces.Base "Driver model"
                     annotation (
      Dialog(group="Driver Models"),
      choicesAllMatching=true,
      Placement(transformation(extent={{-40,55},{-20,75}}, rotation=0)));
  equation
    connect(accessories.engineFlange, engine.accessoryFlange) annotation (Line(
          points={{-125,-15},{-110,-15}}, color={0,0,0}));
    connect(engine.transmissionFlange, transmission.engineFlange) annotation (Line(
          points={{-80,-15},{-60,-15}}, color={0,0,0}));
    connect(transmission.drivelineFlange, driveline.transmissionFlange)
      annotation (Line(points={{-30,-15},{-10,-15}}, color={0,0,0}));
    connect(chassis.wheelHub_2, driveline.wheelHub_2) annotation (Line(
        points={{53.125,0},{53.125,15},{-4,15},{-4,0}},
        color={135,135,135},
        thickness=0.5));
    connect(driveline.wheelHub_4, chassis.wheelHub_4) annotation (Line(
        points={{14,0},{14,10},{86.875,10},{86.875,0}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_4, brakes.wheelHub_4) annotation (Line(
        points={{86.875,0},{86.875,10},{144,10},{144,0}},
        color={135,135,135},
        thickness=0.5));
    connect(brakes.wheelHub_2, chassis.wheelHub_2) annotation (Line(
        points={{126,0},{126,15},{53.125,15},{53.125,0}},
        color={135,135,135},
        thickness=0.5));
    connect(driveline.wheelHub_3, chassis.wheelHub_3) annotation (Line(
        points={{14,-30},{14,-55},{86.875,-55},{86.875,-40}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_1, driveline.wheelHub_1) annotation (Line(
        points={{53.125,-40},{53.125,-60},{-4,-60},{-4,-30}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_3, brakes.wheelHub_3) annotation (Line(
        points={{86.875,-40},{86.875,-55},{144,-55},{144,-30}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_1, brakes.wheelHub_1) annotation (Line(
        points={{53.125,-40},{53.125,-60},{126,-60},{126,-30}},
        color={135,135,135},
        thickness=0.5));
    connect(controlBus, engine.controlBus) annotation (Line(
        points={{-150,20},{-120,20},{-120,-6},{-110,-6}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, transmission.controlBus) annotation (Line(
        points={{-150,20},{-70,20},{-70,-6},{-60,-6}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, driveline.controlBus) annotation (Line(
        points={{-150,20},{-20,20},{-20,-6},{-10,-6}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, chassis.controlBus) annotation (Line(
        points={{-150,20},{34,20},{34,-8},{40.375,-8}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, brakes.controlBus) annotation (Line(
        points={{-150,20},{110,20},{110,-6},{120,-6}},
        color={255,204,51},
        thickness=0.5));
    connect(accessories.controlBus, controlBus) annotation (Line(
        points={{-145,-9},{-150,-9},{-150,20}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, driverEnvironment.controlBus) annotation (Line(
        points={{-150,20},{80,20},{80,74},{30,74}},
        color={255,204,51},
        thickness=0.5));
    connect(driveline.drivelineMount, chassis.chassisFrame) annotation (Line(
        points={{5,-30},{5,-34},{40,-34}},
        color={95,95,95},
        thickness=0.5));
    connect(transmission.transmissionMount, chassis.chassisFrame) annotation (Line(
        points={{-45,-30},{-45,-34},{40,-34}},
        color={95,95,95},
        thickness=0.5));
    connect(engine.engineMount, chassis.chassisFrame) annotation (Line(
        points={{-95,-30},{-95,-34},{40,-34}},
        color={95,95,95},
        thickness=0.5));
    connect(driverEnvironment.acceleratorPedal, engine.acceleratorPedal)
      annotation (Line(points={{3,50},{3,40},{-95,40},{-95,0}}, color={0,127,0}));
    connect(driverEnvironment.brakePedal, brakes.brakePedal) annotation (Line(
          points={{21,50},{21,40},{135,40},{135,0}}, color={0,127,0}));
    connect(driverEnvironment.steeringWheel, chassis.steeringWheel) annotation (Line(
          points={{30,65},{70,65},{70,0}}, color={0,0,0}));
    connect(driverEnvironment.chassisFrame, chassis.chassisFrame) annotation (Line(
        points={{27,50},{27,-34},{40,-34}},
        color={95,95,95},
        thickness=0.5));

    connect(driverEnvironment.driverInterface, driver.driverInterface)
      annotation (Line(
        points={{0,65},{-20,65}},
        color={85,85,255},
        thickness=0.5,
        smooth=Smooth.None));
    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-160,-100},{160,100}},
          grid={1,1},
          initialScale=0.1), graphics),
      Documentation(info="<html>
<p>Example model architecture of a passenger car with an automatic transmission and a driver model that is defined separately from the driverEnvironment.  In this architecture variant the PowerTrain systems are rigidly mounted to the chassis when MultiBody effects are included.</p>
</html>"),
      experiment(StopTime=10));
  end ConventionalAutomaticVehicleExternalDriver;

  model ConventionalManualVehicle "Conventional manual transmission vehicle"
    extends Modelica.Icons.Example;

    replaceable Engines.MinimalEngineUsingPedal engine constrainedby
      VehicleInterfaces.Engines.Interfaces.Base "Engine subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-110,-30},{-80,0}}, rotation=0)));
    replaceable Transmissions.SingleGearManualTransmission transmission(
      clutch(
        phi_rel(fixed=true, start=0)))
      constrainedby
      VehicleInterfaces.Transmissions.Interfaces.BaseManualTransmission
      "Transmission subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-60,-30},{-30,0}}, rotation=0)));
    replaceable Chassis.MinimalChassis chassis(
      body(v(fixed=true)))
      constrainedby VehicleInterfaces.Chassis.Interfaces.TwoAxleBase
      "Chassis subsystem"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{40,-40},{100,0}}, rotation=0)));
    replaceable Drivelines.MinimalDriveline driveline constrainedby
      VehicleInterfaces.Drivelines.Interfaces.TwoAxleBase "Driveline subsystem"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-10,-30},{20,0}}, rotation=0)));
    replaceable Brakes.MinimalBrakesUsingPedal brakes constrainedby
      VehicleInterfaces.Brakes.Interfaces.TwoAxleBase "Brakes subsystem"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{120,-30},{150,0}}, rotation=0)));
    replaceable Accessories.MinimalAccessories accessories constrainedby
      VehicleInterfaces.Accessories.Interfaces.Base "Accessory subsystem"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-145,-25},{-125,-5}}, rotation=0)));
    replaceable DriverEnvironments.ConventionalManual driverEnvironment(
      acceleratorPosition(v(fixed=true)),
      brakePosition(v(fixed=true)),
      clutchPosition(v(fixed=true)))
      constrainedby
      VehicleInterfaces.DriverEnvironments.Interfaces.BaseManualTransmission
      "Driver environment" annotation (
      choicesAllMatching=true,
      Dialog(group="Driver Models"),
      Placement(transformation(extent={{0,50},{30,80}}, rotation=0)));
    inner replaceable Roads.FlatRoad road constrainedby
      VehicleInterfaces.Roads.Interfaces.Base "Road model" annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-120,-100},{-80,-80}}, rotation=0)));
    inner replaceable Atmospheres.ConstantAtmosphere atmosphere constrainedby
      VehicleInterfaces.Atmospheres.Interfaces.Base "Atmospheric model"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-70,-100},{-30,-80}}, rotation=0)));
    inner replaceable Modelica.Mechanics.MultiBody.World world(
      enableAnimation=false,
      n={0,0,-1},
      driveTrainMechanics3D=false)
      constrainedby Modelica.Mechanics.MultiBody.World
      "Global co-ordinate system" annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-150,-100},{-130,-80}}, rotation=0)));
  protected
    Interfaces.ControlBus controlBus "Control bus connector"
      annotation (Placement(transformation(
          origin={-150,20},
          extent={{-20,-20},{20,20}},
          rotation=90), iconTransformation(
          extent={{0,0},{0,0}},
          rotation=90,
          origin={-100,60})));
  equation
    connect(accessories.engineFlange, engine.accessoryFlange) annotation (Line(
          points={{-125,-15},{-110,-15}}, color={0,0,0}));
    connect(engine.transmissionFlange, transmission.engineFlange) annotation (Line(
          points={{-80,-15},{-60,-15}}, color={0,0,0}));
    connect(transmission.drivelineFlange, driveline.transmissionFlange)
      annotation (Line(points={{-30,-15},{-10,-15}}, color={0,0,0}));
    connect(chassis.wheelHub_2, driveline.wheelHub_2) annotation (Line(
        points={{53.125,0},{53.125,15},{-4,15},{-4,0}},
        color={135,135,135},
        thickness=0.5));
    connect(driveline.wheelHub_4, chassis.wheelHub_4) annotation (Line(
        points={{14,0},{14,10},{86.875,10},{86.875,0}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_4, brakes.wheelHub_4) annotation (Line(
        points={{86.875,0},{86.875,10},{144,10},{144,0}},
        color={135,135,135},
        thickness=0.5));
    connect(brakes.wheelHub_2, chassis.wheelHub_2) annotation (Line(
        points={{126,0},{126,15},{53.125,15},{53.125,0}},
        color={135,135,135},
        thickness=0.5));
    connect(driveline.wheelHub_3, chassis.wheelHub_3) annotation (Line(
        points={{14,-30},{14,-50},{86.875,-50},{86.875,-40}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_1, driveline.wheelHub_1) annotation (Line(
        points={{53.125,-40},{53.125,-55},{-4,-55},{-4,-30}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_3, brakes.wheelHub_3) annotation (Line(
        points={{86.875,-40},{86.875,-50},{144,-50},{144,-30}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_1, brakes.wheelHub_1) annotation (Line(
        points={{53.125,-40},{53.125,-55},{126,-55},{126,-30}},
        color={135,135,135},
        thickness=0.5));
    connect(controlBus, engine.controlBus) annotation (Line(
        points={{-150,20},{-120,20},{-120,-6},{-110,-6}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, transmission.controlBus) annotation (Line(
        points={{-150,20},{-70,20},{-70,-6},{-60,-6}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, driveline.controlBus) annotation (Line(
        points={{-150,20},{-20,20},{-20,-6},{-10,-6}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, chassis.controlBus) annotation (Line(
        points={{-150,20},{34,20},{34,-8},{40.375,-8}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, brakes.controlBus) annotation (Line(
        points={{-150,20},{110,20},{110,-6},{120,-6}},
        color={255,204,51},
        thickness=0.5));
    connect(accessories.controlBus, controlBus) annotation (Line(
        points={{-145,-9},{-150,-9},{-150,20}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, driverEnvironment.controlBus) annotation (Line(
        points={{-150,20},{80,20},{80,74},{30,74}},
        color={255,204,51},
        thickness=0.5));
    connect(driveline.drivelineMount, chassis.chassisFrame) annotation (Line(
        points={{5,-30},{5,-34},{40,-34}},
        color={95,95,95},
        thickness=0.5));
    connect(transmission.transmissionMount, chassis.chassisFrame) annotation (Line(
        points={{-45,-30},{-45,-34},{40,-34}},
        color={95,95,95},
        thickness=0.5));
    connect(engine.engineMount, chassis.chassisFrame) annotation (Line(
        points={{-95,-30},{-95,-34},{40,-34}},
        color={95,95,95},
        thickness=0.5));
    connect(driverEnvironment.acceleratorPedal, engine.acceleratorPedal)
      annotation (Line(points={{3,50},{3,40},{-95,40},{-95,0}}, color={0,127,0}));
    connect(driverEnvironment.brakePedal, brakes.brakePedal) annotation (Line(
          points={{21,50},{21,40},{135,40},{135,0}}, color={0,127,0}));
    connect(driverEnvironment.steeringWheel, chassis.steeringWheel) annotation (Line(
          points={{30,65},{70,65},{70,0}}, color={0,0,0}));
    connect(driverEnvironment.chassisFrame, chassis.chassisFrame) annotation (Line(
        points={{27,50},{27,-34},{40,-34}},
        color={95,95,95},
        thickness=0.5));
    connect(driverEnvironment.shiftConnector, transmission.shiftConnector)
      annotation (Line(points={{15,50},{15,30},{-45,30},{-45,0}}, color={0,0,0}));
    connect(driverEnvironment.clutchPedal, transmission.clutchPedal)
      annotation (Line(points={{9,50},{9,35},{-54,35},{-54,0}}, color={0,127,0}));

    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-160,-100},{160,100}},
          grid={1,1},
          initialScale=0.1), graphics),
      Documentation(info="<html>
<p>Example model architecture of a passenger car with a manual transmission.  In this architecture variant the PowerTrain systems are rigidly mounted to the chassis when MultiBody effects are included.</p>
</html>"),
      experiment(StopTime=10));
  end ConventionalManualVehicle;

  model FrontWheelDriveManualVehicle
    "A conventional front-wheel drive manual transmission vehicle including the powertrain mounting systems"
    extends Modelica.Icons.Example;

    replaceable Engines.MinimalEngineUsingPedal engine constrainedby
      VehicleInterfaces.Engines.Interfaces.Base "Engine subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-110,-20},{-80,10}}, rotation=0)));
    replaceable Transmissions.SingleGearManualTransmission transmission(
      clutch(
        phi_rel(fixed=true)))
      constrainedby
      VehicleInterfaces.Transmissions.Interfaces.BaseManualTransmission
      "Transmission subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-60,-20},{-30,10}}, rotation=0)));
    replaceable Chassis.MinimalChassis3 chassis(
      constraint(v(fixed=true)))
      constrainedby VehicleInterfaces.Chassis.Interfaces.TwoAxleBase
      "Chassis subsystem"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{40,-30},{100,10}}, rotation=0)));
    replaceable Drivelines.MinimalDriveline driveline(usingMultiBodyChassis=
          true) constrainedby
      VehicleInterfaces.Drivelines.Interfaces.TwoAxleBase "Driveline subsystem"
                            annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-10,-20},{20,10}}, rotation=0)));
    replaceable Brakes.MinimalBrakesUsingPedal brakes(usingMultiBodyChassis=
          true) constrainedby VehicleInterfaces.Brakes.Interfaces.TwoAxleBase
      "Brakes subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{120,-20},{150,10}}, rotation=0)));
    replaceable Accessories.MinimalAccessories accessories constrainedby
      VehicleInterfaces.Accessories.Interfaces.Base "Accesories subsystem"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-144,-15},{-124,5}}, rotation=0)));
    replaceable DriverEnvironments.ConventionalManual driverEnvironment(
      acceleratorPosition(v(fixed=true)),
      clutchPosition(v(fixed=true)),
      brakePosition(v(fixed=true)))
      constrainedby
      VehicleInterfaces.DriverEnvironments.Interfaces.BaseManualTransmission
      "Driver environment" annotation (
      choicesAllMatching=true,
      Dialog(group="Driver Models"),
      Placement(transformation(extent={{0,60},{30,90}}, rotation=0)));
    inner replaceable Roads.FlatRoad road constrainedby
      VehicleInterfaces.Roads.Interfaces.Base "Road models" annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-120,-100},{-80,-80}}, rotation=0)));
    inner replaceable Atmospheres.ConstantAtmosphere atmosphere constrainedby
      VehicleInterfaces.Atmospheres.Interfaces.Base "Atmospheric model"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-70,-100},{-30,-80}}, rotation=0)));
    inner replaceable Modelica.Mechanics.MultiBody.World world(
      enableAnimation=false,
      n={0,0,-1},
      driveTrainMechanics3D=true)
      constrainedby Modelica.Mechanics.MultiBody.World
      "Global co-ordinate system" annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-150,-100},{-130,-80}}, rotation=0)));
  protected
    Interfaces.ControlBus controlBus "Control bus connector"
      annotation (Placement(transformation(
          origin={-150,30},
          extent={{-20,-20},{20,20}},
          rotation=90), iconTransformation(
          extent={{0,0},{0,0}},
          rotation=90,
          origin={-100,60})));
  public
    replaceable PowertrainMounts.ThreeSystemRigidMount powertrainMounts
      constrainedby PowertrainMounts.Interfaces.TripleSystemMount
      "Powertrain mounting system" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-60,-55},{-30,-40}}, rotation=0)));
  equation
    connect(accessories.engineFlange, engine.accessoryFlange) annotation (Line(
          points={{-124,-5},{-110,-5}}, color={0,0,0}));
    connect(engine.transmissionFlange, transmission.engineFlange)
      annotation (Line(points={{-80,-5},{-60,-5}}, color={0,0,0}));
    connect(transmission.drivelineFlange, driveline.transmissionFlange)
      annotation (Line(points={{-30,-5},{-10,-5}}, color={0,0,0}));
    connect(chassis.wheelHub_2, driveline.wheelHub_2) annotation (Line(
        points={{53.125,10},{53.125,25},{-4,25},{-4,10}},
        color={135,135,135},
        thickness=0.5));
    connect(driveline.wheelHub_4, chassis.wheelHub_4) annotation (Line(
        points={{14,10},{14,20},{86.875,20},{86.875,10}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_4, brakes.wheelHub_4) annotation (Line(
        points={{86.875,10},{86.875,20},{144,20},{144,10}},
        color={135,135,135},
        thickness=0.5));
    connect(brakes.wheelHub_2, chassis.wheelHub_2) annotation (Line(
        points={{126,10},{126,25},{53.125,25},{53.125,10}},
        color={135,135,135},
        thickness=0.5));
    connect(driveline.wheelHub_3, chassis.wheelHub_3) annotation (Line(
        points={{14,-20},{14,-40},{86.875,-40},{86.875,-30}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_1, driveline.wheelHub_1) annotation (Line(
        points={{53.125,-30},{53.125,-45},{-4,-45},{-4,-20}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_3, brakes.wheelHub_3) annotation (Line(
        points={{86.875,-30},{86.875,-40},{144,-40},{144,-20}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_1, brakes.wheelHub_1) annotation (Line(
        points={{53.125,-30},{53.125,-45},{126,-45},{126,-20}},
        color={135,135,135},
        thickness=0.5));
    connect(controlBus, engine.controlBus) annotation (Line(
        points={{-150,30},{-120,30},{-120,4},{-110,4}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, transmission.controlBus) annotation (Line(
        points={{-150,30},{-70,30},{-70,4},{-60,4}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, driveline.controlBus) annotation (Line(
        points={{-150,30},{-20,30},{-20,4},{-10,4}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, chassis.controlBus) annotation (Line(
        points={{-150,30},{34,30},{34,2},{40.375,2}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, brakes.controlBus) annotation (Line(
        points={{-150,30},{110,30},{110,4},{120,4}},
        color={255,204,51},
        thickness=0.5));
    connect(accessories.controlBus, controlBus) annotation (Line(
        points={{-144,1},{-150,1},{-150,30}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, driverEnvironment.controlBus) annotation (Line(
        points={{-150,30},{80,30},{80,84},{30,84}},
        color={255,204,51},
        thickness=0.5));
    connect(driverEnvironment.acceleratorPedal, engine.acceleratorPedal)
      annotation (Line(points={{3,60},{3,50},{-95,50},{-95,10}}, color={0,127,0}));
    connect(driverEnvironment.clutchPedal, transmission.clutchPedal)
      annotation (Line(points={{9,60},{9,47},{-54,47},{-54,10}}, color={0,127,0}));
    connect(driverEnvironment.shiftConnector, transmission.shiftConnector)
      annotation (Line(points={{15,60},{15,44},{-45,44},{-45,10}}, color={0,0,0}));
    connect(driverEnvironment.brakePedal, brakes.brakePedal) annotation (Line(
          points={{21,60},{21,50},{135,50},{135,10}}, color={0,127,0}));
    connect(driverEnvironment.steeringWheel, chassis.steeringWheel) annotation (Line(
          points={{30,75},{70,75},{70,10}}, color={0,0,0}));
    connect(driverEnvironment.chassisFrame, chassis.chassisFrame) annotation (Line(
        points={{27,60},{27,-24},{40,-24}},
        color={95,95,95},
        thickness=0.5));
    connect(powertrainMounts.chassisFrame, chassis.chassisFrame) annotation (Line(
        points={{-45,-55},{-45,-60},{27,-60},{27,-24},{40,-24}},
        color={95,95,95},
        thickness=0.5));
    connect(engine.engineMount, powertrainMounts.mount_1) annotation (Line(
        points={{-95,-20},{-95,-30},{-54,-30},{-54,-40}},
        color={95,95,95},
        thickness=0.5));
    connect(transmission.transmissionMount, powertrainMounts.mount_2)
      annotation (Line(
        points={{-45,-20},{-45,-40}},
        color={95,95,95},
        thickness=0.5));
    connect(driveline.drivelineMount, powertrainMounts.mount_3) annotation (Line(
        points={{5,-20},{5,-30},{-36,-30},{-36,-40}},
        color={95,95,95},
        thickness=0.5));

    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-150,-100},{170,100}},
          grid={1,1},
          initialScale=0.1), graphics),
      Documentation(info="<html>
<p>Example model architecture of a front wheel drive passenger car with an automatic transmission.  In this architecture variant the PowerTrain systems can be elastically mounted in the chassis when MultiBody effects are included.</p>
</html>"),
      experiment(StopTime=10));
  end FrontWheelDriveManualVehicle;

  model PowerSplitHybrid "Power-split hybrid vehicle model"
    extends VehicleInterfaces.Examples.PartialVehicle(chassis(body(v(fixed=true))));
    replaceable Engines.MinimalEngine engine(
      flywheel(phi(fixed=true)))
      constrainedby VehicleInterfaces.Engines.Interfaces.Base
      "Engine subsystem"                                           annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-100,60},{-70,90}}, rotation=0)));
    replaceable Accessories.MinimalAccessories accessories constrainedby
      VehicleInterfaces.Accessories.Interfaces.Base "Accessories subsystem"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-141,65},{-121,85}}, rotation=0)));
    replaceable VehicleInterfaces.ElectricDrives.SimpleMotorDC motor1(
      inductor(
        i(start=0, fixed=true)))
      constrainedby ElectricDrives.Interfaces.BaseDCMachine "Electric Motor 1"
                                                                 annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-101,26},{-71,-6}}, rotation=0)));
    replaceable VehicleInterfaces.ElectricDrives.SimpleMotorDC motor2(
      inductor(
        i(start=0, fixed=true)))
      constrainedby ElectricDrives.Interfaces.BaseDCMachine "Electric Motor 2"
                                                                 annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-101,-67},{-71,-39}},rotation=0)));
    replaceable Transmissions.PowerSplitDevice powerSplitDevice constrainedby
      Transmissions.Interfaces.BaseTwoInputTransmission "Power-split device"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-54,-40},{-24,-10}},rotation=0)));
    replaceable EnergyStorage.Battery battery(V=1)
      constrainedby EnergyStorage.Interfaces.Base "Energy storage subsystem"
                                                               annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-141,-36},{-111,-6}},  rotation=0)));
    Modelica.Electrical.Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{-114,-65},{-94,-45}},
            rotation=0)));
  equation
    connect(accessories.engineFlange, engine.accessoryFlange) annotation (Line(
          points={{-121,75},{-100,75}}, color={0,0,0},
        thickness=0.5));
    connect(controlBus, engine.controlBus) annotation (Line(
        points={{-150,30},{-110,30},{-110,84},{-100,84}},
        color={255,204,51},
        thickness=0.5));
    connect(accessories.controlBus, controlBus) annotation (Line(
        points={{-141,81},{-150,81},{-150,30}},
        color={255,204,51},
        thickness=0.5));
    connect(driverEnvironment.acceleratorPedal, engine.acceleratorPedal)
      annotation (Line(points={{23,50},{23,44},{-40,44},{-40,100},{-85,100},{
            -85,90}}, color={0,127,0}));
    connect(motor2.shaft_b, driveline.transmissionFlange) annotation (Line(
        points={{-71,-53},{-15,-53},{-15,-25},{-6,-25}},
        color={135,135,135},
        pattern=LinePattern.None,
        thickness=0.5));
    connect(motor1.controlBus, controlBus) annotation (Line(
        points={{-101,19.6},{-110,20},{-110,30},{-150,30}},
        color={255,204,51},
        pattern=LinePattern.None,
        thickness=0.5));
    connect(motor2.controlBus, controlBus) annotation (Line(
        points={{-101,-61.4},{-150,-61.4},{-150,30}},
        color={255,204,51},
        pattern=LinePattern.None,
        thickness=0.5));
    connect(powerSplitDevice.drivelineFlange, driveline.transmissionFlange)
      annotation (Line(
        points={{-24,-25},{-6,-25}},
        color={135,135,135},
        thickness=0.5,
        smooth=Smooth.None));
    connect(powerSplitDevice.motorFlange, motor1.shaft_b) annotation (Line(
        points={{-54,-34},{-65,-34},{-65,10},{-71,10}},
        color={0,127,0},
        thickness=0.5,
        smooth=Smooth.None));
    connect(powerSplitDevice.engineFlange, engine.transmissionFlange)
      annotation (Line(
        points={{-54,-25},{-62,-25},{-62,75},{-70,75}},
        color={135,135,135},
        thickness=0.5,
        smooth=Smooth.None));
    connect(powerSplitDevice.controlBus, controlBus) annotation (Line(
        points={{-54,-16},{-54,30},{-150,30}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(battery.pin_p, motor1.pin_p) annotation (Line(
        points={{-111,-12},{-77,-12},{-77,-6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(battery.pin_n, motor1.pin_n) annotation (Line(
        points={{-111,-30},{-95,-30},{-95,-6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(battery.pin_p, motor2.pin_p) annotation (Line(
        points={{-111,-12},{-77,-12},{-77,-39}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(battery.pin_n, motor2.pin_n) annotation (Line(
        points={{-111,-30},{-95,-30},{-95,-39}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ground.p, battery.pin_n) annotation (Line(
        points={{-104,-45},{-104,-30},{-111,-30}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(battery.controlBus, controlBus.batteryBus) annotation (Line(
        points={{-141,-30},{-150,-30},{-150,30}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(engine.engineMount, chassis.chassisFrame) annotation (Line(
        points={{-85,60},{-85,40},{31,40},{31,-44},{44,-44}},
        color={95,95,95},
        thickness=0.5));
    connect(powerSplitDevice.transmissionMount, chassis.chassisFrame) annotation (Line(
        points={{-39,-40},{-39,-47},{31,-47},{31,-44},{44,-44}},
        color={95,95,95},
        thickness=0.5));

    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-160,-100},{160,100}},
          grid={1,1},
          initialScale=0.1), graphics),
      Documentation(info="<html>
<p>Example model architecture of a passenger car with a power-split hybrid powertrain.  In this architecture variant the PowerTrain systems are rigidly mounted to the chassis when MultiBody effects are included.</p>
</html>"),
      experiment(StopTime=10));
  end PowerSplitHybrid;

  model SeriesHybrid "Series hybrid vehicle model"
    extends VehicleInterfaces.Examples.PartialVehicle(
    redeclare DriverEnvironments.DriveByWireAutomatic driverEnvironment(
        initialAccelRequest=0,
        finalAccelRequest=0.9,
        accelTime=2),
        chassis(body(v(fixed=true))));
    replaceable Engines.MinimalEngine engine(
      flywheel(phi(fixed=true)))
      constrainedby VehicleInterfaces.Engines.Interfaces.Base "Engine model"
                                                               annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-98,50},{-68,80}},  rotation=0)));
    replaceable Accessories.MinimalAccessories accessories constrainedby
      VehicleInterfaces.Accessories.Interfaces.Base "Accessories model"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-138,55},{-118,75}}, rotation=0)));
    replaceable VehicleInterfaces.ElectricDrives.SimpleMotorDC generator(
      inductor(i(start=0, fixed=true)))
      constrainedby ElectricDrives.Interfaces.BaseDCMachine
      "Generator subsystem"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-20,80},{-50,50}}, rotation=0)));
    replaceable VehicleInterfaces.ElectricDrives.SimpleMotorDC driveMotor(
      inductor(i(start=0, fixed=true)))
      constrainedby ElectricDrives.Interfaces.BaseDCMachine
      "Traction motor subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-70,-40},{-40,-10}}, rotation=0)));
    replaceable EnergyStorage.Battery battery(V=1)
                                              constrainedby
      EnergyStorage.Interfaces.Base "Energy storage subsystem" annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-130,-6},{-100,24}},rotation=0)));
    Modelica.Electrical.Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{-100,-24},{-80,-4}},
            rotation=0)));
  equation
    connect(controlBus, engine.controlBus) annotation (Line(
        points={{-150,30},{-109,30},{-109,74},{-98,74}},
        color={255,204,51},
        thickness=0.5));
    connect(accessories.controlBus, controlBus) annotation (Line(
        points={{-138,71},{-150,71},{-150,30}},
        color={255,204,51},
        thickness=0.5));
    connect(driverEnvironment.acceleratorPedal, engine.acceleratorPedal)
      annotation (Line(points={{23,50},{23,44},{0,44},{0,90},{-83,90},{-83,80}},
          color={0,127,0}));
    connect(driveMotor.shaft_b, driveline.transmissionFlange) annotation (Line(
        points={{-40,-25},{-6,-25}},
        color={135,135,135},
        pattern=LinePattern.None,
        thickness=0.5));
    connect(generator.controlBus, controlBus) annotation (Line(
        points={{-20,74},{-12,74},{-12,30},{-150,30}},
        color={255,204,51},
        pattern=LinePattern.None,
        thickness=0.5));
    connect(driveMotor.controlBus, controlBus) annotation (Line(
        points={{-70,-34},{-150,-34},{-150,30}},
        color={255,204,51},
        pattern=LinePattern.None,
        thickness=0.5));
    connect(generator.shaft_b, engine.transmissionFlange) annotation (Line(
        points={{-50,65},{-68,65}},
        color={135,135,135},
        pattern=LinePattern.None,
        thickness=0.5));
    connect(battery.pin_p, generator.pin_p) annotation (Line(
        points={{-100,18},{-44,18},{-44,50}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(battery.pin_p, driveMotor.pin_p) annotation (Line(
        points={{-100,18},{-46,18},{-46,-10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(battery.pin_n, driveMotor.pin_n) annotation (Line(
        points={{-100,0},{-64,0},{-64,-10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(battery.pin_n, generator.pin_n) annotation (Line(
        points={{-100,0},{-26,0},{-26,50}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(battery.pin_n, ground.p) annotation (Line(
        points={{-100,0},{-90,0},{-90,-4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(battery.controlBus, controlBus.batteryBus) annotation (Line(
        points={{-130,0},{-150,0},{-150,30}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(accessories.engineFlange, engine.accessoryFlange) annotation (Line(
        points={{-118,65},{-98,65}},
        color={135,135,135},
        thickness=0.5,
        smooth=Smooth.None));
    connect(engine.engineMount, chassis.chassisFrame) annotation (Line(
        points={{-83,50},{-83,40},{27,40},{27,-44},{44,-44}},
        color={95,95,95},
        thickness=0.5));

    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-160,-100},{160,100}},
          grid={1,1},
          initialScale=0.1), graphics),
      Documentation(info="<html>
<p>Example model architecture of a passenger car with a series hybrid powertrain.  In this architecture variant the PowerTrain systems are rigidly mounted to the chassis when MultiBody effects are included.</p>
</html>"),
      experiment(StopTime=10));
  end SeriesHybrid;

  partial model PartialVehicle
    "Basic model for a four wheeled vehicle, requires powertrain components"
    extends Modelica.Icons.Example;

    replaceable Chassis.MinimalChassis chassis constrainedby
      VehicleInterfaces.Chassis.Interfaces.TwoAxleBase "Chassis subsystem"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{44,-50},{104,-10}},rotation=0)));
    replaceable Drivelines.MinimalDriveline driveline constrainedby
      VehicleInterfaces.Drivelines.Interfaces.TwoAxleBase "Driveline subsystem"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{-6,-40},{24,-10}},rotation=0)));
    replaceable Brakes.MinimalBrakes brakes constrainedby
      VehicleInterfaces.Brakes.Interfaces.TwoAxleBase "Brakes subsystem"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Plant Models"),
      Placement(transformation(extent={{120,-40},{150,-10}},rotation=0)));
    replaceable DriverEnvironments.DriveByWireAutomatic driverEnvironment
      constrainedby
      VehicleInterfaces.DriverEnvironments.Interfaces.BaseAutomaticTransmission
      "Driver environment" annotation (
      choicesAllMatching=true,
      Dialog(group="Driver Models"),
      Placement(transformation(extent={{20,50},{50,80}},  rotation=0)));
    inner replaceable Roads.FlatRoad road constrainedby
      VehicleInterfaces.Roads.Interfaces.Base "Road model" annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-120,-100},{-80,-80}}, rotation=0)));
    inner replaceable Atmospheres.ConstantAtmosphere atmosphere constrainedby
      VehicleInterfaces.Atmospheres.Interfaces.Base "Atmospheric model"
      annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-70,-100},{-30,-80}}, rotation=0)));
    inner replaceable Modelica.Mechanics.MultiBody.World world(
      enableAnimation=false,
      n={0,0,-1},
      driveTrainMechanics3D=false)
      constrainedby Modelica.Mechanics.MultiBody.World
      "Global co-ordinate system" annotation (
      choicesAllMatching=true,
      Dialog(group="Conditions"),
      Placement(transformation(extent={{-150,-100},{-130,-80}}, rotation=0)));
  protected
    Interfaces.ControlBus controlBus "Control bus connector"
      annotation (Placement(transformation(
          origin={-150,30},
          extent={{-20,-20},{20,20}},
          rotation=90), iconTransformation(
          extent={{0,0},{0,0}},
          rotation=90,
          origin={-100,60})));
  equation
    connect(chassis.wheelHub_2, driveline.wheelHub_2) annotation (Line(
        points={{57.125,-10},{57.125,5},{0,5},{0,-10}},
        color={135,135,135},
        thickness=0.5));
    connect(driveline.wheelHub_4, chassis.wheelHub_4) annotation (Line(
        points={{18,-10},{18,0},{90.875,0},{90.875,-10}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_4, brakes.wheelHub_4) annotation (Line(
        points={{90.875,-10},{90.875,0},{144,0},{144,-10}},
        color={135,135,135},
        thickness=0.5));
    connect(brakes.wheelHub_2, chassis.wheelHub_2) annotation (Line(
        points={{126,-10},{126,5},{57.125,5},{57.125,-10}},
        color={135,135,135},
        thickness=0.5));
    connect(driveline.wheelHub_3, chassis.wheelHub_3) annotation (Line(
        points={{18,-40},{18,-60},{90.875,-60},{90.875,-50}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_1, driveline.wheelHub_1) annotation (Line(
        points={{57.125,-50},{57.125,-65},{0,-65},{0,-40}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_3, brakes.wheelHub_3) annotation (Line(
        points={{90.875,-50},{90.875,-60},{144,-60},{144,-40}},
        color={135,135,135},
        thickness=0.5));
    connect(chassis.wheelHub_1, brakes.wheelHub_1) annotation (Line(
        points={{57.125,-50},{57.125,-65},{126,-65},{126,-40}},
        color={135,135,135},
        thickness=0.5));
    connect(controlBus, driveline.controlBus) annotation (Line(
        points={{-150,30},{-10,30},{-10,-16},{-6,-16}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, chassis.controlBus) annotation (Line(
        points={{-150,30},{40,30},{40,-18},{44.375,-18}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, brakes.controlBus) annotation (Line(
        points={{-150,30},{115,30},{115,-16},{120,-16}},
        color={255,204,51},
        thickness=0.5));
    connect(controlBus, driverEnvironment.controlBus) annotation (Line(
        points={{-150,30},{80,30},{80,74},{50,74}},
        color={255,204,51},
        thickness=0.5));
    connect(driveline.drivelineMount, chassis.chassisFrame) annotation (Line(
        points={{9,-40},{9,-47},{31,-47},{31,-44},{44,-44}},
        color={95,95,95},
        thickness=0.5));
    connect(driverEnvironment.brakePedal, brakes.brakePedal) annotation (Line(
          points={{41,50},{41,44},{135,44},{135,-10}},color={0,127,0}));
    connect(driverEnvironment.steeringWheel, chassis.steeringWheel) annotation (Line(
          points={{50,65},{74,65},{74,-10}},color={0,0,0}));
    connect(driverEnvironment.chassisFrame, chassis.chassisFrame) annotation (Line(
        points={{47,50},{47,40},{31,40},{31,-44},{44,-44}},
        color={95,95,95},
        thickness=0.5));

    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-160,-100},{160,100}},
          grid={1,1},
          initialScale=0.1), graphics),
      Documentation(info="<html>
<p>Base model architecture of a passenger car that can be extended to add any type of powertrain.  In this architecture variant the Driveline subsystem is rigidly mounted to the chassis when MultiBody effects are included.</p>
</html>"));
  end PartialVehicle;

  annotation (Protection(allowDuplicate=true),Documentation(info="<html>
<p>Example vehicle model architectures.  These can be used as the basis for your own vehicle models but are also fully functional vehicle models on their own.</p>
</html>"));
end Examples;
