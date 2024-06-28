module apps.cms.scripts.pages.create;

import apps.cms;
@safe:
import apps.cms.scripts.pages;

auto createEntity() {  
  return 
    jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~
    jsElementById(["entity_theme"])~
    "setThemes();"~
    jsCreateEntity();

}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/create.js", "w"); // open for writing
  f.write(createEntity);
}
