within VehicleInterfaces.PowertrainMounts;
class Tutorial "Powertrain Mounts Tutorial"
  extends Modelica.Icons.Information;

  annotation (DocumentationClass=true,Documentation(info="<html>
<h4>Tutorial - Defining a new powertrain mounting system</h4>
<p>
The following process will demonstrate how to create a&nbsp;new powertrain
mounting system. In this example we will create a&nbsp;mounting system
for the engine and transmission systems where these two systems are rigidly
connected together.
</p>
<ol>
  <li>We are creating a&nbsp;powertrain mounting system to support
      two powertrain systems so we need to base our model on the
      <strong>DualSystemMount</strong> Interface definition. Start by
      extending this class
      <strong>VehicleInterfaces.PowertrainMounts.Interfaces.DualSystemMount</strong></li>
  <li>This interface definition contains 3 MultiBody connectors, the one
      called <strong>chassisFrame</strong> will be attached to the chassis
      subsystem in our vehicle model and is the chassis reference frame.
      The other two connectors, <strong>mount_1</strong> and
      <strong>mount_2</strong> are the reference frames for the two
      subsystems that this mounting system will support. In this case
      <strong>mount_1</strong> will be treated as the engine reference
      frame and <strong>mount_2</strong> as the transmission reference
      frame. The first step is to add a&nbsp;fixed translation
      (<strong>Modelica.Mechanics.MultiBody.Parts.FixedTranslation</strong>)
      between mount_1 and mount_2 to define the position of the
      transmisison reference frame relative to the engine reference frame.
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/PowertrainMounts/buildNewMounts1.png\">
      <br><br></li>
  <li>The next step is to define the mounting system. In this example we
      will utilise some components from the PowerTrain library to define
      the mounting system. The engine and transmission systems will be
      mounted by three elastic mounts. Start defining the mounting system
      by adding three fixed translation blocks that define the locations
      of the mounts relative to the chassisFrame.
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/PowertrainMounts/buildNewMounts2.png\">
      <br><br></li>
  <li>Add the elastic mount blocks, in this case they are defined in
      the PowerTrain library as <strong>PowerTrain.MountingSystems.Mount</strong>
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/PowertrainMounts/buildNewMounts3.png\">
      <br><br></li>
  <li>Finally add 3 more fixed translation blocks that define the location
      of the engine reference frame relative to each of the mount locations.
      <br><br>
      <img src=\"modelica://VehicleInterfaces/Resources/Images/PowertrainMounts/buildNewMounts4.png\">
      <br><br></li>
  <li>The model is now complete and should check correctly</li>
</ol>
</html>"));
end Tutorial;
