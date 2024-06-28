module apps.cms.forms.inputs.image;

import apps.cms;
@safe:

class DCMSImageFormInput : DTextFormInput {
  mixin(ViewComponentThis!("CMSImageFormInput"));
  
  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .id("entity_imagepath")
    .name("entity_imagepath");

    this
    .inputName("entity_imagepath")
    .fieldName("imagePath")
    .label("Titelbild"); 
  }
}
mixin(ViewComponentCalls!("CMSImageFormInput"));

version(test_uim_cms) { unittest {
    // assert(CMSImageFormInput);
}}