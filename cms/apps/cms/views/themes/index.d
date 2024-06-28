module apps.cms.views.themes.index;

import apps.cms;
@safe:

class DCMSThemesIndexView : DCMSView {
  mixin(ViewThis!("CMSThemesIndexView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this.rootPath("/cms/themes");

    auto myPageHeader = PageHeader(this);
    myPageHeader
      .title(titleView("Übersicht Themes"))
      .actions([["refresh", "list", "create"]])
      .rootPath(this.rootPath)
      .breadcrumbs
        .items(
          ["/", "UIM"],
          ["/cms", "CMS"],
          [this.rootPath, "Themes"]
        );

    auto headerTitle = titleList("Themes");
    auto bodyTitle = "Gefundene Themes";

    auto myForm = EntitiesListForm(this)
      .header(
        FormHeader
          .mainTitle("Themes")
          .subTitle("Themes anzeigen")
          .actions([["print", "export"]]));

    this
      .header(myPageHeader)
      .form(
        myForm
          .content(EntitiesFormContent.form(myForm))
          .rootPath(this.rootPath));     
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSThemesIndexView~":DCMSThemesIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    this
      .pageHeader
        .title("Themes -> Index")
        .breadcrumbs
          .items(
            ["/", "UIM"],
            [this.rootPath, "CMS"],
            [this.rootPath~"/themes", "Themes"]
          );

    if (auto myForm = cast(DForm)this.form) {
      myForm.entities(this.entities);
    } 
  }

/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSThemesIndexView~":DCMSThemesIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this// .rootPath(myRootPath);
    debug writeln("RootPath in DCMSThemesIndexView:toH5 -> ", this.rootPath);
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
mixin(ViewCalls!("CMSThemesIndexView", "DCMSThemesIndexView"));