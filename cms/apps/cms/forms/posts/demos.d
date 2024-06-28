module apps.cms.forms.posts.demos;

import apps.cms;
@safe:

class DCMSDemoForm : DCMSForm {
  mixin(ViewComponentThis!("CMSDemoForm"));
}
mixin(ViewComponentCalls!("CMSDemoForm"));

version(test_uim_cms) { unittest {
    // TODO
}}
