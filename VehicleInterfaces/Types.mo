within VehicleInterfaces;
package Types "Collection of type definitions"
  extends Modelica.Icons.TypesPackage;

  type NormalizedReal = Modelica.Icons.TypeReal (
      final quantity="",
      final unit="1",
      final displayUnit="1",
      final min=0,
      final max=1) "Normalized real number";
  type Gear = Modelica.Icons.TypeInteger (final quantity="gear")
    "Gear ...,-2,-1,0,1,2,... = 2nd rear, 1st rear, neutral, 1st, 2nd forward, etc";

  package GearMode
    "Type, constants and menu choices for gear mode, as temporary solution until enumerations are available"

    // type GearMode = enumeration(Park, Drive, Neutral, Rear, Manual, Limited);

    constant Integer Park=1;
    constant Integer Drive=2;
    constant Integer Neutral=3;
    constant Integer Rear=4;
    constant Integer Manual=5;
    constant Integer Limited=6;

    type Temp
      "Temporary type of gear mode with choices for menus (until enumerations are available)"

      extends Integer(min=1,max=6);
      annotation (choices(
          choice=VehicleInterfaces.Types.GearMode.Park "Park",
          choice=VehicleInterfaces.Types.GearMode.Drive "Drive",
          choice=VehicleInterfaces.Types.GearMode.Neutral "Neutral",
          choice=VehicleInterfaces.Types.GearMode.Rear "Rear",
          choice=VehicleInterfaces.Types.GearMode.Manual "Manual",
          choice=VehicleInterfaces.Types.GearMode.Limited "Limited"));
    end Temp;
    annotation (preferredView="text",
      Icon(
        graphics={
          Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={255,0,128},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-94,94},{94,-94}},
            textColor={255,0,128},
            textString="e")}));
  end GearMode;

  package IgnitionSetting
    "Type, constants and menu choices for ignition setting, as temporary solution until enumerations are available"

    // type IgnitionSetting = enumeration(Off, On, Start);

    constant Integer Off=1 "Ignition is off";
    constant Integer On=2 "Ignition is on";
    constant Integer Start=3
      "Ignition is on and driver requires to start engine";

    type Temp
      "Temporary type of ignition setting with choices for menus (until enumerations are available)"

      extends Integer(min=1,max=3);
      annotation (choices(
          choice=VehicleInterfaces.Types.GearMode.Off "Off",
          choice=VehicleInterfaces.Types.GearMode.On "On",
          choice=VehicleInterfaces.Types.GearMode.Start "Start"));
    end Temp;
    annotation (preferredView="text",
      Icon(
        graphics={
          Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={255,0,128},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-94,94},{94,-94}},
            textColor={255,0,128},
            textString="e")}));
  end IgnitionSetting;

  annotation (Documentation(info="<html>
<p>Type definitions required by the library.</p>
</html>"));
end Types;
