module apps.cms.controllers.actions.tutorials.create;

import apps.cms;
@safe:

class DCMSTutorialsCreateActionController : DCMSCreateActionController {
  mixin(ControllerThis!("CMSTutorialsCreateActionController"));
}
mixin(ControllerCalls!("CMSTutorialsCreateActionController", "DCMSTutorialsCreateActionController"));
