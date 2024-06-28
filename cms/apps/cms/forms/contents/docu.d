module apps.cms.forms.contents.docu;

import apps.cms;
@safe:

class DCMSDocuFormContent : DCMSFormContent {
  mixin(ViewComponentThis!("CMSDocuFormContent"));
}
mixin(ViewComponentCalls!("CMSDocuFormContent"));

version(test_uim_cms) { unittest {
    assert(CMSDocuFormContent(myForm));
}}