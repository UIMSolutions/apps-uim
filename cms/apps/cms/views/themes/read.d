module apps.cms.views.themes.read;

import apps.cms;
@safe:

class DCMSThemesReadView : DCMSView {
  mixin(ViewThis!("CMSThemesReadView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this.rootPath("/cms/themes");

    if (auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .title(titleView("Theme anzeigen"))
        .actions([["refresh", "list", "create"]])
        .rootPath(this.rootPath);
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .crudMode(CRUDModes.Read)
        .content(FormContent.form(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Themes")
          .subTitle("Themes anzeigen");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSThemesReadView~"::DCMSThemesReadView:beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    auto headerTitle = "Theme ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Theme Name:";

    if (auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .breadcrumbs
          .items(
            ["/cms", "CMS"],
            [this.rootPath, "Themes"],
            [this.rootPath~"/view?id="~(this.entity ? this.entity["id"] : " -missing-"), "Anzeigen"]
          );
    }

    this.form
      .parameter("headerTitle", headerTitle)
      .parameter("bodyTitle", bodyTitle)
      .entity(this.entity);

    this
      .pageHeader
        .title("Themes -> Read")
        .breadcrumbs
          .items(
            ["/", "UIM"],
            [this.rootPath, "CMS"],
            [this.rootPath~"/themes", "Themes"],
            [this.rootPath~"/themes/read", "Read"]
          );
  }
}
mixin(ViewCalls!("CMSThemesReadView", "DCMSThemesReadView"));