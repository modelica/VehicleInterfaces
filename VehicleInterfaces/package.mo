within ;
package VehicleInterfaces "VehicleInterfaces Library (Version 2.0.2) - Interface definitions and architectures for vehicle system modeling"
  extends Modelica.Icons.Package;

  import Modelica.Units.SI;

  annotation (
    Protection(
      showDiagram=true,
      showText=true,
      showVariables=true,
      showDiagnostics=true,
      showStatistics=true,
      allowDuplicate=true),
    preferredView="info",
    version="2.0.2",
    versionDate="2025-03-21",
    dateModified = "2025-03-10 10:00:00Z",
    revisionId="$Format:%h %ci$",
    uses(Modelica(version="4.1.0")),
    conversion(
      from(
        version="1.0",
        script="modelica://VehicleInterfaces/Resources/Scripts/Dymola/ConvertVehicleInterfaces_from_1.0_to_1.1.mos",
        to="1.1"),
      from(
        version={"1.1", "1.1.1", "1.1.2", "1.2", "1.2.1", "1.2.2", "1.2.3", "1.2.4", "1.2.5"},
        script="modelica://VehicleInterfaces/Resources/Scripts/Dymola/ConvertVehicleInterfaces_from_1.2.5_to_2.0.0.mos"),
      noneFromVersion="2.0.0",
      noneFromVersion="2.0.1"),
    Documentation(info="<html>
<p>This Modelica library provides standard interface definitions for automotive subsystems and vehicle models.  These are designed to promote compatibility between the various automotive libraries and provide a flexible, powerful structure for vehicle modelling.  The main focus of the library is on defining the interfaces for the individual subsystems and a number of vehicle model examples are included to demonstrate how they might be used.</p>
<p>
<img src=\"modelica://VehicleInterfaces/Resources/Images/conventionalVehicle.png\" align=\"middle\">
</p>
<p>For an automotive library to be compatible with other libraries based on this set of interface definitions they should extend the interface definition from within this library and following the naming convention for the signal bus. </p>
<p>This library also contains a proposal for a naming convention covering the whole model library and the developers of this library would recommend that this convention is followed by other developers to ensure a consistent naming convention across the whole set of automotive models.</p>
<p>The library has been developed as a co-operation between a number of vendors who are currently developing automotive libraries. Please see <a href=\"modelica://VehicleInterfaces.UsersGuide.Contact\">the contact information</a> on how to give feedback and for a list of the people involved in the development of this library.
And last but not least, check also
<a href=\"modelica://VehicleInterfaces.UsersGuide.License\">Copyright and License agreement</a>
before using the library.</p>

<p>
<strong>Licensed by the Modelica Association under the 3-Clause BSD License</strong><br>
Copyright &copy; 2013-2025: Modelica Association and <a href=\"modelica://VehicleInterfaces.UsersGuide.Contact\">contributors</a>.<br>
Copyright &copy; 2005-2013: Dassault Syst&egrave;mes, DLR and Modelon.
</p>

<p>
<em>
This Modelica package is <u>free</u> software and the use is completely at
<u>your own risk</u>; it can be redistributed and/or modified under the terms of
the 3-Clause BSD license. For license conditions (including the disclaimer of
warranty) visit
<a href=\"https://modelica.org/licenses/modelica-3-clause-bsd\">https://modelica.org/licenses/modelica-3-clause-bsd</a>.
</em>
</p>

<p>
<strong>Modelica&reg;</strong> is a registered trademark of the Modelica Association.
</p>
</html>"));
end VehicleInterfaces;
