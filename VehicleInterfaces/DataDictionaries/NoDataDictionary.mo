within VehicleInterfaces.DataDictionaries;
model NoDataDictionary "Empty data dictionary"
  extends VehicleInterfaces.Icons.DataDictionary;
  extends VehicleInterfaces.Icons.Empty;
  extends VehicleInterfaces.DataDictionaries.Interfaces.Base;
  annotation (Documentation(info="<html>
<p>
Empty data dictionary model. Using this empty model in overall vehicle architecture the functionality of data dictionary can be eliminated.
</p>
</html>"));
end NoDataDictionary;
