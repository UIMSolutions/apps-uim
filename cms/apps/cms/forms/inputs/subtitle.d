module apps.cms.forms.inputs.subtitle;

import apps.cms;
@safe:

class DCMSSubTitleFormInput : DTextFormInput {
  mixin(ViewComponentThis!("CMSSubTitleFormInput"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .id("entity_subTitle")
    .name("entity_subTitle");

    this
    .inputName("entity_subTitle")
    .fieldName("subTitle")
    .label("Untertitle"); 
  }
}
mixin(ViewComponentCalls!("CMSSubTitleFormInput"));

version(test_uim_cms) { unittest {
    // TODO Tests
}}

