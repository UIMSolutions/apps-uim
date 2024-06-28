module apps.cms.forms.posts.form;

import apps.cms;
@safe:

class DCMSPostForm : DCMSForm {
  mixin(ViewComponentThis!("CMSPostForm"));

  override void initialize(Json configSettings = Json(null)) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DCMSPostForm~"::DCMSPostForm("~this.className~"):initialize"); }
    super.initialize(configSettings);
    
/*     this
      .content(
        CMSPostFormContent(this)); */
  }

  mixin(OProperty!("DEntity[]", "themes"));
}
mixin(ViewComponentCalls!("CMSPostForm"));

version(test_uim_cms) { unittest {
    // TODO
}}