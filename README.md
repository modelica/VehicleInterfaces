# VehicleInterfaces Library

Free library from the Modelica Association for interface definitions and architectures for vehicle system modeling

## Library description

This Modelica library provides standard interface definitions for automotive subsystems and vehicle models. These are designed to promote compatibility between the various automotive libraries and provide a flexible, powerful structure for vehicle modelling. The main focus of the library is on defining the interfaces for the individual subsystems and a number of vehicle model examples are included to demonstrate how they might be used.

![VehicleInterfaces](VehicleInterfaces/Resources/Images/conventionalVehicle.png)

For an automotive library to be compatible with other libraries based on this set of interface definitions they should extend the interface definition from within this library and following the naming convention for the signal bus.

This library also contains a proposal for a naming convention covering the whole model library and the developers of this library would recommend that this convention is followed by other developers to ensure a consistent naming convention across the whole set of automotive models.

## Current release

Download [VehicleInterfaces v2.0.0 (2020-06-26)](../../releases/tag/v2.0.0)

#### Release notes
* [Version v1.2.5 (2019-03-06)](../../releases/tag/v1.2.5)
  * This version requires the <b>[Modelica 3.2.3](https://github.com/modelica/ModelicaStandardLibrary/releases/tag/v3.2.3)</b> Library.
  * This version is backwards compatible to versions&nbsp;1.1.x and 1.2.x of the VehicleInterfaces library.
  * Blocks marked as obsolete: VehicleInterfaces.Blocks.RealPassThrough, VehicleInterfaces.Blocks.IntegerPassThrough, VehicleInterfaces.Blocks.BooleanPassThrough
  * Resolved usage of obsolete block in VehicleInterfaces.DriverEnvironments.DriveByWireAutomaticExternalDriver
  * Deleted text string from icons of VehicleInterfaces.Mechanics.NormalisedTranslational.Interfaces.Flange and VehicleInterfaces.Mechanics.NormalisedRotational.Interfaces.Flange
  * Restructured Images and Scripts directories to match Modelica Standard Library conventions, removed unused files
* [Version v1.2.4 (2016-03-02)](../../releases/tag/v1.2.4)
  * This version is backwards compatible to versions 1.1.x and 1.2.x
  * Typos in the documentation fixed.
  * FillPattern graphical annotations corrected in a variety of Icons.
  * Icon `VehicleInterfaces.Icons.VariantLibrary` marked as obsolete and no more used. Using `Modelica.Icons.VariantsPackage` instead.
  * Copyright upgraded in `VehicleInterfaces.UsersGuide.License`.
* [Version v1.2.3 (2015-09-09)](../../releases/tag/v1.2.3)
  * This version is backwards compatible to versions 1.1.x and 1.2.x
  * #3: Typos in the documentation fixed.
  * #4: Illegal inheritance fixed.
  * #5: Some LinePattern graphical annotations corrected:
      * `Examples.PowerSplitHybrid`
      * `Examples.SeriesHybridConverting`
      * `Icons.DataDictionary`
  * #5: Bitmap.extent corrected in `Icons.Driver`
* [Version v1.2.2 (2014-06-30)](../../releases/tag/v1.2.2)
  * Further adaption to the conventions of the Modelica Specification 3.2 Revision 2, removal of Dymola specific visualization.
  * Clean-up of superfluous annotations and HTML syntax and links
* [Version v1.2.1 (2013-10-01)](../../releases/tag/v1.2.1)
  * Adapted to the conventions of the *Modelica Standard Library 3.2.1*.

## License
Copyright &copy; 2005-2013, Dassault Syst&egrave;mes, DLR and Modelon

Copyright &copy; 2013- Modelica Association

This Modelica package is free software and the use is completely at your own risk;
it can be redistributed and/or modified under the terms of the [Modelica License 1.1](https://modelica.org/licenses/ModelicaLicense1.1).

## Development and contribution
The devolopment is organised by individual members of the [Modelica Association](https://www.modelica.org/association).

You may report any issues with using the [Issues](https://github.com/modelica/VehicleInterfaces/issues) button.

Contributions in shape of [Pull Requests](https://github.com/modelica/VehicleInterfaces/pulls) are always welcome.
