within ;
package VehicleInterfaces "VehicleInterfaces Library (Version 2.0.0) - Interface definitions and architectures for vehicle system modeling"
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
    version="2.0.0",
    versionBuild=1,
    versionDate="2020-06-26",
    dateModified = "2020-06-26 10:00:00Z",
    revisionId="$Format:%h %ci$",
    uses(Modelica(version="4.0.0")),
    conversion(
      from(version="1.0", script="modelica://VehicleInterfaces/Resources/Scripts/Dymola/ConvertVehicleInterfaces_from_1.0_to_1.1.mos"),
      noneFromVersion="1.1",
      noneFromVersion="1.1.1",
      noneFromVersion="1.1.2",
      noneFromVersion="1.2",
      noneFromVersion="1.2.1",
      noneFromVersion="1.2.2",
      noneFromVersion="1.2.3",
      noneFromVersion="1.2.4",
      from(version="1.2.5", script="modelica://VehicleInterfaces/Resources/Scripts/Dymola/ConvertVehicleInterfaces_from_1.2.5_to_2.0.0.mos")),
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
</html>"));
end VehicleInterfaces;
