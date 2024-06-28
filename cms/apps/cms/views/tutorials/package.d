module apps.cms.views.tutorials;

import apps.cms;
@safe:

// Main
public import apps.cms.views.tutorials.index;

// CRUD Modules
public import apps.cms.views.tutorials.create;
public import apps.cms.views.tutorials.read;
public import apps.cms.views.tutorials.update;
public import apps.cms.views.tutorials.delete_;

package:
  string myRootPath = "/cms/tutorials";