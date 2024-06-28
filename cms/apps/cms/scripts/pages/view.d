module apps.cms.scripts.pages.view;

import apps.cms;
@safe:
import apps.cms.scripts.pages;

public:
auto viewEntity() {  
  return 
    jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~
    jsElementById(["entityForm", "entity_theme"])~
    jsViewEntity(); 
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/view.js", "w"); // open for writing
  f.write(viewEntity);
}
