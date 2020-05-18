within VehicleInterfaces.Transmissions;
model SingleGearAutomaticTransmission
  "Simple fixed gear ratio, automatic transmission, no torque converter"
  extends VehicleInterfaces.Icons.Transmission;
  extends Interfaces.BaseAutomaticTransmission(includeMount=world.driveTrainMechanics3D);

  parameter Real gearRatio=4 "Gear ratio";

  Modelica.Mechanics.Rotational.Components.IdealGear gear(
    ratio=gearRatio,
    useSupport=true)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Parts.Mounting1D mounting1D
    annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor outputSpeed
    annotation (Placement(transformation(
        origin={70,60},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  Modelica.Blocks.Sources.IntegerConstant currentGear(k=1)
    annotation (Placement(transformation(extent={{40,80},{20,100}})));
protected
  VehicleInterfaces.Interfaces.TransmissionBus transmissionBus
    annotation (Placement(transformation(extent={{-30,50},{-10,70}})));
  VehicleInterfaces.Interfaces.TransmissionControlBus transmissionControlBus
    annotation (Placement(transformation(extent={{-30,80},{-10,100}})));
  outer Modelica.Mechanics.MultiBody.World world;
equation
  connect(mounting1D.flange_b,gear.support)
    annotation (Line(points={{0,-50},{0,-10}}));
  connect(mounting1D.frame_a, transmissionMount) annotation (Line(
      points={{-10,-60},{-10,-80},{0,-80},{0,-100}},
      color={95,95,95},
      thickness=0.5));
  connect(gear.flange_b,outputSpeed.flange) annotation (Line(points={{10,0},
          {80,0},{80,60}}));
  connect(controlBus.transmissionBus, transmissionBus) annotation (Line(
      points={{-100.1,60.1},{-60,60.1},{-60,60},{-20,60}},
      color={255,204,51},
      thickness=0.5));
  connect(transmissionControlBus, controlBus.transmissionControlBus)
    annotation (Line(
      points={{-20,90},{-20,90},{-20,60.1},{-100.1,60.1}},
      color={255,204,51},
      thickness=0.5));
  connect(currentGear.y, transmissionControlBus.currentGear) annotation (Line(
        points={{19,90},{-20,90}}, color={255,127,0}));
  connect(gear.flange_a, engineFlange.flange)
    annotation (Line(points={{-10,0},{-54,0},{-54,0.05},{-99.95,0.05}}));
  connect(gear.flange_b, drivelineFlange.flange)
    annotation (Line(points={{10,0},{100,0},{100,0.05},{100.05,0.05}}));
  connect(outputSpeed.w, transmissionBus.outputSpeed) annotation (Line(
      points={{59,60},{20,60},{20,60.05},{-19.95,60.05}},
      color={0,0,127}));
  annotation (
    Documentation(info="<html>
<p>
A&nbsp;single gear transmission without a&nbsp;launch device that is
based on the automatic transmission model interface definition.
</p>
</html>"));
end SingleGearAutomaticTransmission;
