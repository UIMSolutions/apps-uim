module apps.cms.views.glossary;

import apps.cms;
@safe:

// Main
public import apps.cms.views.glossary.index;

// CRUD Modules
public import apps.cms.views.glossary.create;
public import apps.cms.views.glossary.read;
public import apps.cms.views.glossary.update;
public import apps.cms.views.glossary.delete_;

package:
  string myRootPath = "/cms/glossary";
