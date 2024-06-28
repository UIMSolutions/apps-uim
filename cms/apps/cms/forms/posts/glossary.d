module apps.cms.forms.posts.glossary;

import apps.cms;
@safe:

class DCMSGlossaryItemForm : DCMSPostForm {
  mixin(ViewComponentThis!("CMSGlossaryItemForm"));
}
mixin(ViewComponentCalls!("CMSGlossaryItemForm"));

version(test_uim_cms) { unittest {
    // TODO
}}