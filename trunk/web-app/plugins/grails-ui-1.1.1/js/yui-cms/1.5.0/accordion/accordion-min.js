/*
Copyright (c) 2007, Caridy Patino. All rights reserved.
Portions Copyright (c) 2007, Yahoo!, Inc. All rights reserved.
Code licensed under the BSD License:
http://www.bubbling-library.com/eng/licence
version: 1.5.0
*/
(function(){var $B=YAHOO.Bubbling,$L=YAHOO.lang,$E=YAHOO.util.Event,$D=YAHOO.util.Dom;YAHOO.widget.AccordionManager=function(){var obj={},_selector='selected',_sliding='sliding',_anims={};$B.addDefaultAction('accordionToggleItem',function(layer,args){if(!args[1].decrepitate){return obj.toggle(args[1].target);}});$B.addDefaultAction('accordionRemoveItem',function(layer,args){if(!args[1].decrepitate){return obj.remove(args[1].target);}});$B.on('accordionOpenItem',function(layer,args){var reLink=/.*#/;if($D.hasClass(args[1].slide,'ajax')&&$L.isObject(YAHOO.plugin.Dispatcher)){var trigger=$D.getElementsByClassName('accordionToggleItem','*',args[1].el);trigger=(trigger.length>0?trigger[0]:null);if(trigger&&(trigger=trigger.getAttribute('href',2))){YAHOO.plugin.Dispatcher.fetch(args[1].slide,trigger.replace(reLink,''),{onLoad:function(el){$D.removeClass(args[1].slide,'ajax');}});}}});$B.on('key',function(layer,args){var o=args[1],item=null,result=false;if(!o.decrepitate&&(o.type=='keyup')){if(((o.keyCode===39)&&obj.open(o.target))||((o.keyCode===37)&&obj.close(o.target))){o.decrepitate=true;o.stop=true;}}});$B.on('rollover',function(layer,args){var list,item,onWayOut;if(item=_getItem(args[1].target)){if((list=_getList(item))&&list.rollover){if(!list.selected){$D.addClass(list.el,_selector);onWayOut=function(e){var l=_getList({el:$E.getTarget(e)});if(l&&!$B.virtualTarget(e,l.el)&&!l.persistent){_reset(l,{force:true});}};if(!list.persistent){$E.removeListener(list.el,'mouseout',onWayOut);$E.addListener(list.el,'mouseout',onWayOut,obj,true);}}if(!item.selected){_openItem(item,list);}}}});$B.addLayer(['accordionOpenItem','accordionCloseItem','accordionRemoveItem'],obj);function _getEffect(el){var effect=el.getAttribute('rel')||null;if(effect){effect=YAHOO.util.Easing[effect]||null;}return effect;}function _getTimer(el){var t=($D.hasClass(el,'fast')?0.1:null)||($D.hasClass(el,'slow')?0.6:null)||0.4;return t;}function _getItem(elem){if(elem&&($L.isObject(elem)||(elem=$D.get(elem)))){var item,el=$B.getOwnerByClassName(elem,'yui-cms-item');if($L.isObject(el)){item={el:el,triger:elem,selected:$D.hasClass(el,_selector),sliding:$D.hasClass(el,_sliding),size:{width:0,Height:0}};var slide=$D.getElementsByClassName('bd','*',el);slide=(slide.length>0?slide[0]:null);item.slide=slide;var h=parseInt($D.getStyle(slide,'height'),10);var w=parseInt($D.getStyle(slide,'width'),10);if(!$L.isNumber(h)){$D.setStyle(slide,'height',slide.scrollHeight+'px');}if(!$L.isNumber(w)){$D.setStyle(slide,'width',slide.scrollWidth+'px');}item.size.height=slide.scrollHeight;item.size.width=slide.scrollWidth;}return item;}}function _getList(item){var list=null,el=item.el;if(el&&($L.isObject(el)||(el=$D.get(el)))){if(el=$B.getOwnerByClassName(el,'yui-cms-accordion')){list={el:el,effect:_getEffect(el),orientation:($D.hasClass(el,'vertical')?'width':'height'),selected:$D.hasClass(el,_selector),fade:$D.hasClass(el,'fade'),manually:$D.hasClass(el,'manually'),fixIE:($E.isIE&&$D.hasClass(el,'fixIE')),multiple:$D.hasClass(el,'multiple'),rollover:$D.hasClass(el,'rollover'),persistent:$D.hasClass(el,'persistent'),dispatcher:$D.hasClass(el,'dispatcher'),wizard:$D.hasClass(el,'wizard'),timer:_getTimer(el),items:[]};$D.batch($D.getElementsByClassName('bd','*',el),function(elem){list.items.push(_getItem(elem));});}return list;}}function _reset(list,params){params=params||{};var conf=[],i,force=params.force||false,item=params.item||null;if(list){if(!list.multiple||force){for(i=0;i<list.items.length;i++){if((!item||(list.items[i].el!==item.el))&&(list.items[i].selected||list.items[i].sliding||params.expand)){if(params.expand){_openItem(list.items[i],list,params.grouping);}else{_closeItem(list.items[i],list,params.grouping);if(params.mirror){params.mirror.push(list.items[i]);}}}}}}}function _openItem(item,list){var conf=[],anim,i,g=[],m=[],fs,onFinish;if(list||(list=_getList(item))){if(!item.selected){if(!list.multiple){_reset(list,{item:item,grouping:g,mirror:m});}anim=_anims[$E.generateId(item.slide)];if((anim)&&(anim.isAnimated())){anim.stop();}conf[list.orientation]={to:item.size[list.orientation]};if(!list.manually){conf['scroll']={from:(list.orientation=='width'?[item.size[list.orientation],0]:[0,item.size[list.orientation]]),to:[0,0]};}if(list.fade){conf['opacity']={to:1};}anim=new YAHOO.util.Scroll(item.slide,conf,list.timer,list.effect);$D.addClass(item.el,_sliding);onFinish=function(){$D.removeClass(item.el,_sliding);$D.addClass(item.el,_selector);$B.fire('accordionOpenItem',item);};anim.onComplete.subscribe(onFinish);_anims[$E.generateId(item.slide)]=anim;if(list.manually){m=m[0]||null;fs=(m?m.size[list.orientation]:item.size[list.orientation]);for(i=1;i<=fs;i++){if(m){$D.setStyle(m.slide,list.orientation,(fs-i)+'px');}$D.setStyle(item.slide,list.orientation,i+'px');}onFinish();}else{for(i=0;i<g.length;i++){YAHOO.util.AnimMgr.registerElement(g[i]);}YAHOO.util.AnimMgr.registerElement(anim);}}return true;}return false;}function _closeItem(item,list,grouping){var conf=[],anim,fs;if(item&&(list||(list=_getList(item)))){conf[list.orientation]={to:((list.orientation=='width'||list.fixIE)?1:0)};if(list.fade){conf['opacity']={to:0};}if(!list.manually){conf['scroll']={to:(list.orientation=='width'?[item.size[list.orientation],0]:[0,item.size[list.orientation]])};}anim=_anims[$E.generateId(item.slide)];if((anim)&&(anim.isAnimated())){anim.stop();}anim=new YAHOO.util.Scroll(item.slide,conf,list.timer,list.effect);$D.addClass(item.el,_sliding);onFinish=function(){$D.removeClass(item.el,_sliding);$D.removeClass(item.el,_selector);$B.fire('accordionOpenItem',item);};anim.onComplete.subscribe(onFinish);if($L.isArray(grouping)){grouping.push(anim);}else{anim.animate();}if(list.manually){fs=item.size[list.orientation];for(i=fs;i>=conf[list.orientation].to;i--){$D.setStyle(item.slide,list.orientation,i+'px');}onFinish();}_anims[$E.generateId(item.slide)]=anim;return true;}return false;}function _removeItem(item,list){if(item&&(list||(list=_getList(item)))){_closeItem(item,list);$E.purgeElement(item.el,true);window.setTimeout(function(){item.el.parentNode.removeChild(item.el);$B.fire('accordionRemoveItem',item);},list.timer+0.1);return true;}return false;}obj.expand=function(el){var list;if(list=_getList({el:el})){return _reset(list,{force:true,expand:true});}};obj.collapse=function(el){var list;if(list=_getList({el:el})){return _reset(list,{force:true});}};obj.open=function(el){var item;if(item=_getItem(el)){return _openItem(item);}};obj.close=function(el){var item,list;if(item=_getItem(el)){if(list=_getList(item)){return((item.selected&&(list.multiple||!list.persistent))?_closeItem(item,list):false);}}};obj.toggle=function(el){var item,list;if(item=_getItem(el)){if(list=_getList(item)){return((item.selected&&(list.multiple||!list.persistent))?_closeItem(item,list):_openItem(item,list));}}};obj.remove=function(el){var item,list;if(item=_getItem(el)){if(list=_getList(item)){return _removeItem(item,list);}}};return obj;}();})();
YAHOO.register("accordion",YAHOO.widget.AccordionManager,{version:"1.5.0",build:"203"});