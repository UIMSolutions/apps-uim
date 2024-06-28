module apps.cms.forms.inputs.private_;

import apps.cms;
@safe:

class DCMSPrivateFormInput : DSwitchFormInput {
  mixin(ViewComponentThis!("CMSPrivateFormInput"));  // not CMSPrivateFormInput!
  this(DEntity myEntity) { this().entity(myEntity); }
  this(DForm myForm, DEntity myEntity) { /* .form(myForm) */this.entity(myEntity); }

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .id("entity_private")
    .inputName("entity_private")
    .fieldName("isPrivate")
    .label("Privat"); 
  }
}
mixin(ViewComponentCalls!("CMSPrivateFormInput"));

version(test_uim_cms) { unittest {
    // TODO Tests
}}
