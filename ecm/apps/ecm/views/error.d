module apps.ecm.views.error;

import apps.ecm;
@safe:

class DECMErrorView : DView {
  mixin(ViewThis!("ECMErrorView"));

  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DECMErrorView~":DECMErrorView("~this.className~")::toH5");
    super.toH5(options);

    return [
      H5Div("APP ECM -> Error")
    ].toH5;
  }
}
mixin(ViewCalls!("ECMErrorView"));
