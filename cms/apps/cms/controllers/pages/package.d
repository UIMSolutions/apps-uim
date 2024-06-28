/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module apps.cms.controllers.pages;

public { // Pages Controllers
  import apps.cms.controllers.pages.index;
  import apps.cms.controllers.pages.error;
  
  import apps.cms.controllers.pages.create;
  import apps.cms.controllers.pages.read;
  import apps.cms.controllers.pages.update;
  import apps.cms.controllers.pages.delete_;
}

public {
  import apps.cms.controllers.pages.controller;
}

public {
  import apps.cms.controllers.pages.blogs;
  import apps.cms.controllers.pages.news;
  import apps.cms.controllers.pages.themes;
}