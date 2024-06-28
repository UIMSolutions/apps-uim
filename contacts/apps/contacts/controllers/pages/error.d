/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module apps.contacts.controllers.pages.error;

import apps.contacts;
@safe:

class DCTTErrorPageController : DPageController {
  mixin(ControllerThis!("CTTErrorPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(CTTErrorView(this));
  }
}
mixin(ControllerCalls!("CTTErrorPageController"));
