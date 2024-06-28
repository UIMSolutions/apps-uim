/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module apps.myname.controllers.pages.index;

import apps.myname;
@safe:

class DMYNAMEIndexPageController : DAPPPageController {
  mixin(ControllerThis!("MYNAMEIndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(MYNAMEIndexView(this));
  }
}
mixin(ControllerCalls!("MYNAMEIndexPageController"));
