module apps.cms.forms.inputs.text;

import apps.cms;
@safe:

class DCMSTextFormInput : DTextAreaFormInput {
  mixin(ViewComponentThis!("CMSTextFormInput"));

  override void initialize(Json configSettings = Json(null)) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DCMSTextFormInput~"::DCMSTextFormInput("~this.className~"):initialize"); }
    super.initialize(configSettings);

    this
    .id("entity_text")
    .name("entity_text");

    this
    .inputName("entity_text")
    .fieldName("text")
    .label("Inhalt");
  }
}
mixin(ViewComponentCalls!("CMSTextFormInput"));

version(test_uim_cms) { unittest {
    assert(CMSTextFormInput);
}}
