within VehicleInterfaces;
package Mechanics "Collection of additional mechanical components"
  extends Modelica.Icons.Package;

  package NormalisedTranslational
    "Collection of normalized translational mechanics"
    extends Modelica.Icons.Package;

    package Interfaces "Collection of connector definitions"
      extends Modelica.Icons.InterfacesPackage;

      connector Flange "1D normalized translational flange"
        Types.NormalizedReal s "Normalized position of flange";
        flow Modelica.SIunits.Force f "Cut force directed into flange";

        annotation (
          defaultComponentName="flange_a",
          Documentation(info="<html>
<p>1D translational mechanical connector with normalized position as opposed to the <a href=\"Modelica://Modelica.Mechanics.Translational.Interfaces.flange_a\">Modelica.Mechanics.Translational.Interfaces.flange_a</a> connector.  The force is not normalized in this connector.</p>
</html>"),       Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Polygon(
                points={{-100,0},{0,100},{100,0},{0,-100},{-100,0}},
                lineColor={0,127,0},
                fillColor={0,127,0},
                fillPattern=FillPattern.Solid), Text(
                extent={{-100,140},{100,100}},
                lineColor={0,127,0},
                textString="%name")}),
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Polygon(
                points={{-52,0},{0,52},{52,0},{0,-52},{-52,0}},
                lineColor={0,127,0},
                fillColor={0,127,0},
                fillPattern=FillPattern.Solid), Text(
                extent={{-100,-60},{100,-100}},
                lineColor={0,127,0},
                textString="%name")}));
      end Flange;

      annotation (Documentation(info="<html>
<p>
A collection of additional 1D translational mechanical connectors used for normalized translational elements.</p>
</html>"));
    end Interfaces;

    model Position "Applies a position to a Flange"

      parameter Boolean exact=true
        "True/false exact treatment/filtering the input signal";
      parameter SI.Frequency f_crit=50
        "If exact=false: critical frequency of filter to filter input signal"
        annotation (Dialog(enable=not exact));

      Interfaces.Flange flange_b "flange to be positioned"
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica.Blocks.Interfaces.RealInput position "position to be applied"
        annotation (Placement(transformation(
            origin={-120,0},
            extent={{20,-20},{-20,20}},
            rotation=180)));

      Types.NormalizedReal s "Normalized position";
    protected
      parameter Real w_crit=2*Modelica.Constants.pi*f_crit
        "Critical frequency in [1/s]";
      constant Real af=1.3617 "Coefficient s   of Bessel filter";
      constant Real bf=0.6180 "Coefficient s*s of Bessel filter";

      Real v;
      Real a;
    equation
      s = flange_b.s;

      if exact then
        s = position;
        v = 0;
        a = 0;
      else
        v = der(s);
        a = der(v);
        a = ((position - s)*w_crit - af*v)*(w_crit/bf);
      end if;

    initial equation
      if not exact then
        s = position;
      end if;

      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Polygon(
              points={{44,-80},{24,-75},{24,-85},{44,-80}},
              lineColor={128,128,128},
              fillColor={128,128,128},
              fillPattern=FillPattern.Solid), Line(points={{-46,-80},{25,-80}},
                color={128,128,128})}),
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={
                           Text(
              extent={{-150,80},{150,40}},
              textString="%name",
              lineColor={0,0,255}), Rectangle(
              extent={{-100,2},{88,-2}},
              lineColor={0,127,0},
              fillColor={0,127,0},
              fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
<p>Applies a normalized position to a 1D normalized translational system.  Cannot be connected to components from the Modelica.Mechanics.Translational library</p>
</html>"));
    end Position;

    model Force "Applies a force to a Flange"

      Interfaces.Flange flange_b "Flange to be forced"
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica.Blocks.Interfaces.RealInput force "Force to be applied"
        annotation (Placement(transformation(
            origin={-120,0},
            extent={{20,-20},{-20,20}},
            rotation=180)));

    equation
      force = -flange_b.f;

      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Line(points={{-50,-90},{30,-90}}),
            Polygon(
              points={{60,-90},{30,-80},{30,-100},{60,-90}},
              lineColor={128,128,128},
              fillColor={128,128,128},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-100,10},{26,-10}},
              lineColor={0,127,0},
              fillColor={0,127,0},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{20,41},{90,0},{20,-41},{20,41}},
              lineColor={0,127,0},
              fillColor={0,127,0},
              fillPattern=FillPattern.Solid)}),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Polygon(
              points={{20,41},{90,0},{20,-41},{20,41}},
              lineColor={0,127,0},
              fillColor={0,127,0},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-100,-30},{-47,-78}},
              lineColor={95,95,95},
              textString="f",
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,100},{150,60}},
              textString="%name",
              lineColor={0,0,255}),
            Rectangle(
              extent={{-100,10},{26,-10}},
              lineColor={0,127,0},
              fillColor={0,127,0},
              fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
<p>Applies a force to a 1D normalized translational system.  Cannot be connected to components from the Modelica.Mechanics.Translational library</p>
</html>"));
    end Force;

    model PositionSensor "Ideal sensor to measure the position of a Flange"
      extends Modelica.Icons.TranslationalSensor;

      Interfaces.Flange flange_a "Flange to be measured"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Modelica.Blocks.Interfaces.RealOutput position
        "Absolute position of flange as output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));

    equation
      position = flange_a.s;
      0 = flange_a.f;

      annotation (
        Documentation(info="<html>
<p>Measures a normalized position in a 1D normalized translational system.  Cannot be connected to components from the Modelica.Mechanics.Translational library</p>
</html>"),
        Diagram(graphics={Line(points={{-96,0},{-70,0}}, color={95,95,95}),
              Line(points={{70,0},{100,0}}, color={95,95,95})}),
        Icon(graphics={
            Line(points={{-96,0},{-70,0}}, color={95,95,95}),
            Line(points={{70,0},{100,0}}, color={95,95,95}),
            Text(
              extent={{-150,80},{150,40}},
              textString="%name",
              lineColor={0,0,255})}));
    end PositionSensor;

    annotation (Documentation(info="<html>
<p>Additional 1D translational mechanical components with normalized position.</p>
</html>"));
  end NormalisedTranslational;

  package NormalisedRotational "Collection of normalized rotational mechanics"
    extends Modelica.Icons.Package;
    package Interfaces "Collection of connector definitions"
      extends Modelica.Icons.InterfacesPackage;

      connector Flange "1D normalized rotational flange"
        Types.NormalizedReal phi "Normalized rotation of flange";
        flow Modelica.SIunits.Torque tau "Cut torque directed in the flange";

        annotation (
          defaultComponentName="flange_a",
          Documentation(info="<html>
<p>1D rotational mechanical connector with normalized position as opposed to the <a href=\"Modelica://Modelica.Mechanics.Rotational.Interfaces.Flange_a\">Modelica.Mechanics.Rotational.Interfaces.Flange_a</a> connector.  The torque is not normalized in this connector.</p>
</html>"),       Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={
              Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-70,0},{0,70},{70,0},{0,-70},{-70,0}},
                lineColor={255,255,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-100,140},{100,100}},
                lineColor={95,95,95},
                textString="%name")}),
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={
              Ellipse(
                extent={{-40,40},{40,-40}},
                lineColor={0,0,0},
                fillColor={135,135,135},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-30,0},{0,30},{30,0},{0,-30},{-30,0}},
                lineColor={255,255,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-100,-60},{100,-100}},
                lineColor={95,95,95},
                textString="%name")}));
      end Flange;
      annotation (Documentation(info="<html>
<p>
A collection of additional 1D rotational mechanical connectors used for normalized translational elements.</p>
</html>"));
    end Interfaces;

    model Position "Applies a rotation to a Flange"

      parameter Boolean exact=true
        "True/false exact treatment/filtering the input signal";
      parameter SI.Frequency f_crit=50
        "If exact=false: critical frequency of filter to filter input signal"
        annotation (Dialog(enable=not exact));

      Interfaces.Flange flange_b "flange to be rotated"
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica.Blocks.Interfaces.RealInput phi_ref "position to be applied"
        annotation (Placement(transformation(
            origin={-120,0},
            extent={{20,-20},{-20,20}},
            rotation=180)));
      Types.NormalizedReal phi;
    protected
      parameter Real w_crit=2*Modelica.Constants.pi*f_crit
        "critical frequency in [1/s]";
      constant Real af=1.3617 "Coefficient s   of Bessel filter";
      constant Real bf=0.6180 "Coefficient s*s of Bessel filter";

      Real w;
      Real a;
    equation
      phi = flange_b.phi;

      w = der(phi);
      a = der(w);

      if exact then
        phi = phi_ref;
      else
        a = ((phi_ref - phi)*w_crit - af*w)*(w_crit/bf);
      end if;

    initial equation
      if not exact then
        phi = phi_ref;
      end if;

      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Polygon(
              points={{56,-80},{36,-75},{36,-85},{56,-80}},
              lineColor={128,128,128},
              fillColor={128,128,128},
              fillPattern=FillPattern.Solid),
            Line(points={{-34,-80},{37,-80}}, color={128,128,128}),
            Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={192,192,192}),
            Text(extent={{150,60},{-150,100}}, textString="%name")}),
        Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={192,192,192}), Text(
              extent={{-150,100},{150,60}},
              textString="%name",
              lineColor={0,0,255})}),
        Documentation(info="<html>
<p>Applies a normalized angle to a 1D normalized rotational system.  Cannot be connected to components from the Modelica.Mechanics.Rotational library</p>
</html>"));
    end Position;

    model Torque "Applies a torque to a Flange"

      Interfaces.Flange flange_b "Flange to be turned"
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica.Blocks.Interfaces.RealInput tau "Torque to be applied"
        annotation (Placement(transformation(
            origin={-120,0},
            extent={{20,-20},{-20,20}},
            rotation=180)));

    equation
      tau = -flange_b.tau;

      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Line(points={{-50,-90},{30,-90}}),
            Polygon(
              points={{60,-90},{30,-80},{30,-100},{60,-90}},
              lineColor={128,128,128},
              fillColor={128,128,128},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-84,0},{-60,30},{-32,52},{2,62},{32,56},{52,44},{68,28},
                  {80,14},{84,10}},
              thickness=0.5),
            Polygon(
              points={{90,0},{70,58},{42,28},{90,0}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid)}),
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics={
            Text(
              extent={{14,-10},{-100,-60}},
              lineColor={95,95,95},
              textString="tau"),
            Polygon(
              points={{94,10},{75,59},{41,24},{94,10}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,100},{150,60}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              points={{-100,0},{-76,30},{-48,48},{-14,58},{16,56},{40,50},{56,
                  42},{66,32},{80,20}},
              thickness=0.5)}),
        Documentation(info="<html>
<p>Applies a torque to a 1D normalized rotational system.  Cannot be connected to components from the Modelica.Mechanics.Rotational library</p>
</html>"));
    end Torque;

    model AngleSensor "Ideal sensor to measure the rotation of a Flange"
      extends Modelica.Icons.RotationalSensor;

      Interfaces.Flange flange_a "flange to be measured"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Modelica.Blocks.Interfaces.RealOutput phi
        "Absolute angle of flange as output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));

    equation
      phi = flange_a.phi;
      0 = flange_a.tau;

      annotation (
        Documentation(info="<html>
<p>Measures a normalized angle in a 1D normalized rotational system.  Cannot be connected to components from the Modelica.Mechanics.Rotational library</p>
</html>"),
        Diagram(graphics={Line(points={{-96,0},{-70,0}}, color={95,95,95}),
              Line(points={{70,0},{100,0}}, color={95,95,95})}),
        Icon(graphics={
            Line(points={{70,0},{100,0}}, color={95,95,95}),
            Line(points={{-96,0},{-70,0}}, color={95,95,95}),
            Text(
              extent={{-150,120},{150,80}},
              textString="%name",
              lineColor={0,0,255})}));
    end AngleSensor;
    annotation (Documentation(info="<html>
<p>Additional 1D rotational mechanical components with normalized angle of rotation.</p>
</html>"));
  end NormalisedRotational;

  package MultiBody "Collection of additional MultiBody components"
    extends Modelica.Icons.Package;
    model MultiBodyEnd "Ends a MultiBody chain"
      parameter Boolean includeBearingConnector=false
        "= true, if bearing frame connector is present, otherwise not present";

      Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing flange(
          includeBearingConnector=includeBearingConnector)
        "Flange with zero force and torque applied"
        annotation (Placement(transformation(extent={{0,-20},{40,20}})));
    protected
      Modelica.Mechanics.MultiBody.Sensors.Internal.ZeroForceAndTorque
        zeroForceAndTorque if includeBearingConnector
        annotation (Placement(transformation(extent={{-20,-10},{-40,10}})));

    public
      Modelica.Mechanics.Rotational.Sources.ConstantTorque zeroTorque1D(final
          tau_constant=0)
        annotation (Placement(transformation(extent={{-20,30},{0,50}})));
    equation
      connect(zeroTorque1D.flange, flange.flange)   annotation (Line(
          points={{0,40},{20,40},{20,0}}));
      connect(zeroForceAndTorque.frame_a, flange.bearingFrame) annotation (Line(
          points={{-20,0},{20,0}},
          color={95,95,95},
          thickness=0.5));
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-60,-80},{60,80}}), graphics={Polygon(
              points={{40,-40},{40,-60},{-40,-60},{-40,60},{40,60},{40,40},{-20,
                  40},{-20,-40},{40,-40}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
<p>
This component is used to end a chain of multi-body components by applying zero force and torque to the end of the chain.  Uses the <a href=\"Modelica://Modelica.Mechanics.MultiBody.Interfaces.FlangeWithBearing\">FlangeWithBearing</a> connector where the <b>flange</b> connector has zero torque applied to it and the <b>bearingFrame</b> can be optionally included through the parameter <code>includeBearingConnector</code>.
If <code>includeBearingConnector=true</code> then zero force and torque is applied to the bearingFrame.</p>
</html>"),     Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-60,-80},{60,80}}), graphics={Rectangle(
              extent={{-66,18},{0,-24}},
              lineColor={0,127,0},
              fillColor={215,215,215},
              fillPattern=FillPattern.Solid), Text(
              extent={{-64,-16},{-4,-22}},
              lineColor={0,127,0},
              textString="if includeBearingConnector = true")}));
    end MultiBodyEnd;

    annotation (Documentation(info="<html>
<p>Multi-body components required by the library which are not included in Modelica Standard Library (package Modelica.Mechanics.MultiBody).</p>
</html>"));
  end MultiBody;

  annotation (Documentation(info="<html>
<p>Additional mechanical components required by the library and models based on this package.  Includes 1D mechanical connectors and components with normalized position and angle variables rather than actual values.  Also includes the MultiBodyEnd component which applies zero force and torque at the end of a chain of components.</p>
</html>"));
end Mechanics;
