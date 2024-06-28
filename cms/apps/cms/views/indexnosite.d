module apps.cms.views.indexnosite;

import apps.cms;
@safe:

class DCMSIndexNoSiteView : DView {
  mixin(ViewThis!("CMSIndexNoSiteView"));

  mixin(OProperty!("DEntity[]", "sites"));
  mixin(OProperty!("DEntity", "selectedSites"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSIndexNoSiteView~"DCMSIndexNoSiteView::toH5");
    super.toH5(options);
    // debug writeln("apps.cms.pages.index:serverCms.index:toH5 -> reqParameters = ", options);
    // debug writeln("apps.cms.pages.index:serverCms.index:toH5 -> pageTitle = ", options.get("pageTitle", ""));

    debug writeln("Existing sites: ", sites.length);
    DH5Obj[] sitesContent = sites.map!((site) {
      sitesContent ~= 
        H5Div(["col-md-6 col-xl-3"],
          H5Div(["ratio ratio-1x1"], 
            BS5Form(["method":"Post", "action": "/sites/select?siteId="~site.id.toString], 
              BS5Card(["h-100"])
                .body_(["text-center"], 
                  H5Div(["card-title mb-1"], site.id.toString),
                  H5Div(["card-title mb-1"], site.display),
                  H5Div(["text-muted"], BS5ButtonSubmit(["btn-info"], "Site auswählen"))))));
    }).array;

    return [
        H5Div(["content"],
          H5Div(["container-xl"], 
            BS5Row("messages", [""]),
            BS5Row(["row-deck row-cards"], sitesContent)))].toH5;
    }
  }
mixin(ViewCalls!("CMSIndexNoSiteView"));
