module apps.cms.layouts;

import apps.cms;
@safe:

// Main
public import apps.cms.layouts.layout;

/*     new class DH5AppLayout {

    override string toString(DH5PageController page, string[string] reqParameters) {
      // debug writeln("in app.grundschutz.layout");
      // debug writeln(page.scripts.map!(a => a.toString));

      if (auto app = page.app) {
        reqParameters["rootPath"] = app.rootPath;      
        writeln("ROOTPATH = ", reqParameters["rootPath"]);
      }
      this.parameters.byKeyValue(kv => reqParameters[kv.key] = kv.value);
      page.parameters.byKeyValue(kv => reqParameters[kv.key] = kv.value);
    }
  });
 * /
  // serverCms.layout(appLayout);
}


*/