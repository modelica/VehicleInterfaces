within ;
package VehicleInterfaces "VehicleInterfaces Library (Version 1.2.2) - Interface definitions and architectures for vehicle system modeling"
  extends Modelica.Icons.Package;

  import SI = Modelica.SIunits;

  annotation (
    Protection(
      showDiagram=true,
      showText=true,
      showVariables=true,
      showDiagnostics=true,
      showStatistics=true,
      allowDuplicate=true),
    preferredView="info",
    version="1.2.2",
    versionDate="2014-03-13",
    versionBuild=1,
    dateModified="2014-03-13",
    uses(Modelica(version="3.2.1")),
    conversion(
      from(version="1.0", script="modelica://VehicleInterfaces/Resources/Scripts/ConvertVehicleInterfaces_from_1.0_to_1.1.mos"),
      noneFromVersion="1.1",
      noneFromVersion="1.1.1",
      noneFromVersion="1.1.2",
      noneFromVersion="1.2",
      noneFromVersion="1.2.1"),
    Documentation(info="<html>
<p>This Modelica library provides standard interface definitions for automotive subsystems and vehicle models.  These are designed to promote compatibility between the various automotive libraries and provide a flexible, powerful structure for vehicle modelling.  The main focus of the library is on defining the interfaces for the individual subsystems and a number of vehicle model examples are included to demonstrate how they might be used.</p>
<p>
<img src=\"modelica://VehicleInterfaces/Resources/Images/conventionalVehicle.png\" align=\"middle\">
</p>
<p>For an automotive library to be compatible with other libraries based on this set of interface definitions they should extend the interface definition from within this library and following the naming convention for the signal bus. </p>
<p>This library also contains a proposal for a naming convention covering the whole model library and the developers of this library would recommend that this convention is followed by other developers to ensure a consistent naming convention across the whole set of automotive models.</p>

<p>
The complete documentation of the VehicleInterfaces library in pdf format
is available as <a href=\"modelica://VehicleInterfaces/Resources/Documentation/VehicleInterfaces.pdf\">VehicleInterfaces.pdf</a>
</p>

<p>The library has been developed as a co-operation between a number of vendors who are currently developing automotive libraries.  The developers can be contacted by emailing <a href=\"mailto://vi@claytex.com\">vi@claytex.com</a>, please see <a href=\"Modelica://VehicleInterfaces.UsersGuide.Acknowledgements\">acknowledgements</a> for a list of the people involved in the development of this library.</p>
<p>
Copyright &copy; 2005-2013, Dassault Syst&egrave;mes, DLR and Modelon
Copyright &copy; 2013-, Modelica Association
</p>
</html>"));
end VehicleInterfaces;
