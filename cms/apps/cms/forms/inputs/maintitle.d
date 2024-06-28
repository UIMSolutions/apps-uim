module apps.cms.forms.inputs.mainTitle;

import apps.cms;
@safe:

class DCMSMainTitleFormInput : DTextFormInput {
  mixin(ViewComponentThis!("CMSMainTitleFormInput"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .id("entity_mainTitle")
    .name("entity_mainTitle");

    this
    .inputName("entity_mainTitle")
    .fieldName("mainTitle")
    .label("Überschrift"); 
  }
}
mixin(ViewComponentCalls!("CMSMainTitleFormInput"));

version(test_uim_cms) { unittest {
    // TODO Tests
}}