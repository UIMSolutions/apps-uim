module apps.cms.views.links;

import apps.cms;
@safe:

// Main
public import apps.cms.views.links.index;

// CRUD Modules
public import apps.cms.views.links.create;
public import apps.cms.views.links.read;
public import apps.cms.views.links.update;
public import apps.cms.views.links.delete_;

package:
  string myRootPath = "/cms/links";