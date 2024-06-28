module apps.cms.forms.contents.glossary;

import apps.cms;
@safe:

class DCMSGlossaryItemFormContent : DCMSFormContent {
  mixin(ViewComponentThis!("CMSGlossaryItemFormContent"));
}
mixin(ViewComponentCalls!("CMSGlossaryItemFormContent"));

version(test_uim_cms) { unittest {
    assert(CMSGlossaryItemFormContent(myForm));
}}