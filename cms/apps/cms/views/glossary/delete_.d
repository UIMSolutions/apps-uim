module apps.cms.views.glossary.delete_;

import apps.cms;
@safe:

class DCMSGlossaryDeleteView : DCMSDeleteView {
  mixin(ViewThis!("CMSGlossaryDeleteView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this.rootPath("/cms/glossary");

    if (auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .title(titleDelete("Glossary löschen")) 
        .rootPath(this.rootPath);
    }
    
     if (auto myForm = cast(DForm)this.form) {
      myForm
        .action(this.rootPath~"/actions/delete")
        .content(FormContent.form(myForm))
        .rootPath(this.rootPath);

      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
        myFormHeader
          .mainTitle("Glossary")
          .subTitle("Glossary löschen");
      }
    }    
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSGlossaryDeleteView~"::DCMSGlossaryDeleteView:beforeH5");
    super.beforeH5(options);

    auto headerTitle = "Glossary ID:"~(this.entity ? this.entity.id.toString : " - Unbekannt -");
    auto bodyTitle = "Glossary Name:";

    if (auto myHeader = cast(DPageHeaderViewComponent)this.header) {
      myHeader
        .breadcrumbs
          .items(
            ["/cms", "CMS"],
            [this.rootPath, "Glossary"],
            [this.rootPath~"/delete?id="~(this.entity ? this.entity["id"] : " -missing-"), "Löschen"]
          );
    }
  }
}
mixin(ViewCalls!("CMSGlossaryDeleteView"));