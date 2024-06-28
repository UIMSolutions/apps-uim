module apps.cms.views.pages;

import apps.cms;
@safe:

// Main
public import apps.cms.views.pages.index;

// CRUD Modules
public import apps.cms.views.pages.create;
public import apps.cms.views.pages.read;
public import apps.cms.views.pages.update;
public import apps.cms.views.pages.delete_;

package:
  string myRootPath = "/cms/pages";