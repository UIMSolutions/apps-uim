/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module apps.cms.helpers.buttons;

import apps.cms;
@safe:

DH5Obj linkList(string rootPath, string[] classes = ["me-1"]) {
  return H5A(["text-uim"]~classes, ["style":"background-color:#35A6FF", "href":rootPath~"/"], 
    tablerIcon("list", ["text-uim"])~"Übersicht");
}
DH5Obj linkCreate(string rootPath, string[] classes = ["me-1"]) {
  return H5A(["text-uim"]~classes, ["style":"color:#35A6FF", "href":rootPath~"/create"], 
    tablerIcon("plus", ["text-uim"])~"Erstellen");
}
DH5Obj linkView(string rootPath, string id, string[] classes = ["me-1"]) {
  return H5A(["text-uim"]~classes, ["style":"color:#35A6FF", "href":rootPath~"/view?entity_id="~id], 
    tablerIcon("eye", ["text-uim"])~"Anzeigen");
}

DH5Obj linkEdit(string rootPath, string id, string[] classes = null) {
  return H5A(["style":"color:#35A6FF", "href":rootPath~"/edit?entity_id="~id], tablerIcon("edit", ["text-uim"])~"Bearbeiten");
}
DH5Obj linkDelete(string rootPath, string id, string[] classes = null) {
  return BS5ButtonLink(
    ["text-white"]~classes, ["style":"background-color:#35A6FF", "href":rootPath~"/delete?entity_id="~id], 
    tablerIcon("trash", ["text-white"])~"Löschen");
}

DH5Obj alertLinkList(string rootPath, string[] classes = ["me-1"]) {
  return BS5AlertLink(["href":rootPath~"/"], tablerIcon("list")~" Übersicht");
}
DH5Obj alertLinkCreate(string rootPath, string[] classes = ["me-1"]) {
  return BS5AlertLink(["href":rootPath~"/create"], tablerIcon("plus")~" Erstellen");
}
DH5Obj alertLinkView(string rootPath, string id, string[] classes = ["me-1"]) {
  return BS5AlertLink(["href":rootPath~"/view?entity_id="~id], tablerIcon("eye")~" Anzeigen");
}
DH5Obj alertLinkEdit(string rootPath, string id, string[] classes = null) {
  return BS5AlertLink(["href":rootPath~"/edit?entity_id="~id], tablerIcon("edit")~" Bearbeiten");
}
DH5Obj alertLinkDelete(string rootPath, string id, string[] classes = null) {
  return BS5AlertLink(["href":rootPath~"/delete?entity_id="~id], tablerIcon("trash")~" Löschen");
}

DH5Obj linkPrev(string id = null, bool disabled = false) {
  DH5Obj result;
  if (disabled) result = H5Li(["pageitem", "disabled"]);
  else result = H5Li(["pageitem"]);

  if (id) result.id(id);
  
  result(H5A(["page-link"], ["href":"#"], "Vorherige "~tablerIcon("chevrons-left")));
  return result;
}

DH5Obj linkNext(string id = null, bool disabled = false) {
  DH5Obj result;
  if (disabled) result = H5Li(["pageitem", "disabled"]);
  else result = H5Li(["pageitem"]);

  if (id) result.id(id);
  result(H5A(["page-link"], ["href":"#"], "Nächste "~tablerIcon("chevrons-right")));
  return result;
}

DH5Obj submitDelete(string[] classes = null) {
  return BS5ButtonSubmit(
    ["text-white"]~classes, ["style":"background-color:#35A6FF"],  
    tablerIcon("trash", ["text-white"])~"Löschen");
}

DH5Obj buttonLinkCancel(string rootPath, string[] classes = null) {
  return BS5ButtonLink(
    ["text-white me-1"]~classes, ["style":"background-color:#35A6FF", "href":rootPath], 
    tablerIcon("x", ["text-white"])~"Abbrechen");
}

DH5Obj buttonLinkReset(string rootPath, string id, string[] classes = null) {
  return
    BS5ButtonLink(["text-white me-1"]~classes, ["style":"background-color:#35A6FF", "href":rootPath~"/edit?entity_id="~id],
      tablerIcon("reset", ["text-white"])~"Reset");
}

DH5Obj resetClear(string[] classes = null) {
  return 
    BS5ButtonReset(["btn-secondary me-1"],  
      tablerIcon("eraser", ["text-white"])~"Clear");
}

DH5Obj submitSave(string[] classes = null) {
  return 
    BS5ButtonSubmit(["btn-success"],  
      tablerIcon("check", ["text-white"])~"Speichern");
}

string titleList(string title) {
  return tablerIcon("list")~H5Span(["style":"font-weight:bold;"], title).toString;
}

string titleCreate(string title) {
  return tablerIcon("plus")~H5Span(["style":"font-weight:bold;"], title).toString;
}

string titleView(string title) {
  return tablerIcon("eye")~H5Span(["style":"font-weight:bold;"], title).toString;
}

string titleEdit(string title) {
  return tablerIcon("edit")~H5Span(["style":"font-weight:bold;"], title).toString;
}

string titleDelete(string title) {
  return tablerIcon("trash")~H5Span(["style":"font-weight:bold;"], title).toString;
}