(window.psdlWebpackJsonp=window.psdlWebpackJsonp||[]).push([[7],{1153:function(e,n,t){},1154:function(e,n,t){},1155:function(e,n,t){},1156:function(e,n,t){},706:function(e,n,t){"use strict";t.r(n),function(s){t(1153),t(1154),t(1155),t(1156);function n(e){jQuery('[rel="ajax-dialog"]:not([data-initialized="true"])',e||document).each(function(){var o=new window.app.Dialog({themes:["light","l"]}),e=$(this),n=e.attr("href"),i=/<body[^>]*>((.|[\n\r])*)<\/body>/im,t="tmvl="+Math.random(),a="&";this.setAttribute("data-initialized",!0),-1===n.indexOf("?")&&(a="?"),e.click(function(e){e.preventDefault(),n=e.target.href,jQuery.ajax({url:[n,t].join(a),timeout:s.settings.ajaxTimeout}).done(function(e){var n=i.exec(e),t=e;null!==n&&(t=n[1]),o.setContent(t),o.show()}).fail(function(){})})})}s.flexTool={},s.api.flexTool={},s.flexTool.initializeComponents=function(){$("[data-component]:not([data-initialized])").each(function(){var e=$(this);void 0!==s.flexTool.component[e.data("component")]&&(new(s.flexTool.component[e.data("component")])(this),e.attr("data-initialized",!0))})},s.api.flexTool.accumulatedPensionDialog={},s.api.flexTool.accumulatedPensionDialog.show=function(e){s.flexTool.accumulatedPensionDialog=new s.flexTool.component.AccumulatedPensionDialog,s.flexTool.accumulatedPensionDialog.load(e)},s.api.flexTool.accumulatedPensionDialog.load=function(e){s.flexTool.accumulatedPensionDialog.load(e)},s.flexTool.component={},s.flexTool.component.StepNavigation=function(e){$("a",e).each(function(){$(this).click(function(e){e.preventDefault(),s.api.flexTool.accumulatedPensionDialog.load(this.href)})})},s.flexTool.component.AccumulatedPensionDialog=function(){this.dialog=new window.app.Dialog({themes:["light","l","accumulated-pension"]})},s.flexTool.component.AccumulatedPensionDialog.prototype.load=function(e){var o=this,i=/<body[^>]*>((.|[\n\r])*)<\/body>/im;$.ajax({url:e,timeout:s.settings.ajaxTimeout}).done(function(e){var n=i.exec(e),t=e;null!==n&&(t=n[1]),o.dialog.setContent(t),o.dialog.show(),s.flexTool.initializeComponents()}).fail(function(){o.dialog.hide()})},s.tools=s.tools||{},s.tools.flexTool={},s.tools.flexTool.ResultColumn=function(e){this.element=$(e),this.MAX_BAR_HEIGHT=200},s.tools.flexTool.ResultColumn.prototype={update:function(e){$(".mijngetal-grid .schedule-appointment").parent().find("p:first").html(e.intro),n(),this.updateBarGraph(e.barGraph),this.updateTable(e.table),this.updateTexts(e.explanation)},createBarGraph:function(){this.barGraph=$('<div class="bar-graph"/>'),$('<div class="bars"/>').appendTo(this.barGraph),this.legend=$('<ul class="legend"/>').appendTo(this.barGraph);var e=$(".mijngetal-grid .schedule-appointment-button").parent();this.barGraph.insertBefore(e)},updateBarGraph:function(e){void 0===this.barGraph&&this.createBarGraph(e),$(".bars").empty(),this.legend.empty(),this.initGraphMeasures(e.columns);for(var n,t=e.columns.length,o=0;o<t;o++)n=$('<div class="bar"></div>'),this.getBarBlocks(e.columns[o].blocks,n),n.appendTo(".bars"),$("<li>"+e.columns[o].legend+"</li>").appendTo(this.legend)},getBarBlocks:function(e,n){for(var t=0,o=0;o<e.length;o++)t+=e[o].value;for(var i,a=Math.floor(t/this.MAX_TOTAL*this.MAX_BAR_HEIGHT),s=0,l=0;l<e.length;l++){i=Math.ceil(e[l].value/this.MAX_TOTAL*this.MAX_BAR_HEIGHT);var p=$("<div/>").css("height",i+"px").css("bottom",s+"px").css("line-height",i-2+"px").addClass(e[l].label.toLowerCase()).html(e[l].label).appendTo(n);a<i+s&&(i=a-s),0<l&&p.css("height",i-1).css("border-bottom","1px solid #fff"),i<8&&p.text(""),s+=i}},initGraphMeasures:function(e){for(var n=function(e){for(var n=0,t=0;t<e.length;t++)n+=e[t].value;return n},t=0,o=e.length,i=0;i<o;i++)t=Math.max(t,n(e[i].blocks));this.MAX_TOTAL=t},updateTable:function(e){$(".mijngetal-grid .schedule-appointment-button").parent().show(),"J"===e.pensionsoonerlater?($(".pensioenwensen .pensioen-eerderoflater").html("Ja"),"N"===e.pensionaowage?($(".pensioenwensen .pensioen-aowleeftijd").html("Nee"),$(".pensioenwensen .pensioen-leeftijd").html(e.pensionageyear+" jaar "+e.pensionagemonth+" maanden")):"J"===e.pensionaowage?($(".pensioenwensen .pensioen-aowleeftijd").html("Ja"),$(".pensioenwensen .pensioen-leeftijd").html(e.calcaowageyear+" jaar "+e.calcaowagemonth+" maanden")):($(".pensioenwensen .pensioen-aowleeftijd").html("-"),$(".pensioenwensen .pensioen-leeftijd").html("-"))):("N"===e.pensionsoonerlater?($(".pensioenwensen .pensioen-leeftijd").html("-"),$(".pensioenwensen .pensioen-eerderoflater").html("Nee")):($(".pensioenwensen .pensioen-leeftijd").html("-"),$(".pensioenwensen .pensioen-eerderoflater").html("-")),$(".pensioenwensen .pensioen-aowleeftijd").html("-")),"J"===e.parttimepension?($(".pensioenwensen .parttime-pensioen").html("Ja"),$(".pensioenwensen .parttime-pensioen-leeftijd").html(e.parttimepensionageyear+" jaar "+e.parttimepensionagemonth+" maanden"),$(".pensioenwensen .parttime-pensioen-percentage").html(e.parttimepensionperc+"%")):("N"===e.parttimepension?$(".pensioenwensen .parttime-pensioen").html("Nee"):$(".pensioenwensen .parttime-pensioen").html("-"),$(".pensioenwensen .parttime-pensioen-leeftijd").html("-"),$(".pensioenwensen .parttime-pensioen-percentage").html("-")),"J"===e.pensionheightadjust?($(".pensioenwensen .pensioen-variatie").html("Ja"),"H"===e.adjusttype?($(".pensioenwensen .pensioen-variatie-type").html("Hoog/laag"),$(".pensioenwensen .pensioen-variatie-perc").html(e.adjustheighthigh+" jaar")):"L"===e.adjusttype&&($(".pensioenwensen .pensioen-variatie-type").html("Laag/hoog"),$(".pensioenwensen .pensioen-variatie-perc").html(e.adjustheightlow+" jaar"))):"N"===e.pensionheightadjust?($(".pensioenwensen .pensioen-variatie-type").html("Nee"),$(".pensioenwensen .pensioen-variatie-perc").html("-"),$(".pensioenwensen .pensioen-variatie").html("Nee")):($(".pensioenwensen .pensioen-variatie-type").html("-"),$(".pensioenwensen .pensioen-variatie-perc").html("-"),$(".pensioenwensen .pensioen-variatie").html("-")),"P"===e.partnerpension||"O"===e.partnerpension||"N"===e.partnerpension&&""!==e.whendeceased?$(".pensioenwensen .pensioen-partner-vraag").html("Wilt u bij overlijden na pensioendatum een (hogere) uitkering voor uw partner of wilt u een hoger ouderdomspensioen zolang u leeft?"):$(".pensioenwensen .pensioen-partner-vraag").html("Wilt u de hoogte van het partnerpensioen wijzigen?"),"P"===e.partnerpension&&""!==e.whendeceased?($(".pensioenwensen .pensioen-perc").html(e.pensionperc+"%"),$(".pensioenwensen .pensioen-partner").html("Hoger ouderdomspensioen")):"O"===e.partnerpension&&""!==e.whendeceased?($(".pensioenwensen .pensioen-perc").html("-"),$(".pensioenwensen .pensioen-partner").html("Hogere uitkering voor partner")):"N"===e.partnerpension&&""!==e.whendeceased?($(".pensioenwensen .pensioen-perc").html("-"),$(".pensioenwensen .pensioen-partner").html("Nee")):"O"===e.partnerpensionwithoutpartner&&""===e.whendeceased?($(".pensioenwensen .pensioen-perc").html("-"),$(".pensioenwensen .pensioen-partner").html("Ja, ouderdomspensioen naar partnerpensioen")):($(".pensioenwensen .pensioen-perc").html("-"),$(".pensioenwensen .pensioen-partner").html("Nee")),"M"===e.rekterm?$(".pensioenwensen .pensioen-rekterm").html("Maandinkomen"):"J"===e.rekterm?$(".pensioenwensen .pensioen-rekterm").html("Jaarinkomen"):$(".pensioenwensen .pensioen-rekterm").html("-"),$(".uw-gegevens h6 a").css("display","inline"),$(".download").show(),$(".send-email").show(),$(".print").show()},updateTexts:function(e){$(".explanation").remove();var n,t=$(".mijngetal-grid .schedule-appointment-button").parent(),o='<div class="explanation">';if(null!==e.disclaimer&&""!==e.disclaimer&&(o+='<div class="disclaimer"><p class="disclaimer">',o+=e.disclaimer,o+="</p></div>"),o+='<p class="shortage">',o+=e.title,o+="</p>",o+='<p class="solution">',o+=e.subtitle,o+="</p>",null!==e.tableheaders&&""!==e.tableheaders){var i=e.tableheaders.split(";"),a=e.firstrow.split(";"),s=e.secondrow.split(";"),l=null,p=null,r=null;for(null!==e.thirdrow&&(l=e.thirdrow.split(";")),null!==e.fourthrow&&(p=e.fourthrow.split(";")),null!==e.fifthrow&&(r=e.fifthrow.split(";")),o+="<table>",o+="<tr>",n=0;n<i.length+1;n++)o+=0<n?"<td>"+i[n-1]+"</td>":"<td></td>";for(o+="</tr>",o+="<tr>",n=0;n<a.length;n++)o+='<td class="solution">'+a[n]+"</td>";for(o+="</tr>",o+="<tr>",n=0;n<s.length;n++)o+='<td class="solution">'+s[n]+"</td>";if(o+="</tr>",null!==l){for(o+="<tr>",n=0;n<l.length;n++)o+='<td class="solution">'+l[n]+"</td>";o+="</tr>"}if(null!==p){for(o+="<tr>",n=0;n<p.length;n++)o+='<td class="solution">'+p[n]+"</td>";o+="</tr>"}if(null!==r){for(o+="<tr>",n=0;n<r.length;n++)o+='<td class="solution">'+r[n]+"</td>";o+="</tr>"}o+="</table>"}null!==e.partnersubtitle&&(o+='<p class="solution">',o+=e.partnersubtitle,o+="</p>"),o+="</div>",$(o).insertBefore(t)},lock:function(){$(".mijngetal-grid .service-column > .component").addClass("loading")},unlock:function(){$(".mijngetal-grid .service-column .loading").removeClass("loading"),$(".mijngetal-grid .schedule-appointment").show()}},n(document),s.flexTool.initializeComponents(),$(".mijngetal-grid .service-column .component:first").each(function(){s.api.flexTool.resultColumn=new s.tools.flexTool.ResultColumn(this)})}.call(this,t(1))}}]);
//# sourceMappingURL=flextool-min.js.map