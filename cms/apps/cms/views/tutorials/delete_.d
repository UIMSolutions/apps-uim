module apps.cms.views.tutorials.delete_;

import apps.cms;
@safe:
import apps.cms.views.tutorials;

class DCMSTutorialsDeleteView : DCMSDeleteView {
  mixin(ViewThis!("CMSTutorialsDeleteView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this.rootPath("/cms/tutorials");

    if (auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .title(titleDelete("Tutorial löschen"))
        .rootPath(this.rootPath);
    }
    
     if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/delete")
        .content(FormContent.form(myForm))
        .rootPath(this.rootPath);

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Tutorials")
          .subTitle("Tutorials löschen");
      }
    }    
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSTutorialsDeleteView~"::DCMSTutorialsDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Tutorial ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Tutorial Name:";

    if (auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .breadcrumbs
          .items(
            ["/", "UIM"],
            ["/cms", "CMS"],
            [this.rootPath, "Tutorials"],
            [rootPath~"/delete?id="~(this.entity ? this.entity["id"] : " -missing-"), "Löschen"]
          );
    }
  }
}
mixin(ViewCalls!("CMSTutorialsDeleteView"));