module apps.cms.forms.posts.docus;

import apps.cms;
@safe:

class DCMSDocuForm : DCMSForm {
  mixin(ViewComponentThis!("CMSDocuForm"));
}
mixin(ViewComponentCalls!("CMSDocuForm"));

version(test_uim_cms) { unittest {
    // TODO
}}
