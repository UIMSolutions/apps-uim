module apps.cms.forms.contents.demo;

import apps.cms;
@safe:

class DCMSDemoFormContent : DCMSFormContent {
  mixin(ViewComponentThis!("CMSDemoFormContent"));
}
mixin(ViewComponentCalls!("CMSDemoFormContent"));

version(test_uim_cms) { unittest {
    assert(CMSDemoFormContent(myForm));
}}