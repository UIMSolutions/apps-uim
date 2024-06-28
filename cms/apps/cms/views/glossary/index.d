module apps.cms.views.glossary.index;

import apps.cms;
@safe:

class DCMSGlossaryIndexView : DCMSIndexView {
  mixin(ViewThis!("CMSGlossaryIndexView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this.rootPath("/cms/glossary");

    auto myPageHeader = PageHeader(this);
    myPageHeader
      .title(titleView("Übersicht Glossary")) 
      .actions([["refresh", "list", "create"]])
      .rootPath(this.rootPath)
      .breadcrumbs
        .items(
          ["/cms", "CMS"],
          [this.rootPath, "Glossary"]
        );

    /* auto headerTitle = titleList("Glossary"); */
    auto bodyTitle = "Gefundene Glossary";

    auto myForm = EntitiesListForm(this)
      .header(
        FormHeader
          .mainTitle("Glossary")
          .subTitle("Glossary anzeigen")
          .actions([["print", "export"]]));
    this
      .header(myPageHeader)
      .form(
        myForm
          .content(EntitiesFormContent.form(myForm))
          .rootPath(this.rootPath));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSGlossaryIndexView~":DCMSGlossaryIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }
  
    if (auto myForm = cast(DForm)this.form) {
      myForm.entities(this.entities);
    } 
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSGlossaryIndexView~":DCMSGlossaryIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this// .rootPath(myRootPath);
    debug writeln("RootPath in DCMSGlossaryIndexView:toH5 -> ", this.rootPath);
    debug writeln("this.form.rootPath(",this.rootPath,")");

    return [
      H5Div(["content"],
        H5Div(["container-xl"], 
          BS5Row("messages", [""]),
          BS5Row(["row-deck row-cards"], 
          this.form
          .rootPath(this.rootPath)
          .entities(this.entities)
          .toH5(options)
    )))].toH5;              
  }  */
}
mixin(ViewCalls!("CMSGlossaryIndexView"));

version(test_uim_cms) { unittest {
    // TODO
}}