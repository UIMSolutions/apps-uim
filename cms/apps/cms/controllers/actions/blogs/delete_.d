module apps.cms.controllers.actions.blogs.delete_;

import apps.cms;
@safe:

class DCMSBlogsDeleteActionController : DCMSDeleteActionController {
  mixin(ControllerThis!("CMSBlogsDeleteActionController"));
}
mixin(ControllerCalls!("CMSBlogsDeleteActionController", "DCMSBlogsDeleteActionController"));
