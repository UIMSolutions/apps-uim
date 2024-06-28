module apps.cms.scripts.app;

import apps.cms;
@safe:
import apps.cms.scripts.blogs;

auto cmsapp() {  
  return "";
}

unittest {
  auto f = File("../../PUBLIC/js/apps/cms/app.js", "w"); // open for writing
  f.write(cmsapp);
}