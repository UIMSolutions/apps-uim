module apps.cms.forms.posts.news;

import apps.cms;
@safe:

class DCMSNewsItemForm : DCMSForm {
  mixin(ViewComponentThis!("CMSNewsItemForm"));
}
mixin(ViewComponentCalls!("CMSNewsItemForm"));

version(test_uim_cms) { unittest {
    // TODO
}}