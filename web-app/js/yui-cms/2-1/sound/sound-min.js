/*
Copyright (c) 2008, Bubbling Library Team. All rights reserved.
Portions Copyright (c) 2008, Yahoo!, Inc. All rights reserved.
Code licensed under the BSD License:
http://www.bubbling-library.com/eng/licence
version: 2.0
*/
(function(){var C=YAHOO.Bubbling,A=YAHOO.util.Event,B=YAHOO.util.Dom,D=YAHOO.lang;YAHOO.plugin.SoundManager=function(){var G={},L=false,J={},K="soundManagerObject";_handle=null,_defConfing={repeating:false,volume:80,onLoad:null,onPlay:null,onStop:null};function E(O,N){if(O&&(O.getAttribute("rel"))){G.play(O.getAttribute("rel"),N)}}C.on("rollover",function(O,N){C.processingAction(O,N,{soundOnRollover:function(Q,P){E(P[1].el);return false}},true)});C.on("navigate",function(O,N){C.processingAction(O,N,{soundOnClick:function(Q,P){E(P[1].el);return false},soundMasterTrack:function(Q,P){E(P[1].el,"master");return false},soundOnMute:function(Q,P){var R=null;if(P[1].target&&(R=B.getAncestorByClassName(P[1].target,"yui-cms-sound-control"))){B.addClass(R,"mute")}G.mute=true;return true},soundOnPlay:function(Q,P){var R=null;if(P[1].target&&(R=B.getAncestorByClassName(P[1].target,"yui-cms-sound-control"))){B.removeClass(R,"mute")}G.mute=false;return true}},true)});C.addLayer(["newSoundReady","soundManagerAvailable"],G);function F(P){var O="",R="yui-cms-sm-wrapper",Q=document.createElement("div");var N=new YAHOO.util.Element(Q,{id:R,innerHTML:""});N.appendTo(document.body);R=B.get(R);if(A.isIE){O='<object id="'+K+'" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="1" height="1"><param name="movie" value="'+P+'" /><param name="allowScriptAccess" value="sameDomain" /></object>'}else{O='<embed src="'+P+'" width="1" height="1" name="'+K+'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'}R.innerHTML=O;N.setStyle("visibility","hidden")}function M(N){_handle.playsound(N)}function H(N){_handle.stopsound(N)}function I(N){_handle.addsound(N,J[N].uri)}G.mute=false;G.tracks={};G.load=function(O,N){if(D.isString(O)&&(O!=="")&&!J.hasOwnProperty(O)){J[O]=N||_defConfing;J[O].isReady=!N.cache;J[O].id=O;if(N.cache){J[O].uri+=(J[O].uri.indexOf("?")>=0?"&":"?")+"_cache="+(new Date()).getTime()}if(L){I(O)}}};G.init=function(){_handle=(A.isIE?window[K]:document[K]);if(!L&&_handle){L=true;C.fire("soundManagerAvailable",{wrapper:G});for(id in J){if(J.hasOwnProperty(id)){I(id)}}}};G.create=function(N){A.onDOMReady(function(){if(!B.inDocument(K)){F(N)}})};G.ready=function(N){if(J.hasOwnProperty(N)){J[N].isReady=true;C.fire("newSoundReady",J[N])}};G.play=function(O,N){if(J.hasOwnProperty(O)&&J[O].isReady&&!this.mute){if(D.isString(N)){if(G.tracks.hasOwnProperty(N)&&J.hasOwnProperty(G.tracks[N])){H(G.tracks[N])}G.tracks[N]=O}M(O);return true}else{return false}};G.stop=function(N){if(J.hasOwnProperty(N)&&(J[N].isReady)){H(N);return true}else{return false}};G.state=function(N){if(J.hasOwnProperty(N)){return(J[N].isReady?2:1)}else{return 0}};return G}();window.soundManagerInit=function(){YAHOO.plugin.SoundManager.init()};window.soundManagerReady=function(E){YAHOO.plugin.SoundManager.ready(E)}})();YAHOO.register("soundmanager",YAHOO.plugin.SoundManager,{version:"2.0",build:"206"});