within ;
package VehicleInterfacesTestConversion2

  package Accessories
    model Issue38 "Conversion test for issue #38"
      VehicleInterfaces.Accessories.MinimalAccessories accessoriesPositive(
        accessoriesLoad=10) annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
      VehicleInterfaces.Accessories.MinimalAccessories accessoriesNegative(
        accessoriesLoad=-10) annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
      Modelica.Mechanics.Rotational.Components.Inertia inertia1 annotation (Placement(transformation(extent={{20,-10},{40,10}})));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearingAdaptor adaptor1(
        includeBearingConnector=true) annotation (Placement(transformation(extent={{-10,30},{10,50}})));
      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearingAdaptor adaptor2(
        includeBearingConnector=true) annotation (Placement(transformation(extent={{-10,-30},{10,-50}})));
      Modelica.Mechanics.MultiBody.Parts.Fixed fixed1(animation=false) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=180,
            origin={-30,0})));
    equation
      connect(accessoriesPositive.engineFlange, adaptor1.flangeAndFrame) annotation (Line(
          points={{-20,40},{-10,40}},
          color={135,135,135},
          thickness=0.5));
      connect(accessoriesNegative.engineFlange, adaptor2.flangeAndFrame) annotation (Line(
          points={{-20,-40},{-10,-40}},
          color={135,135,135},
          thickness=0.5));
      connect(adaptor1.flange,inertia1. flange_a) annotation (Line(points={{0,40},{10,40},{10,0},{20,0}},
          color={0,0,0}));
      connect(fixed1.frame_b,adaptor1. frame) annotation (Line(
          points={{-20,0},{0,0},{0,30}},
          color={95,95,95},
          thickness=0.5));
      connect(adaptor2.frame, fixed1.frame_b) annotation (Line(
          points={{0,-30},{0,0},{-20,0}},
          color={95,95,95},
          thickness=0.5));
      connect(adaptor2.flange, inertia1.flange_a) annotation (Line(points={{0,-40},{10,-40},{10,0},{20,0}}, color={0,0,0}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
    end Issue38;

    partial model Issue56 "Conversion test for issue #56"
      extends VehicleInterfaces.Accessories.Interfaces.Base(
        includeAccessoriesBearing=true);
    end Issue56;
  end Accessories;

  package Blocks
    model Issue58 "Conversion test for issue #58"
      VehicleInterfaces.Blocks.RealPassThrough realPassThrough annotation (Placement(transformation(extent={{-10,40},{10,60}})));
      VehicleInterfaces.Blocks.IntegerPassThrough integerPassThrough annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
      VehicleInterfaces.Blocks.BooleanPassThrough booleanPassThrough annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));
      Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
      Modelica.Blocks.Sources.IntegerConstant integerConstant(k=0) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
      Modelica.Blocks.Sources.BooleanConstant booleanConstant annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
    equation
      connect(const.y, realPassThrough.u) annotation (Line(points={{-39,50},{-12,50}}, color={0,0,127}));
      connect(integerConstant.y, integerPassThrough.u) annotation (Line(points={{-39,0},{-26,0},{-26,0},{-12,0}}, color={255,127,0}));
      connect(booleanConstant.y, booleanPassThrough.u) annotation (Line(points={{-39,-50},{-26,-50},{-26,-50},{-12,-50}}, color={255,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
    end Issue58;
  end Blocks;

  package Interfaces

    model Issue28 "Conversion test for issue #28"
      VehicleInterfaces.Interfaces.ControlBus controlBus annotation (Placement(transformation(
      extent={{-20,-20},{20,20}},
      rotation=90,
      origin={-100,0})));
    protected
      VehicleInterfaces.Brakes.Interfaces.StandardBus brakesBus annotation (Placement(transformation(extent={{-70,10},{-50,30}})));
      VehicleInterfaces.Chassis.Interfaces.StandardBus chassisBus annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
      VehicleInterfaces.DriverEnvironments.Interfaces.MinimalBus driverEnvironmentsMinimalBus annotation (Placement(transformation(extent={{-10,10},{10,30}})));
      VehicleInterfaces.DriverEnvironments.Interfaces.BusForAutomaticTransmission driverEnvironmentsBusAT annotation (Placement(transformation(extent={{20,10},{40,30}})));
      VehicleInterfaces.DriverEnvironments.Interfaces.BusForManualTransmission driverEnvironmentsBusMT annotation (Placement(transformation(extent={{50,10},{70,30}})));
      VehicleInterfaces.Drivers.Interfaces.MinimalBus driversMinimalBus annotation (Placement(transformation(extent={{-70,70},{-50,90}})));
      VehicleInterfaces.Drivers.Interfaces.BusForAutomaticTransmission driversBusAT annotation (Placement(transformation(extent={{-40,70},{-20,90}})));
      VehicleInterfaces.Drivers.Interfaces.BusForManualTransmission driversBusMT annotation (Placement(transformation(extent={{-10,70},{10,90}})));
      VehicleInterfaces.Engines.Interfaces.StandardBus enginesBus annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
      VehicleInterfaces.Transmissions.Interfaces.StandardBus transmissionsBus annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
      VehicleInterfaces.Transmissions.Interfaces.StandardControlBus transmissionsControlBus annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
    equation
      connect(enginesBus, controlBus.engineBus) annotation (Line(
          points={{-30,-20},{-30,0.1},{-100.1,0.1}},
          color={255,204,51},
          thickness=0.5));
      connect(transmissionsBus, controlBus.transmissionBus) annotation (Line(
          points={{0,-20},{0,0.1},{-100.1,0.1}},
          color={255,204,51},
          thickness=0.5));
      connect(transmissionsControlBus, controlBus.transmissionControlBus) annotation (Line(
          points={{30,-20},{30,0},{-100.1,0},{-100.1,0.1}},
          color={255,204,51},
          thickness=0.5));
      connect(chassisBus, controlBus.chassisBus) annotation (Line(
          points={{-30,20},{-30,0.1},{-100.1,0.1}},
          color={255,204,51},
          thickness=0.5));
      connect(driverEnvironmentsMinimalBus, controlBus.driverBus) annotation (Line(
          points={{0,20},{0,0.1},{-100.1,0.1}},
          color={255,204,51},
          thickness=0.5));
      connect(driverEnvironmentsBusAT, controlBus.driverBus) annotation (Line(
          points={{30,20},{30,0.1},{-100.1,0.1}},
          color={255,204,51},
          thickness=0.5));
      connect(driverEnvironmentsBusMT, controlBus.driverBus) annotation (Line(
          points={{60,20},{60,0.1},{-100.1,0.1}},
          color={255,204,51},
          thickness=0.5));
      connect(brakesBus, controlBus.brakesBus) annotation (Line(
          points={{-60,20},{-60,0.1},{-100.1,0.1}},
          color={255,204,51},
          thickness=0.5));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
    end Issue28;
  end Interfaces;

  package Icons
    class Issue58_VariantLibrary "Conversion test for issue #58"
      extends VehicleInterfaces.Icons.VariantLibrary;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
    end Issue58_VariantLibrary;

    class Issue58_BaseClassPackage "Conversion test for issue #58"
      extends VehicleInterfaces.Icons.BaseClassPackage;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
    end Issue58_BaseClassPackage;
  end Icons;

  package Transmissions
    partial model PullRequest46 "Conversion test for PR #46"
      extends VehicleInterfaces.Transmissions.Interfaces.Base(includeTransmissionBearing=true);
    end PullRequest46;
  end Transmissions;

  package Roads

    model Issue70_BaseExtends "Conversion test for issue #70"
      extends VehicleInterfaces.Roads.Interfaces.Base(
        redeclare final function frictionCoefficient = testFrictionCoefficient (
          mue_fixed=mu_low));

      parameter Real mu_low=0.25;
    protected
      outer Modelica.Mechanics.MultiBody.World world;

      function testFrictionCoefficient
        "Determine friction coefficient at point on road"
        extends VehicleInterfaces.Roads.Interfaces.frictionCoefficientBase;
        input Real mue_fixed=1 "Friction coefficient";
      algorithm
        mue := mue_fixed;
      end testFrictionCoefficient;

    end Issue70_BaseExtends;

    model Issue70_CircleRoad "Conversion test for issue #70"
      inner VehicleInterfaces.Roads.CircleRoad road(
        mue=0.77, radius=100, width=5);
      Real friction;
    equation
      friction = road.frictionCoefficient(0,0);

    end Issue70_CircleRoad;

    model Issue70_FlatRoad "Conversion test for issue #70"
      inner VehicleInterfaces.Roads.FlatRoad road(
        mue=0.8);
      Real friction;
    equation
      friction = road.frictionCoefficient(0,0);

    end Issue70_FlatRoad;
  end Roads;
  annotation (
    uses(
      VehicleInterfaces(version="1.2.5")),
    Documentation(info="<html>
<p>
This library provides models and functions to test the VI v2.0.0 conversion script
\"ConvertVehicleInterfaces_from_1.2.5_to_2.0.0.mos\"
for conversion of Modelica libraries using VI v1.x.y to VI v2.0.0.
These models are not meant to be meaningful otherwise.
</p>
<p>
Copyright &copy; 2020, Modelica Association and contributors
</p>
<p>
<em>This Modelica package is <u>free</u> software and the use is completely at
<u>your own risk</u>; it can be redistributed and/or modified under the terms
of the 3-Clause BSD license. For license conditions (including the disclaimer
of warranty) visit
<a href=\"https://modelica.org/licenses/modelica-3-clause-bsd\">https://modelica.org/licenses/modelica-3-clause-bsd</a>.</em>
</p>
</html>"));
end VehicleInterfacesTestConversion2;
