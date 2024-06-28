module apps.cms.controllers.actions.blogs.update;

import apps.cms;
@safe:

class DCMSBlogsUpdateActionController : DCMSUpdateActionController {
  mixin(ControllerThis!("CMSBlogsUpdateActionController"));
}
mixin(ControllerCalls!("CMSBlogsUpdateActionController", "DCMSBlogsUpdateActionController"));
