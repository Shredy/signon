define(["dojo/_base/declare","dijit/_WidgetBase","dijit/_TemplatedMixin","alfresco/core/Core","dojo/text!./templates/CMMHelpBubble.html","dojo/dom-class"],function(b,h,g,e,c,d){return b([h,g,e],{cssRequirements:[{cssFile:"./css/CMMHelpBubble.css"}],templateString:c,label:"",postMixInProperties:function a(){this.label=this.message(this.label);this.inherited(arguments)},postCreate:function f(){this.inherited(arguments);d.add(this.containerNode,(this.additionalCssClasses||""))}})});