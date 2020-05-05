within VehicleInterfaces;
package Icons "Collection of icons"
  extends Modelica.Icons.IconsPackage;

  partial model Accessories "Icon for an accessories subsystem"

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{24,-32},{52,-60}},
            lineColor={0,0,0},
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-32,-56},{28,-56},{28,4},{78,84},{28,84},{-2,44},{-32,84},
                {-82,84},{-32,4},{-32,-56}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-72,24},{-32,-16}},
            lineColor={0,0,0},
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-12,-26},{8,-46}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Sphere,
            fillColor={170,170,255}),
          Ellipse(
            extent={{-56,76},{-42,62}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Sphere,
            fillColor={170,170,255}),
          Ellipse(
            extent={{30,-38},{46,-54}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Sphere,
            fillColor={170,170,255}),
          Ellipse(
            extent={{28,10},{48,-10}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Sphere,
            fillColor={170,170,255}),
          Ellipse(
            extent={{-62,14},{-42,-6}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Sphere,
            fillColor={170,170,255}),
          Ellipse(
            extent={{-24,18},{-10,4}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Sphere,
            fillColor={255,255,170}),
          Ellipse(
            extent={{6,26},{20,12}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Sphere,
            fillColor={255,255,170}),
          Line(points={{-8,-44},{-58,-4}}),
          Line(points={{-52,14},{-18,4}}),
          Line(points={{-12,16},{-56,66}}),
          Line(points={{-44,74},{8,14}}),
          Line(points={{14,12},{40,10}}),
          Line(points={{48,0},{46,-48}}),
          Line(points={{30,-46},{28,-24}}),
          Ellipse(
            extent={{14,-18},{28,-32}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Sphere,
            fillColor={255,255,170}),
          Line(points={{16,-20},{6,-42},{6,-42}}),
          Text(
            extent={{-100,-50},{100,-90}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid,
            textString="%name")}),
      Documentation(info="<html>
<p>
This partial class is intended to design a default icon for an <em>accessorier assembly</em>.
</p>
</html>"));
  end Accessories;

  partial model Atmosphere "Icon for an atmosphere"

    annotation (Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-200,-100},{200,100}},
          grid={2,2}), graphics={
          Rectangle(
            extent={{-200,100},{200,-100}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={201,210,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-166,29},{-132,5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-158,47},{-66,5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-150,57},{-116,33}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-142,19},{-108,-5}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-118,27},{-74,3}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-86,37},{-52,13}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-124,53},{-70,29}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{118,62},{177,2}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{109,32},{67,27},{69,18},{108,25},{109,26},{109,32}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{116,11},{89,-14},{95,-19},{120,5},{116,11}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{138,-6},{130,-38},{137,-40},{144,-8},{138,-6}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-200,200},{200,120}},
            lineColor={0,0,255},
            textString="%name")}), Documentation(info="<html>
<p>
This partial class is intended to design a default icon for an <em>atmosphere</em>.
</p>
</html>"));
  end Atmosphere;

  partial model Battery "Icon for a battery subsystem"

    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={1,1}), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Line(
            points={{88,60},{0,60},{0,10}},
            color={0,0,255}),
          Line(
            points={{-60,10},{-60,10},{60,10}},
            color={0,0,255}),
          Line(
            points={{-32,-10},{30,-10}},
            color={0,0,255}),
          Line(
            points={{0,-10},{0,-60},{90,-60}},
            color={0,0,255}),
          Text(
            extent={{-100,100},{100,62}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid,
            textString="%name")}),
      Documentation(info="<html>
<p>
This partial class is intended to design a default icon for a <em>batery model</em>.
</p>
</html>"));
  end Battery;

  partial model Brakes "Icon for a brakes subsystem"

    annotation (Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
              -100},{100,100}}), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-80,80},{80,-80}},
            lineColor={95,95,95},
            fillColor={186,186,186},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-46,46},{46,-46}},
            lineColor={95,95,95},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-28,28},{28,-28}},
            lineColor={95,95,95},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-10,10},{10,-10}},
            lineColor={0,0,0},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{22,30},{30,22}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-30,30},{-22,22}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{22,-22},{30,-30}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-30,-22},{-22,-30}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-100,-50},{100,-90}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid,
            textString="%name"),
          Polygon(
            points={{-88,-20},{-88,20},{-80,48},{-48,44},{-48,-44},{-80,-46},{
                -88,-20}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={215,215,215}),
          Line(
            points={{-66,10},{-80,10}},
            thickness=0.5),
          Line(
            points={{-54,-14},{-60,-10},{-60,10},{-54,14}},
            thickness=0.5),
          Line(
            points={{-64,30},{-80,30}},
            thickness=0.5),
          Line(
            points={{-64,-30},{-80,-30}},
            thickness=0.5),
          Line(
            points={{-66,-10},{-80,-10}},
            thickness=0.5)}),      Documentation(info="<html>
<p>
This partial class is intended to design a default icon for a <em>brakes assembly</em>.
</p>
</html>"));
  end Brakes;

  partial model Chassis "Icon for a chassis subsystem"

    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-160,-100},{160,100}},
          grid={1,1})),
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-160,-100},{160,100}},
          grid={1,1}), graphics={
          Rectangle(
            extent={{-160,100},{160,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-75,-10},{-135,-70}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-85,-20},{-125,-60}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-109,-36},{-101,-44}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-105,-22},{-105,-58},{-105,-40},{-90,-31},{-105,-40},{-90,
                -49},{-120,-31},{-105,-40},{-120,-48}},
            color={95,95,95},
            thickness=1),
          Ellipse(
            extent={{-100,-35},{-110,-45}},
            lineColor={95,95,95},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{120,-10},{60,-70}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{110,-20},{70,-60}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{86,-36},{94,-44}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Line(
            points={{90,-22},{90,-58},{90,-40},{105,-31},{90,-40},{105,-49},{75,
                -31},{90,-40},{75,-48}},
            color={95,95,95},
            thickness=1),
          Ellipse(
            extent={{95,-35},{85,-45}},
            lineColor={95,95,95},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-142,-36},{-149,-34},{-154,-22},{-154,-9},{-151,2},{-142,
                12},{-130,19},{-103,24},{-84,27},{-74,29},{-67,31},{-61,33},{-23,
                62},{-11,68},{2,70},{97,70},{115,64},{147,27},{150,23},{151,18},
                {151,0},{152,-4},{154,-7},{154,-16},{139,-35},{128,-35},{124,-23},
                {122,-19},{118,-15},{113,-10},{103,-5},{96,-3},{88,-3},{82,-4},
                {77,-5},{69,-10},{63,-15},{59,-20},{54,-28},{50,-35},{46,-38},{
                41,-39},{-62,-39},{-67,-35},{-69,-28},{-72,-22},{-77,-14},{-86,
                -8},{-92,-5},{-101,-3},{-109,-3},{-118,-5},{-128,-11},{-134,-17},
                {-139,-26},{-142,-36}},
            lineColor={95,95,95},
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{25,62},{11,26},{-39,23},{-41,36},{-20,54},{-6,61},{25,62}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{73,62},{39,62},{31,27},{83,30},{73,62}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{122,30},{105,30},{80,62},{91,62},{110,54},{120,38},{122,30}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Line(points={{77,62},{93,25},{89,8},{78,-2}}, color={95,95,95}),
          Line(points={{32,62},{19,18},{19,-15},{25,-33}}, color={95,95,95}),
          Line(points={{144,22},{87,22},{17,18},{-86,9}}, color={95,95,95}),
          Line(points={{-51,23},{-54,12},{-52,-14},{-48,-32}}, color={95,95,95}),
          Line(points={{61,-16},{-68,-15}}, color={95,95,95}),
          Polygon(points={{109,25},{98,25},{98,16},{109,16},{109,25}},
              lineColor={95,95,95}),
          Line(points={{154,-15},{145,-15},{120,-16},{151,-3}}, color={95,95,95}),
          Polygon(
            points={{-67,-35},{-62,-39},{41,-39},{46,-38},{50,-35},{52,-33},{-68,
                -33},{-67,-35}},
            lineColor={0,0,255},
            fillColor={255,255,85},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{128,-35},{139,-35},{155,-15},{119,-16},{123,-21},{128,-35}},
            lineColor={0,0,255},
            fillColor={255,255,85},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-142,-35},{-139,-26},{-136,-20},{-154,-20},{-154,-22},{-149,
                -34},{-142,-36},{-142,-35}},
            lineColor={0,0,0},
            fillColor={255,255,85},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-154,-9},{-151,2},{-146,8},{-145,2},{-147,-7},{-154,-9}},
            lineColor={95,95,95},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{151,-1},{146,0},{143,12},{151,17},{151,-1}},
            lineColor={95,95,95},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-41,36},{-47,30},{-48,25},{-46,23},{-39,23},{-41,36}},
            lineColor={0,0,0},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-143,-64},{146,-97}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid,
            textString="%name")}),
      Documentation(info="<html>
<p>
This partial class is intended to design a default icon for a <em>chassis assembly</em>.
</p>
</html>"));
  end Chassis;

  partial model Controller "Icon for a controller subsystem"

    annotation (Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
              -100},{100,100}}), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-4,-36},{74,20},{74,-2},{-4,-58},{-4,-36}},
            lineColor={95,95,95},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{8,-34},{28,-44},{20,-50},{0,-40},{8,-34}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{20,-50},{28,-44},{32,-52},{24,-58},{20,-50}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{24,-58},{32,-52},{32,-74},{24,-80},{24,-58}},
            lineColor={0,0,255},
            fillColor={255,255,127},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{0,-40},{20,-50},{24,-58},{24,-80},{22,-80},{22,-58},{20,-54},
                {0,-44},{0,-40}},
            lineColor={0,0,255},
            fillColor={191,191,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-14,44},{-18,36},{-10,42},{-8,48},{-14,44}},
            lineColor={128,128,128},
            fillColor={128,128,128},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-18,36},{-10,42},{-10,18},{-18,12},{-18,36}},
            lineColor={0,0,255},
            fillColor={255,255,127},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-20,14},{-20,36},{-16,44},{4,34},{4,30},{-16,40},{-18,36},
                {-18,12},{-20,14}},
            lineColor={0,0,255},
            fillColor={191,191,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-8,50},{12,40},{4,34},{-16,44},{-8,50}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-150,96},{150,56}},
            textString="%name",
            lineColor={0,0,255}),
          Polygon(
            points={{28,-18},{48,-28},{40,-34},{20,-24},{28,-18}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{40,-34},{48,-28},{52,-36},{44,-42},{40,-34}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{44,-42},{52,-36},{52,-58},{44,-64},{44,-42}},
            lineColor={0,0,255},
            fillColor={255,255,127},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{20,-24},{40,-34},{44,-42},{44,-64},{42,-64},{42,-42},{40,-38},
                {20,-28},{20,-24}},
            lineColor={0,0,255},
            fillColor={191,191,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{48,-4},{68,-14},{60,-20},{40,-10},{48,-4}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{60,-20},{68,-14},{72,-22},{64,-28},{60,-20}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{64,-28},{72,-22},{72,-44},{64,-50},{64,-28}},
            lineColor={0,0,255},
            fillColor={255,255,127},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{40,-10},{60,-20},{64,-28},{64,-50},{62,-50},{62,-28},{60,-24},
                {40,-14},{40,-10}},
            lineColor={0,0,255},
            fillColor={191,191,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{68,10},{88,0},{80,-6},{60,4},{68,10}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{80,-6},{88,0},{92,-8},{84,-14},{80,-6}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{84,-14},{92,-8},{92,-30},{84,-36},{84,-14}},
            lineColor={0,0,255},
            fillColor={255,255,127},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{60,4},{80,-6},{84,-14},{84,-36},{82,-36},{82,-14},{80,-10},
                {60,0},{60,4}},
            lineColor={0,0,255},
            fillColor={191,191,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-34,30},{-38,22},{-30,28},{-28,34},{-34,30}},
            lineColor={128,128,128},
            fillColor={128,128,128},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-38,22},{-30,28},{-30,4},{-38,-2},{-38,22}},
            lineColor={0,0,255},
            fillColor={255,255,127},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-40,0},{-40,22},{-36,30},{-16,20},{-16,16},{-36,26},{-38,
                22},{-38,-2},{-40,0}},
            lineColor={0,0,255},
            fillColor={191,191,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-28,36},{-8,26},{-16,20},{-36,30},{-28,36}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-54,16},{-58,8},{-50,14},{-48,20},{-54,16}},
            lineColor={128,128,128},
            fillColor={128,128,128},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-58,8},{-50,14},{-50,-10},{-58,-16},{-58,8}},
            lineColor={0,0,255},
            fillColor={255,255,127},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-60,-14},{-60,8},{-56,16},{-36,6},{-36,2},{-56,12},{-58,8},
                {-58,-16},{-60,-14}},
            lineColor={0,0,255},
            fillColor={191,191,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-48,22},{-28,12},{-36,6},{-56,16},{-48,22}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-74,0},{-78,-8},{-70,-2},{-68,4},{-74,0}},
            lineColor={128,128,128},
            fillColor={128,128,128},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-78,-8},{-70,-2},{-70,-26},{-78,-32},{-78,-8}},
            lineColor={0,0,255},
            fillColor={255,255,127},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-80,-30},{-80,-8},{-76,0},{-56,-10},{-56,-14},{-76,-4},{-78,
                -8},{-78,-32},{-80,-30}},
            lineColor={0,0,255},
            fillColor={191,191,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-68,6},{-48,-4},{-56,-10},{-76,0},{-68,6}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-64,-4},{-4,-36},{-4,-58},{-64,-26},{-64,-4}},
            lineColor={95,95,95},
            fillColor={75,75,75},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-64,-4},{-4,-36},{74,20},{14,52},{-64,-4}},
            lineColor={95,95,95},
            fillColor={160,160,164},
            fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>
This partial class is intended to design a default icon for <em>controllers</em>.
</p>
</html>"));
  end Controller;

  partial model DataDictionary "Icon for a data dictionary"

    annotation (                         Icon(coordinateSystem(preserveAspectRatio=false,
            extent={{-100,-100},{100,100}}), graphics={
          Ellipse(
            extent={{-60,-60},{60,-100}},
            lineColor={0,0,255},
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-60,-40},{60,-80}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-60,-18},{60,-58}},
            lineColor={0,0,255},
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-60,2},{60,-38}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-60,20},{60,-20}},
            lineColor={0,0,255},
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-60,40},{60,0}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-60,60},{60,20}},
            lineColor={0,0,255},
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-60,80},{60,40}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-60,100},{60,60}},
            lineColor={0,0,255},
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-60,80},{-60,-80}},
            color={0,0,255},
            pattern=LinePattern.Solid),
          Line(
            points={{60,80},{60,-80}},
            color={0,0,255},
            pattern=LinePattern.Solid),
          Text(
            extent={{-150,140},{150,100}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid,
            textString="%name")}),
      Documentation(info="<html>
<p>
This partial class is intended to design a default icon for a <em>data dictionary</em>.
</p>
</html>"));
  end DataDictionary;

  partial model Driveline "Icon for a driveline subsystem"

    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={1,1}), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-64,50},{-48,34}},
            lineColor={0,0,0},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Sphere,
            fillColor={215,215,215}),
          Rectangle(
            extent={{-40.7541,7.9458},{40.7541,-7.9458}},
            lineColor={0,0,0},
            pattern=LinePattern.None,
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={215,215,215},
            origin={-21.1593,21.1992},
            rotation=-31),
          Rectangle(
            extent={{-91,10},{-1,-10}},
            lineColor={0,0,0},
            pattern=LinePattern.None,
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={215,215,215}),
          Text(
            extent={{-100,-55},{100,-95}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid,
            textString="%name"),
          Ellipse(
            extent={{-12,25},{38,-25}},
            lineColor={0,0,0},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Sphere,
            fillColor={215,215,215}),
          Ellipse(
            extent={{6,8},{22,-8}},
            lineColor={0,0,0},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Sphere,
            fillColor={215,215,215}),
          Rectangle(
            extent={{-40.7541,7.9458},{40.7541,-7.9458}},
            lineColor={0,0,0},
            pattern=LinePattern.None,
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={215,215,215},
            origin={48.8407,-20.8008},
            rotation=-31),
          Ellipse(
            extent={{76,-34},{92,-50}},
            lineColor={0,0,0},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Sphere,
            fillColor={215,215,215})}),
      Documentation(info="<html>
<p>
This partial class is intended to design a default icon for a <em>driveline assembly</em>.
</p>
</html>"));
  end Driveline;

  partial model DriverEnvironment "Icon for a driver environment subsystem"

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-82,54},{-60,-26},{-60,-40},{10,-40},{18,-26},{20,-22},{22,
                -18},{22,-16},{22,-14},{20,-12},{14,-10},{8,-10},{-40,-16},{-42,
                -12},{-46,8},{-54,24},{-62,34},{-70,58},{-72,60},{-76,62},{-80,
                62},{-82,58},{-82,54}},
            lineColor={0,0,0},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            fillColor={135,135,135}),
          Polygon(
            points={{24,36},{80,28},{80,-8},{40,8},{30,10},{26,16},{26,30},{24,
                36}},
            lineColor={0,0,0},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            fillColor={170,170,255}),
          Line(points={{80,-8},{80,-40},{-80,-40}}),
          Polygon(
            points={{12,40},{6,6},{8,6},{14,40},{12,40}},
            lineColor={0,0,0},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            fillColor={0,0,0}),
          Polygon(
            points={{26,20},{10,24},{10,22},{26,18},{26,20}},
            lineColor={0,0,0},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            fillColor={0,0,0}),
          Polygon(
            points={{68,-22},{62,-30},{64,-30},{70,-22},{68,-22}},
            lineColor={0,0,0},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            fillColor={0,0,0}),
          Polygon(
            points={{66,-26},{72,-26},{76,-22},{80,-14},{80,-18},{78,-22},{72,-28},
                {66,-28},{66,-26}},
            lineColor={0,0,0},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            fillColor={0,0,0}),
          Text(
            extent={{-100,-50},{100,-90}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid,
            textString="%name")}), Documentation(info="<html>
<p>
This partial class is intended to design a default icon for a <em>driver environment</em>.
</p>
</html>"));
  end DriverEnvironment;

  partial model Driver "Icon for a driver subsystem"

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Bitmap(extent={{-70,-60},{82,96}}, fileName="modelica://VehicleInterfaces/Resources/Images/Icons/driver.jpg"),
          Text(
            extent={{-100,-50},{100,-90}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid,
            textString="%name")}), Documentation(info="<html>
<p>
This partial class is intended to design a default icon for a <em>driver model</em>.
</p>
</html>"));
  end Driver;

  partial model ElectricMotor "Icon for an electric drive subsystem"

    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={1,1}),
          graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-50,70},{70,-30}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={0,128,255}),
          Rectangle(
            extent={{-50,60},{-70,-30}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={128,128,128}),
          Rectangle(
            extent={{70,10},{90,-10}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={95,95,95}),
          Rectangle(
            extent={{-50,80},{30,60}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-60,-50},{-50,-50},{-30,-10},{40,-10},{60,-50},{70,-50},{
                70,-60},{-60,-60},{-60,-50}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-100,-55},{100,-95}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid,
            textString="%name")}),
      Documentation(info="<html>
<p>
This partial class is intended to design a default icon for an <em>electric motor</em>.
</p>
</html>"));
  end ElectricMotor;

  partial model Empty "Icon for an empty component"

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={255,0,0},
            lineThickness=1), Line(
            points={{-70,-70},{70,70}},
            color={255,0,0},
            thickness=1)}), Documentation(info="<html>
<p>
This partial class is intended to design a default icon for an <em>empty element</em>, i.e. for element which has no influence on the overall model.
</p>
</html>"));
  end Empty;

  partial model Engine "Icon for an engine subsystem"

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-56,62},{36,76},{46,52},{-46,38},{-56,62}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{58,8},{-34,-6},{-34,-46},{58,-32},{58,8}},
            lineColor={0,0,0},
            pattern=LinePattern.None,
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-58,-38},{-34,-46},{-34,-6},{-16,28},{-36,54},{-46,38},{-56,
                62},{-76,48},{-58,2},{-58,-38}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-16,28},{76,42},{58,8},{-34,-6},{-16,28}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-36,54},{-16,28},{76,42},{56,68},{-36,54}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-18,54},{2,34}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{40,62},{60,42}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{12,58},{32,38}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Line(points={{-46,38},{-36,54},{40,66}}),
          Text(
            extent={{-100,-50},{100,-90}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid,
            textString="%name")}), Documentation(info="<html>
<p>
This partial class is intended to design a default icon for a <em>engine assembly</em>.
</p>
</html>"));
  end Engine;

  partial model MultipleMounts "Icon for a multiple mounting subsystem"

    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-150,-100},{150,100}},
          grid={1,1})),
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-150,-100},{150,100}},
          grid={1,1}), graphics={
          Rectangle(
            extent={{-150,100},{150,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-150,20},{150,-20}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid,
            textString="%name"),
          Line(points={{-112,70},{-112,60},{-92,50},{-132,30},{-92,10},{-132,-10},
                {-92,-30},{-132,-50},{-112,-60},{-112,-70}}),
          Line(points={{-2,70},{-2,60},{18,50},{-22,30},{18,10},{-22,-10},{18,-30},
                {-22,-50},{-2,-60},{-2,-90}}),
          Line(points={{98,70},{98,60},{118,50},{78,30},{118,10},{78,-10},{118,
                -30},{78,-50},{98,-60},{98,-70}}),
          Rectangle(
            extent={{-132,90},{129,70}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Line(points={{-132,-70},{118,-70}})}),
      Documentation(info="<html>
<p>
This partial class is intended to design a default icon for a model of <em>multiple mounts</em>.
</p>
</html>"));
  end MultipleMounts;

  partial model Road "Icon for a road"

    annotation (Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-200,-100},{200,100}},
          grid={2,2}), graphics={
          Rectangle(
            extent={{-200,100},{200,-100}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            lineThickness=0.5,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-200,100},{200,-100}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-200,200},{200,120}},
            lineColor={0,0,255},
            textString="%name"),
          Rectangle(
            extent={{-167,14},{-107,-7}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-27,13},{33,-8}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{113,14},{173,-7}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>
This partial class is intended to design a default icon for a <em>road</em>.
</p>
</html>"));
  end Road;

  expandable connector SignalSubBusWithExplicitSignals
    "Icon for signal sub-bus where the explicit signals are defined in the bus"

    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Polygon(
            points={{-40,25},{40,25},{50,15},{40,-20},{30,-25},{-30,-25},{-40,
                -20},{-50,15},{-40,25}},
            lineColor={0,0,0},
            lineThickness=0.5,
            smooth=Smooth.Bezier)}),
      Documentation(info="<html>
<p>
This icon is designed for a <strong>sub-bus</strong> in a signal connector.
It contains just an additional polygon as a graphical element in Diagram in order
to highlight such a particular sub-bus.
</p>
</html>"));
  end SignalSubBusWithExplicitSignals;

  partial model SingleMount "Icon for a single mounting subsystem"

    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={1,1}), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-100,20},{100,-20}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid,
            textString="%name"),
          Line(points={{0,70},{0,60},{20,50},{-20,30},{20,10},{-20,-10},{20,-30},
                {-20,-50},{0,-60},{0,-90}}),
          Rectangle(
            extent={{-80,90},{80,70}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Line(points={{-81,-70},{80,-70}})}),
      Documentation(info="<html>
<p>
This partial class is intended to design a default icon for a model of <em>single mount</em>.
</p>
</html>"));
  end SingleMount;

  partial model TwoMounts "Icon for a multiple mounting subsystem"

    annotation (
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-150,-100},{150,100}},
          grid={1,1})),
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-150,-100},{150,100}},
          grid={1,1}), graphics={
          Rectangle(
            extent={{-150,100},{150,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-150,20},{150,-20}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid,
            textString="%name"),
          Line(points={{-80,70},{-80,60},{-60,50},{-100,30},{-60,10},{-100,-10},
                {-60,-30},{-100,-50},{-80,-60},{-80,-70}}),
          Line(points={{80,70},{80,60},{100,50},{60,30},{100,10},{60,-10},{100,
                -30},{60,-50},{80,-60},{80,-70}}),
          Rectangle(
            extent={{-132,90},{129,70}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Line(points={{-132,-70},{118,-70}})}),
      Documentation(info="<html>
<p>
This partial class is intended to design a default icon for a model of <em>two mounts</em>.
</p>
</html>"));
  end TwoMounts;

  partial model Transmission "Icon for a transmission subsystem"

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-90,10},{-60,-10}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={192,192,192}),
          Rectangle(
            extent={{90,10},{60,-10}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={192,192,192}),
          Polygon(
            points={{-60,-60},{-60,60},{-50,60},{-30,40},{30,40},{40,10},{60,10},
                {60,-10},{40,-10},{30,-40},{20,-40},{15,-35},{6,-45},{-30,-45},
                {-40,-38},{-49,-60},{-60,-60}},
            lineColor={0,0,0},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-53,0},{-36,0}}),
          Line(points={{-53,23},{-45,23},{-38,18}}),
          Line(points={{-53,36},{-44,36},{-36,30}}),
          Line(points={{-55,-19},{-47,-19},{-40,-16}}),
          Line(points={{-53,-35},{-46,-35},{-43,-31}}),
          Line(points={{-27,29},{21,29},{28,14}}),
          Line(points={{-9,-1},{21,-1}}),
          Line(points={{-33,-34},{-30,-34},{7,-34}}),
          Text(
            extent={{-100,-50},{100,-90}},
            lineColor={0,0,255},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid,
            textString="%name")}), Documentation(info="<html>
<p>
This partial class is intended to design a default icon for a <em>transmission assembly</em>.
</p>
</html>"));
  end Transmission;

  annotation (Documentation(info="<html>
<p>A collection of basic icon definitions used in the package</p>
</html>"));
end Icons;
