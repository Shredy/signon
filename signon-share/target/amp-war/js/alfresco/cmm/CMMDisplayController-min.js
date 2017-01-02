define(["dojo/_base/declare","dijit/_WidgetBase","alfresco/core/Core","alfresco/core/CoreXhr","dojo/_base/lang","service/constants/Default","cmm/CMMConstants","alfresco/util/hashUtils","dojo/io-query"],function(i,k,d,l,c,e,b,j,g){return i([k,d,l],{interval:null,constructor:function n(r){c.mixin(this,r);this.alfSubscribe(b.DISPLAY_MODELS_TOPIC,c.hitch(this,this.showModels));this.alfSubscribe(b.DISPLAY_TYPES_AND_PROPERTYGROUPS_TOPIC,c.hitch(this,this.showTypesAndPropertyGroups));this.alfSubscribe(b.DISPLAY_PROPERTIES_TOPIC,c.hitch(this,this.showProperties));this.alfSubscribe(b.DISPLAY_FORM_EDITOR_TOPIC,c.hitch(this,this.showFormEditor))},postCreate:function a(){this.formEditorReloadOnLoad()},showModels:function m(){var r={};r[b.PANE_SELECTION_HASH_VAR]=b.PANE_TITLE_MODELS;this._setDisplay(r);this.alfPublish(b.MODELS_LIST_SCOPE+b.MODEL_LIST_RELOAD,{})},showTypesAndPropertyGroups:function o(s){var r={};r[b.PANE_SELECTION_HASH_VAR]=b.PANE_TITLE_TYPE_AND_PROPERTYGROUPS;r[b.MODEL_SELECTION_HASH_VAR]=s.modelName;this._setDisplay(r)},showProperties:function h(s){var r={};r[b.PANE_SELECTION_HASH_VAR]=b.PANE_TITLE_PROPERTIES;r[b.MODEL_SELECTION_HASH_VAR]=s.modelName;r[b.TYPE_SELECTION_HASH_VAR]=s.type;r[b.PROPERTYGROUP_SELECTION_HASH_VAR]=s.propertygroup;this._setDisplay(r)},showFormEditor:function q(t){this.alfPublish(b.FORM_EDITOR_GET_VALUE+"_SUCCESS",{model:"",type:"",propertygroup:""});this.alfPublish(b.FORM_EDITOR_CLEAR);var s={};s[b.PANE_SELECTION_HASH_VAR]=b.PANE_TITLE_FORM_EDITOR;s[b.MODEL_SELECTION_HASH_VAR]=t.modelName;s[b.TYPE_SELECTION_HASH_VAR]=t.type;s[b.PROPERTYGROUP_SELECTION_HASH_VAR]=t.propertygroup;var r=c.clone(s);r.responseTopic=b.FORM_EDITOR_GET_VALUE;this.alfPublish(b.FORM_EDITOR_GET_VALUE,r);this.alfPublish(b.UPDATE_TPG_HEADING,{label:t.modelName+" - "+(t.type||t.propertygroup)});this._setDisplay(s);this.interval=setInterval(c.hitch(this,function(){this.serviceXhr({url:e.URL_CONTEXT+"service/modules/authenticated?noCache="+new Date().getTime(),method:"GET"})}),1000*60)},formEditorReloadOnLoad:function p(){var s=j.getHashString();if(s){var r=g.queryToObject(s);if(r.view&&r.view===b.PANE_TITLE_FORM_EDITOR&&r.model&&(r.type||r.propertygroup)){this.alfPublishDelayed(b.DISPLAY_FORM_EDITOR_TOPIC,{modelName:r.model,type:r.type,propertygroup:r.propertygroup},1*1000)}else{if(r.view&&r.view===b.PANE_TITLE_FORM_EDITOR){this.alfPublish(b.DISPLAY_MODELS_TOPIC)}}}},_setDisplay:function f(r){if(r){this.alfPublish("ALF_NAVIGATE_TO_PAGE",{type:"HASH",url:g.objectToQuery(r)})}if(this.interval){clearInterval(this.interval)}}})});