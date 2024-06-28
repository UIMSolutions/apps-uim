module apps.cms.controllers.actions.blogs.create;

import apps.cms;
@safe:

class DCMSBlogsCreateActionController : DCMSCreateActionController {
  mixin(ControllerThis!("CMSBlogsCreateActionController"));
}
mixin(ControllerCalls!("CMSBlogsCreateActionController", "DCMSBlogsCreateActionController"));
