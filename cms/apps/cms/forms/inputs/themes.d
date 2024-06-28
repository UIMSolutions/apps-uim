module apps.cms.forms.inputs.themes;

import apps.cms;
@safe:

class DCMSThemesFormInput : DFormInput {
  mixin(ViewComponentThis!("CMSThemesFormInput"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .id("entity_theme")
    .name("entity_theme");

    this
    .inputName("entity_theme")
    .fieldName("themeId")
    .label("Thema"); 
  }
  mixin(SProperty!("DEntity[]", "themes"));

  override void beforeH5(STRINGAA options = null) { 
    super.beforeH5(options);

    if (entityBase) {
      this.themes(entityBase.collection("uim", "cms_themes").findMany());
    }
  }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }
    
    DH5Obj[] selectOptions;
    if (entity && themes) {
      selectOptions ~= cast(DH5Obj)H5Option(["value":"00000000-0000-0000-0000-000000000000"], "No theme");
      selectOptions ~= themes.map!(theme => (entity[fieldName] == theme.id.toString) 
        ? H5Option(["selected":"selected", "value":theme.id.toString], theme.display)
        : H5Option(["value":theme.id.toString], theme.display)).array.toH5;
    }

    auto input = H5Select(name, ["form-select"], ["name":inputName, "readonly":"readonly", "value":entity["theme"]], selectOptions); 
    if (_crudMode != CRUDModes.Create && entity) input.attribute("value", entity["theme"]);
    if (_crudMode == CRUDModes.Read || _crudMode == CRUDModes.Delete) input.attribute("disabled","disabled");
    
    return [
      BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], label),
        BS5Col(["col"], input))].toH5;
  }
}
mixin(ViewComponentCalls!("CMSThemesFormInput"));

version(test_uim_cms) { unittest {
    // TODO Tests
}}
