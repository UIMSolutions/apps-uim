module apps.cms.forms.contents.link;

import apps.cms;
@safe:

class DCMSLinkFormContent : DCMSPostFormContent {
  mixin(ViewComponentThis!("CMSLinkFormContent"));
}
mixin(ViewComponentCalls!("CMSLinkFormContent"));

version(test_uim_cms) { unittest {
    assert(CMSLinkFormContent(myForm));
}}
