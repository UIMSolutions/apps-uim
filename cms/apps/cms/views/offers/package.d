module apps.cms.views.offers;

import apps.cms;
@safe:

// Main
public import apps.cms.views.offers.index;

// CRUD Modules
public {
  import apps.cms.views.offers.create;
  import apps.cms.views.offers.read;
  import apps.cms.views.offers.update;
  import apps.cms.views.offers.delete_;
}

package:
  string myRootPath = "/cms/offers";