module apps.cms.forms.themes;

import apps.cms;
@safe:

class DCMSThemeForm : DForm {
  mixin(ViewComponentThis!("CMSThemeForm"));

  override void initialize(Json configSettings = Json(null)) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DCMSThemeForm~"::DCMSThemeForm("~this.className~"):initialize"); }
    super.initialize(configSettings);
    
    this
      .content(
        CMSThemeFormContent.form(this));
  }
}
mixin(ViewComponentCalls!("CMSThemeForm"));

version(test_uim_cms) { unittest {
    // TODO
}}