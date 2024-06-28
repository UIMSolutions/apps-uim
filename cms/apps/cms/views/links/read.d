module apps.cms.views.links.read;

import apps.cms;
@safe:
import apps.cms.views.links;

class DCMSLinksReadView : DCMSReadView {
  mixin(ViewThis!("CMSLinksReadView"));

override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this.rootPath("/cms/links");

    if (auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .title(titleView("Link anzeigen")) 
        .actions([["refresh", "list", "create"]])
        .rootPath(this.rootPath);
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .crudMode(CRUDModes.Read)
        .content(FormContent.form(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Links")
          .subTitle("Links anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSLinksReadView~"::DCMSLinksReadView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "Link ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Link Name:";

    if (auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .breadcrumbs
          .items(
          ["/cms", "CMS"],
          [this.rootPath, "Links"],
          [rootPath~"/view?id="~(this.entity ? this.entity["id"] : " -missing-"), "Anzeigen"]
        );
    }

    this.form
      .parameter("headerTitle", headerTitle)
      .parameter("bodyTitle", bodyTitle)
      .entity(this.entity);
  }
}
mixin(ViewCalls!("CMSLinksReadView"));

version(test_uim_cms) { unittest {
    // TODO
}}