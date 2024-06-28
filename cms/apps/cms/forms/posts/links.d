module apps.cms.forms.posts.links;

import apps.cms;
@safe:

class DCMSLinkForm : DCMSForm {
  mixin(ViewComponentThis!("CMSLinkForm"));
}
mixin(ViewComponentCalls!("CMSLinkForm"));

version(test_uim_cms) { unittest {
    // TODO
}}