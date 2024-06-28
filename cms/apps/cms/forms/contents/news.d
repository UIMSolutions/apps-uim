module apps.cms.forms.contents.news;

import apps.cms;
@safe:

class DCMSNewsItemFormContent : DCMSPostFormContent {
  mixin(ViewComponentThis!("CMSNewsItemFormContent"));
}
mixin(ViewComponentCalls!("CMSNewsItemFormContent"));

version(test_uim_cms) { unittest {
    assert(CMSNewsItemFormContent(myForm));
  }
}
