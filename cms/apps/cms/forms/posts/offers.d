module apps.cms.forms.posts.offers;;

import apps.cms;
@safe:

class DCMSOfferForm : DCMSForm {
  mixin(ViewComponentThis!("CMSOfferForm"));
}
mixin(ViewComponentCalls!("CMSOfferForm"));

version(test_uim_cms) { unittest {
    // TODO
}}