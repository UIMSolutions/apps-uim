/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module apps.myname.controllers.pages.error;

import apps.myname;
@safe:

class DMYNAMEErrorPageController : DAPPPageController {
  mixin(ControllerThis!("MYNAMEErrorPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(MYNAMEErrorView(this));
  }
}
mixin(ControllerCalls!("MYNAMEErrorPageController"));
