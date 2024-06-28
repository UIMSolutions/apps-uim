module apps.cms.controllers.pages.docus;

import apps.cms;
@safe:

// Main
public import apps.cms.controllers.pages.docus.index;

public { // CRUD Modules
  import apps.cms.controllers.pages.docus.create;
  import apps.cms.controllers.pages.docus.read;
  import apps.cms.controllers.pages.docus.update;
  import apps.cms.controllers.pages.docus.delete_;
}