module apps.cms.views.themes.delete_;

import apps.cms;
@safe:

class DCMSThemesDeleteView : DCMSView {
  mixin(ViewThis!("CMSThemesDeleteView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this.rootPath("/cms/themes");

    if (auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .title(titleDelete("Theme löschen"))
        .rootPath(this.rootPath);
    }
    
     if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/delete")
        .content(FormContent.form(myForm))
        .rootPath(this.rootPath);

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
        .mainTitle("Themes")
        .subTitle("Themes löschen");
      }
    }    
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSThemesDeleteView~"::DCMSThemesDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Theme ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Theme Name:";

    if (auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .breadcrumbs
          .items(
            ["/cms", "CMS"],
            [this.rootPath, "Themes"],
            ["active", "Löschen"]
          );
    }

    this
      .pageHeader
        .title("Themes -> Delete")
        .breadcrumbs
          .items(
            ["/", "UIM"],
            [this.rootPath, "CMS"],
            [this.rootPath~"/themes", "Themes"],
            [this.rootPath~"/themes/delete", "Delete"]
          );
  }
}
mixin(ViewCalls!("CMSThemesDeleteView", "DCMSThemesDeleteView"));
