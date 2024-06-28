module apps.cms.forms.form;

import apps.cms;
@safe:

class DCMSForm : DForm {
  mixin(ViewComponentThis!("CMSForm"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

     this
      .content(
        CMSFormContent(this));
  }
}
mixin(ViewComponentCalls!("CMSForm"));

