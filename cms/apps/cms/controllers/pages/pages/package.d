module apps.cms.controllers.pages.pages;

import apps.cms;
@safe:

// Main
public import apps.cms.controllers.pages.pages.index;


public { // CRUD Modules
  import apps.cms.controllers.pages.pages.create;
  import apps.cms.controllers.pages.pages.read;
  import apps.cms.controllers.pages.pages.update;
  import apps.cms.controllers.pages.pages.delete_;
}