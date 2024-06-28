module apps.cms.scripts.glossary.edit;

import apps.cms;
@safe:
import apps.cms.scripts.glossary;

public:
auto editEntity() {  
  return 
    jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~      
    jsElementById(["entity_theme"])~
    jsEditEntity();
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/edit.js", "w"); // open for writing
  f.write(editEntity);
}
