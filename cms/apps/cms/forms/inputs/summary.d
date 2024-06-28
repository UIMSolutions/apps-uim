module apps.cms.forms.inputs.summary;

import apps.cms;
@safe:

class DCMSSummaryFormInput : DTextAreaFormInput {
  mixin(ViewComponentThis!("CMSSummaryFormInput"));

  override void initialize(Json configSettings = Json(null)) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DCMSSummaryFormInput~"::DCMSSummaryFormInput("~this.className~"):initialize"); }
    super.initialize(configSettings);

    this
    .id("entity_summary")
    .name("entity_summary");

    this
    .inputName("entity_summary")
    .fieldName("summary")
    .label("Zusammenfassung");  
  }
}
mixin(ViewComponentCalls!("CMSSummaryFormInput"));

version(test_uim_cms) { unittest {
    // TODO Tests
}}
