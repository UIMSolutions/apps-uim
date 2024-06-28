module apps.cms.controllers.actions.news.create;

import apps.cms;
@safe:

class DCMSNewsCreateActionController : DActionController {
  mixin(ControllerThis!("CMSNewsCreateActionController"));
}
mixin(ControllerCalls!("CMSNewsCreateActionController", "DCMSNewsCreateActionController"));
