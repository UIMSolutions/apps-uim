module apps.cms.views.glossary.update;

import apps.cms;
@safe:
import apps.cms.views.glossary;

class DCMSGlossaryUpdateView : DCMSUpdateView {
  mixin(ViewThis!("CMSGlossaryUpdateView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .rootPath("/cms/glossarys");

    if (auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .title(titleEdit("Glossary bearbeiten")) 
        .rootPath(this.rootPath);
    }

    if (auto myForm = cast(DForm)this.form) {
      myForm
        .action("/cms/glossarys/actions/update")
        .crudMode(CRUDModes.Update)
        .content(FormContent.form(myForm));

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Glossary")
          .subTitle("Glossary bearbeiten");
      }
    }
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSGlossaryUpdateView~"::DCMSGlossaryUpdateView:beforeH5");
    super.beforeH5(options);

    if (this.header) this.header.entity(this.entity);

    auto headerTitle = "Glossary ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Glossary Name:";

    if (auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .breadcrumbs
          .items(
            ["/", "UIM"],
            ["/cms", "CMS"],
            [this.rootPath, "Glossarys"],
            [this.rootPath~"/update?id="~(this.entity ? this.entity["id"] : " -missing-"), "Bearbeiten"]
          );
    }
  }
}
mixin(ViewCalls!("CMSGlossaryUpdateView"));