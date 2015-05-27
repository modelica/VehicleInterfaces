# VehicleInterfaces Library

Free library from the Modelica Association for interface definitions and architectures for vehicle system modeling

## Library description

This Modelica library provides standard interface definitions for automotive subsystems and vehicle models. These are designed to promote compatibility between the various automotive libraries and provide a flexible, powerful structure for vehicle modelling. The main focus of the library is on defining the interfaces for the individual subsystems and a number of vehicle model examples are included to demonstrate how they might be used.

![VehicleInterfaces](VehicleInterfaces/Resources/Images/conventionalVehicle.png)

For an automotive library to be compatible with other libraries based on this set of interface definitions they should extend the interface definition from within this library and following the naming convention for the signal bus.

This library also contains a proposal for a naming convention covering the whole model library and the developers of this library would recommend that this convention is followed by other developers to ensure a consistent naming convention across the whole set of automotive models.

## Current release

Download [VehicleInterfaces v1.2.2 (2014-06-30)](../../releases/tag/v1.2.2)

#### Release notes

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
The devolopment is organised by the [Modelica Association](https://www.modelica.org/association).

You may report any issues with using the [Issues](../../issues) button.

Contributions in shape of [Pull Requests](../../pulls) are always welcome.
