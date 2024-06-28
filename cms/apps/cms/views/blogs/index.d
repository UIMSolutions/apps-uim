module apps.cms.views.blogs.index;

import apps.cms;
@safe:

class DCMSBlogsIndexView : DCMSIndexView {
  mixin(ViewThis!("CMSBlogsIndexView"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .pageHeader(
        MVCIndexPageHeader.rootPath(rootPath))
      .pageBody(PageBodyViewComponent)
      .pageFooter(MVCPageFooterViewComponent);  

    this.rootPath("/cms/blogs");

    auto myPageHeader = PageHeader(this);
    myPageHeader
      .title(titleView("Übersicht Blogs"))
      .actions([["refresh", "list", "create"]])
      .rootPath(this.rootPath)
      .breadcrumbs
        .items(
          ["/cms", "CMS"],
          [this.rootPath, "Blogs"]
        );

    // auto headerTitle = titleList("Blogs");
    auto bodyTitle = "Gefundene Blogs";

    auto myForm = EntitiesListForm(this)
      .header(
        FormHeader
          .mainTitle("Blogs")
          .subTitle("Blogs anzeigen")
          .actions([["print", "export"]]));
    this
      .header(myPageHeader)
      /* .form(
        myForm
          .content(EntitiesFormContent.form(myForm))
          .rootPath(this.rootPath)) */;
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSBlogsIndexView~":DCMSBlogsIndexView("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    if (auto myForm = cast(DForm)this.form) {
      myForm.entities(this.entities);
    } 

    this
      .pageHeader
        .title("Blogs -> Index")
        .breadcrumbs
          .items(
            ["/", "UIM"],
            [this.rootPath, "CMS"],
            [this.rootPath~"/blogs", "Blogs"]
          );

    
  }
}
mixin(ViewCalls!("CMSBlogsIndexView"));


/*   override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DCMSBlogsIndexView~":DCMSBlogsIndexView("~this.name~")::toH5");
    super.toH5(options);

    options["rootPath"] = myRootPath;

    this.rootPath(myRootPath);
    debug writeln("RootPath in DCMSBlogsIndexView:toH5 -> ", this.rootPath);
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
  }   */