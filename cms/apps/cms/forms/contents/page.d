module apps.cms.forms.contents.page;

import apps.cms;
@safe:

class DCMSPageFormContent : DCMSPostFormContent {
  mixin(ViewComponentThis!("CMSPageFormContent"));
}
mixin(ViewComponentCalls!("CMSPageFormContent"));

version(test_uim_cms) { unittest {
    assert(CMSPageFormContent(myForm));
}}
