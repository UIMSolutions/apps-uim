module apps.cms.forms.contents.offer;

import apps.cms;
@safe:

class DCMSOfferFormContent : DCMSFormContent {
  mixin(ViewComponentThis!("CMSOfferFormContent"));
}
mixin(ViewComponentCalls!("CMSOfferFormContent"));

version(test_uim_cms) { unittest {
   assert(CMSOfferFormContent(myForm));
}}