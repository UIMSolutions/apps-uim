module apps.cms.views.tutorials.index;

import apps.cms;
@safe:
import apps.cms.views.tutorials;

class DCMSTutorialsIndexView : DEntitiesListView {
  mixin(ViewThis!("CMSTutorialsIndexView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this.rootPath("/cms/tutorials");

    auto myPageHeader = PageHeader(this);
    myPageHeader
      .title(titleView("Übersicht Tutorials"))
      .actions([["refresh", "list", "create"]])
      .rootPath(this.rootPath)
      .breadcrumbs
        .items(
          ["/cms", "CMS"],
          [this.rootPath, "Tutorials"]
        );

    auto headerTitle = titleList("Tutorials");
    auto bodyTitle = "Gefundene Tutorials";

    auto myForm = EntitiesListForm(this)
      .header(
        FormHeader
          .mainTitle("Tutorials")
          .subTitle("Tutorials anzeigen")
          .actions([["print", "export"]]));
          
    this
      .header(myPageHeader)
      .form(
        myForm
          .content(EntitiesFormContent.form(myForm))
          .rootPath(this.rootPath));
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSTutorialsIndexView~":DCMSTutorialsIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    if (auto myForm = cast(DForm)this.form) {
      myForm.entities(this.entities);
    } 
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSTutorialsIndexView~":DCMSTutorialsIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this// .rootPath(myRootPath);
    debug writeln("RootPath in DCMSTutorialsIndexView:toH5 -> ", this.rootPath);
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
mixin(ViewCalls!("CMSTutorialsIndexView"));

version(test_uim_cms) { unittest {
    // TODO
}}