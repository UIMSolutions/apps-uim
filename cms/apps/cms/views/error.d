/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module apps.cms.views.error;

import apps.cms;
@safe:

class DCMSErrorView : DCMSView {
  mixin(ViewThis!("CMSErrorView"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!CMSErrorView~":CMSErrorView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("APP CMS -> error")
    ].toH5;
  }
}
mixin(ViewCalls!("CMSErrorView"));
