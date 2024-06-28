module apps.bim.views.error;

import apps.bim;
@safe:

class DBIMErrorView : DView {
  mixin(ViewThis!("BIMErrorView"));

  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DBIMErrorView~":DBIMErrorView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("APP BIM -> Error")
    ].toH5;
  }
}
mixin(ViewCalls!("BIMErrorView"));
