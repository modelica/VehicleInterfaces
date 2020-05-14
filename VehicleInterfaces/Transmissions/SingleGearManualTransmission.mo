within VehicleInterfaces.Transmissions;
model SingleGearManualTransmission
  "Simple fixed gear ratio, manual transmission, uses physical connectors"
  import VehicleInterfaces;
  extends VehicleInterfaces.Icons.Transmission;
  extends Interfaces.BaseManualTransmission(
    includeMount=world.driveTrainMechanics3D,
    includeManualShiftConnector=true,
    includeClutchPedal=true);

  parameter Real gearRatio=4 "Gear ratio";

  Modelica.Mechanics.Rotational.Components.IdealGear gear(
    ratio=gearRatio,
    useSupport=true)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Parts.Mounting1D mounting1D
    annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor outputSpeed
    annotation (Placement(transformation(
        origin={70,40},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  VehicleInterfaces.Interfaces.ShiftOutput shiftOutput
    annotation (Placement(transformation(
        origin={0,76},
        extent={{-6,-6},{6,6}},
        rotation=270)));
  Modelica.Mechanics.Rotational.Components.Clutch clutch(fn_max=1)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed
    annotation (Placement(transformation(
        origin={-80,46},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor
    annotation (Placement(transformation(extent={{-80,36},{-60,56}})));
  Modelica.Mechanics.Translational.Components.SpringDamper pedalSpring(c=1, d=1)
    annotation (Placement(transformation(
        origin={-60,76},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Blocks.Sources.BooleanExpression clutchLocked(y=clutch.locked)
    annotation (Placement(transformation(extent={{40,10},{20,30}})));
protected
  VehicleInterfaces.Interfaces.TransmissionBus transmissionBus
    annotation (Placement(transformation(extent={{-30,30},{-10,50}})));
  VehicleInterfaces.Interfaces.TransmissionControlBus transmissionControlBus
    annotation (Placement(transformation(extent={{-30,50},{-10,70}})));
  outer Modelica.Mechanics.MultiBody.World world;
public
  Modelica.Blocks.Math.Gain normalise(k=1/clutch.fn_max)
    annotation (Placement(transformation(
        origin={-70,23},
        extent={{-5,-4},{5,4}},
        rotation=270)));
equation
  connect(mounting1D.flange_b,gear.support)
    annotation (Line(points={{0,-50},{0,-10}}));
  connect(mounting1D.frame_a, transmissionMount) annotation (Line(
      points={{-10,-60},{-10,-80},{0,-80},{0,-100}},
      color={95,95,95},
      thickness=0.5));
  connect(gear.flange_b,outputSpeed.flange) annotation (Line(points={{10,0},
          {80,0},{80,40}}));
  connect(shiftConnector, shiftOutput.shiftConnector) annotation (Line(points={{0,100},
          {0,82},{1.10218e-015,82}}));
  connect(clutch.flange_b, gear.flange_a)
    annotation (Line(points={{-60,0},{-10,0}}));
  connect(forceSensor.flange_a,fixed.flange) annotation (Line(points={{-80,
          46},{-80,46}}, color={0,127,0}));
  connect(clutchPedal, pedalSpring.flange_b) annotation (Line(points={{-60,
          100},{-60,86}}, color={0,127,0}));
  connect(pedalSpring.flange_a, forceSensor.flange_b) annotation (Line(points=
         {{-60,66},{-60,46}}, color={0,127,0}));
  connect(clutchLocked.y, transmissionBus.clutchLocked) annotation (Line(
        points={{19,20},{0,20},{0,38},{-19.95,38},{-19.95,40.05}},
        color={255,0,255}));
  connect(controlBus.transmissionBus, transmissionBus) annotation (Line(
      points={{-100.1,60.1},{-20,60.1},{-20,40}},
      color={255,204,51},
      thickness=0.5));
  connect(clutch.flange_a, engineFlange.flange)
    annotation (Line(points={{-80,0},{-90,0},{-90,0.05},{-99.95,0.05}}));
  connect(gear.flange_b, drivelineFlange.flange)
    annotation (Line(points={{10,0},{100,0},{100,0.05},{100.05,0.05}}));
  connect(transmissionControlBus, controlBus.transmissionControlBus)
    annotation (Line(
      points={{-20,60},{-20,60.1},{-100.1,60.1}},
      color={255,204,51},
      thickness=0.5));
  connect(shiftOutput.gear, transmissionControlBus.currentGear) annotation (Line(
        points={{-1.2124e-015,69.4},{-1.2124e-015,60},{-20,60}}, color={255,127,0}));
  connect(forceSensor.f, normalise.u) annotation (Line(
      points={{-78,35},{-78,32},{-70,32},{-70,29}},
      color={0,0,127}));
  connect(normalise.y, clutch.f_normalized) annotation (Line(
      points={{-70,17.5},{-70,11}},
      color={0,0,127}));
  connect(outputSpeed.w, transmissionBus.outputSpeed) annotation (Line(
      points={{59,40},{20,40},{20,40.05},{-19.95,40.05}},
      color={0,0,127}));

  annotation (
    Documentation(info="<html>
<p>
A&nbsp;single gear transmission based on the manual transmission model
interface definition. Includes a clutch model and uses physical connections
between the driver and transmission system for the clutch position and
current gear number (although the gear number is ignored in this model.
</p>
</html>"));
end SingleGearManualTransmission;
