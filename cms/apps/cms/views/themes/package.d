module apps.cms.views.themes;

// Themes 
public { 
  import apps.cms.views.themes.index;
}

public { // CRUD
  import apps.cms.views.themes.create;
  import apps.cms.views.themes.read;
  import apps.cms.views.themes.update;
  import apps.cms.views.themes.delete_;
}

package:
  string myRootPath = "/cms/themes";